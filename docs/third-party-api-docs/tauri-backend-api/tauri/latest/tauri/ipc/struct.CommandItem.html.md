# Struct CommandItemCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/ipc/command.rs.html#22-37)

```
pub struct CommandItem<'a, R: Runtime> {
    pub plugin: Option<&'static str>,
    pub name: &'static str,
    pub key: &'static str,
    pub message: &'a InvokeMessage<R>,
    pub acl: &'a Option<Vec<ResolvedCommand>>,
}
```

Expand description

Represents a custom command.

## Fields[§](#fields)

[§](#structfield.plugin)`plugin: Option<&'static str>`

Name of the plugin if this command targets one.

[§](#structfield.name)`name: &'static str`

The name of the command, e.g. `handler` on `#[command] fn handler(value: u64)`

[§](#structfield.key)`key: &'static str`

The key of the command item, e.g. `value` on `#[command] fn handler(value: u64)`

[§](#structfield.message)`message: &'a InvokeMessage<R>`

The [`InvokeMessage`](struct.InvokeMessage.html.md "struct tauri::ipc::InvokeMessage") that was passed to this command.

[§](#structfield.acl)`acl: &'a Option<Vec<ResolvedCommand>>`

The resolved ACL for this command.

## Trait Implementations[§](#trait-implementations)

[Source](../../src/tauri/ipc/command.rs.html#113-178)[§](#impl-Deserializer%3C'de%3E-for-CommandItem%3C'de,+R%3E)

### impl<'de, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Deserializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html "trait serde::de::Deserializer")<'de> for [CommandItem](struct.CommandItem.html.md "struct tauri::ipc::CommandItem")<'de, R>

A [`Deserializer`](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html "trait serde::de::Deserializer") wrapper around [`CommandItem`](struct.CommandItem.html.md "struct tauri::ipc::CommandItem").

If the key doesn’t exist, an error will be returned if the deserialized type is not expecting
an optional item. If the key does exist, the value will be called with
[`Value`](https://docs.rs/serde_json/1.0.140/x86_64-unknown-linux-gnu/serde_json/value/enum.Value.html "enum serde_json::value::Value")’s [`Deserializer`](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html "trait serde::de::Deserializer") implementation.

[Source](../../src/tauri/ipc/command.rs.html#114)[§](#associatedtype.Error)

#### type [Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error) = [Error](https://docs.rs/serde_json/1.0.140/x86_64-unknown-linux-gnu/serde_json/error/struct.Error.html "struct serde_json::error::Error")

The error type that can be returned if some error occurs during
deserialization.

[Source](../../src/tauri/ipc/command.rs.html#116)[§](#method.deserialize_any)

#### fn [deserialize\_any](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_any)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Require the `Deserializer` to figure out how to drive the visitor based
on what data type is in the input. [Read more](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_any)

[Source](../../src/tauri/ipc/command.rs.html#117)[§](#method.deserialize_bool)

#### fn [deserialize\_bool](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_bool)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting a `bool` value.

[Source](../../src/tauri/ipc/command.rs.html#118)[§](#method.deserialize_i8)

#### fn [deserialize\_i8](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_i8)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting an `i8` value.

[Source](../../src/tauri/ipc/command.rs.html#119)[§](#method.deserialize_i16)

#### fn [deserialize\_i16](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_i16)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting an `i16` value.

[Source](../../src/tauri/ipc/command.rs.html#120)[§](#method.deserialize_i32)

#### fn [deserialize\_i32](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_i32)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting an `i32` value.

[Source](../../src/tauri/ipc/command.rs.html#121)[§](#method.deserialize_i64)

#### fn [deserialize\_i64](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_i64)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting an `i64` value.

[Source](../../src/tauri/ipc/command.rs.html#122)[§](#method.deserialize_u8)

#### fn [deserialize\_u8](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_u8)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting a `u8` value.

[Source](../../src/tauri/ipc/command.rs.html#123)[§](#method.deserialize_u16)

#### fn [deserialize\_u16](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_u16)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting a `u16` value.

[Source](../../src/tauri/ipc/command.rs.html#124)[§](#method.deserialize_u32)

#### fn [deserialize\_u32](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_u32)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting a `u32` value.

[Source](../../src/tauri/ipc/command.rs.html#125)[§](#method.deserialize_u64)

#### fn [deserialize\_u64](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_u64)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting a `u64` value.

[Source](../../src/tauri/ipc/command.rs.html#126)[§](#method.deserialize_f32)

#### fn [deserialize\_f32](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_f32)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting a `f32` value.

[Source](../../src/tauri/ipc/command.rs.html#127)[§](#method.deserialize_f64)

#### fn [deserialize\_f64](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_f64)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting a `f64` value.

[Source](../../src/tauri/ipc/command.rs.html#128)[§](#method.deserialize_char)

#### fn [deserialize\_char](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_char)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting a `char` value.

[Source](../../src/tauri/ipc/command.rs.html#129)[§](#method.deserialize_str)

#### fn [deserialize\_str](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_str)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting a string value and does
not benefit from taking ownership of buffered data owned by the
`Deserializer`. [Read more](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_str)

[Source](../../src/tauri/ipc/command.rs.html#130)[§](#method.deserialize_string)

#### fn [deserialize\_string](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_string)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting a string value and would
benefit from taking ownership of buffered data owned by the
`Deserializer`. [Read more](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_string)

[Source](../../src/tauri/ipc/command.rs.html#131)[§](#method.deserialize_bytes)

#### fn [deserialize\_bytes](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_bytes)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting a byte array and does not
benefit from taking ownership of buffered data owned by the
`Deserializer`. [Read more](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_bytes)

[Source](../../src/tauri/ipc/command.rs.html#132)[§](#method.deserialize_byte_buf)

#### fn [deserialize\_byte\_buf](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_byte_buf)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting a byte array and would
benefit from taking ownership of buffered data owned by the
`Deserializer`. [Read more](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_byte_buf)

[Source](../../src/tauri/ipc/command.rs.html#134-145)[§](#method.deserialize_option)

#### fn [deserialize\_option](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_option)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting an optional value. [Read more](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_option)

[Source](../../src/tauri/ipc/command.rs.html#147)[§](#method.deserialize_unit)

#### fn [deserialize\_unit](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_unit)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting a unit value.

[Source](../../src/tauri/ipc/command.rs.html#148)[§](#method.deserialize_unit_struct)

#### fn [deserialize\_unit\_struct](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_unit_struct)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, name: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting a unit struct with a
particular name.

[Source](../../src/tauri/ipc/command.rs.html#149)[§](#method.deserialize_newtype_struct)

#### fn [deserialize\_newtype\_struct](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_newtype_struct)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, name: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting a newtype struct with a
particular name.

[Source](../../src/tauri/ipc/command.rs.html#150)[§](#method.deserialize_seq)

#### fn [deserialize\_seq](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_seq)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting a sequence of values.

[Source](../../src/tauri/ipc/command.rs.html#151)[§](#method.deserialize_tuple)

#### fn [deserialize\_tuple](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_tuple)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, len: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting a sequence of values and
knows how many values there are without looking at the serialized data.

[Source](../../src/tauri/ipc/command.rs.html#153-158)[§](#method.deserialize_tuple_struct)

#### fn [deserialize\_tuple\_struct](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_tuple_struct)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, name: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), len: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting a tuple struct with a
particular name and number of fields.

[Source](../../src/tauri/ipc/command.rs.html#160)[§](#method.deserialize_map)

#### fn [deserialize\_map](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_map)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting a map of key-value pairs.

[Source](../../src/tauri/ipc/command.rs.html#162-167)[§](#method.deserialize_struct)

#### fn [deserialize\_struct](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_struct)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, name: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), fields: &'static [&'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)], visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting a struct with a particular
name and fields.

[Source](../../src/tauri/ipc/command.rs.html#169-174)[§](#method.deserialize_enum)

#### fn [deserialize\_enum](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_enum)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, name: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), fields: &'static [&'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)], visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting an enum value with a
particular name and possible variants.

[Source](../../src/tauri/ipc/command.rs.html#176)[§](#method.deserialize_identifier)

#### fn [deserialize\_identifier](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_identifier)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type is expecting the name of a struct
field or the discriminant of an enum variant.

[Source](../../src/tauri/ipc/command.rs.html#177)[§](#method.deserialize_ignored_any)

#### fn [deserialize\_ignored\_any](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_ignored_any)<V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")>

Hint that the `Deserialize` type needs to deserialize a value whose type
doesn’t matter because it is ignored. [Read more](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#tymethod.deserialize_ignored_any)

[Source](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/src/serde/de/mod.rs.html#960-962)[§](#method.deserialize_i128)

#### fn [deserialize\_i128](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#method.deserialize_i128)<V>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<<V as [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")> where V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>,

Hint that the `Deserialize` type is expecting an `i128` value. [Read more](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#method.deserialize_i128)

[Source](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/src/serde/de/mod.rs.html#991-993)[§](#method.deserialize_u128)

#### fn [deserialize\_u128](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#method.deserialize_u128)<V>( self, visitor: V, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<<V as [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>>::[Value](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html#associatedtype.Value "type serde::de::Visitor::Value"), Self::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")> where V: [Visitor](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Visitor.html "trait serde::de::Visitor")<'de>,

Hint that the `Deserialize` type is expecting an `u128` value. [Read more](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#method.deserialize_u128)

[Source](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/src/serde/de/mod.rs.html#1222)[§](#method.is_human_readable)

#### fn [is\_human\_readable](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#method.is_human_readable)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Determine whether `Deserialize` implementations should expect to
deserialize their human-readable form. [Read more](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#method.is_human_readable)

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-CommandItem%3C'a,+R%3E)

### impl<'a, R> [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [CommandItem](struct.CommandItem.html.md "struct tauri::ipc::CommandItem")<'a, R>

[§](#impl-RefUnwindSafe-for-CommandItem%3C'a,+R%3E)

### impl<'a, R> ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [CommandItem](struct.CommandItem.html.md "struct tauri::ipc::CommandItem")<'a, R>

[§](#impl-Send-for-CommandItem%3C'a,+R%3E)

### impl<'a, R> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [CommandItem](struct.CommandItem.html.md "struct tauri::ipc::CommandItem")<'a, R>

[§](#impl-Sync-for-CommandItem%3C'a,+R%3E)

### impl<'a, R> [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [CommandItem](struct.CommandItem.html.md "struct tauri::ipc::CommandItem")<'a, R>

[§](#impl-Unpin-for-CommandItem%3C'a,+R%3E)

### impl<'a, R> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [CommandItem](struct.CommandItem.html.md "struct tauri::ipc::CommandItem")<'a, R>

[§](#impl-UnwindSafe-for-CommandItem%3C'a,+R%3E)

### impl<'a, R> ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [CommandItem](struct.CommandItem.html.md "struct tauri::ipc::CommandItem")<'a, R>

## Blanket Implementations[§](#blanket-implementations)

[Source](https://doc.rust-lang.org/nightly/src/core/any.rs.html#138)[§](#impl-Any-for-T)

### impl<T> [Any](https://doc.rust-lang.org/nightly/core/any/trait.Any.html "trait core::any::Any") for T where T: 'static + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/core/any.rs.html#139)[§](#method.type_id)

#### fn [type\_id](https://doc.rust-lang.org/nightly/core/any/trait.Any.html#tymethod.type_id)(&self) -> [TypeId](https://doc.rust-lang.org/nightly/core/any/struct.TypeId.html "struct core::any::TypeId")

Gets the `TypeId` of `self`. [Read more](https://doc.rust-lang.org/nightly/core/any/trait.Any.html#tymethod.type_id)

[Source](https://doc.rust-lang.org/nightly/src/core/borrow.rs.html#209)[§](#impl-Borrow%3CT%3E-for-T)

### impl<T> [Borrow](https://doc.rust-lang.org/nightly/core/borrow/trait.Borrow.html "trait core::borrow::Borrow")<T> for T where T: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/core/borrow.rs.html#211)[§](#method.borrow)

#### fn [borrow](https://doc.rust-lang.org/nightly/core/borrow/trait.Borrow.html#tymethod.borrow)(&self) -> [&T](https://doc.rust-lang.org/nightly/std/primitive.reference.html)

Immutably borrows from an owned value. [Read more](https://doc.rust-lang.org/nightly/core/borrow/trait.Borrow.html#tymethod.borrow)

[Source](https://doc.rust-lang.org/nightly/src/core/borrow.rs.html#217)[§](#impl-BorrowMut%3CT%3E-for-T)

### impl<T> [BorrowMut](https://doc.rust-lang.org/nightly/core/borrow/trait.BorrowMut.html "trait core::borrow::BorrowMut")<T> for T where T: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/core/borrow.rs.html#218)[§](#method.borrow_mut)

#### fn [borrow\_mut](https://doc.rust-lang.org/nightly/core/borrow/trait.BorrowMut.html#tymethod.borrow_mut)(&mut self) -> [&mut T](https://doc.rust-lang.org/nightly/std/primitive.reference.html)

Mutably borrows from an owned value. [Read more](https://doc.rust-lang.org/nightly/core/borrow/trait.BorrowMut.html#tymethod.borrow_mut)

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#767)[§](#impl-From%3CT%3E-for-T)

### impl<T> [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<T> for T

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#770)[§](#method.from)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(t: T) -> T

Returns the argument unchanged.

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#750-752)[§](#impl-Into%3CU%3E-for-T)

### impl<T, U> [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<U> for T where U: [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<T>,

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#760)[§](#method.into)

#### fn [into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html#tymethod.into)(self) -> U

Calls `U::from(self)`.

That is, this conversion is whatever the implementation of
`From<T> for U` chooses to do.

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#806-808)[§](#impl-TryFrom%3CU%3E-for-T)

### impl<T, U> [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<U> for T where U: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<T>,

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#810)[§](#associatedtype.Error-2)

#### type [Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error) = [Infallible](https://doc.rust-lang.org/nightly/core/convert/enum.Infallible.html "enum core::convert::Infallible")

The type returned in the event of a conversion error.

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#813)[§](#method.try_from)

#### fn [try\_from](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#tymethod.try_from)(value: U) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, <T as [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<U>>::[Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error "type core::convert::TryFrom::Error")>

Performs the conversion.

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#791-793)[§](#impl-TryInto%3CU%3E-for-T)

### impl<T, U> [TryInto](https://doc.rust-lang.org/nightly/core/convert/trait.TryInto.html "trait core::convert::TryInto")<U> for T where U: [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<T>,

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#795)[§](#associatedtype.Error-1)

#### type [Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryInto.html#associatedtype.Error) = <U as [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<T>>::[Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error "type core::convert::TryFrom::Error")

The type returned in the event of a conversion error.

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#798)[§](#method.try_into)

#### fn [try\_into](https://doc.rust-lang.org/nightly/core/convert/trait.TryInto.html#tymethod.try_into)(self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<U, <U as [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<T>>::[Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error "type core::convert::TryFrom::Error")>

Performs the conversion.

[Source](https://docs.rs/yoke/0.7.5/x86_64-unknown-linux-gnu/src/yoke/erased.rs.html#22)[§](#impl-ErasedDestructor-for-T)

### impl<T> [ErasedDestructor](https://docs.rs/yoke/0.7.5/x86_64-unknown-linux-gnu/yoke/erased/trait.ErasedDestructor.html "trait yoke::erased::ErasedDestructor") for T where T: 'static,

[Source](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/src/icu_provider/any.rs.html#32)[§](#impl-MaybeSendSync-for-T)

### impl<T> [MaybeSendSync](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/any/trait.MaybeSendSync.html "trait icu_provider::any::MaybeSendSync") for T