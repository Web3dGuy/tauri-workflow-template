# Struct MockWindowDispatcherCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/test/mock_runtime.rs.html#322-325)

```
pub struct MockWindowDispatcher { /* private fields */ }
```

Available on **crate feature `test`** only.

## Trait Implementations[§](#trait-implementations)

[Source](../../src/tauri/test/mock_runtime.rs.html#321)[§](#impl-Clone-for-MockWindowDispatcher)

### impl [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [MockWindowDispatcher](struct.MockWindowDispatcher.html.md "struct tauri::test::MockWindowDispatcher")

[Source](../../src/tauri/test/mock_runtime.rs.html#321)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> [MockWindowDispatcher](struct.MockWindowDispatcher.html.md "struct tauri::test::MockWindowDispatcher")

Returns a copy of the value. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#174)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &Self)

Performs copy-assignment from `source`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)

[Source](../../src/tauri/test/mock_runtime.rs.html#321)[§](#impl-Debug-for-MockWindowDispatcher)

### impl [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [MockWindowDispatcher](struct.MockWindowDispatcher.html.md "struct tauri::test::MockWindowDispatcher")

[Source](../../src/tauri/test/mock_runtime.rs.html#321)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/fmt/type.Result.html "type core::fmt::Result")

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](../../src/tauri/test/mock_runtime.rs.html#644-1060)[§](#impl-WindowDispatch%3CT%3E-for-MockWindowDispatcher)

### impl<T: [UserEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.UserEvent.html "trait tauri_runtime::UserEvent")> [WindowDispatch](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html "trait tauri_runtime::WindowDispatch")<T> for [MockWindowDispatcher](struct.MockWindowDispatcher.html.md "struct tauri::test::MockWindowDispatcher")

[Source](../../src/tauri/test/mock_runtime.rs.html#645)[§](#associatedtype.Runtime)

#### type [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#associatedtype.Runtime) = [MockRuntime](struct.MockRuntime.html.md "struct tauri::test::MockRuntime")

The runtime this [`WindowDispatch`](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html "trait tauri_runtime::WindowDispatch") runs under.

[Source](../../src/tauri/test/mock_runtime.rs.html#647)[§](#associatedtype.WindowBuilder)

#### type [WindowBuilder](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#associatedtype.WindowBuilder) = [MockWindowBuilder](struct.MockWindowBuilder.html.md "struct tauri::test::MockWindowBuilder")

The window builder type.

[Source](../../src/tauri/test/mock_runtime.rs.html#649-651)[§](#method.run_on_main_thread)

#### fn [run\_on\_main\_thread](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.run_on_main_thread)<F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")() + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>(&self, f: F) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Run a task on the main thread.

[Source](../../src/tauri/test/mock_runtime.rs.html#653-655)[§](#method.on_window_event)

#### fn [on\_window\_event](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.on_window_event)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[WindowEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/enum.WindowEvent.html "enum tauri_runtime::window::WindowEvent")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>( &self, f: F, ) -> [WindowEventId](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.WindowEventId.html "type tauri_runtime::WindowEventId")

Registers a window event handler.

[Source](../../src/tauri/test/mock_runtime.rs.html#657-659)[§](#method.scale_factor)

#### fn [scale\_factor](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.scale_factor)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)>

Returns the scale factor that can be used to map logical pixels to physical pixels, and vice versa.

[Source](../../src/tauri/test/mock_runtime.rs.html#661-663)[§](#method.inner_position)

#### fn [inner\_position](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.inner_position)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[PhysicalPosition](..\struct.PhysicalPosition.html.md "struct tauri::PhysicalPosition")<[i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html)>>

Returns the position of the top-left hand corner of the window’s client area relative to the top-left hand corner of the desktop.

[Source](../../src/tauri/test/mock_runtime.rs.html#665-667)[§](#method.outer_position)

#### fn [outer\_position](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.outer_position)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[PhysicalPosition](..\struct.PhysicalPosition.html.md "struct tauri::PhysicalPosition")<[i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html)>>

Returns the position of the top-left hand corner of the window relative to the top-left hand corner of the desktop.

[Source](../../src/tauri/test/mock_runtime.rs.html#669-674)[§](#method.inner_size)

#### fn [inner\_size](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.inner_size)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[PhysicalSize](..\struct.PhysicalSize.html.md "struct tauri::PhysicalSize")<[u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html)>>

Returns the physical size of the window’s client area. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.inner_size)

[Source](../../src/tauri/test/mock_runtime.rs.html#676-681)[§](#method.outer_size)

#### fn [outer\_size](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.outer_size)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[PhysicalSize](..\struct.PhysicalSize.html.md "struct tauri::PhysicalSize")<[u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html)>>

Returns the physical size of the entire window. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.outer_size)

[Source](../../src/tauri/test/mock_runtime.rs.html#683-685)[§](#method.is_fullscreen)

#### fn [is\_fullscreen](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.is_fullscreen)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s current fullscreen state.

[Source](../../src/tauri/test/mock_runtime.rs.html#687-689)[§](#method.is_minimized)

#### fn [is\_minimized](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.is_minimized)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s current minimized state.

[Source](../../src/tauri/test/mock_runtime.rs.html#691-693)[§](#method.is_maximized)

#### fn [is\_maximized](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.is_maximized)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s current maximized state.

[Source](../../src/tauri/test/mock_runtime.rs.html#695-697)[§](#method.is_focused)

#### fn [is\_focused](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.is_focused)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s current focus state.

[Source](../../src/tauri/test/mock_runtime.rs.html#699-701)[§](#method.is_decorated)

#### fn [is\_decorated](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.is_decorated)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s current decoration state.

[Source](../../src/tauri/test/mock_runtime.rs.html#703-705)[§](#method.is_resizable)

#### fn [is\_resizable](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.is_resizable)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s current resizable state.

[Source](../../src/tauri/test/mock_runtime.rs.html#707-709)[§](#method.is_maximizable)

#### fn [is\_maximizable](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.is_maximizable)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s native maximize button state. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.is_maximizable)

[Source](../../src/tauri/test/mock_runtime.rs.html#711-713)[§](#method.is_minimizable)

#### fn [is\_minimizable](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.is_minimizable)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s native minimize button state. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.is_minimizable)

[Source](../../src/tauri/test/mock_runtime.rs.html#715-717)[§](#method.is_closable)

#### fn [is\_closable](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.is_closable)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s native close button state. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.is_closable)

[Source](../../src/tauri/test/mock_runtime.rs.html#719-721)[§](#method.is_visible)

#### fn [is\_visible](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.is_visible)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s current visibility state.

[Source](../../src/tauri/test/mock_runtime.rs.html#723-725)[§](#method.title)

#### fn [title](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.title)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>

Gets the window’s current title.

[Source](../../src/tauri/test/mock_runtime.rs.html#727-729)[§](#method.current_monitor)

#### fn [current\_monitor](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.current_monitor)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Monitor](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/monitor/struct.Monitor.html "struct tauri_runtime::monitor::Monitor")>>

Returns the monitor on which the window currently resides. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.current_monitor)

[Source](../../src/tauri/test/mock_runtime.rs.html#731-733)[§](#method.primary_monitor)

#### fn [primary\_monitor](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.primary_monitor)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Monitor](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/monitor/struct.Monitor.html "struct tauri_runtime::monitor::Monitor")>>

Returns the primary monitor of the system. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.primary_monitor)

[Source](../../src/tauri/test/mock_runtime.rs.html#735-737)[§](#method.monitor_from_point)

#### fn [monitor\_from\_point](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.monitor_from_point)(&self, x: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), y: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Monitor](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/monitor/struct.Monitor.html "struct tauri_runtime::monitor::Monitor")>>

Returns the monitor that contains the given point.

[Source](../../src/tauri/test/mock_runtime.rs.html#739-741)[§](#method.available_monitors)

#### fn [available\_monitors](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.available_monitors)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[Monitor](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/monitor/struct.Monitor.html "struct tauri_runtime::monitor::Monitor")>>

Returns the list of all the monitors available on the system.

[Source](../../src/tauri/test/mock_runtime.rs.html#743-745)[§](#method.theme)

#### fn [theme](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.theme)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[Theme](..\enum.Theme.html.md "enum tauri::Theme")>

Returns the current window theme.

[Source](../../src/tauri/test/mock_runtime.rs.html#754-756)[§](#method.gtk_window)

#### fn [gtk\_window](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.gtk_window)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[ApplicationWindow](https://docs.rs/gtk/0.18.2/x86_64-unknown-linux-gnu/gtk/auto/application_window/struct.ApplicationWindow.html "struct gtk::auto::application_window::ApplicationWindow")>

Returns the `ApplicationWindow` from gtk crate that is used by this window.

[Source](../../src/tauri/test/mock_runtime.rs.html#765-767)[§](#method.default_vbox)

#### fn [default\_vbox](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.default_vbox)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[Box](https://docs.rs/gtk/0.18.2/x86_64-unknown-linux-gnu/gtk/auto/box_/struct.Box.html "struct gtk::auto::box_::Box")>

Returns the vertical [`gtk::Box`](https://docs.rs/gtk/0.18.2/x86_64-unknown-linux-gnu/gtk/auto/box_/struct.Box.html "struct gtk::auto::box_::Box") that is added by default as the sole child of this window.

[Source](../../src/tauri/test/mock_runtime.rs.html#769-796)[§](#method.window_handle)

#### fn [window\_handle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.window_handle)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[WindowHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/struct.WindowHandle.html "struct raw_window_handle::borrowed::WindowHandle")<'\_>, [HandleError](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/enum.HandleError.html "enum raw_window_handle::HandleError")>

Raw window handle.

[Source](../../src/tauri/test/mock_runtime.rs.html#798-800)[§](#method.center)

#### fn [center](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.center)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Centers the window.

[Source](../../src/tauri/test/mock_runtime.rs.html#802-804)[§](#method.request_user_attention)

#### fn [request\_user\_attention](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.request_user_attention)( &self, request\_type: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[UserAttentionType](..\enum.UserAttentionType.html.md "enum tauri::UserAttentionType")>, ) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Requests user attention to the window. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.request_user_attention)

[Source](../../src/tauri/test/mock_runtime.rs.html#806-849)[§](#method.create_window)

#### fn [create\_window](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.create_window)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([RawWindow](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/struct.RawWindow.html "struct tauri_runtime::window::RawWindow")<'\_>) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>( &mut self, pending: [PendingWindow](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/struct.PendingWindow.html "struct tauri_runtime::window::PendingWindow")<T, Self::[Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#associatedtype.Runtime "type tauri_runtime::WindowDispatch::Runtime")>, \_after\_window\_creation: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<F>, ) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[DetachedWindow](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/struct.DetachedWindow.html "struct tauri_runtime::window::DetachedWindow")<T, Self::[Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#associatedtype.Runtime "type tauri_runtime::WindowDispatch::Runtime")>>

Create a new window.

[Source](../../src/tauri/test/mock_runtime.rs.html#851-870)[§](#method.create_webview)

#### fn [create\_webview](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.create_webview)( &mut self, pending: [PendingWebview](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/webview/struct.PendingWebview.html "struct tauri_runtime::webview::PendingWebview")<T, Self::[Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#associatedtype.Runtime "type tauri_runtime::WindowDispatch::Runtime")>, ) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[DetachedWebview](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/webview/struct.DetachedWebview.html "struct tauri_runtime::webview::DetachedWebview")<T, Self::[Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#associatedtype.Runtime "type tauri_runtime::WindowDispatch::Runtime")>>

Create a new webview.

[Source](../../src/tauri/test/mock_runtime.rs.html#872-874)[§](#method.set_resizable)

#### fn [set\_resizable](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_resizable)(&self, resizable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Updates the window resizable flag.

[Source](../../src/tauri/test/mock_runtime.rs.html#876-878)[§](#method.set_maximizable)

#### fn [set\_maximizable](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_maximizable)(&self, maximizable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Updates the window’s native maximize button state. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_maximizable)

[Source](../../src/tauri/test/mock_runtime.rs.html#880-882)[§](#method.set_minimizable)

#### fn [set\_minimizable](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_minimizable)(&self, minimizable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Updates the window’s native minimize button state. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_minimizable)

[Source](../../src/tauri/test/mock_runtime.rs.html#884-886)[§](#method.set_closable)

#### fn [set\_closable](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_closable)(&self, closable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Updates the window’s native close button state. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_closable)

[Source](../../src/tauri/test/mock_runtime.rs.html#888-890)[§](#method.set_title)

#### fn [set\_title](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_title)<S: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>>(&self, title: S) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Updates the window title.

[Source](../../src/tauri/test/mock_runtime.rs.html#892-894)[§](#method.maximize)

#### fn [maximize](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.maximize)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Maximizes the window.

[Source](../../src/tauri/test/mock_runtime.rs.html#896-898)[§](#method.unmaximize)

#### fn [unmaximize](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.unmaximize)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Unmaximizes the window.

[Source](../../src/tauri/test/mock_runtime.rs.html#900-902)[§](#method.minimize)

#### fn [minimize](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.minimize)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Minimizes the window.

[Source](../../src/tauri/test/mock_runtime.rs.html#904-906)[§](#method.unminimize)

#### fn [unminimize](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.unminimize)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Unminimizes the window.

[Source](../../src/tauri/test/mock_runtime.rs.html#908-910)[§](#method.show)

#### fn [show](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.show)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Shows the window.

[Source](../../src/tauri/test/mock_runtime.rs.html#912-914)[§](#method.hide)

#### fn [hide](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.hide)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Hides the window.

[Source](../../src/tauri/test/mock_runtime.rs.html#916-919)[§](#method.close)

#### fn [close](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.close)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Closes the window.

[Source](../../src/tauri/test/mock_runtime.rs.html#921-924)[§](#method.destroy)

#### fn [destroy](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.destroy)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Destroys the window.

[Source](../../src/tauri/test/mock_runtime.rs.html#926-928)[§](#method.set_decorations)

#### fn [set\_decorations](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_decorations)(&self, decorations: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Updates the decorations flag.

[Source](../../src/tauri/test/mock_runtime.rs.html#930-932)[§](#method.set_shadow)

#### fn [set\_shadow](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_shadow)(&self, shadow: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Updates the shadow flag.

[Source](../../src/tauri/test/mock_runtime.rs.html#934-936)[§](#method.set_always_on_bottom)

#### fn [set\_always\_on\_bottom](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_always_on_bottom)(&self, always\_on\_bottom: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Updates the window alwaysOnBottom flag.

[Source](../../src/tauri/test/mock_runtime.rs.html#938-940)[§](#method.set_always_on_top)

#### fn [set\_always\_on\_top](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_always_on_top)(&self, always\_on\_top: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Updates the window alwaysOnTop flag.

[Source](../../src/tauri/test/mock_runtime.rs.html#942-944)[§](#method.set_visible_on_all_workspaces)

#### fn [set\_visible\_on\_all\_workspaces](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_visible_on_all_workspaces)( &self, visible\_on\_all\_workspaces: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html), ) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Updates the window visibleOnAllWorkspaces flag.

[Source](../../src/tauri/test/mock_runtime.rs.html#946-948)[§](#method.set_content_protected)

#### fn [set\_content\_protected](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_content_protected)(&self, protected: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Prevents the window contents from being captured by other apps.

[Source](../../src/tauri/test/mock_runtime.rs.html#950-952)[§](#method.set_size)

#### fn [set\_size](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_size)(&self, size: [Size](..\enum.Size.html.md "enum tauri::Size")) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Resizes the window.

[Source](../../src/tauri/test/mock_runtime.rs.html#954-956)[§](#method.set_min_size)

#### fn [set\_min\_size](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_min_size)(&self, size: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Size](..\enum.Size.html.md "enum tauri::Size")>) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Updates the window min inner size.

[Source](../../src/tauri/test/mock_runtime.rs.html#958-960)[§](#method.set_max_size)

#### fn [set\_max\_size](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_max_size)(&self, size: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Size](..\enum.Size.html.md "enum tauri::Size")>) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Updates the window max inner size.

[Source](../../src/tauri/test/mock_runtime.rs.html#962-964)[§](#method.set_position)

#### fn [set\_position](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_position)(&self, position: [Position](..\enum.Position.html.md "enum tauri::Position")) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Updates the window position.

[Source](../../src/tauri/test/mock_runtime.rs.html#966-968)[§](#method.set_fullscreen)

#### fn [set\_fullscreen](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_fullscreen)(&self, fullscreen: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Updates the window fullscreen state.

[Source](../../src/tauri/test/mock_runtime.rs.html#970-972)[§](#method.set_focus)

#### fn [set\_focus](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_focus)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Bring the window to front and focus.

[Source](../../src/tauri/test/mock_runtime.rs.html#974-976)[§](#method.set_icon)

#### fn [set\_icon](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_icon)(&self, icon: [Icon](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/struct.Icon.html "struct tauri_runtime::Icon")<'\_>) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Updates the window icon.

[Source](../../src/tauri/test/mock_runtime.rs.html#978-980)[§](#method.set_skip_taskbar)

#### fn [set\_skip\_taskbar](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_skip_taskbar)(&self, skip: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Whether to hide the window icon from the taskbar or not.

[Source](../../src/tauri/test/mock_runtime.rs.html#982-984)[§](#method.set_cursor_grab)

#### fn [set\_cursor\_grab](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_cursor_grab)(&self, grab: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Grabs the cursor, preventing it from leaving the window. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_cursor_grab)

[Source](../../src/tauri/test/mock_runtime.rs.html#986-988)[§](#method.set_cursor_visible)

#### fn [set\_cursor\_visible](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_cursor_visible)(&self, visible: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Modifies the cursor’s visibility. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_cursor_visible)

[Source](../../src/tauri/test/mock_runtime.rs.html#990-992)[§](#method.set_cursor_icon)

#### fn [set\_cursor\_icon](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_cursor_icon)(&self, icon: [CursorIcon](..\enum.CursorIcon.html.md "enum tauri::CursorIcon")) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

[Source](../../src/tauri/test/mock_runtime.rs.html#994-996)[§](#method.set_cursor_position)

#### fn [set\_cursor\_position](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_cursor_position)<Pos: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Position](..\enum.Position.html.md "enum tauri::Position")>>(&self, position: Pos) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Changes the position of the cursor in window coordinates.

[Source](../../src/tauri/test/mock_runtime.rs.html#998-1000)[§](#method.set_ignore_cursor_events)

#### fn [set\_ignore\_cursor\_events](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_ignore_cursor_events)(&self, ignore: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Ignores the window cursor events.

[Source](../../src/tauri/test/mock_runtime.rs.html#1002-1004)[§](#method.start_dragging)

#### fn [start\_dragging](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.start_dragging)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Starts dragging the window.

[Source](../../src/tauri/test/mock_runtime.rs.html#1006-1008)[§](#method.start_resize_dragging)

#### fn [start\_resize\_dragging](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.start_resize_dragging)(&self, direction: [ResizeDirection](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.ResizeDirection.html "enum tauri_runtime::ResizeDirection")) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Starts resize-dragging the window.

[Source](../../src/tauri/test/mock_runtime.rs.html#1010-1012)[§](#method.set_progress_bar)

#### fn [set\_progress\_bar](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_progress_bar)(&self, progress\_state: [ProgressBarState](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/struct.ProgressBarState.html "struct tauri_runtime::ProgressBarState")) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets the taskbar progress state. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_progress_bar)

[Source](../../src/tauri/test/mock_runtime.rs.html#1014-1016)[§](#method.set_badge_count)

#### fn [set\_badge\_count](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_badge_count)( &self, count: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html)>, desktop\_filename: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, ) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets the badge count on the taskbar
The badge count appears as a whole for the application
Using `0` or using `None` will remove the badge [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_badge_count)

[Source](../../src/tauri/test/mock_runtime.rs.html#1018-1020)[§](#method.set_badge_label)

#### fn [set\_badge\_label](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_badge_label)(&self, label: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets the badge count on the taskbar **macOS only**. Using `None` will remove the badge

[Source](../../src/tauri/test/mock_runtime.rs.html#1022-1024)[§](#method.set_overlay_icon)

#### fn [set\_overlay\_icon](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_overlay_icon)(&self, icon: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Icon](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/struct.Icon.html "struct tauri_runtime::Icon")<'\_>>) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets the overlay icon on the taskbar **Windows only**. Using `None` will remove the icon [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_overlay_icon)

[Source](../../src/tauri/test/mock_runtime.rs.html#1026-1028)[§](#method.set_title_bar_style)

#### fn [set\_title\_bar\_style](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_title_bar_style)(&self, style: [TitleBarStyle](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/enum.TitleBarStyle.html "enum tauri_utils::TitleBarStyle")) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets the title bar style. Available on macOS only. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_title_bar_style)

[Source](../../src/tauri/test/mock_runtime.rs.html#1030-1032)[§](#method.set_traffic_light_position)

#### fn [set\_traffic\_light\_position](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_traffic_light_position)(&self, position: [Position](..\enum.Position.html.md "enum tauri::Position")) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Change the position of the window controls. Available on macOS only. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_traffic_light_position)

[Source](../../src/tauri/test/mock_runtime.rs.html#1034-1039)[§](#method.set_size_constraints)

#### fn [set\_size\_constraints](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_size_constraints)(&self, constraints: [WindowSizeConstraints](..\struct.WindowSizeConstraints.html.md "struct tauri::WindowSizeConstraints")) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets this window’s minimum inner width.

[Source](../../src/tauri/test/mock_runtime.rs.html#1041-1043)[§](#method.set_theme)

#### fn [set\_theme](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_theme)(&self, theme: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Theme](..\enum.Theme.html.md "enum tauri::Theme")>) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets the theme for this window. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_theme)

[Source](../../src/tauri/test/mock_runtime.rs.html#1045-1047)[§](#method.set_enabled)

#### fn [set\_enabled](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_enabled)(&self, enabled: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Enable or disable the window. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_enabled)

[Source](../../src/tauri/test/mock_runtime.rs.html#1049-1051)[§](#method.is_enabled)

#### fn [is\_enabled](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.is_enabled)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Whether the window is enabled or disable.

[Source](../../src/tauri/test/mock_runtime.rs.html#1053-1055)[§](#method.is_always_on_top)

#### fn [is\_always\_on\_top](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.is_always_on_top)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window alwaysOnTop flag state. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.is_always_on_top)

[Source](../../src/tauri/test/mock_runtime.rs.html#1057-1059)[§](#method.set_background_color)

#### fn [set\_background\_color](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#tymethod.set_background_color)(&self, color: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Color](..\webview\struct.Color.html.md "struct tauri::webview::Color")>) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Set the window background.

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-MockWindowDispatcher)

### impl [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [MockWindowDispatcher](struct.MockWindowDispatcher.html.md "struct tauri::test::MockWindowDispatcher")

[§](#impl-RefUnwindSafe-for-MockWindowDispatcher)

### impl ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [MockWindowDispatcher](struct.MockWindowDispatcher.html.md "struct tauri::test::MockWindowDispatcher")

[§](#impl-Send-for-MockWindowDispatcher)

### impl [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [MockWindowDispatcher](struct.MockWindowDispatcher.html.md "struct tauri::test::MockWindowDispatcher")

[§](#impl-Sync-for-MockWindowDispatcher)

### impl [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [MockWindowDispatcher](struct.MockWindowDispatcher.html.md "struct tauri::test::MockWindowDispatcher")

[§](#impl-Unpin-for-MockWindowDispatcher)

### impl [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [MockWindowDispatcher](struct.MockWindowDispatcher.html.md "struct tauri::test::MockWindowDispatcher")

[§](#impl-UnwindSafe-for-MockWindowDispatcher)

### impl ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [MockWindowDispatcher](struct.MockWindowDispatcher.html.md "struct tauri::test::MockWindowDispatcher")

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

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/lib.rs.html#210)[§](#impl-UserEvent-for-T)

### impl<T> [UserEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.UserEvent.html "trait tauri_runtime::UserEvent") for T where T: [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") + [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,