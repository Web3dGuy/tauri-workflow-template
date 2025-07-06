# Enum BaseDirectoryCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/path/mod.rs.html#84-160)

```

#[non_exhaustive]

#[repr(u16)]

pub enum BaseDirectory {
Show 23 variants    Audio = 1,
    Cache = 2,
    Config = 3,
    Data = 4,
    LocalData = 5,
    Document = 6,
    Download = 7,
    Picture = 8,
    Public = 9,
    Video = 10,
    Resource = 11,
    Temp = 12,
    AppConfig = 13,
    AppData = 14,
    AppLocalData = 15,
    AppCache = 16,
    AppLog = 17,
    Desktop = 18,
    Executable = 19,
    Font = 20,
    Home = 21,
    Runtime = 22,
    Template = 23,
}
```

Expand description

A base directory for a path.

The base directory is the optional root of a file system operation.
If informed by the API call, all paths will be relative to the path of the given directory.

For more information, check the [`dirs` documentation](https://docs.rs/dirs/).

## Variants (Non-exhaustive)[§](#variants)

This enum is marked as non-exhaustive

Non-exhaustive enums could have additional variants added in future. Therefore, when matching against variants of non-exhaustive enums, an extra wildcard arm must be added to account for any future variants.

[§](#variant.Audio)

### Audio = 1

The Audio directory.
Resolves to [`crate::path::PathResolver::audio_dir`](struct.PathResolver.html_method.audio_dir.md "method tauri::path::PathResolver::audio_dir").

[§](#variant.Cache)

### Cache = 2

The Cache directory.
Resolves to [`crate::path::PathResolver::cache_dir`](struct.PathResolver.html_method.cache_dir.md "method tauri::path::PathResolver::cache_dir").

[§](#variant.Config)

### Config = 3

The Config directory.
Resolves to [`crate::path::PathResolver::config_dir`](struct.PathResolver.html_method.config_dir.md "method tauri::path::PathResolver::config_dir").

[§](#variant.Data)

### Data = 4

The Data directory.
Resolves to [`crate::path::PathResolver::data_dir`](struct.PathResolver.html_method.data_dir.md "method tauri::path::PathResolver::data_dir").

[§](#variant.LocalData)

### LocalData = 5

The LocalData directory.
Resolves to [`crate::path::PathResolver::local_data_dir`](struct.PathResolver.html_method.local_data_dir.md "method tauri::path::PathResolver::local_data_dir").

[§](#variant.Document)

### Document = 6

The Document directory.
Resolves to [`crate::path::PathResolver::document_dir`](struct.PathResolver.html_method.document_dir.md "method tauri::path::PathResolver::document_dir").

[§](#variant.Download)

### Download = 7

The Download directory.
Resolves to [`crate::path::PathResolver::download_dir`](struct.PathResolver.html_method.download_dir.md "method tauri::path::PathResolver::download_dir").

[§](#variant.Picture)

### Picture = 8

The Picture directory.
Resolves to [`crate::path::PathResolver::picture_dir`](struct.PathResolver.html_method.picture_dir.md "method tauri::path::PathResolver::picture_dir").

[§](#variant.Public)

### Public = 9

The Public directory.
Resolves to [`crate::path::PathResolver::public_dir`](struct.PathResolver.html_method.public_dir.md "method tauri::path::PathResolver::public_dir").

[§](#variant.Video)

### Video = 10

The Video directory.
Resolves to [`crate::path::PathResolver::video_dir`](struct.PathResolver.html_method.video_dir.md "method tauri::path::PathResolver::video_dir").

[§](#variant.Resource)

### Resource = 11

The Resource directory.
Resolves to the resource directory of this app.

[§](#variant.Temp)

### Temp = 12

A temporary directory.
Resolves to [`std::env::temp_dir`](https://doc.rust-lang.org/nightly/std/env/fn.temp_dir.html "fn std::env::temp_dir").

[§](#variant.AppConfig)

### AppConfig = 13

The default app config directory.
Resolves to [`BaseDirectory::Config`](enum.BaseDirectory.html_variant.Config.md "variant tauri::path::BaseDirectory::Config")`/{bundle_identifier}`.

[§](#variant.AppData)

### AppData = 14

The default app data directory.
Resolves to [`BaseDirectory::Data`](enum.BaseDirectory.html_variant.Data.md "variant tauri::path::BaseDirectory::Data")`/{bundle_identifier}`.

[§](#variant.AppLocalData)

### AppLocalData = 15

The default app local data directory.
Resolves to [`BaseDirectory::LocalData`](enum.BaseDirectory.html_variant.LocalData.md "variant tauri::path::BaseDirectory::LocalData")`/{bundle_identifier}`.

[§](#variant.AppCache)

### AppCache = 16

The default app cache directory.
Resolves to [`BaseDirectory::Cache`](enum.BaseDirectory.html_variant.Cache.md "variant tauri::path::BaseDirectory::Cache")`/{bundle_identifier}`.

[§](#variant.AppLog)

### AppLog = 17

The default app log directory.
Resolves to [`BaseDirectory::Home`](enum.BaseDirectory.html_variant.Home.md "variant tauri::path::BaseDirectory::Home")`/Library/Logs/{bundle_identifier}` on macOS
and [`BaseDirectory::Config`](enum.BaseDirectory.html_variant.Config.md "variant tauri::path::BaseDirectory::Config")`/{bundle_identifier}/logs` on linux and Windows.

[§](#variant.Desktop)

### Desktop = 18

The Desktop directory.
Resolves to [`crate::path::PathResolver::desktop_dir`](struct.PathResolver.html_method.desktop_dir.md "method tauri::path::PathResolver::desktop_dir").

[§](#variant.Executable)

### Executable = 19

The Executable directory.
Resolves to [`crate::path::PathResolver::executable_dir`](struct.PathResolver.html_method.executable_dir.md "method tauri::path::PathResolver::executable_dir").

[§](#variant.Font)

### Font = 20

The Font directory.
Resolves to [`crate::path::PathResolver::font_dir`](struct.PathResolver.html_method.font_dir.md "method tauri::path::PathResolver::font_dir").

[§](#variant.Home)

### Home = 21

The Home directory.
Resolves to [`crate::path::PathResolver::home_dir`](struct.PathResolver.html_method.home_dir.md "method tauri::path::PathResolver::home_dir").

[§](#variant.Runtime)

### Runtime = 22

The Runtime directory.
Resolves to [`crate::path::PathResolver::runtime_dir`](struct.PathResolver.html_method.runtime_dir.md "method tauri::path::PathResolver::runtime_dir").

[§](#variant.Template)

### Template = 23

The Template directory.
Resolves to [`crate::path::PathResolver::template_dir`](struct.PathResolver.html_method.template_dir.md "method tauri::path::PathResolver::template_dir").

## Implementations[§](#implementations)

[Source](../../src/tauri/path/mod.rs.html#162-236)[§](#impl-BaseDirectory)

### impl [BaseDirectory](enum.BaseDirectory.html.md "enum tauri::path::BaseDirectory")

[Source](../../src/tauri/path/mod.rs.html#164-196)

#### pub fn [variable](#method.variable)(self) -> &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

Gets the variable that represents this [`BaseDirectory`](enum.BaseDirectory.html.md "enum tauri::path::BaseDirectory") for string paths.

[Source](../../src/tauri/path/mod.rs.html#199-235)

#### pub fn [from\_variable](#method.from_variable)(variable: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<Self>

Gets the [`BaseDirectory`](enum.BaseDirectory.html.md "enum tauri::path::BaseDirectory") associated with the given variable, or [`None`](https://doc.rust-lang.org/nightly/core/option/enum.Option.html#variant.None "variant core::option::Option::None") if the variable doesn’t match any.

## Trait Implementations[§](#trait-implementations)

[Source](../../src/tauri/path/mod.rs.html#81)[§](#impl-Clone-for-BaseDirectory)

### impl [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [BaseDirectory](enum.BaseDirectory.html.md "enum tauri::path::BaseDirectory")

[Source](../../src/tauri/path/mod.rs.html#81)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> [BaseDirectory](enum.BaseDirectory.html.md "enum tauri::path::BaseDirectory")

Returns a copy of the value. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#174)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &Self)

Performs copy-assignment from `source`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)

[Source](../../src/tauri/path/mod.rs.html#81)[§](#impl-Debug-for-BaseDirectory)

### impl [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [BaseDirectory](enum.BaseDirectory.html.md "enum tauri::path::BaseDirectory")

[Source](../../src/tauri/path/mod.rs.html#81)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/fmt/type.Result.html "type core::fmt::Result")

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](../../src/tauri/path/mod.rs.html#81)[§](#impl-Deserialize%3C'de%3E-for-BaseDirectory)

### impl<'de> [Deserialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html "trait serde::de::Deserialize")<'de> for [BaseDirectory](enum.BaseDirectory.html.md "enum tauri::path::BaseDirectory")

[Source](../../src/tauri/path/mod.rs.html#81)[§](#method.deserialize)

#### fn [deserialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html#tymethod.deserialize)<D>(deserializer: D) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Self, D::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")> where D: [Deserializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html "trait serde::de::Deserializer")<'de>,

Deserialize this value from the given Serde deserializer. [Read more](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html#tymethod.deserialize)

[Source](../../src/tauri/path/mod.rs.html#81)[§](#impl-Serialize-for-BaseDirectory)

### impl [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize") for [BaseDirectory](enum.BaseDirectory.html.md "enum tauri::path::BaseDirectory")

[Source](../../src/tauri/path/mod.rs.html#81)[§](#method.serialize)

#### fn [serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html#tymethod.serialize)<S>(&self, serializer: S) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<S::[Ok](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html#associatedtype.Ok "type serde::ser::Serializer::Ok"), S::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html#associatedtype.Error "type serde::ser::Serializer::Error")> where S: [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer"),

Serialize this value into the given Serde serializer. [Read more](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html#tymethod.serialize)

[Source](../../src/tauri/path/mod.rs.html#81)[§](#impl-Copy-for-BaseDirectory)

### impl [Copy](https://doc.rust-lang.org/nightly/core/marker/trait.Copy.html "trait core::marker::Copy") for [BaseDirectory](enum.BaseDirectory.html.md "enum tauri::path::BaseDirectory")

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-BaseDirectory)

### impl [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [BaseDirectory](enum.BaseDirectory.html.md "enum tauri::path::BaseDirectory")

[§](#impl-RefUnwindSafe-for-BaseDirectory)

### impl [RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [BaseDirectory](enum.BaseDirectory.html.md "enum tauri::path::BaseDirectory")

[§](#impl-Send-for-BaseDirectory)

### impl [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [BaseDirectory](enum.BaseDirectory.html.md "enum tauri::path::BaseDirectory")

[§](#impl-Sync-for-BaseDirectory)

### impl [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [BaseDirectory](enum.BaseDirectory.html.md "enum tauri::path::BaseDirectory")

[§](#impl-Unpin-for-BaseDirectory)

### impl [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [BaseDirectory](enum.BaseDirectory.html.md "enum tauri::path::BaseDirectory")

[§](#impl-UnwindSafe-for-BaseDirectory)

### impl [UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [BaseDirectory](enum.BaseDirectory.html.md "enum tauri::path::BaseDirectory")

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

[Source](../../src/tauri/ipc/command.rs.html#62-70)[§](#impl-CommandArg%3C'de,+R%3E-for-D)

### impl<'de, D, R> [CommandArg](..\ipc\trait.CommandArg.html.md "trait tauri::ipc::CommandArg")<'de, R> for D where D: [Deserialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html "trait serde::de::Deserialize")<'de>, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"),

[Source](../../src/tauri/ipc/command.rs.html#63-69)[§](#method.from_command)

#### fn [from\_command](..\ipc\trait.CommandArg.html_tymethod.from_command.md)(command: [CommandItem](..\ipc\struct.CommandItem.html.md "struct tauri::ipc::CommandItem")<'de, R>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<D, [InvokeError](..\ipc\struct.InvokeError.html.md "struct tauri::ipc::InvokeError")>

Derives an instance of `Self` from the [`CommandItem`](..\ipc\struct.CommandItem.html.md "struct tauri::ipc::CommandItem"). [Read more](..\ipc\trait.CommandArg.html_tymethod.from_command.md)

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

[Source](../../src/tauri/ipc/mod.rs.html#176-182)[§](#impl-IpcResponse-for-T)

### impl<T> [IpcResponse](..\ipc\trait.IpcResponse.html.md "trait tauri::ipc::IpcResponse") for T where T: [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize"),

[Source](../../src/tauri/ipc/mod.rs.html#177-181)[§](#method.body)

#### fn [body](..\ipc\trait.IpcResponse.html_tymethod.body.md)(self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[InvokeResponseBody](..\ipc\enum.InvokeResponseBody.html.md "enum tauri::ipc::InvokeResponseBody"), [Error](..\enum.Error.html.md "enum tauri::Error")>

Resolve the IPC response body.

[Source](../../src/tauri/ipc/authority.rs.html#799-804)[§](#impl-ScopeObject-for-T)

### impl<T> [ScopeObject](..\ipc\trait.ScopeObject.html.md "trait tauri::ipc::ScopeObject") for T where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") + [DeserializeOwned](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.DeserializeOwned.html "trait serde::de::DeserializeOwned") + 'static,

[Source](../../src/tauri/ipc/authority.rs.html#800)[§](#associatedtype.Error)

#### type [Error](..\ipc\trait.ScopeObject.html_associatedtype.Error.md) = [Error](https://docs.rs/serde_json/1.0.140/x86_64-unknown-linux-gnu/serde_json/error/struct.Error.html "struct serde_json::error::Error")

The error type.

[Source](../../src/tauri/ipc/authority.rs.html#801-803)[§](#method.deserialize-1)

#### fn [deserialize](..\ipc\trait.ScopeObject.html_tymethod.deserialize.md)<R>( \_app: &[AppHandle](..\struct.AppHandle.html.md "struct tauri::AppHandle")<R>, raw: [Value](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/acl/value/enum.Value.html "enum tauri_utils::acl::value::Value"), ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, <T as [ScopeObject](..\ipc\trait.ScopeObject.html.md "trait tauri::ipc::ScopeObject")>::[Error](..\ipc\trait.ScopeObject.html_associatedtype.Error.md "type tauri::ipc::ScopeObject::Error")> where R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"),

Deserialize the raw scope value.

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

[Source](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/src/serde/de/mod.rs.html#614)[§](#impl-DeserializeOwned-for-T)

### impl<T> [DeserializeOwned](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.DeserializeOwned.html "trait serde::de::DeserializeOwned") for T where T: for<'de> [Deserialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html "trait serde::de::Deserialize")<'de>,

[Source](https://docs.rs/yoke/0.7.5/x86_64-unknown-linux-gnu/src/yoke/erased.rs.html#22)[§](#impl-ErasedDestructor-for-T)

### impl<T> [ErasedDestructor](https://docs.rs/yoke/0.7.5/x86_64-unknown-linux-gnu/yoke/erased/trait.ErasedDestructor.html "trait yoke::erased::ErasedDestructor") for T where T: 'static,

[Source](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/src/icu_provider/any.rs.html#32)[§](#impl-MaybeSendSync-for-T)

### impl<T> [MaybeSendSync](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/any/trait.MaybeSendSync.html "trait icu_provider::any::MaybeSendSync") for T

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/lib.rs.html#210)[§](#impl-UserEvent-for-T)

### impl<T> [UserEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.UserEvent.html "trait tauri_runtime::UserEvent") for T where T: [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") + [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,