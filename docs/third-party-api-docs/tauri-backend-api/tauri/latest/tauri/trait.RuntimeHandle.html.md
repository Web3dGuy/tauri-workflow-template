# Trait RuntimeHandleCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](../src/tauri/lib.rs.html#295)

```
pub trait RuntimeHandle: RuntimeHandle<EventLoopMessage> { }
```

Expand description

The webview runtime handle. A wrapper arond [`runtime::RuntimeHandle`](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html "trait tauri_runtime::RuntimeHandle") with the proper user event type associated.

## Dyn Compatibility[§](#dyn-compatibility)

This trait is **not** [dyn compatible](https://doc.rust-lang.org/nightly/reference/items/traits.html#dyn-compatibility).

*In older versions of Rust, dyn compatibility was called "object safety", so this trait is not object safe.*

## Implementors[§](#implementors)

[Source](../src/tauri/lib.rs.html#298)[§](#impl-RuntimeHandle-for-R)

### impl<R: [RuntimeHandle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html "trait tauri_runtime::RuntimeHandle")<[EventLoopMessage](enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>> [RuntimeHandle](trait.RuntimeHandle.html.md "trait tauri::RuntimeHandle") for R