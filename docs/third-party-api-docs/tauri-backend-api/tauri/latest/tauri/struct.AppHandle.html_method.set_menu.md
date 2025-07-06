# Struct AppHandleCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](../src/tauri/app.rs.html#346-350)

```
pub struct AppHandle<R: Runtime = Wry> { /* private fields */ }
```

Expand description

A handle to the currently running application.

This type implements [`Manager`](trait.Manager.html.md "trait tauri::Manager") which allows for manipulation of global application items.

## Implementations[§](#implementations)

[Source](../src/tauri/app.rs.html#359-384)[§](#impl-AppHandle)

### impl [AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<[Wry](type.Wry.html.md "type tauri::Wry")>

APIs specific to the wry runtime.

[Source](../src/tauri/app.rs.html#361-368)

#### pub fn [create\_tao\_window](#method.create_tao_window)<F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")() -> ([String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"), [TaoWindowBuilder](https://docs.rs/tao/0.32.8/x86_64-unknown-linux-gnu/tao/window/struct.WindowBuilder.html "struct tao::window::WindowBuilder")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>( &self, f: F, ) -> [Result](type.Result.html.md "type tauri::Result")<[Weak](https://doc.rust-lang.org/nightly/alloc/sync/struct.Weak.html "struct alloc::sync::Weak")<[Window](https://docs.rs/tao/0.32.8/x86_64-unknown-linux-gnu/tao/window/struct.Window.html "struct tao::window::Window")>>

Create a new tao window using a callback. The event loop must be running at this point.

[Source](../src/tauri/app.rs.html#371-383)

#### pub fn [send\_tao\_window\_event](#method.send_tao_window_event)( &self, window\_id: [TaoWindowId](https://docs.rs/tao/0.32.8/x86_64-unknown-linux-gnu/tao/window/struct.WindowId.html "struct tao::window::WindowId"), message: [WindowMessage](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/enum.WindowMessage.html "enum tauri_runtime_wry::WindowMessage"), ) -> [Result](type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sends a window message to the event loop.

[Source](../src/tauri/app.rs.html#456-603)[§](#impl-AppHandle%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>

[Source](../src/tauri/app.rs.html#458-463)

#### pub fn [run\_on\_main\_thread](#method.run_on_main_thread)<F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")() + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>( &self, f: F, ) -> [Result](type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Runs the given closure on the main thread.

[Source](../src/tauri/app.rs.html#491-499)

#### pub fn [plugin](#method.plugin)<P: [Plugin](plugin\trait.Plugin.html.md "trait tauri::plugin::Plugin")<R> + 'static>(&self, plugin: P) -> [Result](type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Adds a Tauri application plugin.
This function can be used to register a plugin that is loaded dynamically e.g. after login.
For plugins that are created when the app is started, prefer [`Builder::plugin`](struct.Builder.html_method.plugin.md "method tauri::Builder::plugin").

See [`Builder::plugin`](struct.Builder.html_method.plugin.md "method tauri::Builder::plugin") for more information.

##### [§](#examples)Examples

```
use tauri::{plugin::{Builder as PluginBuilder, TauriPlugin}, Runtime};

fn init_plugin<R: Runtime>() -> TauriPlugin<R> {
  PluginBuilder::new("dummy").build()
}

tauri::Builder::default()
  .setup(move |app| {
    let handle = app.handle().clone();
    std::thread::spawn(move || {
      handle.plugin(init_plugin());
    });

    Ok(())
  });
```

[Source](../src/tauri/app.rs.html#526-528)

#### pub fn [remove\_plugin](#method.remove_plugin)(&self, plugin: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Removes the plugin with the given name.

##### [§](#examples-1)Examples

```
use tauri::{plugin::{Builder as PluginBuilder, TauriPlugin, Plugin}, Runtime};

fn init_plugin<R: Runtime>() -> TauriPlugin<R> {
  PluginBuilder::new("dummy").build()
}

let plugin = init_plugin();
// `.name()` requires the `PLugin` trait import
let plugin_name = plugin.name();
tauri::Builder::default()
  .plugin(plugin)
  .setup(move |app| {
    let handle = app.handle().clone();
    std::thread::spawn(move || {
      handle.remove_plugin(plugin_name);
    });

    Ok(())
  });
```

[Source](../src/tauri/app.rs.html#531-537)

#### pub fn [exit](#method.exit)(&self, exit\_code: [i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html))

Exits the app by triggering [`RunEvent::ExitRequested`](enum.RunEvent.html_variant.ExitRequested.md "variant tauri::RunEvent::ExitRequested") and [`RunEvent::Exit`](enum.RunEvent.html_variant.Exit.md "variant tauri::RunEvent::Exit").

[Source](../src/tauri/app.rs.html#545-569)

#### pub fn [restart](#method.restart)(&self) -> [!](https://doc.rust-lang.org/nightly/std/primitive.never.html)

Restarts the app by triggering [`RunEvent::ExitRequested`](enum.RunEvent.html_variant.ExitRequested.md "variant tauri::RunEvent::ExitRequested") with code [`RESTART_EXIT_CODE`](constant.RESTART_EXIT_CODE.html.md "constant tauri::RESTART_EXIT_CODE") and [`RunEvent::Exit`](enum.RunEvent.html_variant.Exit.md "variant tauri::RunEvent::Exit").

When this function is called on the main thread, we cannot guarantee the delivery of those events,
so we skip them and directly restart the process.

If you want to trigger them reliably, use [`Self::request_restart`](struct.AppHandle.html_method.request_restart.md "method tauri::AppHandle::request_restart") instead

[Source](../src/tauri/app.rs.html#572-582)

#### pub fn [request\_restart](#method.request_restart)(&self)

Restarts the app by triggering [`RunEvent::ExitRequested`](enum.RunEvent.html_variant.ExitRequested.md "variant tauri::RunEvent::ExitRequested") with code [`RESTART_EXIT_CODE`](constant.RESTART_EXIT_CODE.html.md "constant tauri::RESTART_EXIT_CODE") and [`RunEvent::Exit`](enum.RunEvent.html_variant.Exit.md "variant tauri::RunEvent::Exit").

[Source](../src/tauri/app.rs.html#1079)[§](#impl-AppHandle%3CR%3E-1)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>

[Source](../src/tauri/app.rs.html#1079)

#### pub fn [on\_menu\_event](#method.on_menu_event)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>, [MenuEvent](menu\struct.MenuEvent.html.md "struct tauri::menu::MenuEvent")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( &self, handler: F, )

Registers a global menu event listener.

[Source](../src/tauri/app.rs.html#1079)

#### pub fn [on\_tray\_icon\_event](#method.on_tray_icon_event)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>, [TrayIconEvent](tray\enum.TrayIconEvent.html.md "enum tauri::tray::TrayIconEvent")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( &self, handler: F, )

Available on **`desktop` and crate feature `tray-icon`** only.

Registers a global tray icon menu event listener.

[Source](../src/tauri/app.rs.html#1079)

#### pub fn [tray\_by\_id](#method.tray_by_id)<'a, I>(&self, id: [&'a I](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[TrayIcon](tray\struct.TrayIcon.html.md "struct tauri::tray::TrayIcon")<R>> where I: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), [TrayIconId](tray\struct.TrayIconId.html.md "struct tauri::tray::TrayIconId"): [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq")<[&'a I](https://doc.rust-lang.org/nightly/std/primitive.reference.html)>,

Available on **`desktop` and crate feature `tray-icon`** only.

Gets a tray icon using the provided id.

[Source](../src/tauri/app.rs.html#1079)

#### pub fn [remove\_tray\_by\_id](#method.remove_tray_by_id)<'a, I>(&self, id: [&'a I](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[TrayIcon](tray\struct.TrayIcon.html.md "struct tauri::tray::TrayIcon")<R>> where I: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), [TrayIconId](tray\struct.TrayIconId.html.md "struct tauri::tray::TrayIconId"): [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq")<[&'a I](https://doc.rust-lang.org/nightly/std/primitive.reference.html)>,

Available on **`desktop` and crate feature `tray-icon`** only.

Removes a tray icon using the provided id from tauri’s internal state and returns it.

Note that dropping the returned icon, may cause the tray icon to disappear
if it wasn’t cloned somewhere else or referenced by JS.

[Source](../src/tauri/app.rs.html#1079)

#### pub fn [config](#method.config)(&self) -> &[Config](struct.Config.html.md "struct tauri::Config")

Gets the app’s configuration, defined on the `tauri.conf.json` file.

[Source](../src/tauri/app.rs.html#1079)

#### pub fn [package\_info](#method.package_info)(&self) -> &[PackageInfo](struct.PackageInfo.html.md "struct tauri::PackageInfo")

Gets the app’s package information.

[Source](../src/tauri/app.rs.html#1079)

#### pub fn [asset\_resolver](#method.asset_resolver)(&self) -> [AssetResolver](struct.AssetResolver.html.md "struct tauri::AssetResolver")<R>

The application’s asset resolver.

[Source](../src/tauri/app.rs.html#1079)

#### pub fn [primary\_monitor](#method.primary_monitor)(&self) -> [Result](type.Result.html.md "type tauri::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Monitor](window\struct.Monitor.html.md "struct tauri::window::Monitor")>>

Returns the primary monitor of the system.

Returns None if it can’t identify any monitor as a primary one.

[Source](../src/tauri/app.rs.html#1079)

#### pub fn [monitor\_from\_point](#method.monitor_from_point)(&self, x: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), y: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> [Result](type.Result.html.md "type tauri::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Monitor](window\struct.Monitor.html.md "struct tauri::window::Monitor")>>

Returns the monitor that contains the given point.

[Source](../src/tauri/app.rs.html#1079)

#### pub fn [available\_monitors](#method.available_monitors)(&self) -> [Result](type.Result.html.md "type tauri::Result")<[Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[Monitor](window\struct.Monitor.html.md "struct tauri::window::Monitor")>>

Returns the list of all the monitors available on the system.

[Source](../src/tauri/app.rs.html#1079)

#### pub fn [cursor\_position](#method.cursor_position)(&self) -> [Result](type.Result.html.md "type tauri::Result")<[PhysicalPosition](struct.PhysicalPosition.html.md "struct tauri::PhysicalPosition")<[f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)>>

Get the cursor position relative to the top-left hand corner of the desktop.

Note that the top-left hand corner of the desktop is not necessarily the same as the screen.
If the user uses a desktop with multiple monitors,
the top-left hand corner of the desktop is the top-left hand corner of the main monitor on Windows and macOS
or the top-left of the leftmost monitor on X11.

The coordinates can be negative if the top-left hand corner of the window is outside of the visible screen region.

[Source](../src/tauri/app.rs.html#1079)

#### pub fn [set\_theme](#method.set_theme)(&self, theme: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Theme](enum.Theme.html.md "enum tauri::Theme")>)

Set the app theme.

[Source](../src/tauri/app.rs.html#1079)

#### pub fn [default\_window\_icon](#method.default_window_icon)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[Image](image\struct.Image.html.md "struct tauri::image::Image")<'\_>>

Returns the default window icon.

[Source](../src/tauri/app.rs.html#1079)

#### pub fn [menu](#method.menu)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Menu](menu\struct.Menu.html.md "struct tauri::menu::Menu")<R>>

Returns the app-wide menu.

[Source](../src/tauri/app.rs.html#1079)

#### pub fn [set\_menu](#method.set_menu)(&self, menu: [Menu](menu\struct.Menu.html.md "struct tauri::menu::Menu")<R>) -> [Result](type.Result.html.md "type tauri::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Menu](menu\struct.Menu.html.md "struct tauri::menu::Menu")<R>>>

Sets the app-wide menu and returns the previous one.

If a window was not created with an explicit menu or had one set explicitly,
this menu will be assigned to it.

[Source](../src/tauri/app.rs.html#1079)

#### pub fn [remove\_menu](#method.remove_menu)(&self) -> [Result](type.Result.html.md "type tauri::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Menu](menu\struct.Menu.html.md "struct tauri::menu::Menu")<R>>>

Remove the app-wide menu and returns it.

If a window was not created with an explicit menu or had one set explicitly,
this will remove the menu from it.

[Source](../src/tauri/app.rs.html#1079)

#### pub fn [hide\_menu](#method.hide_menu)(&self) -> [Result](type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Hides the app-wide menu from windows that have it.

If a window was not created with an explicit menu or had one set explicitly,
this will hide the menu from it.

[Source](../src/tauri/app.rs.html#1079)

#### pub fn [show\_menu](#method.show_menu)(&self) -> [Result](type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Shows the app-wide menu for windows that have it.

If a window was not created with an explicit menu or had one set explicitly,
this will show the menu for it.

[Source](../src/tauri/app.rs.html#1079)

#### pub fn [cleanup\_before\_exit](#method.cleanup_before_exit)(&self)

Runs necessary cleanup tasks before exiting the process.
**You should always exit the tauri app immediately after this function returns and not use any tauri-related APIs.**

[Source](../src/tauri/app.rs.html#1079)

#### pub fn [invoke\_key](#method.invoke_key)(&self) -> &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

Gets the invoke key that must be referenced when using [`crate::webview::InvokeRequest`](webview\struct.InvokeRequest.html.md "struct tauri::webview::InvokeRequest").

##### [§](#security)Security

DO NOT expose this key to third party scripts as might grant access to the backend from external URLs and iframes.

## Trait Implementations[§](#trait-implementations)

[Source](../src/tauri/app.rs.html#439-447)[§](#impl-Clone-for-AppHandle%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>

[Source](../src/tauri/app.rs.html#440-446)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> Self

Returns a copy of the value. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#174)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &Self)

Performs copy-assignment from `source`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)

[Source](../src/tauri/app.rs.html#449-454)[§](#impl-CommandArg%3C'de,+R%3E-for-AppHandle%3CR%3E)

### impl<'de, R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [CommandArg](ipc\trait.CommandArg.html.md "trait tauri::ipc::CommandArg")<'de, R> for [AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>

[Source](../src/tauri/app.rs.html#451-453)[§](#method.from_command)

#### fn [from\_command](ipc\trait.CommandArg.html_tymethod.from_command.md)(command: [CommandItem](ipc\struct.CommandItem.html.md "struct tauri::ipc::CommandItem")<'de, R>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Self, [InvokeError](ipc\struct.InvokeError.html.md "struct tauri::ipc::InvokeError")>

Grabs the [`Window`](window\struct.Window.html.md "struct tauri::window::Window") from the [`CommandItem`](ipc\struct.CommandItem.html.md "struct tauri::ipc::CommandItem") and returns the associated [`AppHandle`](struct.AppHandle.html.md "struct tauri::AppHandle"). This will never fail.

[Source](../src/tauri/app.rs.html#345)[§](#impl-Debug-for-AppHandle%3CR%3E)

### impl<R: [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") + [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R> where R::[Handle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.Handle "type tauri_runtime::Runtime::Handle"): [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug"),

[Source](../src/tauri/app.rs.html#345)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/fmt/type.Result.html "type core::fmt::Result")

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](../src/tauri/app.rs.html#1079)[§](#impl-Emitter%3CR%3E-for-AppHandle%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Emitter](trait.Emitter.html.md "trait tauri::Emitter")<R> for [AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>

[Source](../src/tauri/lib.rs.html#962-966)[§](#method.emit)

#### fn [emit](trait.Emitter.html_method.emit.md)<S: [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize") + [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone")>(&self, event: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), payload: S) -> [Result](type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Emits an event to all [targets](enum.EventTarget.html.md "enum tauri::EventTarget"). [Read more](trait.Emitter.html_method.emit.md)

[Source](../src/tauri/lib.rs.html#969-973)[§](#method.emit_str)

#### fn [emit\_str](trait.Emitter.html_method.emit_str.md)(&self, event: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), payload: [String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")) -> [Result](type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Similar to [`Emitter::emit`](trait.Emitter.html_method.emit.md "method tauri::Emitter::emit") but the payload is json serialized.

[Source](../src/tauri/lib.rs.html#997-1005)[§](#method.emit_to)

#### fn [emit\_to](trait.Emitter.html_method.emit_to.md)<I, S>(&self, target: I, event: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), payload: S) -> [Result](type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> where I: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[EventTarget](enum.EventTarget.html.md "enum tauri::EventTarget")>, S: [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize") + [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone"),

Emits an event to all [targets](enum.EventTarget.html.md "enum tauri::EventTarget") matching the given target. [Read more](trait.Emitter.html_method.emit_to.md)

[Source](../src/tauri/lib.rs.html#1008-1015)[§](#method.emit_str_to)

#### fn [emit\_str\_to](trait.Emitter.html_method.emit_str_to.md)<I>(&self, target: I, event: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), payload: [String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")) -> [Result](type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> where I: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[EventTarget](enum.EventTarget.html.md "enum tauri::EventTarget")>,

Similar to [`Emitter::emit_to`](trait.Emitter.html_method.emit_to.md "method tauri::Emitter::emit_to") but the payload is json serialized.

[Source](../src/tauri/lib.rs.html#1035-1043)[§](#method.emit_filter)

#### fn [emit\_filter](trait.Emitter.html_method.emit_filter.md)<S, F>(&self, event: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), payload: S, filter: F) -> [Result](type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> where S: [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize") + [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone"), F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[EventTarget](enum.EventTarget.html.md "enum tauri::EventTarget")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html),

Emits an event to all [targets](enum.EventTarget.html.md "enum tauri::EventTarget") based on the given filter. [Read more](trait.Emitter.html_method.emit_filter.md)

[Source](../src/tauri/lib.rs.html#1046-1053)[§](#method.emit_str_filter)

#### fn [emit\_str\_filter](trait.Emitter.html_method.emit_str_filter.md)<F>( &self, event: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), payload: [String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"), filter: F, ) -> [Result](type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> where F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[EventTarget](enum.EventTarget.html.md "enum tauri::EventTarget")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html),

Similar to [`Emitter::emit_filter`](trait.Emitter.html_method.emit_filter.md "method tauri::Emitter::emit_filter") but the payload is json serialized.

[Source](../src/tauri/lib.rs.html#1124-1128)[§](#impl-FunctionArg-for-AppHandle%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [FunctionArg](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/function/arg/trait.FunctionArg.html "trait specta::function::arg::FunctionArg") for [AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>

[Source](../src/tauri/lib.rs.html#1125-1127)[§](#method.to_datatype)

#### fn [to\_datatype](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/function/arg/trait.FunctionArg.html#tymethod.to_datatype)(\_: &mut TypeMap) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[DataType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/enum.DataType.html "enum specta::datatype::DataType")>

Gets the type of an argument as a [`DataType`](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/enum.DataType.html "enum specta::datatype::DataType"). [Read more](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/function/arg/trait.FunctionArg.html#tymethod.to_datatype)

[Source](../src/tauri/app.rs.html#2289-2295)[§](#impl-HasDisplayHandle-for-AppHandle%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [HasDisplayHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/trait.HasDisplayHandle.html "trait raw_window_handle::borrowed::HasDisplayHandle") for [AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>

[Source](../src/tauri/app.rs.html#2290-2294)[§](#method.display_handle)

#### fn [display\_handle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/trait.HasDisplayHandle.html#tymethod.display_handle)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[DisplayHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/struct.DisplayHandle.html "struct raw_window_handle::borrowed::DisplayHandle")<'\_>, [HandleError](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/enum.HandleError.html "enum raw_window_handle::HandleError")>

Get a handle to the display controller of the windowing system.

[Source](../src/tauri/app.rs.html#1079)[§](#impl-Listener%3CR%3E-for-AppHandle%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Listener](trait.Listener.html.md "trait tauri::Listener")<R> for [AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>

[Source](../src/tauri/app.rs.html#1079)[§](#method.listen)

#### fn [listen](trait.Listener.html_tymethod.listen.md)<F>(&self, event: impl [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, handler: F) -> [EventId](type.EventId.html.md "type tauri::EventId") where F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([Event](struct.Event.html.md "struct tauri::Event")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Listen to an event on this app.

##### [§](#examples-2)Examples

```
use tauri::Listener;

tauri::Builder::default()
  .setup(|app| {
    app.listen("component-loaded", move |event| {
      println!("window just loaded a component");
    });

    Ok(())
  });
```

[Source](../src/tauri/app.rs.html#1079)[§](#method.once)

#### fn [once](trait.Listener.html_tymethod.once.md)<F>(&self, event: impl [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, handler: F) -> [EventId](type.EventId.html.md "type tauri::EventId") where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")([Event](struct.Event.html.md "struct tauri::Event")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Listen to an event on this app only once.

See [`Self::listen`](struct.AppHandle.html_method.listen.md "method tauri::AppHandle::listen") for more information.

[Source](../src/tauri/app.rs.html#1079)[§](#method.unlisten)

#### fn [unlisten](trait.Listener.html_tymethod.unlisten.md)(&self, id: [EventId](type.EventId.html.md "type tauri::EventId"))

Unlisten to an event on this app.

##### [§](#examples-3)Examples

```
use tauri::Listener;

tauri::Builder::default()
  .setup(|app| {
    let handler = app.listen("component-loaded", move |event| {
      println!("app just loaded a component");
    });

    // stop listening to the event when you do not need it anymore
    app.unlisten(handler);

    Ok(())
  });
```

[Source](../src/tauri/lib.rs.html#926-932)[§](#method.listen_any)

#### fn [listen\_any](trait.Listener.html_method.listen_any.md)<F>(&self, event: impl [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, handler: F) -> [EventId](type.EventId.html.md "type tauri::EventId") where F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([Event](struct.Event.html.md "struct tauri::Event")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Listen to an emitted event to any [target](enum.EventTarget.html.md "enum tauri::EventTarget"). [Read more](trait.Listener.html_method.listen_any.md)

[Source](../src/tauri/lib.rs.html#939-945)[§](#method.once_any)

#### fn [once\_any](trait.Listener.html_method.once_any.md)<F>(&self, event: impl [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, handler: F) -> [EventId](type.EventId.html.md "type tauri::EventId") where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")([Event](struct.Event.html.md "struct tauri::Event")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Listens once to an emitted event to any [target](enum.EventTarget.html.md "enum tauri::EventTarget") . [Read more](trait.Listener.html_method.once_any.md)

[Source](../src/tauri/app.rs.html#605-609)[§](#impl-Manager%3CR%3E-for-AppHandle%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Manager](trait.Manager.html.md "trait tauri::Manager")<R> for [AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>

[Source](../src/tauri/app.rs.html#606-608)[§](#method.resources_table)

#### fn [resources\_table](trait.Manager.html_tymethod.resources_table.md)(&self) -> [MutexGuard](https://doc.rust-lang.org/nightly/std/sync/poison/mutex/struct.MutexGuard.html "struct std::sync::poison::mutex::MutexGuard")<'\_, [ResourceTable](struct.ResourceTable.html.md "struct tauri::ResourceTable")>

Get a reference to the resources table of this manager.

[Source](../src/tauri/lib.rs.html#535-537)[§](#method.app_handle)

#### fn [app\_handle](trait.Manager.html_method.app_handle.md)(&self) -> &[AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>

The application handle associated with this manager.

[Source](../src/tauri/lib.rs.html#540-542)[§](#method.config-1)

#### fn [config](trait.Manager.html_method.config.md)(&self) -> &[Config](struct.Config.html.md "struct tauri::Config")

The [`Config`](struct.Config.html.md "struct tauri::Config") the manager was created with.

[Source](../src/tauri/lib.rs.html#545-547)[§](#method.package_info-1)

#### fn [package\_info](trait.Manager.html_method.package_info.md)(&self) -> &[PackageInfo](struct.PackageInfo.html.md "struct tauri::PackageInfo")

The [`PackageInfo`](struct.PackageInfo.html.md "struct tauri::PackageInfo") the manager was created with.

[Source](../src/tauri/lib.rs.html#552-554)[§](#method.get_window)

#### fn [get\_window](trait.Manager.html_method.get_window.md)(&self, label: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Window](window\struct.Window.html.md "struct tauri::window::Window")<R>>

Available on **crate feature `unstable`** only.

Fetch a single window from the manager.

[Source](../src/tauri/lib.rs.html#559-561)[§](#method.get_focused_window)

#### fn [get\_focused\_window](trait.Manager.html_method.get_focused_window.md)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Window](window\struct.Window.html.md "struct tauri::window::Window")<R>>

Available on **crate feature `unstable`** only.

Fetch the focused window. Returns `None` if there is not any focused window.

[Source](../src/tauri/lib.rs.html#566-568)[§](#method.windows)

#### fn [windows](trait.Manager.html_method.windows.md)(&self) -> [HashMap](https://doc.rust-lang.org/nightly/std/collections/hash/map/struct.HashMap.html "struct std::collections::hash::map::HashMap")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"), [Window](window\struct.Window.html.md "struct tauri::window::Window")<R>>

Available on **crate feature `unstable`** only.

Fetch all managed windows.

[Source](../src/tauri/lib.rs.html#573-575)[§](#method.get_webview)

#### fn [get\_webview](trait.Manager.html_method.get_webview.md)(&self, label: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Webview](webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>>

Available on **crate feature `unstable`** only.

Fetch a single webview from the manager.

[Source](../src/tauri/lib.rs.html#580-582)[§](#method.webviews)

#### fn [webviews](trait.Manager.html_method.webviews.md)(&self) -> [HashMap](https://doc.rust-lang.org/nightly/std/collections/hash/map/struct.HashMap.html "struct std::collections::hash::map::HashMap")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"), [Webview](webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>>

Available on **crate feature `unstable`** only.

Fetch all managed webviews.

[Source](../src/tauri/lib.rs.html#585-597)[§](#method.get_webview_window)

#### fn [get\_webview\_window](trait.Manager.html_method.get_webview_window.md)(&self, label: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[WebviewWindow](webview\struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>>

Fetch a single webview window from the manager.

[Source](../src/tauri/lib.rs.html#600-620)[§](#method.webview_windows)

#### fn [webview\_windows](trait.Manager.html_method.webview_windows.md)(&self) -> [HashMap](https://doc.rust-lang.org/nightly/std/collections/hash/map/struct.HashMap.html "struct std::collections::hash::map::HashMap")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"), [WebviewWindow](webview\struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>>

Fetch all managed webview windows.

[Source](../src/tauri/lib.rs.html#706-711)[§](#method.manage)

#### fn [manage](trait.Manager.html_method.manage.md)<T>(&self, state: T) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static,

Add `state` to the state managed by the application. [Read more](trait.Manager.html_method.manage.md)

[Source](../src/tauri/lib.rs.html#733-739)[§](#method.unmanage)

#### fn [unmanage](trait.Manager.html_method.unmanage.md)<T>(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<T> where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static,

👎Deprecated since 2.3.0: This method is unsafe, since it can cause dangling references.

Removes the state managed by the application for T. Returns the state if it was actually removed. [Read more](trait.Manager.html_method.unmanage.md)

[Source](../src/tauri/lib.rs.html#747-756)[§](#method.state)

#### fn [state](trait.Manager.html_method.state.md)<T>(&self) -> [State](struct.State.html.md "struct tauri::State")<'\_, T> [ⓘ](#) where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static,

Retrieves the managed state for the type `T`. [Read more](trait.Manager.html_method.state.md)

[Source](../src/tauri/lib.rs.html#761-766)[§](#method.try_state)

#### fn [try\_state](trait.Manager.html_method.try_state.md)<T>(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[State](struct.State.html.md "struct tauri::State")<'\_, T>> where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static,

Attempts to retrieve the managed state for the type `T`. [Read more](trait.Manager.html_method.try_state.md)

[Source](../src/tauri/lib.rs.html#772-774)[§](#method.env)

#### fn [env](trait.Manager.html_method.env.md)(&self) -> [Env](struct.Env.html.md "struct tauri::Env")

Gets the managed [`Env`](struct.Env.html.md "struct tauri::Env").

[Source](../src/tauri/lib.rs.html#778-780)[§](#method.asset_protocol_scope)

#### fn [asset\_protocol\_scope](trait.Manager.html_method.asset_protocol_scope.md)(&self) -> [Scope](scope\fs\struct.Scope.html.md "struct tauri::scope::fs::Scope")

Gets the scope for the asset protocol.

[Source](../src/tauri/lib.rs.html#783-785)[§](#method.path)

#### fn [path](trait.Manager.html_method.path.md)(&self) -> &[PathResolver](path\struct.PathResolver.html.md "struct tauri::path::PathResolver")<R>

The path resolver.

[Source](../src/tauri/lib.rs.html#829-836)[§](#method.add_capability)

#### fn [add\_capability](trait.Manager.html_method.add_capability.md)(&self, capability: impl [RuntimeCapability](ipc\trait.RuntimeCapability.html.md "trait tauri::ipc::RuntimeCapability")) -> [Result](type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Adds a capability to the app. [Read more](trait.Manager.html_method.add_capability.md)

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-AppHandle%3CR%3E)

### impl<R> [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R> where <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[Handle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.Handle "type tauri_runtime::Runtime::Handle"): [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze"),

[§](#impl-RefUnwindSafe-for-AppHandle%3CR%3E)

### impl<R = [Wry](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.Wry.html "struct tauri_runtime_wry::Wry")<[EventLoopMessage](enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>> ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>

[§](#impl-Send-for-AppHandle%3CR%3E)

### impl<R> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>

[§](#impl-Sync-for-AppHandle%3CR%3E)

### impl<R> [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>

[§](#impl-Unpin-for-AppHandle%3CR%3E)

### impl<R> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R> where <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[Handle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.Handle "type tauri_runtime::Runtime::Handle"): [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin"),

[§](#impl-UnwindSafe-for-AppHandle%3CR%3E)

### impl<R = [Wry](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.Wry.html "struct tauri_runtime_wry::Wry")<[EventLoopMessage](enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>> ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>

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

[Source](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/src/raw_window_handle/lib.rs.html#232)[§](#impl-HasRawDisplayHandle-for-T)

### impl<T> [HasRawDisplayHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/trait.HasRawDisplayHandle.html "trait raw_window_handle::HasRawDisplayHandle") for T where T: [HasDisplayHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/trait.HasDisplayHandle.html "trait raw_window_handle::borrowed::HasDisplayHandle") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/src/raw_window_handle/lib.rs.html#233)[§](#method.raw_display_handle)

#### fn [raw\_display\_handle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/trait.HasRawDisplayHandle.html#tymethod.raw_display_handle)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[RawDisplayHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/enum.RawDisplayHandle.html "enum raw_window_handle::RawDisplayHandle"), [HandleError](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/enum.HandleError.html "enum raw_window_handle::HandleError")>

👎Deprecated: Use `HasDisplayHandle` instead

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

{"State<'\_, T>":"<h3>Notable traits for <code><a class=\"struct\" href=\"struct.State.html\" title=\"struct tauri::State\">State</a>&lt;'r, T&gt;</code></h3><pre><code><div class=\"where\">impl&lt;T&gt; <a class=\"trait\" href=\"https://docs.rs/time/0.3.41/x86\_64-unknown-linux-gnu/time/formatting/formattable/trait.Formattable.html\" title=\"trait time::formatting::formattable::Formattable\">Formattable</a> for T<div class=\"where\">where\n T: <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html\" title=\"trait core::ops::deref::Deref\">Deref</a>,\n &lt;T as <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html\" title=\"trait core::ops::deref::Deref\">Deref</a>&gt;::<a class=\"associatedtype\" href=\"https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html#associatedtype.Target\" title=\"type core::ops::deref::Deref::Target\">Target</a>: <a class=\"trait\" href=\"https://docs.rs/time/0.3.41/x86\_64-unknown-linux-gnu/time/formatting/formattable/trait.Formattable.html\" title=\"trait time::formatting::formattable::Formattable\">Formattable</a>,</div></div><div class=\"where\">impl&lt;T&gt; <a class=\"trait\" href=\"https://docs.rs/time/0.3.41/x86\_64-unknown-linux-gnu/time/parsing/parsable/trait.Parsable.html\" title=\"trait time::parsing::parsable::Parsable\">Parsable</a> for T<div class=\"where\">where\n T: <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html\" title=\"trait core::ops::deref::Deref\">Deref</a>,\n &lt;T as <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html\" title=\"trait core::ops::deref::Deref\">Deref</a>&gt;::<a class=\"associatedtype\" href=\"https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html#associatedtype.Target\" title=\"type core::ops::deref::Deref::Target\">Target</a>: <a class=\"trait\" href=\"https://docs.rs/time/0.3.41/x86\_64-unknown-linux-gnu/time/parsing/parsable/trait.Parsable.html\" title=\"trait time::parsing::parsable::Parsable\">Parsable</a>,</div></div>"}