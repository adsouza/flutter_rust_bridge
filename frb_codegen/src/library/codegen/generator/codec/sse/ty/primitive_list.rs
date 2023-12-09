use crate::codegen::generator::codec::sse::ty::*;

impl<'a> CodecSseTyTrait for PrimitiveListCodecSseTy<'a> {
    fn generate_encode(&self, lang: &Lang) -> String {
        match lang {
            Lang::DartLang(_) => format!(
                "serializer.buffer.put{}(self);",
                get_serializer_dart_postfix(&self.ir)
            ),
            Lang::RustLang(_) => format!(
                "serializer.cursor.write_{}::<NativeEndian>(self).unwrap();",
                self.ir.rust_api_type()
            ),
        }
    }

    fn generate_decode(&self, lang: &Lang) -> String {
        match lang {
            Lang::DartLang(_) => format!(
                "return deserializer.buffer.get{}();",
                get_serializer_dart_postfix(&self.ir)
            ),
            Lang::RustLang(_) => {
                format!(
                    "deserializer.cursor.read_{}::<NativeEndian>().unwrap()",
                    self.ir.rust_api_type()
                )
            }
        }
    }
}
