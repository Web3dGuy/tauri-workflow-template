# Type Alias WryHandleCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](../src/tauri/lib.rs.html#121)

```
pub type WryHandle = WryHandle<EventLoopMessage>;
```

Available on **crate feature `wry`** only.

Expand description

A Tauri [`RuntimeHandle`](trait.RuntimeHandle.html.md "trait tauri::RuntimeHandle") wrapper around wry.

## Aliased Type[§](#aliased-type)

```
struct WryHandle { /* private fields */ }
```

## Implementations

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2377)[§](#impl-WryHandle%3CT%3E)

### impl<T> [WryHandle](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.WryHandle.html "struct tauri_runtime_wry::WryHandle")<T> where T: [UserEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.UserEvent.html "trait tauri_runtime::UserEvent"),

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2379-2382)

#### pub fn [create\_tao\_window](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.WryHandle.html#tymethod.create_tao_window)<F>(&self, f: F) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Weak](https://doc.rust-lang.org/nightly/alloc/sync/struct.Weak.html "struct alloc::sync::Weak")<[Window](https://docs.rs/tao/0.32.8/x86_64-unknown-linux-gnu/tao/window/struct.Window.html "struct tao::window::Window")>, [Error](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.Error.html "enum tauri_runtime::Error")> where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")() -> ([String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"), [WindowBuilder](https://docs.rs/tao/0.32.8/x86_64-unknown-linux-gnu/tao/window/struct.WindowBuilder.html "struct tao::window::WindowBuilder")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Creates a new tao window using a callback, and returns its window id.

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2390)

#### pub fn [window\_id](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.WryHandle.html#tymethod.window_id)(&self, window\_id: [WindowId](https://docs.rs/tao/0.32.8/x86_64-unknown-linux-gnu/tao/window/struct.WindowId.html "struct tao::window::WindowId")) -> [WindowId](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/struct.WindowId.html "struct tauri_runtime::window::WindowId")

