use lib_flutter_rust_bridge_codegen::{
    config_parse, frb_codegen_multi, get_symbols_if_no_duplicates, init_logger, RawOpts,
};

/// Path of input Rust code
const RUST_INPUT_1: &str = "src/api_1.rs";
const RUST_INPUT_2: &str = "src/api_2.rs";
/// Path of output generated Dart code
const DART_OUTPUT_1: &str = "../dart/lib/bridge_generated_api_1.dart";
const DART_OUTPUT_2: &str = "../dart/lib/bridge_generated_api_2.dart";
/// Path of output Rust code
const RUST_OUTPUT_1: &str = "src/generated_api_1.rs";
const RUST_OUTPUT_2: &str = "src/generated_api_2.rs";
/// Class name to use in dart, corresponding to each Rust block
const CLASS_NAME_1: &str = "ApiClass1";
const CLASS_NAME_2: &str = "ApiClass2";

fn main() {
    init_logger("./logs/", true).unwrap();

    // Tell Cargo that if the input Rust code changes, to rerun this build script.
    println!("cargo:rerun-if-changed={RUST_INPUT_1}");
    println!("cargo:rerun-if-changed={RUST_INPUT_2}");
    // Options for frb_codegen
    let mut raw_opts = RawOpts {
        // Path of input Rust code
        rust_input: vec![RUST_INPUT_1.to_string(), RUST_INPUT_2.to_string()],
        // Path of output generated Dart code
        dart_output: vec![DART_OUTPUT_1.to_string(), DART_OUTPUT_2.to_string()],
        // Path of output Rust code
        rust_output: Some(vec![RUST_OUTPUT_1.to_string(), RUST_OUTPUT_2.to_string()]),
        wasm: true,
        // Class name of each Rust block of api
        class_name: Some(vec![CLASS_NAME_1.to_string(), CLASS_NAME_2.to_string()]),
        dart_format_line_length: 120,
        // for other options use defaults
        ..Default::default()
    };

    if cfg!(feature = "c-output") {
        raw_opts.c_output = Some(vec![
            // each field should contain head file name
            "./c_output_path/c_output_1.h".into(),
            "./c_output_path/c_output_2.h".into(),
        ]);
    }

    if cfg!(feature = "extra-c-output-path") {
        raw_opts.extra_c_output_path = Some(vec![
            // For test, the below 2 paths format are made a little different
            "./extra_c_output_path_1/".into(),
            "extra_c_output_path_2".into(),
        ]);
    }

    // get opts from raw opts
    let (all_configs, all_symbols) = config_parse(raw_opts).unwrap();

    // generation of rust api for ffi (multi-blocks)
    for config_index in 0..all_configs.len() {
        frb_codegen_multi(&all_configs, config_index, &all_symbols).unwrap()
    }
}
