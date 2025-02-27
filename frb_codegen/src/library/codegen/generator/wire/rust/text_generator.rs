use crate::codegen::generator::acc::Acc;
use crate::codegen::generator::misc::target::{Target, TargetOrCommon};
use crate::codegen::generator::misc::text_generator_utils::{
    generate_text_respecting_web_flag, section_header_comment,
};
use crate::codegen::generator::wire::rust::internal_config::GeneratorWireRustInternalConfig;
use crate::codegen::generator::wire::rust::spec_generator::extern_func::ExternFunc;
use crate::codegen::generator::wire::rust::spec_generator::output_code::WireRustOutputCode;
use crate::codegen::generator::wire::rust::spec_generator::WireRustOutputSpec;
use itertools::Itertools;
use strum::IntoEnumIterator;

// Call it "text", not "code", because the whole codegen is generating code,
// and we want to emphasize we are generating final output text here.
pub(super) struct WireRustOutputText {
    pub(super) text: Acc<Option<String>>,
    pub(super) extern_funcs: Vec<ExternFunc>,
}

pub(super) fn generate(
    spec: &WireRustOutputSpec,
    config: &GeneratorWireRustInternalConfig,
) -> anyhow::Result<WireRustOutputText> {
    let merged_code = generate_merged_code(spec);
    let text = generate_text_from_merged_code(
        config,
        &merged_code.clone().map(|code, _| code.all_code()),
    )?;
    let extern_funcs = compute_extern_funcs(merged_code);

    Ok(WireRustOutputText { text, extern_funcs })
}

fn compute_extern_funcs(merged_code: Acc<WireRustOutputCode>) -> Vec<ExternFunc> {
    let extern_funcs_acc = merged_code.map(|code, _| code.extern_funcs);
    TargetOrCommon::iter()
        .flat_map(|target| extern_funcs_acc[target].clone())
        .collect_vec()
}

fn generate_merged_code(spec: &WireRustOutputSpec) -> Acc<WireRustOutputCode> {
    let mut merged_code = Acc::<Vec<WireRustOutputCode>>::default();
    let mut add = |section_name: &str, item: &Acc<Vec<WireRustOutputCode>>| {
        if !section_name.is_empty() {
            merged_code += section_header_comment(section_name, item);
        }
        merged_code += item.clone();
    };

    add("", &spec.misc.code_header);
    add("", &spec.misc.file_attributes);
    add("imports", &spec.misc.imports);
    add("boilerplate", &spec.misc.boilerplate);
    add("executor", &spec.misc.executor);
    add("wire_funcs", &spec.misc.wire_funcs);
    add("wrapper_structs", &spec.misc.wrapper_structs);
    add("static_checks", &spec.misc.static_checks);
    add("related_funcs", &spec.misc.related_funcs);
    add("dart2rust", &spec.dart2rust.inner);
    add("rust2dart", &spec.rust2dart.inner);

    merged_code.map(|code, _| code.into_iter().fold(Default::default(), |a, b| a + b))
}

fn generate_text_from_merged_code(
    config: &GeneratorWireRustInternalConfig,
    core_code: &Acc<String>,
) -> anyhow::Result<Acc<Option<String>>> {
    Ok(generate_text_respecting_web_flag(
        Acc {
            common: generate_text_common(&core_code.common, config)?,
            io: core_code.io.clone(),
            web: core_code.web.clone(),
        },
        config.web_enabled,
    ))
}

fn generate_text_common(
    core_code_common: &str,
    config: &GeneratorWireRustInternalConfig,
) -> anyhow::Result<String> {
    let mod_io = generate_text_common_mod_declaration("io", config, Target::Io)?;

    let mod_web = if config.web_enabled {
        generate_text_common_mod_declaration("web", config, Target::Web)?
    } else {
        "".into()
    };

    Ok(format!(
        "{core_code_common}
        {mod_io}
        {mod_web}
        ",
    ))
}

fn generate_text_common_mod_declaration(
    name: &str,
    config: &GeneratorWireRustInternalConfig,
    target: Target,
) -> anyhow::Result<String> {
    let prelude = match target {
        Target::Io => "",
        Target::Web => "/// cbindgen:ignore",
    };

    let cfg = match target {
        Target::Io => r#"not(target_family = "wasm")"#,
        Target::Web => r#"target_family = "wasm""#,
    };

    let mod_filename = config.rust_output_path[target.into()]
        .file_name()
        .unwrap()
        .to_str()
        .unwrap();

    Ok(format!(
        "
        {prelude}
        #[cfg({cfg})]
        #[path = \"{mod_filename}\"]
        mod {name};
        #[cfg({cfg})]
        pub use {name}::*;
        "
    ))
}
