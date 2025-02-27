use crate::codegen::generator::acc::Acc;
use crate::codegen::generator::api_dart::spec_generator::base::ApiDartGenerator;
use crate::codegen::generator::wire::dart::spec_generator::base::*;
use crate::codegen::generator::wire::dart::spec_generator::misc::ty::WireDartGeneratorMiscTrait;
use crate::codegen::generator::wire::dart::spec_generator::output_code::WireDartOutputCode;
use crate::codegen::ir::ty::IrTypeTrait;
use crate::library::codegen::generator::api_dart::spec_generator::info::ApiDartGeneratorInfoTrait;
use itertools::Itertools;

impl<'a> WireDartGeneratorMiscTrait for DartFnWireDartGenerator<'a> {
    fn generate_extra_functions(&self) -> Option<Acc<WireDartOutputCode>> {
        let num_params = self.ir.inputs.len();
        let raw_parameter_names = (0..num_params).map(|i| format!("rawArg{i}")).join(", ");
        let parameter_names = (0..num_params).map(|i| format!("arg{i}")).join(", ");
        let repeated_dynamics = (0..num_params).map(|_i| "dynamic".to_string()).join(", ");
        let decode_block = (self.ir.inputs.iter().enumerate())
            .map(|(i, ty)| {
                format!(
                    "final arg{i} = dco_decode_{}(rawArg{i});\n",
                    ty.safe_ident()
                )
            })
            .join("");
        let ir_safe_ident = self.ir.safe_ident();
        let dart_api_type =
            ApiDartGenerator::new(self.ir.clone(), self.context.as_api_dart_context())
                .dart_api_type();
        let return_type_safe_ident = self.ir.output.safe_ident();

        let api_impl_body = format!(
            "
            Future<void> Function(int, {repeated_dynamics})
                encode_{ir_safe_ident}({dart_api_type} raw) {{
              return (callId, {raw_parameter_names}) async {{
                {decode_block}

                final rawOutput = await raw({parameter_names});

                final serializer = SseSerializer(generalizedFrbRustBinding);
                sse_encode_{return_type_safe_ident}(rawOutput, serializer);
                final output = serializer.intoRaw();

                wire.dart_fn_deliver_output(callId, output.ptr, output.rustVecLen, output.dataLen);
              }};
            }}
            ",
        );
        Some(Acc::new_common(WireDartOutputCode {
            api_impl_class_body: api_impl_body,
            ..Default::default()
        }))
    }
}