Gets the [`WebviewId'] associated with the given [`WindowId`].

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2402)

#### pub fn [send\_event](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.WryHandle.html#tymethod.send_event)(&self, message: [Message](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/enum.Message.html "enum tauri_runtime_wry::Message")<T>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.Error.html "enum tauri_runtime::Error")>

Send a message to the event loop.

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2411-2413)

#### pub fn [plugin](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.WryHandle.html#tymethod.plugin)<P>(&mut self, plugin: P) where P: [PluginBuilder](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/trait.PluginBuilder.html "trait tauri_runtime_wry::PluginBuilder")<T> + 'static, <P as [PluginBuilder](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/trait.PluginBuilder.html "trait tauri_runtime_wry::PluginBuilder")<T>>::[Plugin](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/trait.PluginBuilder.html#associatedtype.Plugin "type tauri_runtime_wry::PluginBuilder::Plugin"): [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send"),

## Trait Implementations

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2368)[§](#impl-Clone-for-WryHandle%3CT%3E)

### impl<T> [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [WryHandle](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.WryHandle.html "struct tauri_runtime_wry::WryHandle")<T> where T: [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") + [UserEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.UserEvent.html "trait tauri_runtime::UserEvent"),

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2368)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> [WryHandle](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.WryHandle.html "struct tauri_runtime_wry::WryHandle")<T>

Returns a copy of the value. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#174)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &Self)

Performs copy-assignment from `source`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2368)[§](#impl-Debug-for-WryHandle%3CT%3E)

### impl<T> [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [WryHandle](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.WryHandle.html "struct tauri_runtime_wry::WryHandle")<T> where T: [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") + [UserEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.UserEvent.html "trait tauri_runtime::UserEvent"),

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2368)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")>

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2424)[§](#impl-RuntimeHandle%3CT%3E-for-WryHandle%3CT%3E)

### impl<T> [RuntimeHandle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html "trait tauri_runtime::RuntimeHandle")<T> for [WryHandle](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.WryHandle.html "struct tauri_runtime_wry::WryHandle")<T> where T: [UserEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.UserEvent.html "trait tauri_runtime::UserEvent"),

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2425)[§](#associatedtype.Runtime)

#### type [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html#associatedtype.Runtime) = [Wry](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.Wry.html "struct tauri_runtime_wry::Wry")<T>

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2427)[§](#method.create_proxy)

#### fn [create\_proxy](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html#tymethod.create_proxy)(&self) -> [EventProxy](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.EventProxy.html "struct tauri_runtime_wry::EventProxy")<T>

Creates an `EventLoopProxy` that can be used to dispatch user events to the main event loop.

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2439)[§](#method.request_exit)

#### fn [request\_exit](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html#tymethod.request_exit)(&self, code: [i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html)) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.Error.html "enum tauri_runtime::Error")>

Requests an exit of the event loop.

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2450-2454)[§](#method.create_window)

#### fn [create\_window](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html#tymethod.create_window)<F>( &self, pending: [PendingWindow](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/struct.PendingWindow.html "struct tauri_runtime::window::PendingWindow")<T, <[WryHandle](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.WryHandle.html "struct tauri_runtime_wry::WryHandle")<T> as [RuntimeHandle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html "trait tauri_runtime::RuntimeHandle")<T>>::[Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html#associatedtype.Runtime "type tauri_runtime::RuntimeHandle::Runtime")>, after\_window\_creation: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<F>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[DetachedWindow](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/struct.DetachedWindow.html "struct tauri_runtime::window::DetachedWindow")<T, <[WryHandle](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.WryHandle.html "struct tauri_runtime_wry::WryHandle")<T> as [RuntimeHandle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html "trait tauri_runtime::RuntimeHandle")<T>>::[Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html#associatedtype.Runtime "type tauri_runtime::RuntimeHandle::Runtime")>, [Error](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.Error.html "enum tauri_runtime::Error")> where F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([RawWindow](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/struct.RawWindow.html "struct tauri_runtime::window::RawWindow")<'\_>) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Create a new window.

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2460-2464)[§](#method.create_webview)

#### fn [create\_webview](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html#tymethod.create_webview)( &self, window\_id: [WindowId](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/struct.WindowId.html "struct tauri_runtime::window::WindowId"), pending: [PendingWebview](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/webview/struct.PendingWebview.html "struct tauri_runtime::webview::PendingWebview")<T, <[WryHandle](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.WryHandle.html "struct tauri_runtime_wry::WryHandle")<T> as [RuntimeHandle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html "trait tauri_runtime::RuntimeHandle")<T>>::[Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html#associatedtype.Runtime "type tauri_runtime::RuntimeHandle::Runtime")>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[DetachedWebview](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/webview/struct.DetachedWebview.html "struct tauri_runtime::webview::DetachedWebview")<T, <[WryHandle](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.WryHandle.html "struct tauri_runtime_wry::WryHandle")<T> as [RuntimeHandle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html "trait tauri_runtime::RuntimeHandle")<T>>::[Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html#associatedtype.Runtime "type tauri_runtime::RuntimeHandle::Runtime")>, [Error](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.Error.html "enum tauri_runtime::Error")>

Create a new webview.

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2468)[§](#method.run_on_main_thread)

#### fn [run\_on\_main\_thread](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html#tymethod.run_on_main_thread)<F>(&self, f: F) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.Error.html "enum tauri_runtime::Error")> where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")() + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Run a task on the main thread.

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2472)[§](#method.display_handle)

#### fn [display\_handle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html#tymethod.display_handle)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[DisplayHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/struct.DisplayHandle.html "struct raw_window_handle::borrowed::DisplayHandle")<'\_>, [HandleError](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/enum.HandleError.html "enum raw_window_handle::HandleError")>

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2476)[§](#method.primary_monitor)

#### fn [primary\_monitor](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html#tymethod.primary_monitor)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Monitor](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/monitor/struct.Monitor.html "struct tauri_runtime::monitor::Monitor")>

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2485)[§](#method.monitor_from_point)

#### fn [monitor\_from\_point](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html#tymethod.monitor_from_point)(&self, x: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), y: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Monitor](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/monitor/struct.Monitor.html "struct tauri_runtime::monitor::Monitor")>

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2494)[§](#method.available_monitors)

#### fn [available\_monitors](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html#tymethod.available_monitors)(&self) -> [Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[Monitor](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/monitor/struct.Monitor.html "struct tauri_runtime::monitor::Monitor")>

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2504)[§](#method.cursor_position)

#### fn [cursor\_position](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html#tymethod.cursor_position)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[PhysicalPosition](struct.PhysicalPosition.html.md "struct tauri::PhysicalPosition")<[f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)>, [Error](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.Error.html "enum tauri_runtime::Error")>

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2511)[§](#method.set_theme)

#### fn [set\_theme](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html#tymethod.set_theme)(&self, theme: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Theme](enum.Theme.html.md "enum tauri::Theme")>)

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2375)[§](#impl-Sync-for-WryHandle%3CT%3E)

### impl<T> [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [WryHandle](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.WryHandle.html "struct tauri_runtime_wry::WryHandle")<T> where T: [UserEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.UserEvent.html "trait tauri_runtime::UserEvent"),