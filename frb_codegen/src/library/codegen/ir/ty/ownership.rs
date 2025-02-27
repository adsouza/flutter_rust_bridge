use crate::codegen::ir::ty::{IrContext, IrType, IrTypeTrait};
use serde::Serialize;

crate::ir! {
pub struct IrTypeOwnership {
    pub mode: IrTypeOwnershipMode,
    pub inner: Box<IrType>,
}
}

#[derive(Debug, Clone, Hash, Eq, PartialEq, Serialize, strum_macros::Display)]
pub enum IrTypeOwnershipMode {
    /// "T"
    Owned,
    /// "&T"
    Ref,
    /// "&mut T"
    RefMut,
}

impl IrTypeTrait for IrTypeOwnership {
    fn visit_children_types<F: FnMut(&IrType) -> bool>(
        &self,
        f: &mut F,
        ir_context: &impl IrContext,
    ) {
        self.inner.visit_types(f, ir_context)
    }

    fn safe_ident(&self) -> String {
        format!("Ownership{}_{}", self.mode, self.inner.safe_ident())
    }

    // frb-coverage:ignore-start
    fn rust_api_type(&self) -> String {
        unreachable!()
    }
    // frb-coverage:ignore-end
}
