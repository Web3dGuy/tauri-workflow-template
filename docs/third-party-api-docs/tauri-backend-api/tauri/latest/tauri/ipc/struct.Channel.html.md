# Struct ChannelCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/ipc/channel.rs.html#40-44)

```
pub struct Channel<TSend = InvokeResponseBody> { /* private fields */ }
```

Expand description

An IPC channel.

## Implementations[§](#implementations)

[Source](../../src/tauri/ipc/channel.rs.html#155-216)[§](#impl-Channel%3CTSend%3E)

### impl<TSend> [Channel](struct.Channel.html.md "struct tauri::ipc::Channel")<TSend>

[Source](../../src/tauri/ipc/channel.rs.html#157-161)

#### pub fn [new](#method.new)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([InvokeResponseBody](enum.InvokeResponseBody.html.md "enum tauri::ipc::InvokeResponseBody")) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( on\_message: F, ) -> Self

Creates a new channel with the given message handler.

[Source](../../src/tauri/ipc/channel.rs.html#205-207)

#### pub fn [id](#method.id)(&self) -> [u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html)

The channel identifier.

[Source](../../src/tauri/ipc/channel.rs.html#210-215)

#### pub fn [send](#method.send)(&self, data: TSend) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> where TSend: [IpcResponse](trait.IpcResponse.html.md "trait tauri::ipc::IpcResponse"),

Sends the given data through the channel.

## Trait Implementations[§](#trait-implementations)

[Source](../../src/tauri/ipc/channel.rs.html#53-61)[§](#impl-Clone-for-Channel%3CTSend%3E)

### impl<TSend> [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [Channel](struct.Channel.html.md "struct tauri::ipc::Channel")<TSend>

[Source](../../src/tauri/ipc/channel.rs.html#54-60)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> Self

Returns a copy of the value. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#174)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &Self)

Performs copy-assignment from `source`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)

[Source](../../src/tauri/ipc/channel.rs.html#218-234)[§](#impl-CommandArg%3C'de,+R%3E-for-Channel%3CTSend%3E)

### impl<'de, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"), TSend> [CommandArg](trait.CommandArg.html.md "trait tauri::ipc::CommandArg")<'de, R> for [Channel](struct.Channel.html.md "struct tauri::ipc::Channel")<TSend>

[Source](../../src/tauri/ipc/channel.rs.html#220-233)[§](#method.from_command)

#### fn [from\_command](trait.CommandArg.html_tymethod.from_command.md)(command: [CommandItem](struct.CommandItem.html.md "struct tauri::ipc::CommandItem")<'de, R>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Self, [InvokeError](struct.InvokeError.html.md "struct tauri::ipc::InvokeError")>

Grabs the [`Webview`](..\webview\struct.Webview.html.md "struct tauri::webview::Webview") from the [`CommandItem`](struct.CommandItem.html.md "struct tauri::ipc::CommandItem") and returns the associated [`Channel`](struct.Channel.html.md "struct tauri::ipc::Channel").

[Source](../../src/tauri/ipc/channel.rs.html#48)[§](#impl-NamedType-for-Channel%3CTSend%3E)

### impl<TSend> [NamedType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.NamedType.html "trait specta::type::NamedType") for [Channel](struct.Channel.html.md "struct tauri::ipc::Channel")<TSend> where TSend: [Type](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.Type.html "trait specta::type::Type"),

[Source](../../src/tauri/ipc/channel.rs.html#48)[§](#method.sid)

#### fn [sid](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.NamedType.html#tymethod.sid)() -> [SpectaID](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/specta_id/struct.SpectaID.html "struct specta::specta_id::SpectaID")

[Source](../../src/tauri/ipc/channel.rs.html#48)[§](#method.named_data_type)

#### fn [named\_data\_type](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.NamedType.html#tymethod.named_data_type)( type\_map: &mut [TypeCollection](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type_collection/struct.TypeCollection.html "struct specta::type_collection::TypeCollection"), generics: &[[DataType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/enum.DataType.html "enum specta::datatype::DataType")], ) -> [NamedDataType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/named/struct.NamedDataType.html "struct specta::datatype::named::NamedDataType")

this is equivalent to [Type::inline](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.Type.html#tymethod.inline "associated function specta::type::Type::inline") but returns a [NamedDataType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/named/struct.NamedDataType.html "struct specta::datatype::named::NamedDataType") instead.

[Source](../../src/tauri/ipc/channel.rs.html#48)[§](#method.definition_named_data_type)

#### fn [definition\_named\_data\_type](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.NamedType.html#tymethod.definition_named_data_type)(type\_map: &mut [TypeCollection](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type_collection/struct.TypeCollection.html "struct specta::type_collection::TypeCollection")) -> [NamedDataType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/named/struct.NamedDataType.html "struct specta::datatype::named::NamedDataType")

this is equivalent to [Type::definition] but returns a [NamedDataType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/named/struct.NamedDataType.html "struct specta::datatype::named::NamedDataType") instead.

[Source](../../src/tauri/ipc/channel.rs.html#63-70)[§](#impl-Serialize-for-Channel%3CTSend%3E)

### impl<TSend> [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize") for [Channel](struct.Channel.html.md "struct tauri::ipc::Channel")<TSend>

[Source](../../src/tauri/ipc/channel.rs.html#64-69)[§](#method.serialize)

#### fn [serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html#tymethod.serialize)<S>(&self, serializer: S) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<S::[Ok](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html#associatedtype.Ok "type serde::ser::Serializer::Ok"), S::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html#associatedtype.Error "type serde::ser::Serializer::Error")> where S: [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer"),

Serialize this value into the given Serde serializer. [Read more](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html#tymethod.serialize)

[Source](../../src/tauri/ipc/channel.rs.html#48)[§](#impl-Type-for-Channel%3CTSend%3E)

### impl<TSend> [Type](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.Type.html "trait specta::type::Type") for [Channel](struct.Channel.html.md "struct tauri::ipc::Channel")<TSend> where TSend: [Type](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.Type.html "trait specta::type::Type"),

[Source](../../src/tauri/ipc/channel.rs.html#48)[§](#method.inline)

#### fn [inline](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.Type.html#tymethod.inline)(type\_map: &mut [TypeCollection](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type_collection/struct.TypeCollection.html "struct specta::type_collection::TypeCollection"), generics: [Generics](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/enum.Generics.html "enum specta::type::Generics")<'\_>) -> [DataType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/enum.DataType.html "enum specta::datatype::DataType")

Returns the definition of a type using the provided generics. [Read more](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.Type.html#tymethod.inline)

[Source](../../src/tauri/ipc/channel.rs.html#48)[§](#method.reference)

#### fn [reference](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.Type.html#method.reference)(type\_map: &mut [TypeCollection](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type_collection/struct.TypeCollection.html "struct specta::type_collection::TypeCollection"), generics: &[[DataType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/enum.DataType.html "enum specta::datatype::DataType")]) -> [Reference](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/reference/struct.Reference.html "struct specta::datatype::reference::Reference")

Generates a datatype corresponding to a reference to this type,
as determined by its category. Getting a reference to a type implies that
it should belong in the type map (since it has to be referenced from somewhere),
so the output of [`definition`](crate::Type::definition) will be put into the type map.

[Source](../../src/tauri/ipc/channel.rs.html#48)[§](#impl-Flatten-for-Channel%3CTSend%3E)

### impl<TSend> [Flatten](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.Flatten.html "trait specta::type::Flatten") for [Channel](struct.Channel.html.md "struct tauri::ipc::Channel")<TSend> where TSend: [Type](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.Type.html "trait specta::type::Type"),

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-Channel%3CTSend%3E)

### impl<TSend> [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [Channel](struct.Channel.html.md "struct tauri::ipc::Channel")<TSend>

[§](#impl-RefUnwindSafe-for-Channel%3CTSend%3E)

### impl<TSend = [InvokeResponseBody](enum.InvokeResponseBody.html.md "enum tauri::ipc::InvokeResponseBody")> ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [Channel](struct.Channel.html.md "struct tauri::ipc::Channel")<TSend>

[§](#impl-Send-for-Channel%3CTSend%3E)

### impl<TSend> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [Channel](struct.Channel.html.md "struct tauri::ipc::Channel")<TSend> where TSend: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send"),

[§](#impl-Sync-for-Channel%3CTSend%3E)

### impl<TSend> [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [Channel](struct.Channel.html.md "struct tauri::ipc::Channel")<TSend> where TSend: [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync"),

[§](#impl-Unpin-for-Channel%3CTSend%3E)

### impl<TSend> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [Channel](struct.Channel.html.md "struct tauri::ipc::Channel")<TSend> where TSend: [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin"),

[§](#impl-UnwindSafe-for-Channel%3CTSend%3E)

### impl<TSend = [InvokeResponseBody](enum.InvokeResponseBody.html.md "enum tauri::ipc::InvokeResponseBody")> ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [Channel](struct.Channel.html.md "struct tauri::ipc::Channel")<TSend>

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

[Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#441)[§](#impl-CloneToUninit-for-T)

### impl<T> [CloneToUninit](https://doc.rust-lang.org/nightly/core/clone/trait.CloneToUninit.html "trait core::clone::CloneToUninit") for T where T: [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone"),

[Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#443)[§](#method.clone_to_uninit)

#### unsafe fn [clone\_to\_uninit](https://doc.rust-lang.org/nightly/core/clone/trait.CloneToUninit.html#tymethod.clone_to_uninit)(&self, dest: [\*mut](https://doc.rust-lang.org/nightly/std/primitive.pointer.html) [u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html))

🔬This is a nightly-only experimental API. (`clone_to_uninit`)

Performs copy-assignment from `self` to `dest`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.CloneToUninit.html#tymethod.clone_to_uninit)

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#767)[§](#impl-From%3CT%3E-for-T)

### impl<T> [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<T> for T

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#770)[§](#method.from)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(t: T) -> T

Returns the argument unchanged.

[Source](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/src/specta/function/arg.rs.html#13)[§](#impl-FunctionArg-for-T)

### impl<T> [FunctionArg](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/function/arg/trait.FunctionArg.html "trait specta::function::arg::FunctionArg") for T where T: [Type](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.Type.html "trait specta::type::Type"),

[Source](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/src/specta/function/arg.rs.html#14)[§](#method.to_datatype)

#### fn [to\_datatype](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/function/arg/trait.FunctionArg.html#tymethod.to_datatype)(type\_map: &mut [TypeCollection](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type_collection/struct.TypeCollection.html "struct specta::type_collection::TypeCollection")) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[DataType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/enum.DataType.html "enum specta::datatype::DataType")>

Gets the type of an argument as a [`DataType`](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/enum.DataType.html "enum specta::datatype::DataType"). [Read more](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/function/arg/trait.FunctionArg.html#tymethod.to_datatype)

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#750-752)[§](#impl-Into%3CU%3E-for-T)

### impl<T, U> [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<U> for T where U: [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<T>,

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#760)[§](#method.into)

#### fn [into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html#tymethod.into)(self) -> U

Calls `U::from(self)`.

That is, this conversion is whatever the implementation of
`From<T> for U` chooses to do.

[Source](../../src/tauri/ipc/mod.rs.html#176-182)[§](#impl-IpcResponse-for-T)

### impl<T> [IpcResponse](trait.IpcResponse.html.md "trait tauri::ipc::IpcResponse") for T where T: [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize"),

[Source](../../src/tauri/ipc/mod.rs.html#177-181)[§](#method.body)

#### fn [body](trait.IpcResponse.html_tymethod.body.md)(self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[InvokeResponseBody](enum.InvokeResponseBody.html.md "enum tauri::ipc::InvokeResponseBody"), [Error](..\enum.Error.html.md "enum tauri::Error")>

Resolve the IPC response body.

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#224-226)[§](#impl-Serialize-for-T)

### impl<T> [Serialize](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serialize.html "trait erased_serde::ser::Serialize") for T where T: [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#228)[§](#method.erased_serialize)

#### fn [erased\_serialize](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serialize.html#tymethod.erased_serialize)(&self, serializer: &mut dyn [Serializer](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html "trait erased_serde::ser::Serializer")) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#236)[§](#method.do_erased_serialize)

#### fn [do\_erased\_serialize](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serialize.html#tymethod.do_erased_serialize)( &self, serializer: &mut dyn [Serializer](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html "trait erased_serde::ser::Serializer"), ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), ErrorImpl>

[Source](https://doc.rust-lang.org/nightly/src/alloc/borrow.rs.html#82-84)[§](#impl-ToOwned-for-T)

### impl<T> [ToOwned](https://doc.rust-lang.org/nightly/alloc/borrow/trait.ToOwned.html "trait alloc::borrow::ToOwned") for T where T: [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/borrow.rs.html#86)[§](#associatedtype.Owned)

#### type [Owned](https://doc.rust-lang.org/nightly/alloc/borrow/trait.ToOwned.html#associatedtype.Owned) = T

The resulting type after obtaining ownership.

[Source](https://doc.rust-lang.org/nightly/src/alloc/borrow.rs.html#87)[§](#method.to_owned)

#### fn [to\_owned](https://doc.rust-lang.org/nightly/alloc/borrow/trait.ToOwned.html#tymethod.to_owned)(&self) -> T

Creates owned data from borrowed data, usually by cloning. [Read more](https://doc.rust-lang.org/nightly/alloc/borrow/trait.ToOwned.html#tymethod.to_owned)

[Source](https://doc.rust-lang.org/nightly/src/alloc/borrow.rs.html#91)[§](#method.clone_into)

#### fn [clone\_into](https://doc.rust-lang.org/nightly/alloc/borrow/trait.ToOwned.html#method.clone_into)(&self, target: [&mut T](https://doc.rust-lang.org/nightly/std/primitive.reference.html))

Uses borrowed data to replace owned data, usually by cloning. [Read more](https://doc.rust-lang.org/nightly/alloc/borrow/trait.ToOwned.html#method.clone_into)

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#806-808)[§](#impl-TryFrom%3CU%3E-for-T)

### impl<T, U> [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<U> for T where U: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<T>,

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#810)[§](#associatedtype.Error-1)

#### type [Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error) = [Infallible](https://doc.rust-lang.org/nightly/core/convert/enum.Infallible.html "enum core::convert::Infallible")

The type returned in the event of a conversion error.

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#813)[§](#method.try_from)

#### fn [try\_from](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#tymethod.try_from)(value: U) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, <T as [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<U>>::[Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error "type core::convert::TryFrom::Error")>

Performs the conversion.

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#791-793)[§](#impl-TryInto%3CU%3E-for-T)

### impl<T, U> [TryInto](https://doc.rust-lang.org/nightly/core/convert/trait.TryInto.html "trait core::convert::TryInto")<U> for T where U: [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<T>,

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#795)[§](#associatedtype.Error)

#### type [Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryInto.html#associatedtype.Error) = <U as [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<T>>::[Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error "type core::convert::TryFrom::Error")

The type returned in the event of a conversion error.

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#798)[§](#method.try_into)

#### fn [try\_into](https://doc.rust-lang.org/nightly/core/convert/trait.TryInto.html#tymethod.try_into)(self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<U, <U as [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<T>>::[Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error "type core::convert::TryFrom::Error")>

Performs the conversion.

[Source](https://docs.rs/yoke/0.7.5/x86_64-unknown-linux-gnu/src/yoke/erased.rs.html#22)[§](#impl-ErasedDestructor-for-T)

### impl<T> [ErasedDestructor](https://docs.rs/yoke/0.7.5/x86_64-unknown-linux-gnu/yoke/erased/trait.ErasedDestructor.html "trait yoke::erased::ErasedDestructor") for T where T: 'static,

[Source](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/src/icu_provider/any.rs.html#32)[§](#impl-MaybeSendSync-for-T)

### impl<T> [MaybeSendSync](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/any/trait.MaybeSendSync.html "trait icu_provider::any::MaybeSendSync") for T