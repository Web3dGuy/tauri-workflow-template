# Trait RuntimeCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](../src/tauri/lib.rs.html#293)

```
pub trait Runtime: Runtime<EventLoopMessage> { }
```

Expand description

The webview runtime interface. A wrapper around [`runtime::Runtime`](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime") with the proper user event type associated.

## Dyn Compatibility[§](#dyn-compatibility)

This trait is **not** [dyn compatible](https://doc.rust-lang.org/nightly/reference/items/traits.html#dyn-compatibility).

*In older versions of Rust, dyn compatibility was called "object safety", so this trait is not object safe.*

## Implementors[§](#implementors)

[Source](../src/tauri/lib.rs.html#297)[§](#impl-Runtime-for-W)

### impl<W: [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>> [Runtime](trait.Runtime.html.md "trait tauri::Runtime") for W