use crate::generator::dart::{dart_comments, dart_metadata, GeneratedApiMethod};
use crate::generator::dart::{is_method, ty::*};
use crate::ir::*;
use crate::type_dart_generator_struct;
use convert_case::{Case, Casing};

type_dart_generator_struct!(TypeStructRefGenerator, IrTypeStructRef);

impl TypeDartGeneratorTrait for TypeStructRefGenerator<'_> {
    fn api2wire_body(&self) -> Option<String> {
        None
    }

    fn api_fill_to_wire_body(&self) -> Option<String> {
        let s = self.ir.get(self.context.ir_file);
        Some(
            s.fields
                .iter()
                .map(|field| {
                    format!(
                        "wireObj.{} = _api2wire_{}(apiObj.{});",
                        field.name.rust_style(),
                        field.ty.safe_ident(),
                        field.name.dart_style()
                    )
                })
                .collect::<Vec<_>>()
                .join("\n"),
        )
    }

    fn wire2api_body(&self) -> String {
        let src = self.ir.get(self.context.ir_file);
        let s = self.ir.get(self.context.ir_file);

        let methods = self
            .context
            .ir_file
            .funcs
            .iter()
            .filter(|f| is_method(f, src.name.clone()))
            .collect::<Vec<_>>();
        let has_methods = !methods.is_empty();
        let mut inner = s
            .fields
            .iter()
            .enumerate()
            .map(|(idx, field)| {
                format!(
                    "{}: _wire2api_{}(arr[{}]),",
                    field.name.dart_style(),
                    field.ty.safe_ident(),
                    idx
                )
            })
            .collect::<Vec<_>>();

        let is_method_for_struct = {
            let TypeGeneratorContext {
                ir_file:
                    IrFile {
                        funcs,
                        struct_pool: _,
                        enum_pool: _,
                        has_executor: _,
                    },
            } = self.context;

            let IrField {
                ty,
                name: _,
                is_final: _,
                comments: _,
            } = &funcs[0].inputs[0];

            if let IrType::Boxed(IrTypeBoxed {
                exist_in_real_api: _,
                inner,
            }) = ty
            {
                if let IrType::StructRef(IrTypeStructRef { name, freezed: _ }) = &**inner {
                    *name == src.name
                } else {
                    false
                }
            } else {
                false
            }
        };

        if has_methods && is_method_for_struct {
            inner.insert(0, "bridge: bridge,".to_string());
        }
        let inner = inner.join("\n");

        format!(
            "final arr = raw as List<dynamic>;
                if (arr.length != {}) throw Exception('unexpected arr length: expect {} but see ${{arr.length}}');
                return {}({});",
            s.fields.len(),
            s.fields.len(),
            s.name, inner,
        )
    }

    fn set_dart_api_class_name(&mut self, s: &str) {
        self.dart_api_class_name = Some(s.to_string())
    }

    fn structs(&self) -> String {
        let src = self.ir.get(self.context.ir_file);
        let comments = dart_comments(&src.comments);
        let metadata = dart_metadata(&src.dart_metadata);

        let ir_file = self.context.ir_file;
        let methods = ir_file
            .funcs
            .iter()
            .filter(|f| is_method(f, src.name.clone()))
            .collect::<Vec<_>>();

        let has_methods = !methods.is_empty();
        let methods = methods
            .iter()
            .map(|func| generate_api_method(func, src))
            .collect::<Vec<_>>();

        let methods_string = methods
            .iter()
            .map(|g| format!("{}=>{};", g.signature.clone(), g.implementation.clone()))
            .collect::<Vec<_>>()
            .concat();
        let bridge_requirement = "required this.bridge,".to_string();
        let field_bridge = format!(
            "final {} bridge;",
            self.dart_api_class_name.as_ref().unwrap()
        );
        if src.using_freezed() {
            let mut constructor_params = src
                .fields
                .iter()
                .map(|f| {
                    format!(
                        "{} {} {},",
                        f.ty.dart_required_modifier(),
                        f.ty.dart_api_type(),
                        f.name.dart_style()
                    )
                })
                .collect::<Vec<_>>();
            if has_methods {
                constructor_params.insert(0, bridge_requirement);
            }
            let constructor_params = constructor_params.join("");

            format!(
                "{}{}class {} with _${} {{
                const factory {}({{{}}}) = _{};
                {}
            }}",
                comments,
                metadata,
                self.ir.name,
                self.ir.name,
                self.ir.name,
                constructor_params,
                self.ir.name,
                methods_string
            )
        } else {
            let mut field_declarations = src
                .fields
                .iter()
                .map(|f| {
                    let comments = dart_comments(&f.comments);
                    format!(
                        "{}{} {} {};",
                        comments,
                        if f.is_final { "final" } else { "" },
                        f.ty.dart_api_type(),
                        f.name.dart_style()
                    )
                })
                .collect::<Vec<_>>();
            if has_methods {
                field_declarations.insert(0, field_bridge);
            }
            let field_declarations = field_declarations.join("\n");

            let mut constructor_params = src
                .fields
                .iter()
                .map(|f| {
                    format!(
                        "{}this.{},",
                        f.ty.dart_required_modifier(),
                        f.name.dart_style()
                    )
                })
                .collect::<Vec<_>>();
            if has_methods {
                constructor_params.insert(0, bridge_requirement);
            }

            let constructor_params = constructor_params.join("");

            format!(
                "{}{}class {} {{
                {}

                {}({{{}}});
                {}
            }}",
                comments,
                metadata,
                self.ir.name,
                field_declarations,
                self.ir.name,
                constructor_params,
                methods_string
            )
        }
    }
}

fn generate_api_method(func: &IrFunc, _ir_struct: &IrStruct) -> GeneratedApiMethod {
    let is_static_method = {
        println!("is_static_method for {:?}", func);
        if let Some(_) = func.inputs.get(0) {};
        false
    };
    let raw_func_param_list = func
        .inputs
        .iter()
        .skip(1) //skip the first as it's the method 'self'
        .map(|input| {
            format!(
                "{}{} {}",
                input.ty.dart_required_modifier(),
                input.ty.dart_api_type(),
                input.name.dart_style()
            )
        })
        .collect::<Vec<_>>();

    let full_func_param_list = [raw_func_param_list, vec!["dynamic hint".to_string()]].concat();

    let partial = format!(
        "{} {}({{ {} }})",
        func.mode.dart_return_type(&func.output.dart_api_type()),
        if is_static_method {
            func.name.replace("__method", "").to_case(Case::Camel)
        } else {
            func.name.replace("__method", "").to_case(Case::Camel)
        },
        full_func_param_list.join(","),
    );

    let signature = format!("{}", partial);

    let arg_names = func
        .inputs
        .iter()
        .skip(1) //skip the first as it's the method 'self'
        .map(|input| format!("{}:{},", input.name.dart_style(), input.name.dart_style()))
        .collect::<Vec<_>>()
        .concat();

    let implementation = format!(
        "bridge.{}({}: this, {})",
        func.name.clone().to_case(Case::Camel),
        func.inputs[0].name.dart_style(),
        arg_names
    );

    GeneratedApiMethod {
        signature,
        implementation,
    }
}
