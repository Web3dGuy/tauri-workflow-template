# Type Alias WryCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](../src/tauri/lib.rs.html#117)

```
pub type Wry = Wry<EventLoopMessage>;
```

Available on **crate feature `wry`** only.

Expand description

A Tauri [`Runtime`](trait.Runtime.html.md "trait tauri::Runtime") wrapper around wry.

## Aliased Type[§](#aliased-type)

```
struct Wry { /* private fields */ }
```

## Trait Implementations

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2356)[§](#impl-Debug-for-Wry%3CT%3E)

### impl<T> [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [Wry](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.Wry.html "struct tauri_runtime_wry::Wry")<T> where T: [UserEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.UserEvent.html "trait tauri_runtime::UserEvent"),

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2357)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")>

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2638)[§](#impl-Runtime%3CT%3E-for-Wry%3CT%3E)

### impl<T> [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<T> for [Wry](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.Wry.html "struct tauri_runtime_wry::Wry")<T> where T: [UserEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.UserEvent.html "trait tauri_runtime::UserEvent"),

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2639)[§](#associatedtype.WindowDispatcher)

#### type [WindowDispatcher](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.WindowDispatcher) = [WryWindowDispatcher](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.WryWindowDispatcher.html "struct tauri_runtime_wry::WryWindowDispatcher")<T>

The window message dispatcher.

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2640)[§](#associatedtype.WebviewDispatcher)

#### type [WebviewDispatcher](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.WebviewDispatcher) = [WryWebviewDispatcher](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.WryWebviewDispatcher.html "struct tauri_runtime_wry::WryWebviewDispatcher")<T>

The webview message dispatcher.

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2641)[§](#associatedtype.Handle)

#### type [Handle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.Handle) = [WryHandle](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.WryHandle.html "struct tauri_runtime_wry::WryHandle")<T>

The runtime handle type.

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2643)[§](#associatedtype.EventLoopProxy)

#### type [EventLoopProxy](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.EventLoopProxy) = [EventProxy](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.EventProxy.html "struct tauri_runtime_wry::EventProxy")<T>

The proxy type.

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2645)[§](#method.new)

#### fn [new](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.new)(args: [RuntimeInitArgs](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/struct.RuntimeInitArgs.html "struct tauri_runtime::RuntimeInitArgs")) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Wry](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.Wry.html "struct tauri_runtime_wry::Wry")<T>, [Error](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.Error.html "enum tauri_runtime::Error")>

Creates a new webview runtime. Must be used on the main thread.

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2655)[§](#method.new_any_thread)

#### fn [new\_any\_thread](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.new_any_thread)(args: [RuntimeInitArgs](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/struct.RuntimeInitArgs.html "struct tauri_runtime::RuntimeInitArgs")) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Wry](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.Wry.html "struct tauri_runtime_wry::Wry")<T>, [Error](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.Error.html "enum tauri_runtime::Error")>

Available on **Windows or Linux** only.

Creates a new webview runtime on any thread.

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2670)[§](#method.create_proxy)

#### fn [create\_proxy](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.create_proxy)(&self) -> [EventProxy](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.EventProxy.html "struct tauri_runtime_wry::EventProxy")<T>

Creates an `EventLoopProxy` that can be used to dispatch user events to the main event loop.

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2674)[§](#method.handle)

#### fn [handle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.handle)(&self) -> <[Wry](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.Wry.html "struct tauri_runtime_wry::Wry")<T> as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<T>>::[Handle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.Handle "type tauri_runtime::Runtime::Handle")

Gets a runtime handle.

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2680-2684)[§](#method.create_window)

#### fn [create\_window](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.create_window)<F>( &self, pending: [PendingWindow](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/struct.PendingWindow.html "struct tauri_runtime::window::PendingWindow")<T, [Wry](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.Wry.html "struct tauri_runtime_wry::Wry")<T>>, after\_window\_creation: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<F>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[DetachedWindow](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/struct.DetachedWindow.html "struct tauri_runtime::window::DetachedWindow")<T, [Wry](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.Wry.html "struct tauri_runtime_wry::Wry")<T>>, [Error](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.Error.html "enum tauri_runtime::Error")> where F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([RawWindow](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/struct.RawWindow.html "struct tauri_runtime::window::RawWindow")<'\_>) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Create a new window.

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2743-2747)[§](#method.create_webview)

#### fn [create\_webview](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.create_webview)( &self, window\_id: [WindowId](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/struct.WindowId.html "struct tauri_runtime::window::WindowId"), pending: [PendingWebview](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/webview/struct.PendingWebview.html "struct tauri_runtime::webview::PendingWebview")<T, [Wry](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.Wry.html "struct tauri_runtime_wry::Wry")<T>>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[DetachedWebview](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/webview/struct.DetachedWebview.html "struct tauri_runtime::webview::DetachedWebview")<T, [Wry](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.Wry.html "struct tauri_runtime_wry::Wry")<T>>, [Error](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.Error.html "enum tauri_runtime::Error")>

Create a new webview.

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2798)[§](#method.primary_monitor)

#### fn [primary\_monitor](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.primary_monitor)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Monitor](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/monitor/struct.Monitor.html "struct tauri_runtime::monitor::Monitor")>

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2807)[§](#method.monitor_from_point)

#### fn [monitor\_from\_point](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.monitor_from_point)(&self, x: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), y: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Monitor](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/monitor/struct.Monitor.html "struct tauri_runtime::monitor::Monitor")>

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2816)[§](#method.available_monitors)

#### fn [available\_monitors](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.available_monitors)(&self) -> [Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[Monitor](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/monitor/struct.Monitor.html "struct tauri_runtime::monitor::Monitor")>

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2826)[§](#method.cursor_position)

#### fn [cursor\_position](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.cursor_position)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[PhysicalPosition](struct.PhysicalPosition.html.md "struct tauri::PhysicalPosition")<[f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)>, [Error](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.Error.html "enum tauri_runtime::Error")>

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2833)[§](#method.set_theme)

#### fn [set\_theme](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.set_theme)(&self, theme: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Theme](enum.Theme.html.md "enum tauri::Theme")>)

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2858)[§](#method.set_device_event_filter)

#### fn [set\_device\_event\_filter](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.set_device_event_filter)(&mut self, filter: [DeviceEventFilter](enum.DeviceEventFilter.html.md "enum tauri::DeviceEventFilter"))

Change the device event filter mode. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.set_device_event_filter)

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2865)[§](#method.run_iteration)

#### fn [run\_iteration](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.run_iteration)<F>(&mut self, callback: F) where F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")([RunEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.RunEvent.html "enum tauri_runtime::RunEvent")<T>) + 'static,

Runs an iteration of the runtime event loop and returns control flow to the caller.

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2920)[§](#method.run)

#### fn [run](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.run)<F>(self, callback: F) where F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")([RunEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.RunEvent.html "enum tauri_runtime::RunEvent")<T>) + 'static,

Run the webview runtime.

[Source](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime_wry/lib.rs.html#2927)[§](#method.run_return)

#### fn [run\_return](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.run_return)<F>(self, callback: F) -> [i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html) where F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")([RunEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.RunEvent.html "enum tauri_runtime::RunEvent")<T>) + 'static,

Equivalent to [`Runtime::run`](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.run "method tauri_runtime::Runtime::run") but returns the exit code instead of exiting the process.