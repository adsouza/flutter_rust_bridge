use crate::utils::dart_repository::dart_repo::{DartDependencyMode, DartRepository};
use crate::utils::path_utils::path_to_string;
use anyhow::bail;
use lazy_static::lazy_static;
use semver::VersionReq;
use std::path::Path;
use std::str::FromStr;

lazy_static! {
    pub(crate) static ref FFI_REQUIREMENT: VersionReq =
        VersionReq::parse(">= 2.0.1, < 3.0.0").unwrap();
    pub(crate) static ref FFIGEN_REQUIREMENT: VersionReq =
        VersionReq::parse(">= 8.0.0, < 10.0.0").unwrap();
}

pub fn ensure_tools_available(dart_root: &Path, enable_deps_check: bool) -> anyhow::Result<()> {
    let repo = DartRepository::from_str(&path_to_string(dart_root)?)?;
    if !repo.toolchain_available() {
        bail!("Dart/Flutter toolchain not available");
    }

    if enable_deps_check {
        repo.has_specified("ffi", DartDependencyMode::Main, &FFI_REQUIREMENT)?;
        repo.has_installed("ffi", DartDependencyMode::Main, &FFI_REQUIREMENT)?;

        repo.has_specified("ffigen", DartDependencyMode::Dev, &FFIGEN_REQUIREMENT)?;
        repo.has_installed("ffigen", DartDependencyMode::Dev, &FFIGEN_REQUIREMENT)?;
    }

    Ok(())
}
