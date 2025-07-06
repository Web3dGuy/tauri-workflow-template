# Trait CommandArgCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/ipc/command.rs.html#54-59)

```
pub trait CommandArg<'de, R: Runtime>: Sized {
    // Required method
    fn from_command(command: CommandItem<'de, R>) -> Result<Self, InvokeError>;
}
```

Expand description

Trait implemented by command arguments to derive a value from a [`CommandItem`](struct.CommandItem.html.md "struct tauri::ipc::CommandItem").

## [§](#command-arguments)Command Arguments

A command argument is any type that represents an item parsable from a [`CommandItem`](struct.CommandItem.html.md "struct tauri::ipc::CommandItem"). Most
implementations will use the data stored in [`InvokeMessage`](struct.InvokeMessage.html.md "struct tauri::ipc::InvokeMessage") since [`CommandItem`](struct.CommandItem.html.md "struct tauri::ipc::CommandItem") is mostly a
wrapper around it.

## [§](#provided-implementations)Provided Implementations

Tauri implements [`CommandArg`](trait.CommandArg.html.md "trait tauri::ipc::CommandArg") automatically for a number of types.

* `T where T: serde::Deserialize`
  + Any type that implements `Deserialize` can automatically be used as a [`CommandArg`](trait.CommandArg.html.md "trait tauri::ipc::CommandArg").

## Required Methods[§](#required-methods)

[Source](../../src/tauri/ipc/command.rs.html#58)

#### fn [from\_command](#tymethod.from_command)(command: [CommandItem](struct.CommandItem.html.md "struct tauri::ipc::CommandItem")<'de, R>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Self, [InvokeError](struct.InvokeError.html.md "struct tauri::ipc::InvokeError")>

Derives an instance of `Self` from the [`CommandItem`](struct.CommandItem.html.md "struct tauri::ipc::CommandItem").

If the derivation fails, the corresponding message will be rejected using [`InvokeMessage`](struct.InvokeMessage.html_reject.md "struct tauri::ipc::InvokeMessage").

## Dyn Compatibility[§](#dyn-compatibility)

This trait is **not** [dyn compatible](https://doc.rust-lang.org/nightly/reference/items/traits.html#dyn-compatibility).

*In older versions of Rust, dyn compatibility was called "object safety", so this trait is not object safe.*

## Implementors[§](#implementors)

[Source](../../src/tauri/ipc/mod.rs.html#160-168)[§](#impl-CommandArg%3C'a,+R%3E-for-Request%3C'a%3E)

### impl<'a, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [CommandArg](trait.CommandArg.html.md "trait tauri::ipc::CommandArg")<'a, R> for [Request](struct.Request.html.md "struct tauri::ipc::Request")<'a>

[Source](../../src/tauri/ipc/authority.rs.html#722-740)[§](#impl-CommandArg%3C'a,+R%3E-for-CommandScope%3CT%3E)

### impl<'a, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"), T: [ScopeObject](trait.ScopeObject.html.md "trait tauri::ipc::ScopeObject")> [CommandArg](trait.CommandArg.html.md "trait tauri::ipc::CommandArg")<'a, R> for [CommandScope](struct.CommandScope.html.md "struct tauri::ipc::CommandScope")<T>

[Source](../../src/tauri/ipc/authority.rs.html#769-778)[§](#impl-CommandArg%3C'a,+R%3E-for-GlobalScope%3CT%3E)

### impl<'a, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"), T: [ScopeObject](trait.ScopeObject.html.md "trait tauri::ipc::ScopeObject")> [CommandArg](trait.CommandArg.html.md "trait tauri::ipc::CommandArg")<'a, R> for [GlobalScope](struct.GlobalScope.html.md "struct tauri::ipc::GlobalScope")<T>

[Source](../../src/tauri/ipc/command.rs.html#62-70)[§](#impl-CommandArg%3C'de,+R%3E-for-D)

### impl<'de, D: [Deserialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html "trait serde::de::Deserialize")<'de>, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [CommandArg](trait.CommandArg.html.md "trait tauri::ipc::CommandArg")<'de, R> for D

Automatically implement [`CommandArg`](trait.CommandArg.html.md "trait tauri::ipc::CommandArg") for any type that can be deserialized.

[Source](../../src/tauri/app.rs.html#449-454)[§](#impl-CommandArg%3C'de,+R%3E-for-AppHandle%3CR%3E)

### impl<'de, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [CommandArg](trait.CommandArg.html.md "trait tauri::ipc::CommandArg")<'de, R> for [AppHandle](..\struct.AppHandle.html.md "struct tauri::AppHandle")<R>

[Source](../../src/tauri/webview/mod.rs.html#1892-1897)[§](#impl-CommandArg%3C'de,+R%3E-for-Webview%3CR%3E)

### impl<'de, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [CommandArg](trait.CommandArg.html.md "trait tauri::ipc::CommandArg")<'de, R> for [Webview](..\webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>

[Source](../../src/tauri/webview/webview_window.rs.html#1069-1083)[§](#impl-CommandArg%3C'de,+R%3E-for-WebviewWindow%3CR%3E)

### impl<'de, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [CommandArg](trait.CommandArg.html.md "trait tauri::ipc::CommandArg")<'de, R> for [WebviewWindow](..\webview\struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

[Source](../../src/tauri/window/mod.rs.html#967-972)[§](#impl-CommandArg%3C'de,+R%3E-for-Window%3CR%3E)

### impl<'de, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [CommandArg](trait.CommandArg.html.md "trait tauri::ipc::CommandArg")<'de, R> for [Window](..\window\struct.Window.html.md "struct tauri::window::Window")<R>

[Source](../../src/tauri/ipc/channel.rs.html#218-234)[§](#impl-CommandArg%3C'de,+R%3E-for-Channel%3CTSend%3E)

### impl<'de, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"), TSend> [CommandArg](trait.CommandArg.html.md "trait tauri::ipc::CommandArg")<'de, R> for [Channel](struct.Channel.html.md "struct tauri::ipc::Channel")<TSend>

[Source](../../src/tauri/state.rs.html#60-70)[§](#impl-CommandArg%3C'de,+R%3E-for-State%3C'r,+T%3E)

### impl<'r, 'de: 'r, T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [CommandArg](trait.CommandArg.html.md "trait tauri::ipc::CommandArg")<'de, R> for [State](..\struct.State.html.md "struct tauri::State")<'r, T>