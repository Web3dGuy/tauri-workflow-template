# Trait EmitterCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](../src/tauri/lib.rs.html#949-1054)

```
pub trait Emitter<R: Runtime>: ManagerBase<R> {
    // Provided methods
    fn emit<S: Serialize + Clone>(&self, event: &str, payload: S) -> Result<()> { ... }
    fn emit_str(&self, event: &str, payload: String) -> Result<()> { ... }
    fn emit_to<I, S>(&self, target: I, event: &str, payload: S) -> Result<()>
       where I: Into<EventTarget>,
             S: Serialize + Clone { ... }
    fn emit_str_to<I>(
        &self,
        target: I,
        event: &str,
        payload: String,
    ) -> Result<()>
       where I: Into<EventTarget> { ... }
    fn emit_filter<S, F>(
        &self,
        event: &str,
        payload: S,
        filter: F,
    ) -> Result<()>
       where S: Serialize + Clone,
             F: Fn(&EventTarget) -> bool { ... }
    fn emit_str_filter<F>(
        &self,
        event: &str,
        payload: String,
        filter: F,
    ) -> Result<()>
       where F: Fn(&EventTarget) -> bool { ... }
}
```

Expand description

Emit events.

## Provided Methods[§](#provided-methods)

[Source](../src/tauri/lib.rs.html#962-966)

#### fn [emit](#method.emit)<S: [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize") + [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone")>(&self, event: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), payload: S) -> [Result](type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Emits an event to all [targets](enum.EventTarget.html.md "enum tauri::EventTarget").

##### [§](#examples)Examples

```
use tauri::Emitter;

#[tauri::command]
fn synchronize(app: tauri::AppHandle) {
  // emits the synchronized event to all webviews
  app.emit("synchronized", ());
}
```

[Source](../src/tauri/lib.rs.html#969-973)

#### fn [emit\_str](#method.emit_str)(&self, event: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), payload: [String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")) -> [Result](type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Similar to [`Emitter::emit`](trait.Emitter.html_method.emit.md "method tauri::Emitter::emit") but the payload is json serialized.

[Source](../src/tauri/lib.rs.html#997-1005)

#### fn [emit\_to](#method.emit_to)<I, S>(&self, target: I, event: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), payload: S) -> [Result](type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> where I: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[EventTarget](enum.EventTarget.html.md "enum tauri::EventTarget")>, S: [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize") + [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone"),

Emits an event to all [targets](enum.EventTarget.html.md "enum tauri::EventTarget") matching the given target.

##### [§](#examples-1)Examples

```
use tauri::{Emitter, EventTarget};

#[tauri::command]
fn download(app: tauri::AppHandle) {
  for i in 1..100 {
    std::thread::sleep(std::time::Duration::from_millis(150));
    // emit a download progress event to all listeners
    app.emit_to(EventTarget::any(), "download-progress", i);
    // emit an event to listeners that used App::listen or AppHandle::listen
    app.emit_to(EventTarget::app(), "download-progress", i);
    // emit an event to any webview/window/webviewWindow matching the given label
    app.emit_to("updater", "download-progress", i); // similar to using EventTarget::labeled
    app.emit_to(EventTarget::labeled("updater"), "download-progress", i);
    // emit an event to listeners that used WebviewWindow::listen
    app.emit_to(EventTarget::webview_window("updater"), "download-progress", i);
  }
}
```

[Source](../src/tauri/lib.rs.html#1008-1015)

#### fn [emit\_str\_to](#method.emit_str_to)<I>(&self, target: I, event: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), payload: [String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")) -> [Result](type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> where I: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[EventTarget](enum.EventTarget.html.md "enum tauri::EventTarget")>,

Similar to [`Emitter::emit_to`](trait.Emitter.html_method.emit_to.md "method tauri::Emitter::emit_to") but the payload is json serialized.

[Source](../src/tauri/lib.rs.html#1035-1043)

#### fn [emit\_filter](#method.emit_filter)<S, F>(&self, event: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), payload: S, filter: F) -> [Result](type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> where S: [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize") + [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone"), F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[EventTarget](enum.EventTarget.html.md "enum tauri::EventTarget")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html),

Emits an event to all [targets](enum.EventTarget.html.md "enum tauri::EventTarget") based on the given filter.

##### [§](#examples-2)Examples

```
use tauri::{Emitter, EventTarget};

#[tauri::command]
fn download(app: tauri::AppHandle) {
  for i in 1..100 {
    std::thread::sleep(std::time::Duration::from_millis(150));
    // emit a download progress event to the updater window
    app.emit_filter("download-progress", i, |t| match t {
      EventTarget::WebviewWindow { label } => label == "main",
      _ => false,
    });
  }
}
```

[Source](../src/tauri/lib.rs.html#1046-1053)

#### fn [emit\_str\_filter](#method.emit_str_filter)<F>( &self, event: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), payload: [String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"), filter: F, ) -> [Result](type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> where F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[EventTarget](enum.EventTarget.html.md "enum tauri::EventTarget")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html),

Similar to [`Emitter::emit_filter`](trait.Emitter.html_method.emit_filter.md "method tauri::Emitter::emit_filter") but the payload is json serialized.

## Dyn Compatibility[§](#dyn-compatibility)

This trait is **not** [dyn compatible](https://doc.rust-lang.org/nightly/reference/items/traits.html#dyn-compatibility).

*In older versions of Rust, dyn compatibility was called "object safety", so this trait is not object safe.*

## Implementors[§](#implementors)

[Source](../src/tauri/app.rs.html#1078)[§](#impl-Emitter%3CR%3E-for-App%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Emitter](trait.Emitter.html.md "trait tauri::Emitter")<R> for [App](struct.App.html.md "struct tauri::App")<R>

[Source](../src/tauri/app.rs.html#1079)[§](#impl-Emitter%3CR%3E-for-AppHandle%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Emitter](trait.Emitter.html.md "trait tauri::Emitter")<R> for [AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>

[Source](../src/tauri/webview/mod.rs.html#1863)[§](#impl-Emitter%3CR%3E-for-Webview%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Emitter](trait.Emitter.html.md "trait tauri::Emitter")<R> for [Webview](webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>

[Source](../src/tauri/webview/webview_window.rs.html#2167)[§](#impl-Emitter%3CR%3E-for-WebviewWindow%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Emitter](trait.Emitter.html.md "trait tauri::Emitter")<R> for [WebviewWindow](webview\struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

[Source](../src/tauri/window/mod.rs.html#2226)[§](#impl-Emitter%3CR%3E-for-Window%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Emitter](trait.Emitter.html.md "trait tauri::Emitter")<R> for [Window](window\struct.Window.html.md "struct tauri::window::Window")<R>