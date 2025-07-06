# Trait ListenerCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](../src/tauri/lib.rs.html#840-946)

```
pub trait Listener<R: Runtime>: ManagerBase<R> {
    // Required methods
    fn listen<F>(&self, event: impl Into<String>, handler: F) -> EventId
       where F: Fn(Event) + Send + 'static;
    fn once<F>(&self, event: impl Into<String>, handler: F) -> EventId
       where F: FnOnce(Event) + Send + 'static;
    fn unlisten(&self, id: EventId);

    // Provided methods
    fn listen_any<F>(&self, event: impl Into<String>, handler: F) -> EventId
       where F: Fn(Event) + Send + 'static { ... }
    fn once_any<F>(&self, event: impl Into<String>, handler: F) -> EventId
       where F: FnOnce(Event) + Send + 'static { ... }
}
```

Expand description

Listen to events.

## Required Methods[§](#required-methods)

[Source](../src/tauri/lib.rs.html#864-866)

#### fn [listen](#tymethod.listen)<F>(&self, event: impl [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, handler: F) -> [EventId](type.EventId.html.md "type tauri::EventId") where F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([Event](struct.Event.html.md "struct tauri::Event")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Listen to an emitted event on this manager.

##### [§](#examples)Examples

```
use tauri::{Manager, Listener, Emitter};

#[tauri::command]
fn synchronize(window: tauri::Window) {
  // emits the synchronized event to all windows
  window.emit("synchronized", ());
}

tauri::Builder::default()
  .setup(|app| {
    app.listen("synchronized", |event| {
      println!("app is in sync");
    });
    Ok(())
  })
  .invoke_handler(tauri::generate_handler![synchronize]);
```

##### [§](#panics)Panics

Will panic if `event` contains characters other than alphanumeric, `-`, `/`, `:` and `_`

[Source](../src/tauri/lib.rs.html#873-875)

#### fn [once](#tymethod.once)<F>(&self, event: impl [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, handler: F) -> [EventId](type.EventId.html.md "type tauri::EventId") where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")([Event](struct.Event.html.md "struct tauri::Event")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Listen to an event on this manager only once.

See [`Self::listen`](trait.Listener.html_tymethod.listen.md) for more information.

##### [§](#panics-1)Panics

Will panic if `event` contains characters other than alphanumeric, `-`, `/`, `:` and `_`

[Source](../src/tauri/lib.rs.html#901)

#### fn [unlisten](#tymethod.unlisten)(&self, id: [EventId](type.EventId.html.md "type tauri::EventId"))

Remove an event listener.

##### [§](#examples-1)Examples

```
use tauri::{Manager, Listener};

tauri::Builder::default()
  .setup(|app| {
    let handle = app.handle().clone();
    let handler = app.listen_any("ready", move |event| {
      println!("app is ready");

      // we no longer need to listen to the event
      // we also could have used `app.once_global` instead
      handle.unlisten(event.id());
    });

    // stop listening to the event when you do not need it anymore
    app.unlisten(handler);

    Ok(())
  });
```

## Provided Methods[§](#provided-methods)

[Source](../src/tauri/lib.rs.html#926-932)

#### fn [listen\_any](#method.listen_any)<F>(&self, event: impl [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, handler: F) -> [EventId](type.EventId.html.md "type tauri::EventId") where F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([Event](struct.Event.html.md "struct tauri::Event")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Listen to an emitted event to any [target](enum.EventTarget.html.md "enum tauri::EventTarget").

##### [§](#examples-2)Examples

```
use tauri::{Manager, Emitter, Listener};

#[tauri::command]
fn synchronize(window: tauri::Window) {
  // emits the synchronized event to all windows
  window.emit("synchronized", ());
}

tauri::Builder::default()
  .setup(|app| {
    app.listen_any("synchronized", |event| {
      println!("app is in sync");
    });
    Ok(())
  })
  .invoke_handler(tauri::generate_handler![synchronize]);
```

##### [§](#panics-2)Panics

Will panic if `event` contains characters other than alphanumeric, `-`, `/`, `:` and `_`

[Source](../src/tauri/lib.rs.html#939-945)

#### fn [once\_any](#method.once_any)<F>(&self, event: impl [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, handler: F) -> [EventId](type.EventId.html.md "type tauri::EventId") where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")([Event](struct.Event.html.md "struct tauri::Event")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Listens once to an emitted event to any [target](enum.EventTarget.html.md "enum tauri::EventTarget") .

See [`Self::listen_any`](trait.Listener.html_method.listen_any.md) for more information.

##### [§](#panics-3)Panics

Will panic if `event` contains characters other than alphanumeric, `-`, `/`, `:` and `_`

## Dyn Compatibility[§](#dyn-compatibility)

This trait is **not** [dyn compatible](https://doc.rust-lang.org/nightly/reference/items/traits.html#dyn-compatibility).

*In older versions of Rust, dyn compatibility was called "object safety", so this trait is not object safe.*

## Implementors[§](#implementors)

[Source](../src/tauri/app.rs.html#1078)[§](#impl-Listener%3CR%3E-for-App%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Listener](trait.Listener.html.md "trait tauri::Listener")<R> for [App](struct.App.html.md "struct tauri::App")<R>

[Source](../src/tauri/app.rs.html#1079)[§](#impl-Listener%3CR%3E-for-AppHandle%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Listener](trait.Listener.html.md "trait tauri::Listener")<R> for [AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>

[Source](../src/tauri/webview/mod.rs.html#1776-1861)[§](#impl-Listener%3CR%3E-for-Webview%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Listener](trait.Listener.html.md "trait tauri::Listener")<R> for [Webview](webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>

[Source](../src/tauri/webview/webview_window.rs.html#2089-2165)[§](#impl-Listener%3CR%3E-for-WebviewWindow%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Listener](trait.Listener.html.md "trait tauri::Listener")<R> for [WebviewWindow](webview\struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

[Source](../src/tauri/window/mod.rs.html#2139-2224)[§](#impl-Listener%3CR%3E-for-Window%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Listener](trait.Listener.html.md "trait tauri::Listener")<R> for [Window](window\struct.Window.html.md "struct tauri::window::Window")<R>