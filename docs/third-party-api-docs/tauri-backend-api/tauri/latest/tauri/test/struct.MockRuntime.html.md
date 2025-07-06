# Struct MockRuntimeCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/test/mock_runtime.rs.html#1072-1076)

```
pub struct MockRuntime {
    pub context: RuntimeContext,
    /* private fields */
}
```

Available on **crate feature `test`** only.

## Fields[§](#fields)

[§](#structfield.context)`context: RuntimeContext`

## Trait Implementations[§](#trait-implementations)

[Source](../../src/tauri/test/mock_runtime.rs.html#1071)[§](#impl-Debug-for-MockRuntime)

### impl [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [MockRuntime](struct.MockRuntime.html.md "struct tauri::test::MockRuntime")

[Source](../../src/tauri/test/mock_runtime.rs.html#1071)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/fmt/type.Result.html "type core::fmt::Result")

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](../../src/tauri/test/mock_runtime.rs.html#1100-1311)[§](#impl-Runtime%3CT%3E-for-MockRuntime)

### impl<T: [UserEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.UserEvent.html "trait tauri_runtime::UserEvent")> [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<T> for [MockRuntime](struct.MockRuntime.html.md "struct tauri::test::MockRuntime")

[Source](../../src/tauri/test/mock_runtime.rs.html#1101)[§](#associatedtype.WindowDispatcher)

#### type [WindowDispatcher](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.WindowDispatcher) = [MockWindowDispatcher](struct.MockWindowDispatcher.html.md "struct tauri::test::MockWindowDispatcher")

The window message dispatcher.

[Source](../../src/tauri/test/mock_runtime.rs.html#1102)[§](#associatedtype.WebviewDispatcher)

#### type [WebviewDispatcher](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.WebviewDispatcher) = [MockWebviewDispatcher](struct.MockWebviewDispatcher.html.md "struct tauri::test::MockWebviewDispatcher")

The webview message dispatcher.

[Source](../../src/tauri/test/mock_runtime.rs.html#1103)[§](#associatedtype.Handle)

#### type [Handle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.Handle) = [MockRuntimeHandle](struct.MockRuntimeHandle.html.md "struct tauri::test::MockRuntimeHandle")

The runtime handle type.

[Source](../../src/tauri/test/mock_runtime.rs.html#1104)[§](#associatedtype.EventLoopProxy)

#### type [EventLoopProxy](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.EventLoopProxy) = [EventProxy](struct.EventProxy.html.md "struct tauri::test::EventProxy")

The proxy type.

[Source](../../src/tauri/test/mock_runtime.rs.html#1106-1108)[§](#method.new)

#### fn [new](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.new)(\_args: [RuntimeInitArgs](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/struct.RuntimeInitArgs.html "struct tauri_runtime::RuntimeInitArgs")) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<Self>

Creates a new webview runtime. Must be used on the main thread.

[Source](../../src/tauri/test/mock_runtime.rs.html#1111-1113)[§](#method.new_any_thread)

#### fn [new\_any\_thread](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.new_any_thread)(\_args: [RuntimeInitArgs](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/struct.RuntimeInitArgs.html "struct tauri_runtime::RuntimeInitArgs")) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<Self>

Available on **Windows or Linux** only.

Creates a new webview runtime on any thread.

[Source](../../src/tauri/test/mock_runtime.rs.html#1115-1117)[§](#method.create_proxy)

#### fn [create\_proxy](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.create_proxy)(&self) -> [EventProxy](struct.EventProxy.html.md "struct tauri::test::EventProxy")

Creates an `EventLoopProxy` that can be used to dispatch user events to the main event loop.

[Source](../../src/tauri/test/mock_runtime.rs.html#1119-1123)[§](#method.handle)

#### fn [handle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.handle)(&self) -> Self::[Handle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.Handle "type tauri_runtime::Runtime::Handle")

Gets a runtime handle.

[Source](../../src/tauri/test/mock_runtime.rs.html#1125-1168)[§](#method.create_window)

#### fn [create\_window](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.create_window)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([RawWindow](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/struct.RawWindow.html "struct tauri_runtime::window::RawWindow")<'\_>) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>( &self, pending: [PendingWindow](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/struct.PendingWindow.html "struct tauri_runtime::window::PendingWindow")<T, Self>, \_after\_window\_creation: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<F>, ) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[DetachedWindow](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/struct.DetachedWindow.html "struct tauri_runtime::window::DetachedWindow")<T, Self>>

Create a new window.

[Source](../../src/tauri/test/mock_runtime.rs.html#1170-1190)[§](#method.create_webview)

#### fn [create\_webview](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.create_webview)( &self, window\_id: [WindowId](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/struct.WindowId.html "struct tauri_runtime::window::WindowId"), pending: [PendingWebview](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/webview/struct.PendingWebview.html "struct tauri_runtime::webview::PendingWebview")<T, Self>, ) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[DetachedWebview](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/webview/struct.DetachedWebview.html "struct tauri_runtime::webview::DetachedWebview")<T, Self>>

Create a new webview.

[Source](../../src/tauri/test/mock_runtime.rs.html#1192-1194)[§](#method.primary_monitor)

#### fn [primary\_monitor](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.primary_monitor)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Monitor](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/monitor/struct.Monitor.html "struct tauri_runtime::monitor::Monitor")>

[Source](../../src/tauri/test/mock_runtime.rs.html#1196-1198)[§](#method.monitor_from_point)

#### fn [monitor\_from\_point](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.monitor_from_point)(&self, x: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), y: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Monitor](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/monitor/struct.Monitor.html "struct tauri_runtime::monitor::Monitor")>

[Source](../../src/tauri/test/mock_runtime.rs.html#1200-1202)[§](#method.available_monitors)

#### fn [available\_monitors](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.available_monitors)(&self) -> [Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[Monitor](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/monitor/struct.Monitor.html "struct tauri_runtime::monitor::Monitor")>

[Source](../../src/tauri/test/mock_runtime.rs.html#1204-1206)[§](#method.set_theme)

#### fn [set\_theme](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.set_theme)(&self, theme: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Theme](..\enum.Theme.html.md "enum tauri::Theme")>)

[Source](../../src/tauri/test/mock_runtime.rs.html#1220)[§](#method.set_device_event_filter)

#### fn [set\_device\_event\_filter](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.set_device_event_filter)(&mut self, filter: [DeviceEventFilter](..\enum.DeviceEventFilter.html.md "enum tauri::DeviceEventFilter"))

Change the device event filter mode. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.set_device_event_filter)

[Source](../../src/tauri/test/mock_runtime.rs.html#1231)[§](#method.run_iteration)

#### fn [run\_iteration](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.run_iteration)<F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")([RunEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.RunEvent.html "enum tauri_runtime::RunEvent")<T>)>(&mut self, callback: F)

Runs an iteration of the runtime event loop and returns control flow to the caller.

[Source](../../src/tauri/test/mock_runtime.rs.html#1233-1237)[§](#method.run_return)

#### fn [run\_return](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.run_return)<F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")([RunEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.RunEvent.html "enum tauri_runtime::RunEvent")<T>) + 'static>(self, callback: F) -> [i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html)

Equivalent to [`Runtime::run`](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.run "method tauri_runtime::Runtime::run") but returns the exit code instead of exiting the process.

[Source](../../src/tauri/test/mock_runtime.rs.html#1239-1306)[§](#method.run)

#### fn [run](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.run)<F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")([RunEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.RunEvent.html "enum tauri_runtime::RunEvent")<T>) + 'static>(self, callback: F)

Run the webview runtime.

[Source](../../src/tauri/test/mock_runtime.rs.html#1308-1310)[§](#method.cursor_position)

#### fn [cursor\_position](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#tymethod.cursor_position)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[PhysicalPosition](..\struct.PhysicalPosition.html.md "struct tauri::PhysicalPosition")<[f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)>>

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-MockRuntime)

### impl [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [MockRuntime](struct.MockRuntime.html.md "struct tauri::test::MockRuntime")

[§](#impl-RefUnwindSafe-for-MockRuntime)

### impl ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [MockRuntime](struct.MockRuntime.html.md "struct tauri::test::MockRuntime")

[§](#impl-Send-for-MockRuntime)

### impl [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [MockRuntime](struct.MockRuntime.html.md "struct tauri::test::MockRuntime")

[§](#impl-Sync-for-MockRuntime)

### impl ![Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [MockRuntime](struct.MockRuntime.html.md "struct tauri::test::MockRuntime")

[§](#impl-Unpin-for-MockRuntime)

### impl [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [MockRuntime](struct.MockRuntime.html.md "struct tauri::test::MockRuntime")

[§](#impl-UnwindSafe-for-MockRuntime)

### impl ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [MockRuntime](struct.MockRuntime.html.md "struct tauri::test::MockRuntime")

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

[Source](../../src/tauri/lib.rs.html#297)[§](#impl-Runtime-for-W)

### impl<W> [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime") for W where W: [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>,