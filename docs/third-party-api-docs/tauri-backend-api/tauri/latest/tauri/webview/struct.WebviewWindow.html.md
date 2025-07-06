# Struct WebviewWindowCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/webview/webview_window.rs.html#1023-1026)

```
pub struct WebviewWindow<R: Runtime = Wry> { /* private fields */ }
```

Expand description

A type that wraps a [`Window`](..\window\struct.Window.html.md "struct tauri::window::Window") together with a [`Webview`](struct.Webview.html.md "struct tauri::webview::Webview").

## Implementations[§](#implementations)

[Source](../../src/tauri/webview/webview_window.rs.html#1086-1158)[§](#impl-WebviewWindow%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

Base webview window functions.

[Source](../../src/tauri/webview/webview_window.rs.html#1090-1096)

#### pub fn [builder](#method.builder)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>, L: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>>( manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), label: L, url: [WebviewUrl](..\enum.WebviewUrl.html.md "enum tauri::WebviewUrl"), ) -> [WebviewWindowBuilder](struct.WebviewWindowBuilder.html.md "struct tauri::webview::WebviewWindowBuilder")<'\_, R, M>

Initializes a [`WebviewWindowBuilder`](struct.WebviewWindowBuilder.html.md "struct tauri::webview::WebviewWindowBuilder") with the given window label and webview URL.

Data URLs are only supported with the `webview-data-url` feature flag.

[Source](../../src/tauri/webview/webview_window.rs.html#1099-1101)

#### pub fn [run\_on\_main\_thread](#method.run_on_main_thread)<F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")() + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>( &self, f: F, ) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Runs the given closure on the main thread.

[Source](../../src/tauri/webview/webview_window.rs.html#1104-1106)

#### pub fn [label](#method.label)(&self) -> &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

The webview label.

[Source](../../src/tauri/webview/webview_window.rs.html#1109-1111)

#### pub fn [on\_window\_event](#method.on_window_event)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[WindowEvent](..\enum.WindowEvent.html.md "enum tauri::WindowEvent")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>(&self, f: F)

Registers a window event listener.

[Source](../../src/tauri/webview/webview_window.rs.html#1151-1157)

#### pub fn [resolve\_command\_scope](#method.resolve_command_scope)<T: [ScopeObject](..\ipc\trait.ScopeObject.html.md "trait tauri::ipc::ScopeObject")>( &self, plugin: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), command: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), ) -> [Result](..\type.Result.html.md "type tauri::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[ResolvedScope](struct.ResolvedScope.html.md "struct tauri::webview::ResolvedScope")<T>>>

Resolves the given command scope for this webview on the currently loaded URL.

If the command is not allowed, returns None.

If the scope cannot be deserialized to the given type, an error is returned.

In a command context this can be directly resolved from the command arguments via [crate::ipc::CommandScope](..\ipc\struct.CommandScope.html.md "struct tauri::ipc::CommandScope"):

```
use tauri::ipc::CommandScope;

#[derive(Debug, serde::Deserialize)]
struct ScopeType {
  some_value: String,
}
#[tauri::command]
fn my_command(scope: CommandScope<ScopeType>) {
  // check scope
}
```

##### [§](#examples)Examples

```
use tauri::Manager;

#[derive(Debug, serde::Deserialize)]
struct ScopeType {
  some_value: String,
}

tauri::Builder::default()
  .setup(|app| {
    let webview = app.get_webview_window("main").unwrap();
    let scope = webview.resolve_command_scope::<ScopeType>("my-plugin", "read");
    Ok(())
  });
```

[Source](../../src/tauri/webview/webview_window.rs.html#1162-1263)[§](#impl-WebviewWindow%3CR%3E-1)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

Menu APIs

[Source](../../src/tauri/webview/webview_window.rs.html#1200-1205)

#### pub fn [on\_menu\_event](#method.on_menu_event)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[Window](..\window\struct.Window.html.md "struct tauri::window::Window")<R>, [MenuEvent](..\menu\struct.MenuEvent.html.md "struct tauri::menu::MenuEvent")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( &self, f: F, )

Registers a global menu event listener.

Note that this handler is called for any menu event,
whether it is coming from this window, another window or from the tray icon menu.

Also note that this handler will not be called if
the window used to register it was closed.

##### [§](#examples-1)Examples

```
use tauri::menu::{Menu, Submenu, MenuItem};
use tauri::{WebviewWindowBuilder, WebviewUrl};

tauri::Builder::default()
  .setup(|app| {
    let handle = app.handle();
    let save_menu_item = MenuItem::new(handle, "Save", true, None::<&str>)?;
    let menu = Menu::with_items(handle, &[
      &Submenu::with_items(handle, "File", true, &[
        &save_menu_item,
      ])?,
    ])?;
    let webview_window = WebviewWindowBuilder::new(app, "editor", WebviewUrl::default())
      .menu(menu)
      .build()
      .unwrap();

    webview_window.on_menu_event(move |window, event| {
      if event.id == save_menu_item.id() {
          // save menu item
      }
    });

    Ok(())
  });
```

[Source](../../src/tauri/webview/webview_window.rs.html#1208-1210)

#### pub fn [menu](#method.menu)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Menu](..\menu\struct.Menu.html.md "struct tauri::menu::Menu")<R>>

Returns this window menu.

[Source](../../src/tauri/webview/webview_window.rs.html#1219-1221)

#### pub fn [set\_menu](#method.set_menu)(&self, menu: [Menu](..\menu\struct.Menu.html.md "struct tauri::menu::Menu")<R>) -> [Result](..\type.Result.html.md "type tauri::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Menu](..\menu\struct.Menu.html.md "struct tauri::menu::Menu")<R>>>

Sets the window menu and returns the previous one.

###### [§](#platform-specific)Platform-specific:

* **macOS:** Unsupported. The menu on macOS is app-wide and not specific to one
  window, if you need to set it, use [`AppHandle::set_menu`](..\struct.AppHandle.html_method.set_menu.md "method tauri::AppHandle::set_menu") instead.

[Source](../../src/tauri/webview/webview_window.rs.html#1229-1231)

#### pub fn [remove\_menu](#method.remove_menu)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Menu](..\menu\struct.Menu.html.md "struct tauri::menu::Menu")<R>>>

Removes the window menu and returns it.

###### [§](#platform-specific-1)Platform-specific:

* **macOS:** Unsupported. The menu on macOS is app-wide and not specific to one
  window, if you need to remove it, use [`AppHandle::remove_menu`](..\struct.AppHandle.html_method.remove_menu.md "method tauri::AppHandle::remove_menu") instead.

[Source](../../src/tauri/webview/webview_window.rs.html#1234-1236)

#### pub fn [hide\_menu](#method.hide_menu)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Hides the window menu.

[Source](../../src/tauri/webview/webview_window.rs.html#1239-1241)

#### pub fn [show\_menu](#method.show_menu)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Shows the window menu.

[Source](../../src/tauri/webview/webview_window.rs.html#1244-1246)

#### pub fn [is\_menu\_visible](#method.is_menu_visible)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Shows the window menu.

[Source](../../src/tauri/webview/webview_window.rs.html#1249-1251)

#### pub fn [popup\_menu](#method.popup_menu)<M: [ContextMenu](..\menu\trait.ContextMenu.html.md "trait tauri::menu::ContextMenu")>(&self, menu: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Shows the specified menu as a context menu at the cursor position.

[Source](../../src/tauri/webview/webview_window.rs.html#1256-1262)

#### pub fn [popup\_menu\_at](#method.popup_menu_at)<M: [ContextMenu](..\menu\trait.ContextMenu.html.md "trait tauri::menu::ContextMenu"), P: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Position](..\enum.Position.html.md "enum tauri::Position")>>( &self, menu: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), position: P, ) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Shows the specified menu as a context menu at the specified position.

The position is relative to the window’s top-left corner.

[Source](../../src/tauri/webview/webview_window.rs.html#1266-1455)[§](#impl-WebviewWindow%3CR%3E-2)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

Window getters.

[Source](../../src/tauri/webview/webview_window.rs.html#1268-1270)

#### pub fn [scale\_factor](#method.scale_factor)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)>

Returns the scale factor that can be used to map logical pixels to physical pixels, and vice versa.

[Source](../../src/tauri/webview/webview_window.rs.html#1273-1275)

#### pub fn [inner\_position](#method.inner_position)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PhysicalPosition](..\struct.PhysicalPosition.html.md "struct tauri::PhysicalPosition")<[i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html)>>

Returns the position of the top-left hand corner of the window’s client area relative to the top-left hand corner of the desktop.

[Source](../../src/tauri/webview/webview_window.rs.html#1278-1280)

#### pub fn [outer\_position](#method.outer_position)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PhysicalPosition](..\struct.PhysicalPosition.html.md "struct tauri::PhysicalPosition")<[i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html)>>

Returns the position of the top-left hand corner of the window relative to the top-left hand corner of the desktop.

[Source](../../src/tauri/webview/webview_window.rs.html#1285-1287)

#### pub fn [inner\_size](#method.inner_size)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PhysicalSize](..\struct.PhysicalSize.html.md "struct tauri::PhysicalSize")<[u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html)>>

Returns the physical size of the window’s client area.

The client area is the content of the window, excluding the title bar and borders.

[Source](../../src/tauri/webview/webview_window.rs.html#1292-1294)

#### pub fn [outer\_size](#method.outer_size)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PhysicalSize](..\struct.PhysicalSize.html.md "struct tauri::PhysicalSize")<[u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html)>>

Returns the physical size of the entire window.

These dimensions include the title bar and borders. If you don’t want that (and you usually don’t), use inner\_size instead.

[Source](../../src/tauri/webview/webview_window.rs.html#1297-1299)

#### pub fn [is\_fullscreen](#method.is_fullscreen)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s current fullscreen state.

[Source](../../src/tauri/webview/webview_window.rs.html#1302-1304)

#### pub fn [is\_minimized](#method.is_minimized)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s current minimized state.

[Source](../../src/tauri/webview/webview_window.rs.html#1307-1309)

#### pub fn [is\_maximized](#method.is_maximized)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s current maximized state.

[Source](../../src/tauri/webview/webview_window.rs.html#1312-1314)

#### pub fn [is\_focused](#method.is_focused)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s current focus state.

[Source](../../src/tauri/webview/webview_window.rs.html#1317-1319)

#### pub fn [is\_decorated](#method.is_decorated)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s current decoration state.

[Source](../../src/tauri/webview/webview_window.rs.html#1322-1324)

#### pub fn [is\_resizable](#method.is_resizable)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s current resizable state.

[Source](../../src/tauri/webview/webview_window.rs.html#1327-1329)

#### pub fn [is\_enabled](#method.is_enabled)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Whether the window is enabled or disabled.

[Source](../../src/tauri/webview/webview_window.rs.html#1336-1338)

#### pub fn [is\_always\_on\_top](#method.is_always_on_top)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Determines if this window should always be on top of other windows.

###### [§](#platform-specific-2)Platform-specific

* **iOS / Android:** Unsupported.

[Source](../../src/tauri/webview/webview_window.rs.html#1345-1347)

#### pub fn [is\_maximizable](#method.is_maximizable)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s native maximize button state

###### [§](#platform-specific-3)Platform-specific

* **Linux / iOS / Android:** Unsupported.

[Source](../../src/tauri/webview/webview_window.rs.html#1354-1356)

#### pub fn [is\_minimizable](#method.is_minimizable)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s native minimize button state

###### [§](#platform-specific-4)Platform-specific

* **Linux / iOS / Android:** Unsupported.

[Source](../../src/tauri/webview/webview_window.rs.html#1363-1365)

#### pub fn [is\_closable](#method.is_closable)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s native close button state

###### [§](#platform-specific-5)Platform-specific

* **Linux / iOS / Android:** Unsupported.

[Source](../../src/tauri/webview/webview_window.rs.html#1368-1370)

#### pub fn [is\_visible](#method.is_visible)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s current visibility state.

[Source](../../src/tauri/webview/webview_window.rs.html#1373-1375)

#### pub fn [title](#method.title)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>

Gets the window’s current title.

[Source](../../src/tauri/webview/webview_window.rs.html#1380-1382)

#### pub fn [current\_monitor](#method.current_monitor)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Monitor](..\window\struct.Monitor.html.md "struct tauri::window::Monitor")>>

Returns the monitor on which the window currently resides.

Returns None if current monitor can’t be detected.

[Source](../../src/tauri/webview/webview_window.rs.html#1387-1389)

#### pub fn [primary\_monitor](#method.primary_monitor)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Monitor](..\window\struct.Monitor.html.md "struct tauri::window::Monitor")>>

Returns the primary monitor of the system.

Returns None if it can’t identify any monitor as a primary one.

[Source](../../src/tauri/webview/webview_window.rs.html#1392-1394)

#### pub fn [monitor\_from\_point](#method.monitor_from_point)(&self, x: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), y: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Monitor](..\window\struct.Monitor.html.md "struct tauri::window::Monitor")>>

Returns the monitor that contains the given point.

[Source](../../src/tauri/webview/webview_window.rs.html#1397-1399)

#### pub fn [available\_monitors](#method.available_monitors)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[Monitor](..\window\struct.Monitor.html.md "struct tauri::window::Monitor")>>

Returns the list of all the monitors available on the system.

[Source](../../src/tauri/webview/webview_window.rs.html#1429-1431)

#### pub fn [gtk\_window](#method.gtk_window)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[ApplicationWindow](https://docs.rs/gtk/0.18.2/x86_64-unknown-linux-gnu/gtk/auto/application_window/struct.ApplicationWindow.html "struct gtk::auto::application_window::ApplicationWindow")>

Returns the `ApplicationWindow` from gtk crate that is used by this window.

Note that this type can only be used on the main thread.

[Source](../../src/tauri/webview/webview_window.rs.html#1443-1445)

#### pub fn [default\_vbox](#method.default_vbox)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[Box](https://docs.rs/gtk/0.18.2/x86_64-unknown-linux-gnu/gtk/auto/box_/struct.Box.html "struct gtk::auto::box_::Box")>

Returns the vertical [`gtk::Box`](https://docs.rs/gtk/0.18.2/x86_64-unknown-linux-gnu/gtk/auto/box_/struct.Box.html "struct gtk::auto::box_::Box") that is added by default as the sole child of this window.

Note that this type can only be used on the main thread.

[Source](../../src/tauri/webview/webview_window.rs.html#1452-1454)

#### pub fn [theme](#method.theme)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[Theme](..\enum.Theme.html.md "enum tauri::Theme")>

Returns the current window theme.

###### [§](#platform-specific-6)Platform-specific

* **macOS**: Only supported on macOS 10.14+.

[Source](../../src/tauri/webview/webview_window.rs.html#1459-1471)[§](#impl-WebviewWindow%3CR%3E-3)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

Desktop window getters.

[Source](../../src/tauri/webview/webview_window.rs.html#1468-1470)

#### pub fn [cursor\_position](#method.cursor_position)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PhysicalPosition](..\struct.PhysicalPosition.html.md "struct tauri::PhysicalPosition")<[f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)>>

Get the cursor position relative to the top-left hand corner of the desktop.

Note that the top-left hand corner of the desktop is not necessarily the same as the screen.
If the user uses a desktop with multiple monitors,
the top-left hand corner of the desktop is the top-left hand corner of the main monitor on Windows and macOS
or the top-left of the leftmost monitor on X11.

The coordinates can be negative if the top-left hand corner of the window is outside of the visible screen region.

[Source](../../src/tauri/webview/webview_window.rs.html#1475-1828)[§](#impl-WebviewWindow%3CR%3E-4)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

Desktop window setters and actions.

[Source](../../src/tauri/webview/webview_window.rs.html#1477-1479)

#### pub fn [center](#method.center)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Centers the window.

[Source](../../src/tauri/webview/webview_window.rs.html#1492-1497)

#### pub fn [request\_user\_attention](#method.request_user_attention)( &self, request\_type: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[UserAttentionType](..\enum.UserAttentionType.html.md "enum tauri::UserAttentionType")>, ) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Requests user attention to the window, this has no effect if the application
is already focused. How requesting for user attention manifests is platform dependent,
see `UserAttentionType` for details.

Providing `None` will unset the request for user attention. Unsetting the request for
user attention might not be done automatically by the WM when the window receives input.

###### [§](#platform-specific-7)Platform-specific

* **macOS:** `None` has no effect.
* **Linux:** Urgency levels have the same effect.

[Source](../../src/tauri/webview/webview_window.rs.html#1501-1503)

#### pub fn [set\_resizable](#method.set_resizable)(&self, resizable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Determines if this window should be resizable.
When resizable is set to false, native window’s maximize button is automatically disabled.

[Source](../../src/tauri/webview/webview_window.rs.html#1506-1508)

#### pub fn [set\_enabled](#method.set_enabled)(&self, enabled: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Enable or disable the window.

[Source](../../src/tauri/webview/webview_window.rs.html#1517-1519)

#### pub fn [set\_maximizable](#method.set_maximizable)(&self, maximizable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Determines if this window’s native maximize button should be enabled.
If resizable is set to false, this setting is ignored.

###### [§](#platform-specific-8)Platform-specific

* **macOS:** Disables the “zoom” button in the window titlebar, which is also used to enter fullscreen mode.
* **Linux / iOS / Android:** Unsupported.

[Source](../../src/tauri/webview/webview_window.rs.html#1526-1528)

#### pub fn [set\_minimizable](#method.set_minimizable)(&self, minimizable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Determines if this window’s native minimize button should be enabled.

###### [§](#platform-specific-9)Platform-specific

* **Linux / iOS / Android:** Unsupported.

[Source](../../src/tauri/webview/webview_window.rs.html#1537-1539)

#### pub fn [set\_closable](#method.set_closable)(&self, closable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Determines if this window’s native close button should be enabled.

###### [§](#platform-specific-10)Platform-specific

* **Linux:** “GTK+ will do its best to convince the window manager not to show a close button.
  Depending on the system, this function may not have any effect when called on a window that is already visible”
* **iOS / Android:** Unsupported.

[Source](../../src/tauri/webview/webview_window.rs.html#1542-1544)

#### pub fn [set\_title](#method.set_title)(&self, title: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Set this window’s title.

[Source](../../src/tauri/webview/webview_window.rs.html#1547-1549)

#### pub fn [maximize](#method.maximize)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Maximizes this window.

[Source](../../src/tauri/webview/webview_window.rs.html#1552-1554)

#### pub fn [unmaximize](#method.unmaximize)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Un-maximizes this window.

[Source](../../src/tauri/webview/webview_window.rs.html#1557-1559)

#### pub fn [minimize](#method.minimize)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Minimizes this window.

[Source](../../src/tauri/webview/webview_window.rs.html#1562-1564)

#### pub fn [unminimize](#method.unminimize)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Un-minimizes this window.

[Source](../../src/tauri/webview/webview_window.rs.html#1567-1569)

#### pub fn [show](#method.show)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Show this window.

[Source](../../src/tauri/webview/webview_window.rs.html#1572-1574)

#### pub fn [hide](#method.hide)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Hide this window.

[Source](../../src/tauri/webview/webview_window.rs.html#1577-1579)

#### pub fn [close](#method.close)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Closes this window. It emits [`crate::RunEvent::CloseRequested`] first like a user-initiated close request so you can intercept it.

[Source](../../src/tauri/webview/webview_window.rs.html#1582-1584)

#### pub fn [destroy](#method.destroy)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Destroys this window. Similar to [`Self::close`](struct.WebviewWindow.html_method.close.md "method tauri::webview::WebviewWindow::close") but does not emit any events and force close the window instead.

[Source](../../src/tauri/webview/webview_window.rs.html#1589-1591)

#### pub fn [set\_decorations](#method.set_decorations)(&self, decorations: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Determines if this window should be [decorated](https://en.wikipedia.org/wiki/Window_(computing)#Window_decoration).

[Source](../../src/tauri/webview/webview_window.rs.html#1602-1604)

#### pub fn [set\_shadow](#method.set_shadow)(&self, enable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Determines if this window should have shadow.

###### [§](#platform-specific-11)Platform-specific

* **Windows:**
  + `false` has no effect on decorated window, shadow are always ON.
  + `true` will make undecorated window have a 1px white border,
    and on Windows 11, it will have a rounded corners.
* **Linux:** Unsupported.

[Source](../../src/tauri/webview/webview_window.rs.html#1634-1639)

#### pub fn [set\_effects](#method.set_effects)<E: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[WindowEffectsConfig](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowEffectsConfig.html "struct tauri_utils::config::WindowEffectsConfig")>>>( &self, effects: E, ) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets window effects, pass [`None`](https://doc.rust-lang.org/nightly/core/option/enum.Option.html#variant.None "variant core::option::Option::None") to clear any effects applied if possible.

Requires the window to be transparent.

See [`crate::window::EffectsBuilder`](..\window\struct.EffectsBuilder.html.md "struct tauri::window::EffectsBuilder") for a convenient builder for [`crate::utils::config::WindowEffectsConfig`](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowEffectsConfig.html "struct tauri_utils::config::WindowEffectsConfig").

```
use tauri::{Manager, window::{Color, Effect, EffectState, EffectsBuilder}};
tauri::Builder::default()
  .setup(|app| {
    let webview_window = app.get_webview_window("main").unwrap();
    webview_window.set_effects(
      EffectsBuilder::new()
        .effect(Effect::Popover)
        .state(EffectState::Active)
        .radius(5.)
        .color(Color(0, 0, 0, 255))
        .build(),
    )?;
    Ok(())
  });
```

###### [§](#platform-specific-12)Platform-specific:

* **Windows**: If using decorations or shadows, you may want to try this workaround <https://github.com/tauri-apps/tao/issues/72#issuecomment-975607891>
* **Linux**: Unsupported

[Source](../../src/tauri/webview/webview_window.rs.html#1642-1644)

#### pub fn [set\_always\_on\_bottom](#method.set_always_on_bottom)(&self, always\_on\_bottom: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Determines if this window should always be below other windows.

[Source](../../src/tauri/webview/webview_window.rs.html#1647-1649)

#### pub fn [set\_always\_on\_top](#method.set_always_on_top)(&self, always\_on\_top: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Determines if this window should always be on top of other windows.

[Source](../../src/tauri/webview/webview_window.rs.html#1652-1659)

#### pub fn [set\_visible\_on\_all\_workspaces](#method.set_visible_on_all_workspaces)( &self, visible\_on\_all\_workspaces: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html), ) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets whether the window should be visible on all workspaces or virtual desktops.

[Source](../../src/tauri/webview/webview_window.rs.html#1662-1664)

#### pub fn [set\_content\_protected](#method.set_content_protected)(&self, protected: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Prevents the window contents from being captured by other apps.

[Source](../../src/tauri/webview/webview_window.rs.html#1667-1669)

#### pub fn [set\_size](#method.set_size)<S: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Size](..\enum.Size.html.md "enum tauri::Size")>>(&self, size: S) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Resizes this window.

[Source](../../src/tauri/webview/webview_window.rs.html#1672-1674)

#### pub fn [set\_min\_size](#method.set_min_size)<S: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Size](..\enum.Size.html.md "enum tauri::Size")>>(&self, size: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<S>) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets this window’s minimum inner size.

[Source](../../src/tauri/webview/webview_window.rs.html#1677-1679)

#### pub fn [set\_max\_size](#method.set_max_size)<S: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Size](..\enum.Size.html.md "enum tauri::Size")>>(&self, size: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<S>) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets this window’s maximum inner size.

[Source](../../src/tauri/webview/webview_window.rs.html#1682-1687)

#### pub fn [set\_size\_constraints](#method.set_size_constraints)( &self, constriants: [WindowSizeConstraints](..\struct.WindowSizeConstraints.html.md "struct tauri::WindowSizeConstraints"), ) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets this window’s minimum inner width.

[Source](../../src/tauri/webview/webview_window.rs.html#1690-1692)

#### pub fn [set\_position](#method.set_position)<Pos: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Position](..\enum.Position.html.md "enum tauri::Position")>>(&self, position: Pos) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets this window’s position.

[Source](../../src/tauri/webview/webview_window.rs.html#1695-1697)

#### pub fn [set\_fullscreen](#method.set_fullscreen)(&self, fullscreen: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Determines if this window should be fullscreen.

[Source](../../src/tauri/webview/webview_window.rs.html#1700-1702)

#### pub fn [set\_focus](#method.set_focus)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Bring the window to front and focus.

[Source](../../src/tauri/webview/webview_window.rs.html#1705-1707)

#### pub fn [set\_icon](#method.set_icon)(&self, icon: [Image](..\image\struct.Image.html.md "struct tauri::image::Image")<'\_>) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets this window’ icon.

[Source](../../src/tauri/webview/webview_window.rs.html#1719-1722)

#### pub fn [set\_background\_color](#method.set_background_color)(&self, color: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Color](struct.Color.html.md "struct tauri::webview::Color")>) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets the window background color.

###### [§](#platform-specific-13)Platform-specific:

* **iOS / Android:** Unsupported.
* **macOS**: Not implemented for the webview layer..
* **Windows**:
  + alpha channel is ignored for the window layer.
  + On Windows 7, transparency is not supported and the alpha value will be ignored for the webview layer..
  + On Windows 8 and newer: translucent colors are not supported so any alpha value other than `0` will be replaced by `255` for the webview layer.

[Source](../../src/tauri/webview/webview_window.rs.html#1729-1731)

#### pub fn [set\_skip\_taskbar](#method.set_skip_taskbar)(&self, skip: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Whether to hide the window icon from the taskbar or not.

###### [§](#platform-specific-14)Platform-specific

* **macOS:** Unsupported.

[Source](../../src/tauri/webview/webview_window.rs.html#1742-1744)

#### pub fn [set\_cursor\_grab](#method.set_cursor_grab)(&self, grab: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Grabs the cursor, preventing it from leaving the window.

There’s no guarantee that the cursor will be hidden. You should
hide it by yourself if you want so.

###### [§](#platform-specific-15)Platform-specific

* **Linux:** Unsupported.
* **macOS:** This locks the cursor in a fixed location, which looks visually awkward.

[Source](../../src/tauri/webview/webview_window.rs.html#1755-1757)

#### pub fn [set\_cursor\_visible](#method.set_cursor_visible)(&self, visible: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Modifies the cursor’s visibility.

If `false`, this will hide the cursor. If `true`, this will show the cursor.

###### [§](#platform-specific-16)Platform-specific

* **Windows:** The cursor is only hidden within the confines of the window.
* **macOS:** The cursor is hidden as long as the window has input focus, even if the cursor is
  outside of the window.

[Source](../../src/tauri/webview/webview_window.rs.html#1760-1762)

#### pub fn [set\_cursor\_icon](#method.set_cursor_icon)(&self, icon: [CursorIcon](..\enum.CursorIcon.html.md "enum tauri::CursorIcon")) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Modifies the cursor icon of the window.

[Source](../../src/tauri/webview/webview_window.rs.html#1765-1767)

#### pub fn [set\_cursor\_position](#method.set_cursor_position)<Pos: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Position](..\enum.Position.html.md "enum tauri::Position")>>( &self, position: Pos, ) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Changes the position of the cursor in window coordinates.

[Source](../../src/tauri/webview/webview_window.rs.html#1770-1772)

#### pub fn [set\_ignore\_cursor\_events](#method.set_ignore_cursor_events)(&self, ignore: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Ignores the window cursor events.

[Source](../../src/tauri/webview/webview_window.rs.html#1775-1777)

#### pub fn [start\_dragging](#method.start_dragging)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Starts dragging the window.

[Source](../../src/tauri/webview/webview_window.rs.html#1794-1796)

#### pub fn [set\_badge\_count](#method.set_badge_count)(&self, count: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html)>) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets the taskbar badge count. Using `0` or `None` will remove the badge

###### [§](#platform-specific-17)Platform-specific

* **Windows:** Unsupported, use [`WebviewWindow::set_overlay_icon`] instead.
* **iOS:** iOS expects i32, the value will be clamped to i32::MIN, i32::MAX.
* **Android:** Unsupported.

[Source](../../src/tauri/webview/webview_window.rs.html#1812-1817)

#### pub fn [set\_progress\_bar](#method.set_progress_bar)(&self, progress\_state: [ProgressBarState](..\window\struct.ProgressBarState.html.md "struct tauri::window::ProgressBarState")) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets the taskbar progress state.

###### [§](#platform-specific-18)Platform-specific

* **Linux / macOS**: Progress bar is app-wide and not specific to this window.
* **Linux**: Only supported desktop environments with `libunity` (e.g. GNOME).
* **iOS / Android:** Unsupported.

[Source](../../src/tauri/webview/webview_window.rs.html#1820-1822)

#### pub fn [set\_title\_bar\_style](#method.set_title_bar_style)(&self, style: [TitleBarStyle](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/enum.TitleBarStyle.html "enum tauri_utils::TitleBarStyle")) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets the title bar style. **macOS only**.

[Source](../../src/tauri/webview/webview_window.rs.html#1825-1827)

#### pub fn [set\_theme](#method.set_theme)(&self, theme: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Theme](..\enum.Theme.html.md "enum tauri::Theme")>) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Set the window theme.

[Source](../../src/tauri/webview/webview_window.rs.html#1832-1839)[§](#impl-WebviewWindow%3CR%3E-5)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

Desktop webview setters and actions.

[Source](../../src/tauri/webview/webview_window.rs.html#1836-1838)

#### pub fn [print](#method.print)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Opens the dialog to prints the contents of the webview.
Currently only supported on macOS on `wry`.
`window.print()` works on all platforms.

[Source](../../src/tauri/webview/webview_window.rs.html#1842-2087)[§](#impl-WebviewWindow%3CR%3E-6)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

Webview APIs.

[Source](../../src/tauri/webview/webview_window.rs.html#1901-1906)

#### pub fn [with\_webview](#method.with_webview)<F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")([PlatformWebview](struct.PlatformWebview.html.md "struct tauri::webview::PlatformWebview")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>( &self, f: F, ) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Executes a closure, providing it with the webview handle that is specific to the current platform.

The closure is executed on the main thread.

Note that `webview2-com`, `webkit2gtk`, `objc2_web_kit` and similar crates may be updated in minor releases of Tauri.
Therefore it’s recommended to pin Tauri to at least a minor version when you’re using `with_webview`.

##### [§](#examples-2)Examples

```
use tauri::Manager;

fn main() {
  tauri::Builder::default()
    .setup(|app| {
      let main_webview = app.get_webview_window("main").unwrap();
      main_webview.with_webview(|webview| {
        #[cfg(target_os = "linux")]
        {
          // see <https://docs.rs/webkit2gtk/2.0.0/webkit2gtk/struct.WebView.html>
          // and <https://docs.rs/webkit2gtk/2.0.0/webkit2gtk/trait.WebViewExt.html>
          use webkit2gtk::WebViewExt;
          webview.inner().set_zoom_level(4.);
        }

        #[cfg(windows)]
        unsafe {
          // see <https://docs.rs/webview2-com/0.19.1/webview2_com/Microsoft/Web/WebView2/Win32/struct.ICoreWebView2Controller.html>
          webview.controller().SetZoomFactor(4.).unwrap();
        }

        #[cfg(target_os = "macos")]
        unsafe {
          let view: &objc2_web_kit::WKWebView = &*webview.inner().cast();
          let controller: &objc2_web_kit::WKUserContentController = &*webview.controller().cast();
          let window: &objc2_app_kit::NSWindow = &*webview.ns_window().cast();

          view.setPageZoom(4.);
          controller.removeAllUserScripts();
          let bg_color = objc2_app_kit::NSColor::colorWithDeviceRed_green_blue_alpha(0.5, 0.2, 0.4, 1.);
          window.setBackgroundColor(Some(&bg_color));
        }

        #[cfg(target_os = "android")]
        {
          use jni::objects::JValue;
          webview.jni_handle().exec(|env, _, webview| {
            env.call_method(webview, "zoomBy", "(F)V", &[JValue::Float(4.)]).unwrap();
          })
        }
      });
      Ok(())
  });
}
```

[Source](../../src/tauri/webview/webview_window.rs.html#1909-1911)

#### pub fn [url](#method.url)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[Url](..\struct.Url.html.md "struct tauri::Url")>

Returns the current url of the webview.

[Source](../../src/tauri/webview/webview_window.rs.html#1914-1916)

#### pub fn [navigate](#method.navigate)(&self, url: [Url](..\struct.Url.html.md "struct tauri::Url")) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Navigates the webview to the defined url.

[Source](../../src/tauri/webview/webview_window.rs.html#1919-1921)

#### pub fn [reload](#method.reload)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Reloads the current page.

[Source](../../src/tauri/webview/webview_window.rs.html#1924-1930)

#### pub fn [on\_message](#method.on_message)( self, request: [InvokeRequest](struct.InvokeRequest.html.md "struct tauri::webview::InvokeRequest"), responder: [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<[OwnedInvokeResponder](..\ipc\type.OwnedInvokeResponder.html.md "type tauri::ipc::OwnedInvokeResponder")<R>>, )

Handles this window receiving an [`crate::webview::InvokeRequest`](struct.InvokeRequest.html.md "struct tauri::webview::InvokeRequest").

[Source](../../src/tauri/webview/webview_window.rs.html#1933-1935)

#### pub fn [eval](#method.eval)(&self, js: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Evaluates JavaScript on this window.

[Source](../../src/tauri/webview/webview_window.rs.html#1958-1960)

#### pub fn [open\_devtools](#method.open_devtools)(&self)

Available on **debug-assertions enabled or crate feature `devtools`** only.

Opens the developer tools window (Web Inspector).
The devtools is only enabled on debug builds or with the `devtools` feature flag.

###### [§](#platform-specific-19)Platform-specific

* **macOS:** Only supported on macOS 10.15+.
  This is a private API on macOS, so you cannot use this if your application will be published on the App Store.

##### [§](#examples-3)Examples

```
use tauri::Manager;
tauri::Builder::default()
  .setup(|app| {
    #[cfg(debug_assertions)]
    app.get_webview_window("main").unwrap().open_devtools();
    Ok(())
  });
```

[Source](../../src/tauri/webview/webview_window.rs.html#1991-1993)

#### pub fn [close\_devtools](#method.close_devtools)(&self)

Available on **debug-assertions enabled or crate feature `devtools`** only.

Closes the developer tools window (Web Inspector).
The devtools is only enabled on debug builds or with the `devtools` feature flag.

###### [§](#platform-specific-20)Platform-specific

* **macOS:** Only supported on macOS 10.15+.
  This is a private API on macOS, so you cannot use this if your application will be published on the App Store.
* **Windows:** Unsupported.

##### [§](#examples-4)Examples

```
use tauri::Manager;
tauri::Builder::default()
  .setup(|app| {
    #[cfg(debug_assertions)]
    {
      let webview = app.get_webview_window("main").unwrap();
      webview.open_devtools();
      std::thread::spawn(move || {
        std::thread::sleep(std::time::Duration::from_secs(10));
        webview.close_devtools();
      });
    }
    Ok(())
  });
```

[Source](../../src/tauri/webview/webview_window.rs.html#2022-2024)

#### pub fn [is\_devtools\_open](#method.is_devtools_open)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Available on **debug-assertions enabled or crate feature `devtools`** only.

Checks if the developer tools window (Web Inspector) is opened.
The devtools is only enabled on debug builds or with the `devtools` feature flag.

###### [§](#platform-specific-21)Platform-specific

* **macOS:** Only supported on macOS 10.15+.
  This is a private API on macOS, so you cannot use this if your application will be published on the App Store.
* **Windows:** Unsupported.

##### [§](#examples-5)Examples

```
use tauri::Manager;
tauri::Builder::default()
  .setup(|app| {
    #[cfg(debug_assertions)]
    {
      let webview = app.get_webview_window("main").unwrap();
      if !webview.is_devtools_open() {
        webview.open_devtools();
      }
    }
    Ok(())
  });
```

[Source](../../src/tauri/webview/webview_window.rs.html#2033-2035)

#### pub fn [set\_zoom](#method.set_zoom)(&self, scale\_factor: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Set the webview zoom level

###### [§](#platform-specific-22)Platform-specific:

* **Android**: Not supported.
* **macOS**: available on macOS 11+ only.
* **iOS**: available on iOS 14+ only.

[Source](../../src/tauri/webview/webview_window.rs.html#2038-2040)

#### pub fn [clear\_all\_browsing\_data](#method.clear_all_browsing_data)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Clear all browsing data for this webview window.

[Source](../../src/tauri/webview/webview_window.rs.html#2059-2061)

#### pub fn [cookies\_for\_url](#method.cookies_for_url)(&self, url: [Url](..\struct.Url.html.md "struct tauri::Url")) -> [Result](..\type.Result.html.md "type tauri::Result")<[Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'static>>>

Returns all cookies in the runtime’s cookie store including HTTP-only and secure cookies.

Note that cookies will only be returned for URLs with an http or https scheme.
Cookies set through javascript for local files
(such as those served from the tauri://) protocol are not currently supported.

##### [§](#stability)Stability

The return value of this function leverages [`tauri_runtime::Cookie`](struct.Cookie.html.md "struct tauri::webview::Cookie") which re-exports the cookie crate.
This dependency might receive updates in minor Tauri releases.

##### [§](#known-issues)Known issues

On Windows, this function deadlocks when used in a synchronous command or event handlers, see [the Webview2 issue](https://github.com/tauri-apps/wry/issues/583).
You should use `async` commands and separate threads when reading cookies.

[Source](../../src/tauri/webview/webview_window.rs.html#2084-2086)

#### pub fn [cookies](#method.cookies)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'static>>>

Returns all cookies in the runtime’s cookie store for all URLs including HTTP-only and secure cookies.

Note that cookies will only be returned for URLs with an http or https scheme.
Cookies set through javascript for local files
(such as those served from the tauri://) protocol are not currently supported.

##### [§](#stability-1)Stability

The return value of this function leverages [`tauri_runtime::Cookie`](struct.Cookie.html.md "struct tauri::webview::Cookie") which re-exports the cookie crate.
This dependency might receive updates in minor Tauri releases.

##### [§](#known-issues-1)Known issues

On Windows, this function deadlocks when used in a synchronous command or event handlers, see [the Webview2 issue](https://github.com/tauri-apps/wry/issues/583).
You should use `async` commands and separate threads when reading cookies.

###### [§](#platform-specific-23)Platform-specific

* **Android**: Unsupported, always returns an empty [`Vec`](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec").

## Trait Implementations[§](#trait-implementations)

[Source](../../src/tauri/webview/webview_window.rs.html#1028-1032)[§](#impl-AsRef%3CWebview%3CR%3E%3E-for-WebviewWindow%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>> for [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

[Source](../../src/tauri/webview/webview_window.rs.html#1029-1031)[§](#method.as_ref)

#### fn [as\_ref](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html#tymethod.as_ref)(&self) -> &[Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>

Converts this type into a shared reference of the (usually inferred) input type.

[Source](../../src/tauri/webview/webview_window.rs.html#1034-1041)[§](#impl-Clone-for-WebviewWindow%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

[Source](../../src/tauri/webview/webview_window.rs.html#1035-1040)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> Self

Returns a copy of the value. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#174)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &Self)

Performs copy-assignment from `source`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)

[Source](../../src/tauri/webview/webview_window.rs.html#1069-1083)[§](#impl-CommandArg%3C'de,+R%3E-for-WebviewWindow%3CR%3E)

### impl<'de, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [CommandArg](..\ipc\trait.CommandArg.html.md "trait tauri::ipc::CommandArg")<'de, R> for [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

[Source](../../src/tauri/webview/webview_window.rs.html#1071-1082)[§](#method.from_command)

#### fn [from\_command](..\ipc\trait.CommandArg.html_tymethod.from_command.md)(command: [CommandItem](..\ipc\struct.CommandItem.html.md "struct tauri::ipc::CommandItem")<'de, R>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Self, [InvokeError](..\ipc\struct.InvokeError.html.md "struct tauri::ipc::InvokeError")>

Grabs the [`Window`](..\window\struct.Window.html.md "struct tauri::window::Window") from the [`CommandItem`](..\ipc\struct.CommandItem.html.md "struct tauri::ipc::CommandItem"). This will never fail.

[Source](../../src/tauri/webview/webview_window.rs.html#1022)[§](#impl-Debug-for-WebviewWindow%3CR%3E)

### impl<R: [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") + [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

[Source](../../src/tauri/webview/webview_window.rs.html#1022)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/fmt/type.Result.html "type core::fmt::Result")

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](../../src/tauri/webview/webview_window.rs.html#2167)[§](#impl-Emitter%3CR%3E-for-WebviewWindow%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Emitter](..\trait.Emitter.html.md "trait tauri::Emitter")<R> for [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

[Source](../../src/tauri/lib.rs.html#962-966)[§](#method.emit)

#### fn [emit](..\trait.Emitter.html_method.emit.md)<S: [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize") + [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone")>(&self, event: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), payload: S) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Emits an event to all [targets](..\enum.EventTarget.html.md "enum tauri::EventTarget"). [Read more](..\trait.Emitter.html_method.emit.md)

[Source](../../src/tauri/lib.rs.html#969-973)[§](#method.emit_str)

#### fn [emit\_str](..\trait.Emitter.html_method.emit_str.md)(&self, event: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), payload: [String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Similar to [`Emitter::emit`](..\trait.Emitter.html_method.emit.md "method tauri::Emitter::emit") but the payload is json serialized.

[Source](../../src/tauri/lib.rs.html#997-1005)[§](#method.emit_to)

#### fn [emit\_to](..\trait.Emitter.html_method.emit_to.md)<I, S>(&self, target: I, event: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), payload: S) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> where I: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[EventTarget](..\enum.EventTarget.html.md "enum tauri::EventTarget")>, S: [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize") + [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone"),

Emits an event to all [targets](..\enum.EventTarget.html.md "enum tauri::EventTarget") matching the given target. [Read more](..\trait.Emitter.html_method.emit_to.md)

[Source](../../src/tauri/lib.rs.html#1008-1015)[§](#method.emit_str_to)

#### fn [emit\_str\_to](..\trait.Emitter.html_method.emit_str_to.md)<I>(&self, target: I, event: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), payload: [String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> where I: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[EventTarget](..\enum.EventTarget.html.md "enum tauri::EventTarget")>,

Similar to [`Emitter::emit_to`](..\trait.Emitter.html_method.emit_to.md "method tauri::Emitter::emit_to") but the payload is json serialized.

[Source](../../src/tauri/lib.rs.html#1035-1043)[§](#method.emit_filter)

#### fn [emit\_filter](..\trait.Emitter.html_method.emit_filter.md)<S, F>(&self, event: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), payload: S, filter: F) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> where S: [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize") + [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone"), F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[EventTarget](..\enum.EventTarget.html.md "enum tauri::EventTarget")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html),

Emits an event to all [targets](..\enum.EventTarget.html.md "enum tauri::EventTarget") based on the given filter. [Read more](..\trait.Emitter.html_method.emit_filter.md)

[Source](../../src/tauri/lib.rs.html#1046-1053)[§](#method.emit_str_filter)

#### fn [emit\_str\_filter](..\trait.Emitter.html_method.emit_str_filter.md)<F>( &self, event: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), payload: [String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"), filter: F, ) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> where F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[EventTarget](..\enum.EventTarget.html.md "enum tauri::EventTarget")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html),

Similar to [`Emitter::emit_filter`](..\trait.Emitter.html_method.emit_filter.md "method tauri::Emitter::emit_filter") but the payload is json serialized.

[Source](../../src/tauri/lib.rs.html#1142-1146)[§](#impl-FunctionArg-for-WebviewWindow%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [FunctionArg](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/function/arg/trait.FunctionArg.html "trait specta::function::arg::FunctionArg") for [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

[Source](../../src/tauri/lib.rs.html#1143-1145)[§](#method.to_datatype)

#### fn [to\_datatype](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/function/arg/trait.FunctionArg.html#tymethod.to_datatype)(\_: &mut TypeMap) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[DataType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/enum.DataType.html "enum specta::datatype::DataType")>

Gets the type of an argument as a [`DataType`](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/enum.DataType.html "enum specta::datatype::DataType"). [Read more](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/function/arg/trait.FunctionArg.html#tymethod.to_datatype)

[Source](../../src/tauri/webview/webview_window.rs.html#1061-1067)[§](#impl-HasDisplayHandle-for-WebviewWindow%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [HasDisplayHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/trait.HasDisplayHandle.html "trait raw_window_handle::borrowed::HasDisplayHandle") for [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

[Source](../../src/tauri/webview/webview_window.rs.html#1062-1066)[§](#method.display_handle)

#### fn [display\_handle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/trait.HasDisplayHandle.html#tymethod.display_handle)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[DisplayHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/struct.DisplayHandle.html "struct raw_window_handle::borrowed::DisplayHandle")<'\_>, [HandleError](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/enum.HandleError.html "enum raw_window_handle::HandleError")>

Get a handle to the display controller of the windowing system.

[Source](../../src/tauri/webview/webview_window.rs.html#1051-1059)[§](#impl-HasWindowHandle-for-WebviewWindow%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [HasWindowHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/trait.HasWindowHandle.html "trait raw_window_handle::borrowed::HasWindowHandle") for [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

[Source](../../src/tauri/webview/webview_window.rs.html#1052-1058)[§](#method.window_handle)

#### fn [window\_handle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/trait.HasWindowHandle.html#tymethod.window_handle)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[WindowHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/struct.WindowHandle.html "struct raw_window_handle::borrowed::WindowHandle")<'\_>, [HandleError](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/enum.HandleError.html "enum raw_window_handle::HandleError")>

Get a handle to the window.

[Source](../../src/tauri/webview/webview_window.rs.html#2089-2165)[§](#impl-Listener%3CR%3E-for-WebviewWindow%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Listener](..\trait.Listener.html.md "trait tauri::Listener")<R> for [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

[Source](../../src/tauri/webview/webview_window.rs.html#2107-2119)[§](#method.listen)

#### fn [listen](..\trait.Listener.html_tymethod.listen.md)<F>(&self, event: impl [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, handler: F) -> [EventId](..\type.EventId.html.md "type tauri::EventId") where F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([Event](..\struct.Event.html.md "struct tauri::Event")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Listen to an event on this webview window.

##### [§](#examples-6)Examples

```
use tauri::{Manager, Listener};

tauri::Builder::default()
  .setup(|app| {
    let webview_window = app.get_webview_window("main").unwrap();
    webview_window.listen("component-loaded", move |event| {
      println!("window just loaded a component");
    });

    Ok(())
  });
```

[Source](../../src/tauri/webview/webview_window.rs.html#2124-2136)[§](#method.once)

#### fn [once](..\trait.Listener.html_tymethod.once.md)<F>(&self, event: impl [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, handler: F) -> [EventId](..\type.EventId.html.md "type tauri::EventId") where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")([Event](..\struct.Event.html.md "struct tauri::Event")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Listen to an event on this window webview only once.

See [`Self::listen`](struct.WebviewWindow.html_method.listen.md "method tauri::webview::WebviewWindow::listen") for more information.

[Source](../../src/tauri/webview/webview_window.rs.html#2162-2164)[§](#method.unlisten)

#### fn [unlisten](..\trait.Listener.html_tymethod.unlisten.md)(&self, id: [EventId](..\type.EventId.html.md "type tauri::EventId"))

Unlisten to an event on this webview window.

##### [§](#examples-7)Examples

```
use tauri::{Manager, Listener};

tauri::Builder::default()
  .setup(|app| {
    let webview_window = app.get_webview_window("main").unwrap();
    let webview_window_ = webview_window.clone();
    let handler = webview_window.listen("component-loaded", move |event| {
      println!("webview_window just loaded a component");

      // we no longer need to listen to the event
      // we also could have used `webview_window.once` instead
      webview_window_.unlisten(event.id());
    });

    // stop listening to the event when you do not need it anymore
    webview_window.unlisten(handler);

    Ok(())
});
```

[Source](../../src/tauri/lib.rs.html#926-932)[§](#method.listen_any)

#### fn [listen\_any](..\trait.Listener.html_method.listen_any.md)<F>(&self, event: impl [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, handler: F) -> [EventId](..\type.EventId.html.md "type tauri::EventId") where F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([Event](..\struct.Event.html.md "struct tauri::Event")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Listen to an emitted event to any [target](..\enum.EventTarget.html.md "enum tauri::EventTarget"). [Read more](..\trait.Listener.html_method.listen_any.md)

[Source](../../src/tauri/lib.rs.html#939-945)[§](#method.once_any)

#### fn [once\_any](..\trait.Listener.html_method.once_any.md)<F>(&self, event: impl [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, handler: F) -> [EventId](..\type.EventId.html.md "type tauri::EventId") where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")([Event](..\struct.Event.html.md "struct tauri::Event")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Listens once to an emitted event to any [target](..\enum.EventTarget.html.md "enum tauri::EventTarget") . [Read more](..\trait.Listener.html_method.once_any.md)

[Source](../../src/tauri/webview/webview_window.rs.html#2169-2177)[§](#impl-Manager%3CR%3E-for-WebviewWindow%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R> for [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

[Source](../../src/tauri/webview/webview_window.rs.html#2170-2176)[§](#method.resources_table)

#### fn [resources\_table](..\trait.Manager.html_tymethod.resources_table.md)(&self) -> [MutexGuard](https://doc.rust-lang.org/nightly/std/sync/poison/mutex/struct.MutexGuard.html "struct std::sync::poison::mutex::MutexGuard")<'\_, [ResourceTable](..\struct.ResourceTable.html.md "struct tauri::ResourceTable")>

Get a reference to the resources table of this manager.

[Source](../../src/tauri/lib.rs.html#535-537)[§](#method.app_handle)

#### fn [app\_handle](..\trait.Manager.html_method.app_handle.md)(&self) -> &[AppHandle](..\struct.AppHandle.html.md "struct tauri::AppHandle")<R>

The application handle associated with this manager.

[Source](../../src/tauri/lib.rs.html#540-542)[§](#method.config)

#### fn [config](..\trait.Manager.html_method.config.md)(&self) -> &[Config](..\struct.Config.html.md "struct tauri::Config")

The [`Config`](..\struct.Config.html.md "struct tauri::Config") the manager was created with.

[Source](../../src/tauri/lib.rs.html#545-547)[§](#method.package_info)

#### fn [package\_info](..\trait.Manager.html_method.package_info.md)(&self) -> &[PackageInfo](..\struct.PackageInfo.html.md "struct tauri::PackageInfo")

The [`PackageInfo`](..\struct.PackageInfo.html.md "struct tauri::PackageInfo") the manager was created with.

[Source](../../src/tauri/lib.rs.html#552-554)[§](#method.get_window)

#### fn [get\_window](..\trait.Manager.html_method.get_window.md)(&self, label: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Window](..\window\struct.Window.html.md "struct tauri::window::Window")<R>>

Available on **crate feature `unstable`** only.

Fetch a single window from the manager.

[Source](../../src/tauri/lib.rs.html#559-561)[§](#method.get_focused_window)

#### fn [get\_focused\_window](..\trait.Manager.html_method.get_focused_window.md)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Window](..\window\struct.Window.html.md "struct tauri::window::Window")<R>>

Available on **crate feature `unstable`** only.

Fetch the focused window. Returns `None` if there is not any focused window.

[Source](../../src/tauri/lib.rs.html#566-568)[§](#method.windows)

#### fn [windows](..\trait.Manager.html_method.windows.md)(&self) -> [HashMap](https://doc.rust-lang.org/nightly/std/collections/hash/map/struct.HashMap.html "struct std::collections::hash::map::HashMap")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"), [Window](..\window\struct.Window.html.md "struct tauri::window::Window")<R>>

Available on **crate feature `unstable`** only.

Fetch all managed windows.

[Source](../../src/tauri/lib.rs.html#573-575)[§](#method.get_webview)

#### fn [get\_webview](..\trait.Manager.html_method.get_webview.md)(&self, label: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>>

Available on **crate feature `unstable`** only.

Fetch a single webview from the manager.

[Source](../../src/tauri/lib.rs.html#580-582)[§](#method.webviews)

#### fn [webviews](..\trait.Manager.html_method.webviews.md)(&self) -> [HashMap](https://doc.rust-lang.org/nightly/std/collections/hash/map/struct.HashMap.html "struct std::collections::hash::map::HashMap")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"), [Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>>

Available on **crate feature `unstable`** only.

Fetch all managed webviews.

[Source](../../src/tauri/lib.rs.html#585-597)[§](#method.get_webview_window)

#### fn [get\_webview\_window](..\trait.Manager.html_method.get_webview_window.md)(&self, label: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>>

Fetch a single webview window from the manager.

[Source](../../src/tauri/lib.rs.html#600-620)[§](#method.webview_windows)

#### fn [webview\_windows](..\trait.Manager.html_method.webview_windows.md)(&self) -> [HashMap](https://doc.rust-lang.org/nightly/std/collections/hash/map/struct.HashMap.html "struct std::collections::hash::map::HashMap")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"), [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>>

Fetch all managed webview windows.

[Source](../../src/tauri/lib.rs.html#706-711)[§](#method.manage)

#### fn [manage](..\trait.Manager.html_method.manage.md)<T>(&self, state: T) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static,

Add `state` to the state managed by the application. [Read more](..\trait.Manager.html_method.manage.md)

[Source](../../src/tauri/lib.rs.html#733-739)[§](#method.unmanage)

#### fn [unmanage](..\trait.Manager.html_method.unmanage.md)<T>(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<T> where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static,

👎Deprecated since 2.3.0: This method is unsafe, since it can cause dangling references.

Removes the state managed by the application for T. Returns the state if it was actually removed. [Read more](..\trait.Manager.html_method.unmanage.md)

[Source](../../src/tauri/lib.rs.html#747-756)[§](#method.state)

#### fn [state](..\trait.Manager.html_method.state.md)<T>(&self) -> [State](..\struct.State.html.md "struct tauri::State")<'\_, T> [ⓘ](#) where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static,

Retrieves the managed state for the type `T`. [Read more](..\trait.Manager.html_method.state.md)

[Source](../../src/tauri/lib.rs.html#761-766)[§](#method.try_state)

#### fn [try\_state](..\trait.Manager.html_method.try_state.md)<T>(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[State](..\struct.State.html.md "struct tauri::State")<'\_, T>> where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static,

Attempts to retrieve the managed state for the type `T`. [Read more](..\trait.Manager.html_method.try_state.md)

[Source](../../src/tauri/lib.rs.html#772-774)[§](#method.env)

#### fn [env](..\trait.Manager.html_method.env.md)(&self) -> [Env](..\struct.Env.html.md "struct tauri::Env")

Gets the managed [`Env`](..\struct.Env.html.md "struct tauri::Env").

[Source](../../src/tauri/lib.rs.html#778-780)[§](#method.asset_protocol_scope)

#### fn [asset\_protocol\_scope](..\trait.Manager.html_method.asset_protocol_scope.md)(&self) -> [Scope](..\scope\fs\struct.Scope.html.md "struct tauri::scope::fs::Scope")

Gets the scope for the asset protocol.

[Source](../../src/tauri/lib.rs.html#783-785)[§](#method.path)

#### fn [path](..\trait.Manager.html_method.path.md)(&self) -> &[PathResolver](..\path\struct.PathResolver.html.md "struct tauri::path::PathResolver")<R>

The path resolver.

[Source](../../src/tauri/lib.rs.html#829-836)[§](#method.add_capability)

#### fn [add\_capability](..\trait.Manager.html_method.add_capability.md)(&self, capability: impl [RuntimeCapability](..\ipc\trait.RuntimeCapability.html.md "trait tauri::ipc::RuntimeCapability")) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Adds a capability to the app. [Read more](..\trait.Manager.html_method.add_capability.md)

[Source](../../src/tauri/webview/webview_window.rs.html#1044-1049)[§](#impl-PartialEq-for-WebviewWindow%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq") for [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

[Source](../../src/tauri/webview/webview_window.rs.html#1046-1048)[§](#method.eq)

#### fn [eq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#tymethod.eq)(&self, other: &Self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Only use the [`Window`](..\window\struct.Window.html.md "struct tauri::window::Window")’s label to compare equality.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#262)[§](#method.ne)

#### fn [ne](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#method.ne)(&self, other: [&Rhs](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `!=`. The default implementation is almost always sufficient,
and should not be overridden without very good reason.

[Source](../../src/tauri/webview/webview_window.rs.html#1043)[§](#impl-Eq-for-WebviewWindow%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Eq](https://doc.rust-lang.org/nightly/core/cmp/trait.Eq.html "trait core::cmp::Eq") for [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-WebviewWindow%3CR%3E)

### impl<R> [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R> where <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WindowDispatcher](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.WindowDispatcher "type tauri_runtime::Runtime::WindowDispatcher"): [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze"), <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[Handle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.Handle "type tauri_runtime::Runtime::Handle"): [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze"), <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WebviewDispatcher](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.WebviewDispatcher "type tauri_runtime::Runtime::WebviewDispatcher"): [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze"),

[§](#impl-RefUnwindSafe-for-WebviewWindow%3CR%3E)

### impl<R = [Wry](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.Wry.html "struct tauri_runtime_wry::Wry")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>> ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

[§](#impl-Send-for-WebviewWindow%3CR%3E)

### impl<R> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

[§](#impl-Sync-for-WebviewWindow%3CR%3E)

### impl<R> [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

[§](#impl-Unpin-for-WebviewWindow%3CR%3E)

### impl<R> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R> where <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WindowDispatcher](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.WindowDispatcher "type tauri_runtime::Runtime::WindowDispatcher"): [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin"), <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[Handle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.Handle "type tauri_runtime::Runtime::Handle"): [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin"), <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WebviewDispatcher](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.WebviewDispatcher "type tauri_runtime::Runtime::WebviewDispatcher"): [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin"),

[§](#impl-UnwindSafe-for-WebviewWindow%3CR%3E)

### impl<R = [Wry](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.Wry.html "struct tauri_runtime_wry::Wry")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>> ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

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

[Source](https://docs.rs/hashbrown/0.15.2/x86_64-unknown-linux-gnu/src/hashbrown/lib.rs.html#159-162)[§](#impl-Equivalent%3CK%3E-for-Q)

### impl<Q, K> [Equivalent](https://docs.rs/hashbrown/0.15.2/x86_64-unknown-linux-gnu/hashbrown/trait.Equivalent.html "trait hashbrown::Equivalent")<K> for Q where Q: [Eq](https://doc.rust-lang.org/nightly/core/cmp/trait.Eq.html "trait core::cmp::Eq") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), K: [Borrow](https://doc.rust-lang.org/nightly/core/borrow/trait.Borrow.html "trait core::borrow::Borrow")<Q> + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/hashbrown/0.15.2/x86_64-unknown-linux-gnu/src/hashbrown/lib.rs.html#164)[§](#method.equivalent)

#### fn [equivalent](https://docs.rs/hashbrown/0.15.2/x86_64-unknown-linux-gnu/hashbrown/trait.Equivalent.html#tymethod.equivalent)(&self, key: [&K](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Checks if this value is equivalent to the given key. [Read more](https://docs.rs/hashbrown/0.15.2/x86_64-unknown-linux-gnu/hashbrown/trait.Equivalent.html#tymethod.equivalent)

[Source](https://docs.rs/equivalent/1.0.2/x86_64-unknown-linux-gnu/src/equivalent/lib.rs.html#82-85)[§](#impl-Equivalent%3CK%3E-for-Q-1)

### impl<Q, K> [Equivalent](https://docs.rs/equivalent/1.0.2/x86_64-unknown-linux-gnu/equivalent/trait.Equivalent.html "trait equivalent::Equivalent")<K> for Q where Q: [Eq](https://doc.rust-lang.org/nightly/core/cmp/trait.Eq.html "trait core::cmp::Eq") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), K: [Borrow](https://doc.rust-lang.org/nightly/core/borrow/trait.Borrow.html "trait core::borrow::Borrow")<Q> + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/equivalent/1.0.2/x86_64-unknown-linux-gnu/src/equivalent/lib.rs.html#88)[§](#method.equivalent-1)

#### fn [equivalent](https://docs.rs/equivalent/1.0.2/x86_64-unknown-linux-gnu/equivalent/trait.Equivalent.html#tymethod.equivalent)(&self, key: [&K](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Compare self to `key` and return `true` if they are equal.

[Source](https://docs.rs/indexmap/2.8.0/x86_64-unknown-linux-gnu/src/indexmap/equivalent.rs.html#18-21)[§](#impl-Equivalent%3CK%3E-for-Q-2)

### impl<Q, K> [Equivalent](https://docs.rs/indexmap/2.8.0/x86_64-unknown-linux-gnu/indexmap/equivalent/trait.Equivalent.html "trait indexmap::equivalent::Equivalent")<K> for Q where Q: [Eq](https://doc.rust-lang.org/nightly/core/cmp/trait.Eq.html "trait core::cmp::Eq") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), K: [Borrow](https://doc.rust-lang.org/nightly/core/borrow/trait.Borrow.html "trait core::borrow::Borrow")<Q> + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/indexmap/2.8.0/x86_64-unknown-linux-gnu/src/indexmap/equivalent.rs.html#24)[§](#method.equivalent-2)

#### fn [equivalent](https://docs.rs/indexmap/2.8.0/x86_64-unknown-linux-gnu/indexmap/equivalent/trait.Equivalent.html#tymethod.equivalent)(&self, key: [&K](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Compare self to `key` and return `true` if they are equal.

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

[Source](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/src/raw_window_handle/lib.rs.html#85)[§](#impl-HasRawWindowHandle-for-T)

### impl<T> [HasRawWindowHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/trait.HasRawWindowHandle.html "trait raw_window_handle::HasRawWindowHandle") for T where T: [HasWindowHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/trait.HasWindowHandle.html "trait raw_window_handle::borrowed::HasWindowHandle") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/src/raw_window_handle/lib.rs.html#86)[§](#method.raw_window_handle)

#### fn [raw\_window\_handle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/trait.HasRawWindowHandle.html#tymethod.raw_window_handle)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[RawWindowHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/enum.RawWindowHandle.html "enum raw_window_handle::RawWindowHandle"), [HandleError](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/enum.HandleError.html "enum raw_window_handle::HandleError")>

👎Deprecated: Use `HasWindowHandle` instead

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

{"State<'\_, T>":"<h3>Notable traits for <code><a class=\"struct\" href=\"../struct.State.html\" title=\"struct tauri::State\">State</a>&lt;'r, T&gt;</code></h3><pre><code><div class=\"where\">impl&lt;T&gt; <a class=\"trait\" href=\"https://docs.rs/time/0.3.41/x86\_64-unknown-linux-gnu/time/formatting/formattable/trait.Formattable.html\" title=\"trait time::formatting::formattable::Formattable\">Formattable</a> for T<div class=\"where\">where\n T: <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html\" title=\"trait core::ops::deref::Deref\">Deref</a>,\n &lt;T as <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html\" title=\"trait core::ops::deref::Deref\">Deref</a>&gt;::<a class=\"associatedtype\" href=\"https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html#associatedtype.Target\" title=\"type core::ops::deref::Deref::Target\">Target</a>: <a class=\"trait\" href=\"https://docs.rs/time/0.3.41/x86\_64-unknown-linux-gnu/time/formatting/formattable/trait.Formattable.html\" title=\"trait time::formatting::formattable::Formattable\">Formattable</a>,</div></div><div class=\"where\">impl&lt;T&gt; <a class=\"trait\" href=\"https://docs.rs/time/0.3.41/x86\_64-unknown-linux-gnu/time/parsing/parsable/trait.Parsable.html\" title=\"trait time::parsing::parsable::Parsable\">Parsable</a> for T<div class=\"where\">where\n T: <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html\" title=\"trait core::ops::deref::Deref\">Deref</a>,\n &lt;T as <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html\" title=\"trait core::ops::deref::Deref\">Deref</a>&gt;::<a class=\"associatedtype\" href=\"https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html#associatedtype.Target\" title=\"type core::ops::deref::Deref::Target\">Target</a>: <a class=\"trait\" href=\"https://docs.rs/time/0.3.41/x86\_64-unknown-linux-gnu/time/parsing/parsable/trait.Parsable.html\" title=\"trait time::parsing::parsable::Parsable\">Parsable</a>,</div></div>"}