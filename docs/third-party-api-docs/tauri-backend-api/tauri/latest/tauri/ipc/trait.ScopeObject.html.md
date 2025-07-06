# Trait ScopeObjectCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/ipc/authority.rs.html#792-797)

```
pub trait ScopeObject:
    Sized
    + Send
    + Sync
    + Debug
    + 'static {
    type Error: Error + Send + Sync;

    // Required method
    fn deserialize<R: Runtime>(
        app: &AppHandle<R>,
        raw: Value,
    ) -> Result<Self, Self::Error>;
}
```

Expand description

Marks a type as a scope object.

Usually you will just rely on [`serde::de::DeserializeOwned`](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.DeserializeOwned.html "trait serde::de::DeserializeOwned") instead of implementing it manually,
though this is useful if you need to do some initialization logic on the type itself.

## Required Associated Types[§](#required-associated-types)

[Source](../../src/tauri/ipc/authority.rs.html#794)

#### type [Error](#associatedtype.Error): [Error](https://doc.rust-lang.org/nightly/core/error/trait.Error.html "trait core::error::Error") + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync")

The error type.

## Required Methods[§](#required-methods)

[Source](../../src/tauri/ipc/authority.rs.html#796)

#### fn [deserialize](#tymethod.deserialize)<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")>( app: &[AppHandle](..\struct.AppHandle.html.md "struct tauri::AppHandle")<R>, raw: [Value](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/acl/value/enum.Value.html "enum tauri_utils::acl::value::Value"), ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Self, Self::[Error](trait.ScopeObject.html_associatedtype.Error.md "type tauri::ipc::ScopeObject::Error")>

Deserialize the raw scope value.

## Dyn Compatibility[§](#dyn-compatibility)

This trait is **not** [dyn compatible](https://doc.rust-lang.org/nightly/reference/items/traits.html#dyn-compatibility).

*In older versions of Rust, dyn compatibility was called "object safety", so this trait is not object safe.*

## Implementors[§](#implementors)

[Source](../../src/tauri/ipc/authority.rs.html#799-804)[§](#impl-ScopeObject-for-T)

### impl<T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") + [DeserializeOwned](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.DeserializeOwned.html "trait serde::de::DeserializeOwned") + 'static> [ScopeObject](trait.ScopeObject.html.md "trait tauri::ipc::ScopeObject") for T

[Source](../../src/tauri/ipc/authority.rs.html#800)[§](#associatedtype.Error-1)

#### type [Error](#associatedtype.Error) = [Error](https://docs.rs/serde_json/1.0.140/x86_64-unknown-linux-gnu/serde_json/error/struct.Error.html "struct serde_json::error::Error")