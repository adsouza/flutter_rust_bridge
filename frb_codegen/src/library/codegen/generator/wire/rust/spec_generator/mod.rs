use crate::codegen::dumper::Dumper;
use crate::codegen::generator::codec::structs::CodecMode;
use crate::codegen::generator::codec::structs::EncodeOrDecode::{Decode, Encode};
use crate::codegen::generator::wire::rust::spec_generator::base::WireRustGeneratorContext;
use crate::codegen::generator::wire::rust::spec_generator::codec::base::{
    WireRustCodecEntrypoint, WireRustCodecOutputSpec,
};
use crate::codegen::generator::wire::rust::spec_generator::dump::generate_dump_info;
use crate::codegen::generator::wire::rust::spec_generator::misc::WireRustOutputSpecMisc;
use crate::codegen::ir::pack::IrPackComputedCache;
use crate::codegen::ConfigDumpContent::GeneratorInfo;
use itertools::Itertools;
use serde::Serialize;
use strum::IntoEnumIterator;

pub(crate) mod base;
pub(crate) mod codec;
mod dump;
pub(crate) mod extern_func;
pub(crate) mod misc;
pub mod output_code;

#[derive(Serialize)]
pub(super) struct WireRustOutputSpec {
    pub(super) misc: WireRustOutputSpecMisc,
    pub(super) dart2rust: WireRustCodecOutputSpec,
    pub(super) rust2dart: WireRustCodecOutputSpec,
    pub(super) extern_struct_names: Vec<String>,
}

pub(super) fn generate(
    context: WireRustGeneratorContext,
    dumper: &Dumper,
) -> anyhow::Result<WireRustOutputSpec> {
    let cache = IrPackComputedCache::compute(context.ir_pack);

    dumper.dump(
        GeneratorInfo,
        "wire_rust.json",
        &generate_dump_info(&cache, context),
    )?;

    let dart2rust = CodecMode::iter()
        .map(WireRustCodecEntrypoint::from)
        .flat_map(|codec| codec.generate(context, &cache.distinct_types, Decode))
        .collect();
    let rust2dart = CodecMode::iter()
        .map(WireRustCodecEntrypoint::from)
        .flat_map(|codec| codec.generate(context, &cache.distinct_types, Encode))
        .collect();
    let extern_struct_names = generate_extern_struct_names(&dart2rust, &rust2dart);

    Ok(WireRustOutputSpec {
        misc: misc::generate(context, &cache)?,
        dart2rust,
        rust2dart,
        extern_struct_names,
    })
}

fn generate_extern_struct_names(
    dart2rust: &WireRustCodecOutputSpec,
    rust2dart: &WireRustCodecOutputSpec,
) -> Vec<String> {
    [dart2rust.inner.io.clone(), rust2dart.inner.io.clone()]
        .concat()
        .iter()
        .flat_map(|x| x.extern_classes.clone())
        .map(|x| x.name)
        .unique()
        .collect_vec()
}
