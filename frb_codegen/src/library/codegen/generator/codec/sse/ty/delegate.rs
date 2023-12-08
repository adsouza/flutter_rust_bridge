use crate::codegen::generator::codec::sse::lang::*;
use crate::codegen::generator::codec::sse::ty::*;

impl<'a> CodecSseTyTrait for DelegateCodecSseTy<'a> {
    fn generate_encode(&self, lang: &Lang) -> String {
        let inner_expr = match &self.ir {
            IrTypeDelegate::Array(_) => "src",
            IrTypeDelegate::String => "utf8.encoder.convert(src)",
            IrTypeDelegate::PrimitiveEnum(_) => "src.index",
            IrTypeDelegate::Time(_) => "src.microsecondsSinceEpoch",
            IrTypeDelegate::Uuid => "src.toBytes()",
            IrTypeDelegate::Backtrace => "NOT_USED",
            IrTypeDelegate::Anyhow => "NOT_USED",
        };
        simple_delegate_encode(lang, &self.ir.get_delegate(), inner_expr)
    }

    fn generate_decode(&self, lang: &Lang) -> String {
        let wrapper_expr = match &self.ir {
            IrTypeDelegate::Array(_) => {
                "flutter_rust_bridge::for_generated::from_vec_to_array(inner)"
            }
            IrTypeDelegate::String => "String::from_utf8_lossy(&inner).into_owned()",
            IrTypeDelegate::PrimitiveEnum(_) => "TODO",
            IrTypeDelegate::Time(_) => "TODO",
            IrTypeDelegate::Uuid => "TODO",
            IrTypeDelegate::Backtrace => "TODO",
            IrTypeDelegate::Anyhow => "TODO",
        };
        simple_delegate_decode(lang, &self.ir.get_delegate(), wrapper_expr)
    }
}

pub(super) fn simple_delegate_encode(lang: &Lang, inner_ty: &IrType, inner_expr: &str) -> String {
    format!("{};", lang.call_encode(inner_ty, inner_expr))
}

pub(super) fn simple_delegate_decode(lang: &Lang, inner_ty: &IrType, wrapper_expr: &str) -> String {
    format!(
        "{var_decl} inner = {};
        return {wrapper_expr};",
        lang.call_decode(&inner_ty),
        var_decl = lang.var_decl()
    )
}
