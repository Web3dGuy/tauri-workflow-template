# Struct WindowCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/window/mod.rs.html#874-884)

```
pub struct Window<R: Runtime = Wry> { /* private fields */ }
```

Expand description

A window managed by Tauri.

This type also implements [`Manager`](..\trait.Manager.html.md "trait tauri::Manager") which allows you to manage other windows attached to
the same application.

## Implementations[§](#implementations)

[Source](../../src/tauri/window/mod.rs.html#975-1061)[§](#impl-Window%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Window](struct.Window.html.md "struct tauri::window::Window")<R>

Base window functions.

[Source](../../src/tauri/window/mod.rs.html#998-1000)

#### pub fn [builder](#method.builder)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>, L: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>>( manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), label: L, ) -> [WindowBuilder](struct.WindowBuilder.html.md "struct tauri::window::WindowBuilder")<'\_, R, M>

Available on **crate feature `unstable`** only.

Initializes a window builder with the given window label.

Data URLs are only supported with the `webview-data-url` feature flag.

[Source](../../src/tauri/window/mod.rs.html#1005-1022)

#### pub fn [add\_child](#method.add_child)<P: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Position](..\enum.Position.html.md "enum tauri::Position")>, S: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Size](..\enum.Size.html.md "enum tauri::Size")>>( &self, webview\_builder: [WebviewBuilder](..\webview\struct.WebviewBuilder.html.md "struct tauri::webview::WebviewBuilder")<R>, position: P, size: S, ) -> [Result](..\type.Result.html.md "type tauri::Result")<[Webview](..\webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>>

Available on **`desktop` and crate feature `unstable`** only.

Adds a new webview as a child of this window.

[Source](../../src/tauri/window/mod.rs.html#1025-1034)

#### pub fn [webviews](#method.webviews)(&self) -> [Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[Webview](..\webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>>

List of webviews associated with this window.

[Source](../../src/tauri/window/mod.rs.html#1041-1047)

#### pub fn [run\_on\_main\_thread](#method.run_on_main_thread)<F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")() + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>( &self, f: F, ) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Runs the given closure on the main thread.

[Source](../../src/tauri/window/mod.rs.html#1050-1052)

#### pub fn [label](#method.label)(&self) -> &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

The label of this window.

[Source](../../src/tauri/window/mod.rs.html#1055-1060)

#### pub fn [on\_window\_event](#method.on_window_event)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[WindowEvent](..\enum.WindowEvent.html.md "enum tauri::WindowEvent")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>(&self, f: F)

Registers a window event listener.

[Source](../../src/tauri/window/mod.rs.html#1065-1332)[§](#impl-Window%3CR%3E-1)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Window](struct.Window.html.md "struct tauri::window::Window")<R>

Menu APIs

[Source](../../src/tauri/window/mod.rs.html#1105-1116)

#### pub fn [on\_menu\_event](#method.on_menu_event)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[Window](struct.Window.html.md "struct tauri::window::Window")<R>, [MenuEvent](..\menu\struct.MenuEvent.html.md "struct tauri::menu::MenuEvent")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( &self, f: F, )

Registers a global menu event listener.

Note that this handler is called for any menu event,
whether it is coming from this window, another window or from the tray icon menu.

Also note that this handler will not be called if
the window used to register it was closed.

##### [§](#examples)Examples

```
use tauri::menu::{Menu, Submenu, MenuItem};
tauri::Builder::default()
  .setup(|app| {
    let handle = app.handle();
    let save_menu_item = MenuItem::new(handle, "Save", true, None::<&str>)?;
    let menu = Menu::with_items(handle, &[
      &Submenu::with_items(handle, "File", true, &[
        &save_menu_item,
      ])?,
    ])?;
    let window = tauri::window::WindowBuilder::new(app, "editor")
      .menu(menu)
      .build()
      .unwrap();

    window.on_menu_event(move |window, event| {
      if event.id == save_menu_item.id() {
          // save menu item
      }
    });

    Ok(())
  });
```

[Source](../../src/tauri/window/mod.rs.html#1141-1143)

#### pub fn [menu](#method.menu)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Menu](..\menu\struct.Menu.html.md "struct tauri::menu::Menu")<R>>

Returns this window menu .

[Source](../../src/tauri/window/mod.rs.html#1152-1189)

#### pub fn [set\_menu](#method.set_menu)(&self, menu: [Menu](..\menu\struct.Menu.html.md "struct tauri::menu::Menu")<R>) -> [Result](..\type.Result.html.md "type tauri::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Menu](..\menu\struct.Menu.html.md "struct tauri::menu::Menu")<R>>>

Sets the window menu and returns the previous one.

###### [§](#platform-specific)Platform-specific:

* **macOS:** Unsupported. The menu on macOS is app-wide and not specific to one
  window, if you need to set it, use [`AppHandle::set_menu`](..\struct.AppHandle.html_method.set_menu.md "method tauri::AppHandle::set_menu") instead.

[Source](../../src/tauri/window/mod.rs.html#1197-1228)

#### pub fn [remove\_menu](#method.remove_menu)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Menu](..\menu\struct.Menu.html.md "struct tauri::menu::Menu")<R>>>

Removes the window menu and returns it.

###### [§](#platform-specific-1)Platform-specific:

* **macOS:** Unsupported. The menu on macOS is app-wide and not specific to one
  window, if you need to remove it, use [`AppHandle::remove_menu`](..\struct.AppHandle.html_method.remove_menu.md "method tauri::AppHandle::remove_menu") instead.

[Source](../../src/tauri/window/mod.rs.html#1231-1256)

#### pub fn [hide\_menu](#method.hide_menu)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Hides the window menu.

[Source](../../src/tauri/window/mod.rs.html#1259-1284)

#### pub fn [show\_menu](#method.show_menu)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Shows the window menu.

[Source](../../src/tauri/window/mod.rs.html#1287-1315)

#### pub fn [is\_menu\_visible](#method.is_menu_visible)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Shows the window menu.

[Source](../../src/tauri/window/mod.rs.html#1318-1320)

#### pub fn [popup\_menu](#method.popup_menu)<M: [ContextMenu](..\menu\trait.ContextMenu.html.md "trait tauri::menu::ContextMenu")>(&self, menu: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Shows the specified menu as a context menu at the cursor position.

[Source](../../src/tauri/window/mod.rs.html#1325-1331)

#### pub fn [popup\_menu\_at](#method.popup_menu_at)<M: [ContextMenu](..\menu\trait.ContextMenu.html.md "trait tauri::menu::ContextMenu"), P: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Position](..\enum.Position.html.md "enum tauri::Position")>>( &self, menu: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), position: P, ) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Shows the specified menu as a context menu at the specified position.

The position is relative to the window’s top-left corner.

[Source](../../src/tauri/window/mod.rs.html#1335-1583)[§](#impl-Window%3CR%3E-2)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Window](struct.Window.html.md "struct tauri::window::Window")<R>

Window getters.

[Source](../../src/tauri/window/mod.rs.html#1337-1339)

#### pub fn [scale\_factor](#method.scale_factor)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)>

Returns the scale factor that can be used to map logical pixels to physical pixels, and vice versa.

[Source](../../src/tauri/window/mod.rs.html#1342-1344)

#### pub fn [inner\_position](#method.inner_position)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PhysicalPosition](..\struct.PhysicalPosition.html.md "struct tauri::PhysicalPosition")<[i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html)>>

Returns the position of the top-left hand corner of the window’s client area relative to the top-left hand corner of the desktop.

[Source](../../src/tauri/window/mod.rs.html#1347-1349)

#### pub fn [outer\_position](#method.outer_position)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PhysicalPosition](..\struct.PhysicalPosition.html.md "struct tauri::PhysicalPosition")<[i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html)>>

Returns the position of the top-left hand corner of the window relative to the top-left hand corner of the desktop.

[Source](../../src/tauri/window/mod.rs.html#1354-1356)

#### pub fn [inner\_size](#method.inner_size)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PhysicalSize](..\struct.PhysicalSize.html.md "struct tauri::PhysicalSize")<[u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html)>>

Returns the physical size of the window’s client area.

The client area is the content of the window, excluding the title bar and borders.

[Source](../../src/tauri/window/mod.rs.html#1361-1363)

#### pub fn [outer\_size](#method.outer_size)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PhysicalSize](..\struct.PhysicalSize.html.md "struct tauri::PhysicalSize")<[u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html)>>

Returns the physical size of the entire window.

These dimensions include the title bar and borders. If you don’t want that (and you usually don’t), use inner\_size instead.

[Source](../../src/tauri/window/mod.rs.html#1366-1368)

#### pub fn [is\_fullscreen](#method.is_fullscreen)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s current fullscreen state.

[Source](../../src/tauri/window/mod.rs.html#1371-1373)

#### pub fn [is\_minimized](#method.is_minimized)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s current minimized state.

[Source](../../src/tauri/window/mod.rs.html#1376-1378)

#### pub fn [is\_maximized](#method.is_maximized)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s current maximized state.

[Source](../../src/tauri/window/mod.rs.html#1381-1383)

#### pub fn [is\_focused](#method.is_focused)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s current focus state.

[Source](../../src/tauri/window/mod.rs.html#1386-1388)

#### pub fn [is\_decorated](#method.is_decorated)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s current decoration state.

[Source](../../src/tauri/window/mod.rs.html#1391-1393)

#### pub fn [is\_resizable](#method.is_resizable)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s current resizable state.

[Source](../../src/tauri/window/mod.rs.html#1396-1398)

#### pub fn [is\_enabled](#method.is_enabled)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Whether the window is enabled or disabled.

[Source](../../src/tauri/window/mod.rs.html#1405-1411)

#### pub fn [is\_always\_on\_top](#method.is_always_on_top)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Determines if this window should always be on top of other windows.

###### [§](#platform-specific-2)Platform-specific

* **iOS / Android:** Unsupported.

[Source](../../src/tauri/window/mod.rs.html#1418-1420)

#### pub fn [is\_maximizable](#method.is_maximizable)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s native maximize button state

###### [§](#platform-specific-3)Platform-specific

* **Linux / iOS / Android:** Unsupported.

[Source](../../src/tauri/window/mod.rs.html#1427-1429)

#### pub fn [is\_minimizable](#method.is_minimizable)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s native minimize button state

###### [§](#platform-specific-4)Platform-specific

* **Linux / iOS / Android:** Unsupported.

[Source](../../src/tauri/window/mod.rs.html#1436-1438)

#### pub fn [is\_closable](#method.is_closable)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s native close button state

###### [§](#platform-specific-5)Platform-specific

* **Linux / iOS / Android:** Unsupported.

[Source](../../src/tauri/window/mod.rs.html#1441-1443)

#### pub fn [is\_visible](#method.is_visible)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the window’s current visibility state.

[Source](../../src/tauri/window/mod.rs.html#1446-1448)

#### pub fn [title](#method.title)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>

Gets the window’s current title.

[Source](../../src/tauri/window/mod.rs.html#1453-1460)

#### pub fn [current\_monitor](#method.current_monitor)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Monitor](struct.Monitor.html.md "struct tauri::window::Monitor")>>

Returns the monitor on which the window currently resides.

Returns None if current monitor can’t be detected.

[Source](../../src/tauri/window/mod.rs.html#1463-1470)

#### pub fn [monitor\_from\_point](#method.monitor_from_point)(&self, x: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), y: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Monitor](struct.Monitor.html.md "struct tauri::window::Monitor")>>

Returns the monitor that contains the given point.

[Source](../../src/tauri/window/mod.rs.html#1475-1482)

#### pub fn [primary\_monitor](#method.primary_monitor)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Monitor](struct.Monitor.html.md "struct tauri::window::Monitor")>>

Returns the primary monitor of the system.

Returns None if it can’t identify any monitor as a primary one.

[Source](../../src/tauri/window/mod.rs.html#1485-1492)

#### pub fn [available\_monitors](#method.available_monitors)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[Monitor](struct.Monitor.html.md "struct tauri::window::Monitor")>>

Returns the list of all the monitors available on the system.

[Source](../../src/tauri/window/mod.rs.html#1557-1559)

#### pub fn [gtk\_window](#method.gtk_window)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[ApplicationWindow](https://docs.rs/gtk/0.18.2/x86_64-unknown-linux-gnu/gtk/auto/application_window/struct.ApplicationWindow.html "struct gtk::auto::application_window::ApplicationWindow")>

Returns the `ApplicationWindow` from gtk crate that is used by this window.

Note that this type can only be used on the main thread.

[Source](../../src/tauri/window/mod.rs.html#1571-1573)

#### pub fn [default\_vbox](#method.default_vbox)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[Box](https://docs.rs/gtk/0.18.2/x86_64-unknown-linux-gnu/gtk/auto/box_/struct.Box.html "struct gtk::auto::box_::Box")>

Returns the vertical [`gtk::Box`](https://docs.rs/gtk/0.18.2/x86_64-unknown-linux-gnu/gtk/auto/box_/struct.Box.html "struct gtk::auto::box_::Box") that is added by default as the sole child of this window.

Note that this type can only be used on the main thread.

[Source](../../src/tauri/window/mod.rs.html#1580-1582)

#### pub fn [theme](#method.theme)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[Theme](..\enum.Theme.html.md "enum tauri::Theme")>

Returns the current window theme.

###### [§](#platform-specific-6)Platform-specific

* **macOS**: Only supported on macOS 10.14+.

[Source](../../src/tauri/window/mod.rs.html#1587-1599)[§](#impl-Window%3CR%3E-3)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Window](struct.Window.html.md "struct tauri::window::Window")<R>

Desktop window getters.

[Source](../../src/tauri/window/mod.rs.html#1596-1598)

#### pub fn [cursor\_position](#method.cursor_position)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PhysicalPosition](..\struct.PhysicalPosition.html.md "struct tauri::PhysicalPosition")<[f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)>>

Get the cursor position relative to the top-left hand corner of the desktop.

Note that the top-left hand corner of the desktop is not necessarily the same as the screen.
If the user uses a desktop with multiple monitors,
the top-left hand corner of the desktop is the top-left hand corner of the main monitor on Windows and macOS
or the top-left of the leftmost monitor on X11.

The coordinates can be negative if the top-left hand corner of the window is outside of the visible screen region.

[Source](../../src/tauri/window/mod.rs.html#1603-2123)[§](#impl-Window%3CR%3E-4)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Window](struct.Window.html.md "struct tauri::window::Window")<R>

Desktop window setters and actions.

[Source](../../src/tauri/window/mod.rs.html#1605-1607)

#### pub fn [center](#method.center)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Centers the window.

[Source](../../src/tauri/window/mod.rs.html#1620-1629)

#### pub fn [request\_user\_attention](#method.request_user_attention)( &self, request\_type: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[UserAttentionType](..\enum.UserAttentionType.html.md "enum tauri::UserAttentionType")>, ) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Requests user attention to the window, this has no effect if the application
is already focused. How requesting for user attention manifests is platform dependent,
see `UserAttentionType` for details.

Providing `None` will unset the request for user attention. Unsetting the request for
user attention might not be done automatically by the WM when the window receives input.

###### [§](#platform-specific-7)Platform-specific

* **macOS:** `None` has no effect.
* **Linux:** Urgency levels have the same effect.

[Source](../../src/tauri/window/mod.rs.html#1633-1639)

#### pub fn [set\_resizable](#method.set_resizable)(&self, resizable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Determines if this window should be resizable.
When resizable is set to false, native window’s maximize button is automatically disabled.

[Source](../../src/tauri/window/mod.rs.html#1648-1654)

#### pub fn [set\_maximizable](#method.set_maximizable)(&self, maximizable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Determines if this window’s native maximize button should be enabled.
If resizable is set to false, this setting is ignored.

###### [§](#platform-specific-8)Platform-specific

* **macOS:** Disables the “zoom” button in the window titlebar, which is also used to enter fullscreen mode.
* **Linux / iOS / Android:** Unsupported.

[Source](../../src/tauri/window/mod.rs.html#1661-1667)

#### pub fn [set\_minimizable](#method.set_minimizable)(&self, minimizable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Determines if this window’s native minimize button should be enabled.

###### [§](#platform-specific-9)Platform-specific

* **Linux / iOS / Android:** Unsupported.

[Source](../../src/tauri/window/mod.rs.html#1676-1682)

#### pub fn [set\_closable](#method.set_closable)(&self, closable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Determines if this window’s native close button should be enabled.

###### [§](#platform-specific-10)Platform-specific

* **Linux:** “GTK+ will do its best to convince the window manager not to show a close button.
  Depending on the system, this function may not have any effect when called on a window that is already visible”
* **iOS / Android:** Unsupported.

[Source](../../src/tauri/window/mod.rs.html#1685-1691)

#### pub fn [set\_title](#method.set_title)(&self, title: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Set this window’s title.

[Source](../../src/tauri/window/mod.rs.html#1694-1700)

#### pub fn [set\_enabled](#method.set_enabled)(&self, enabled: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Enable or disable the window.

[Source](../../src/tauri/window/mod.rs.html#1703-1705)

#### pub fn [maximize](#method.maximize)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Maximizes this window.

[Source](../../src/tauri/window/mod.rs.html#1708-1710)

#### pub fn [unmaximize](#method.unmaximize)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Un-maximizes this window.

[Source](../../src/tauri/window/mod.rs.html#1713-1715)

#### pub fn [minimize](#method.minimize)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Minimizes this window.

[Source](../../src/tauri/window/mod.rs.html#1718-1720)

#### pub fn [unminimize](#method.unminimize)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Un-minimizes this window.

[Source](../../src/tauri/window/mod.rs.html#1723-1725)

#### pub fn [show](#method.show)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Show this window.

[Source](../../src/tauri/window/mod.rs.html#1728-1730)

#### pub fn [hide](#method.hide)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Hide this window.

[Source](../../src/tauri/window/mod.rs.html#1733-1735)

#### pub fn [close](#method.close)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Closes this window. It emits [`crate::RunEvent::CloseRequested`] first like a user-initiated close request so you can intercept it.

[Source](../../src/tauri/window/mod.rs.html#1738-1740)

#### pub fn [destroy](#method.destroy)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Destroys this window. Similar to [`Self::close`](struct.Window.html_method.close.md "method tauri::window::Window::close") but does not emit any events and force close the window instead.

[Source](../../src/tauri/window/mod.rs.html#1745-1751)

#### pub fn [set\_decorations](#method.set_decorations)(&self, decorations: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Determines if this window should be [decorated](https://en.wikipedia.org/wiki/Window_(computing)#Window_decoration).

[Source](../../src/tauri/window/mod.rs.html#1762-1768)

#### pub fn [set\_shadow](#method.set_shadow)(&self, enable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Determines if this window should have shadow.

###### [§](#platform-specific-11)Platform-specific

* **Windows:**
  + `false` has no effect on decorated window, shadow are always ON.
  + `true` will make undecorated window have a 1px white border,
    and on Windows 11, it will have a rounded corners.
* **Linux:** Unsupported.

[Source](../../src/tauri/window/mod.rs.html#1802-1808)

#### pub fn [set\_effects](#method.set_effects)<E: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[WindowEffectsConfig](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowEffectsConfig.html "struct tauri_utils::config::WindowEffectsConfig")>>>( &self, effects: E, ) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets window effects, pass [`None`](https://doc.rust-lang.org/nightly/core/option/enum.Option.html#variant.None "variant core::option::Option::None") to clear any effects applied if possible.

Requires the window to be transparent.

See [`EffectsBuilder`](struct.EffectsBuilder.html.md "struct tauri::window::EffectsBuilder") for a convenient builder for [`WindowEffectsConfig`](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowEffectsConfig.html "struct tauri_utils::config::WindowEffectsConfig").

```
use tauri::{Manager, window::{Color, Effect, EffectState, EffectsBuilder}};
tauri::Builder::default()
  .setup(|app| {
    let window = app.get_window("main").unwrap();
    window.set_effects(
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

[Source](../../src/tauri/window/mod.rs.html#1811-1817)

#### pub fn [set\_always\_on\_bottom](#method.set_always_on_bottom)(&self, always\_on\_bottom: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Determines if this window should always be below other windows.

[Source](../../src/tauri/window/mod.rs.html#1820-1826)

#### pub fn [set\_always\_on\_top](#method.set_always_on_top)(&self, always\_on\_top: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Determines if this window should always be on top of other windows.

[Source](../../src/tauri/window/mod.rs.html#1833-1842)

#### pub fn [set\_visible\_on\_all\_workspaces](#method.set_visible_on_all_workspaces)( &self, visible\_on\_all\_workspaces: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html), ) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets whether the window should be visible on all workspaces or virtual desktops.

###### [§](#platform-specific-13)Platform-specific

* **Windows / iOS / Android:** Unsupported.

[Source](../../src/tauri/window/mod.rs.html#1850-1856)

#### pub fn [set\_background\_color](#method.set_background_color)(&self, color: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Color](..\webview\struct.Color.html.md "struct tauri::webview::Color")>) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets the window background color.

###### [§](#platform-specific-14)Platform-specific:

* **Windows:** alpha channel is ignored.
* **iOS / Android:** Unsupported.

[Source](../../src/tauri/window/mod.rs.html#1859-1865)

#### pub fn [set\_content\_protected](#method.set_content_protected)(&self, protected: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Prevents the window contents from being captured by other apps.

[Source](../../src/tauri/window/mod.rs.html#1868-1874)

#### pub fn [set\_size](#method.set_size)<S: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Size](..\enum.Size.html.md "enum tauri::Size")>>(&self, size: S) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Resizes this window.

[Source](../../src/tauri/window/mod.rs.html#1877-1883)

#### pub fn [set\_min\_size](#method.set_min_size)<S: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Size](..\enum.Size.html.md "enum tauri::Size")>>(&self, size: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<S>) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets this window’s minimum inner size.

[Source](../../src/tauri/window/mod.rs.html#1886-1892)

#### pub fn [set\_max\_size](#method.set_max_size)<S: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Size](..\enum.Size.html.md "enum tauri::Size")>>(&self, size: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<S>) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets this window’s maximum inner size.

[Source](../../src/tauri/window/mod.rs.html#1895-1904)

#### pub fn [set\_size\_constraints](#method.set_size_constraints)( &self, constriants: [WindowSizeConstraints](..\struct.WindowSizeConstraints.html.md "struct tauri::WindowSizeConstraints"), ) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets this window’s minimum inner width.

[Source](../../src/tauri/window/mod.rs.html#1907-1913)

#### pub fn [set\_position](#method.set_position)<Pos: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Position](..\enum.Position.html.md "enum tauri::Position")>>(&self, position: Pos) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets this window’s position.

[Source](../../src/tauri/window/mod.rs.html#1916-1922)

#### pub fn [set\_fullscreen](#method.set_fullscreen)(&self, fullscreen: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Determines if this window should be fullscreen.

[Source](../../src/tauri/window/mod.rs.html#1925-1927)

#### pub fn [set\_focus](#method.set_focus)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Bring the window to front and focus.

[Source](../../src/tauri/window/mod.rs.html#1930-1936)

#### pub fn [set\_icon](#method.set_icon)(&self, icon: [Image](..\image\struct.Image.html.md "struct tauri::image::Image")<'\_>) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets this window’ icon.

[Source](../../src/tauri/window/mod.rs.html#1943-1949)

#### pub fn [set\_skip\_taskbar](#method.set_skip_taskbar)(&self, skip: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Whether to hide the window icon from the taskbar or not.

###### [§](#platform-specific-15)Platform-specific

* **macOS:** Unsupported.

[Source](../../src/tauri/window/mod.rs.html#1960-1966)

#### pub fn [set\_cursor\_grab](#method.set_cursor_grab)(&self, grab: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Grabs the cursor, preventing it from leaving the window.

There’s no guarantee that the cursor will be hidden. You should
hide it by yourself if you want so.

###### [§](#platform-specific-16)Platform-specific

* **Linux:** Unsupported.
* **macOS:** This locks the cursor in a fixed location, which looks visually awkward.

[Source](../../src/tauri/window/mod.rs.html#1977-1983)

#### pub fn [set\_cursor\_visible](#method.set_cursor_visible)(&self, visible: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Modifies the cursor’s visibility.

If `false`, this will hide the cursor. If `true`, this will show the cursor.

###### [§](#platform-specific-17)Platform-specific

* **Windows:** The cursor is only hidden within the confines of the window.
* **macOS:** The cursor is hidden as long as the window has input focus, even if the cursor is
  outside of the window.

[Source](../../src/tauri/window/mod.rs.html#1986-1992)

#### pub fn [set\_cursor\_icon](#method.set_cursor_icon)(&self, icon: [CursorIcon](..\enum.CursorIcon.html.md "enum tauri::CursorIcon")) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Modifies the cursor icon of the window.

[Source](../../src/tauri/window/mod.rs.html#1995-2001)

#### pub fn [set\_cursor\_position](#method.set_cursor_position)<Pos: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Position](..\enum.Position.html.md "enum tauri::Position")>>( &self, position: Pos, ) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Changes the position of the cursor in window coordinates.

[Source](../../src/tauri/window/mod.rs.html#2004-2010)

#### pub fn [set\_ignore\_cursor\_events](#method.set_ignore_cursor_events)(&self, ignore: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Ignores the window cursor events.

[Source](../../src/tauri/window/mod.rs.html#2013-2015)

#### pub fn [start\_dragging](#method.start_dragging)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Starts dragging the window.

[Source](../../src/tauri/window/mod.rs.html#2018-2027)

#### pub fn [start\_resize\_dragging](#method.start_resize_dragging)(&self, direction: [ResizeDirection](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.ResizeDirection.html "enum tauri_runtime::ResizeDirection")) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Starts resize-dragging the window.

[Source](../../src/tauri/window/mod.rs.html#2048-2054)

#### pub fn [set\_badge\_count](#method.set_badge_count)(&self, count: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html)>) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets the taskbar badge count. Using `0` or `None` will remove the badge

###### [§](#platform-specific-18)Platform-specific

* **Windows:** Unsupported, use [`Window::set_overlay_icon`] instead.
* **iOS:** iOS expects i32, the value will be clamped to i32::MIN, i32::MAX.
* **Android:** Unsupported.

[Source](../../src/tauri/window/mod.rs.html#2074-2084)

#### pub fn [set\_progress\_bar](#method.set_progress_bar)(&self, progress\_state: [ProgressBarState](struct.ProgressBarState.html.md "struct tauri::window::ProgressBarState")) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets the taskbar progress state.

###### [§](#platform-specific-19)Platform-specific

* **Linux / macOS**: Progress bar is app-wide and not specific to this window.
* **Linux**: Only supported desktop environments with `libunity` (e.g. GNOME).
* **iOS / Android:** Unsupported.

[Source](../../src/tauri/window/mod.rs.html#2087-2093)

#### pub fn [set\_title\_bar\_style](#method.set_title_bar_style)(&self, style: [TitleBarStyle](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/enum.TitleBarStyle.html "enum tauri_utils::TitleBarStyle")) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets the title bar style. **macOS only**.

[Source](../../src/tauri/window/mod.rs.html#2101-2122)

#### pub fn [set\_theme](#method.set_theme)(&self, theme: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Theme](..\enum.Theme.html.md "enum tauri::Theme")>) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets the theme for this window.

###### [§](#platform-specific-20)Platform-specific

* **Linux / macOS**: Theme is app-wide and not specific to this window.
* **iOS / Android:** Unsupported.

## Trait Implementations[§](#trait-implementations)

[Source](../../src/tauri/window/mod.rs.html#912-923)[§](#impl-Clone-for-Window%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [Window](struct.Window.html.md "struct tauri::window::Window")<R>

[Source](../../src/tauri/window/mod.rs.html#913-922)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> Self

Returns a copy of the value. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#174)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &Self)

Performs copy-assignment from `source`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)

[Source](../../src/tauri/window/mod.rs.html#967-972)[§](#impl-CommandArg%3C'de,+R%3E-for-Window%3CR%3E)

### impl<'de, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [CommandArg](..\ipc\trait.CommandArg.html.md "trait tauri::ipc::CommandArg")<'de, R> for [Window](struct.Window.html.md "struct tauri::window::Window")<R>

[Source](../../src/tauri/window/mod.rs.html#969-971)[§](#method.from_command)

#### fn [from\_command](..\ipc\trait.CommandArg.html_tymethod.from_command.md)(command: [CommandItem](..\ipc\struct.CommandItem.html.md "struct tauri::ipc::CommandItem")<'de, R>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Self, [InvokeError](..\ipc\struct.InvokeError.html.md "struct tauri::ipc::InvokeError")>

Grabs the [`Window`](struct.Window.html.md "struct tauri::window::Window") from the [`CommandItem`](..\ipc\struct.CommandItem.html.md "struct tauri::ipc::CommandItem"). This will never fail.

[Source](../../src/tauri/window/mod.rs.html#886-894)[§](#impl-Debug-for-Window%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [Window](struct.Window.html.md "struct tauri::window::Window")<R>

[Source](../../src/tauri/window/mod.rs.html#887-893)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/fmt/type.Result.html "type core::fmt::Result")

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](../../src/tauri/window/mod.rs.html#2226)[§](#impl-Emitter%3CR%3E-for-Window%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Emitter](..\trait.Emitter.html.md "trait tauri::Emitter")<R> for [Window](struct.Window.html.md "struct tauri::window::Window")<R>

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

[Source](../../src/tauri/lib.rs.html#1130-1134)[§](#impl-FunctionArg-for-Window%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [FunctionArg](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/function/arg/trait.FunctionArg.html "trait specta::function::arg::FunctionArg") for [Window](struct.Window.html.md "struct tauri::window::Window")<R>

[Source](../../src/tauri/lib.rs.html#1131-1133)[§](#method.to_datatype)

#### fn [to\_datatype](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/function/arg/trait.FunctionArg.html#tymethod.to_datatype)(\_: &mut TypeMap) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[DataType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/enum.DataType.html "enum specta::datatype::DataType")>

Gets the type of an argument as a [`DataType`](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/enum.DataType.html "enum specta::datatype::DataType"). [Read more](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/function/arg/trait.FunctionArg.html#tymethod.to_datatype)

[Source](../../src/tauri/window/mod.rs.html#904-910)[§](#impl-HasDisplayHandle-for-Window%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [HasDisplayHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/trait.HasDisplayHandle.html "trait raw_window_handle::borrowed::HasDisplayHandle") for [Window](struct.Window.html.md "struct tauri::window::Window")<R>

[Source](../../src/tauri/window/mod.rs.html#905-909)[§](#method.display_handle)

#### fn [display\_handle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/trait.HasDisplayHandle.html#tymethod.display_handle)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[DisplayHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/struct.DisplayHandle.html "struct raw_window_handle::borrowed::DisplayHandle")<'\_>, [HandleError](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/enum.HandleError.html "enum raw_window_handle::HandleError")>

Get a handle to the display controller of the windowing system.

[Source](../../src/tauri/window/mod.rs.html#896-902)[§](#impl-HasWindowHandle-for-Window%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [HasWindowHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/trait.HasWindowHandle.html "trait raw_window_handle::borrowed::HasWindowHandle") for [Window](struct.Window.html.md "struct tauri::window::Window")<R>

[Source](../../src/tauri/window/mod.rs.html#897-901)[§](#method.window_handle)

#### fn [window\_handle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/trait.HasWindowHandle.html#tymethod.window_handle)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[WindowHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/struct.WindowHandle.html "struct raw_window_handle::borrowed::WindowHandle")<'\_>, [HandleError](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/enum.HandleError.html "enum raw_window_handle::HandleError")>

Get a handle to the window.

[Source](../../src/tauri/window/mod.rs.html#925-930)[§](#impl-Hash-for-Window%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Hash](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html "trait core::hash::Hash") for [Window](struct.Window.html.md "struct tauri::window::Window")<R>

[Source](../../src/tauri/window/mod.rs.html#927-929)[§](#method.hash)

#### fn [hash](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#tymethod.hash)<H: [Hasher](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher")>(&self, state: [&mut H](https://doc.rust-lang.org/nightly/std/primitive.reference.html))

Only use the [`Window`](struct.Window.html.md "struct tauri::window::Window")’s label to represent its hash.

1.3.0 · [Source](https://doc.rust-lang.org/nightly/src/core/hash/mod.rs.html#235-237)[§](#method.hash_slice)

#### fn [hash\_slice](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#method.hash_slice)<H>(data: &[Self], state: [&mut H](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) where H: [Hasher](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Feeds a slice of this type into the given [`Hasher`](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"). [Read more](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#method.hash_slice)

[Source](../../src/tauri/window/mod.rs.html#2139-2224)[§](#impl-Listener%3CR%3E-for-Window%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Listener](..\trait.Listener.html.md "trait tauri::Listener")<R> for [Window](struct.Window.html.md "struct tauri::window::Window")<R>

[Source](../../src/tauri/window/mod.rs.html#2161-2173)[§](#method.listen)

#### fn [listen](..\trait.Listener.html_tymethod.listen.md)<F>(&self, event: impl [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, handler: F) -> [EventId](..\type.EventId.html.md "type tauri::EventId") where F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([Event](..\struct.Event.html.md "struct tauri::Event")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Listen to an event on this window.

##### [§](#examples-1)Examples

```
use tauri::{Manager, Listener};

tauri::Builder::default()
  .setup(|app| {
    let window = app.get_window("main").unwrap();
    window.listen("component-loaded", move |event| {
      println!("window just loaded a component");
    });

    Ok(())
  });
```

[Source](../../src/tauri/window/mod.rs.html#2178-2190)[§](#method.once)

#### fn [once](..\trait.Listener.html_tymethod.once.md)<F>(&self, event: impl [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, handler: F) -> [EventId](..\type.EventId.html.md "type tauri::EventId") where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")([Event](..\struct.Event.html.md "struct tauri::Event")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Listen to an event on this window only once.

See [`Self::listen`](struct.Window.html_method.listen.md "method tauri::window::Window::listen") for more information.

[Source](../../src/tauri/window/mod.rs.html#2221-2223)[§](#method.unlisten)

#### fn [unlisten](..\trait.Listener.html_tymethod.unlisten.md)(&self, id: [EventId](..\type.EventId.html.md "type tauri::EventId"))

Unlisten to an event on this window.

##### [§](#examples-2)Examples

```
use tauri::{Manager, Listener};

tauri::Builder::default()
  .setup(|app| {
    let window = app.get_window("main").unwrap();
    let window_ = window.clone();
    let handler = window.listen("component-loaded", move |event| {
      println!("window just loaded a component");

      // we no longer need to listen to the event
      // we also could have used `window.once` instead
      window_.unlisten(event.id());
    });

    // stop listening to the event when you do not need it anymore
    window.unlisten(handler);

    Ok(())
  });
```

[Source](../../src/tauri/lib.rs.html#926-932)[§](#method.listen_any)

#### fn [listen\_any](..\trait.Listener.html_method.listen_any.md)<F>(&self, event: impl [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, handler: F) -> [EventId](..\type.EventId.html.md "type tauri::EventId") where F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([Event](..\struct.Event.html.md "struct tauri::Event")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Listen to an emitted event to any [target](..\enum.EventTarget.html.md "enum tauri::EventTarget"). [Read more](..\trait.Listener.html_method.listen_any.md)

[Source](../../src/tauri/lib.rs.html#939-945)[§](#method.once_any)

#### fn [once\_any](..\trait.Listener.html_method.once_any.md)<F>(&self, event: impl [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, handler: F) -> [EventId](..\type.EventId.html.md "type tauri::EventId") where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")([Event](..\struct.Event.html.md "struct tauri::Event")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Listens once to an emitted event to any [target](..\enum.EventTarget.html.md "enum tauri::EventTarget") . [Read more](..\trait.Listener.html_method.once_any.md)

[Source](../../src/tauri/window/mod.rs.html#940-947)[§](#impl-Manager%3CR%3E-for-Window%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R> for [Window](struct.Window.html.md "struct tauri::window::Window")<R>

[Source](../../src/tauri/window/mod.rs.html#941-946)[§](#method.resources_table)

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

#### fn [get\_window](..\trait.Manager.html_method.get_window.md)(&self, label: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Window](struct.Window.html.md "struct tauri::window::Window")<R>>

Available on **crate feature `unstable`** only.

Fetch a single window from the manager.

[Source](../../src/tauri/lib.rs.html#559-561)[§](#method.get_focused_window)

#### fn [get\_focused\_window](..\trait.Manager.html_method.get_focused_window.md)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Window](struct.Window.html.md "struct tauri::window::Window")<R>>

Available on **crate feature `unstable`** only.

Fetch the focused window. Returns `None` if there is not any focused window.

[Source](../../src/tauri/lib.rs.html#566-568)[§](#method.windows)

#### fn [windows](..\trait.Manager.html_method.windows.md)(&self) -> [HashMap](https://doc.rust-lang.org/nightly/std/collections/hash/map/struct.HashMap.html "struct std::collections::hash::map::HashMap")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"), [Window](struct.Window.html.md "struct tauri::window::Window")<R>>

Available on **crate feature `unstable`** only.

Fetch all managed windows.

[Source](../../src/tauri/lib.rs.html#573-575)[§](#method.get_webview)

#### fn [get\_webview](..\trait.Manager.html_method.get_webview.md)(&self, label: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Webview](..\webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>>

Available on **crate feature `unstable`** only.

Fetch a single webview from the manager.

[Source](../../src/tauri/lib.rs.html#580-582)[§](#method.webviews-1)

#### fn [webviews](..\trait.Manager.html_method.webviews.md)(&self) -> [HashMap](https://doc.rust-lang.org/nightly/std/collections/hash/map/struct.HashMap.html "struct std::collections::hash::map::HashMap")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"), [Webview](..\webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>>

Available on **crate feature `unstable`** only.

Fetch all managed webviews.

[Source](../../src/tauri/lib.rs.html#585-597)[§](#method.get_webview_window)

#### fn [get\_webview\_window](..\trait.Manager.html_method.get_webview_window.md)(&self, label: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[WebviewWindow](..\webview\struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>>

Fetch a single webview window from the manager.

[Source](../../src/tauri/lib.rs.html#600-620)[§](#method.webview_windows)

#### fn [webview\_windows](..\trait.Manager.html_method.webview_windows.md)(&self) -> [HashMap](https://doc.rust-lang.org/nightly/std/collections/hash/map/struct.HashMap.html "struct std::collections::hash::map::HashMap")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"), [WebviewWindow](..\webview\struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>>

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

[Source](../../src/tauri/window/mod.rs.html#933-938)[§](#impl-PartialEq-for-Window%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq") for [Window](struct.Window.html.md "struct tauri::window::Window")<R>

[Source](../../src/tauri/window/mod.rs.html#935-937)[§](#method.eq)

#### fn [eq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#tymethod.eq)(&self, other: &Self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Only use the [`Window`](struct.Window.html.md "struct tauri::window::Window")’s label to compare equality.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#262)[§](#method.ne)

#### fn [ne](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#method.ne)(&self, other: [&Rhs](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `!=`. The default implementation is almost always sufficient,
and should not be overridden without very good reason.

[Source](../../src/tauri/window/mod.rs.html#932)[§](#impl-Eq-for-Window%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Eq](https://doc.rust-lang.org/nightly/core/cmp/trait.Eq.html "trait core::cmp::Eq") for [Window](struct.Window.html.md "struct tauri::window::Window")<R>

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-Window%3CR%3E)

### impl<R> [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [Window](struct.Window.html.md "struct tauri::window::Window")<R> where <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WindowDispatcher](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.WindowDispatcher "type tauri_runtime::Runtime::WindowDispatcher"): [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze"), <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[Handle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.Handle "type tauri_runtime::Runtime::Handle"): [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze"), <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WebviewDispatcher](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.WebviewDispatcher "type tauri_runtime::Runtime::WebviewDispatcher"): [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze"),

[§](#impl-RefUnwindSafe-for-Window%3CR%3E)

### impl<R = [Wry](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.Wry.html "struct tauri_runtime_wry::Wry")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>> ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [Window](struct.Window.html.md "struct tauri::window::Window")<R>

[§](#impl-Send-for-Window%3CR%3E)

### impl<R> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [Window](struct.Window.html.md "struct tauri::window::Window")<R>

[§](#impl-Sync-for-Window%3CR%3E)

### impl<R> [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [Window](struct.Window.html.md "struct tauri::window::Window")<R>

[§](#impl-Unpin-for-Window%3CR%3E)

### impl<R> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [Window](struct.Window.html.md "struct tauri::window::Window")<R> where <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WindowDispatcher](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.WindowDispatcher "type tauri_runtime::Runtime::WindowDispatcher"): [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin"), <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[Handle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.Handle "type tauri_runtime::Runtime::Handle"): [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin"), <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WebviewDispatcher](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.WebviewDispatcher "type tauri_runtime::Runtime::WebviewDispatcher"): [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin"),

[§](#impl-UnwindSafe-for-Window%3CR%3E)

### impl<R = [Wry](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.Wry.html "struct tauri_runtime_wry::Wry")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>> ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [Window](struct.Window.html.md "struct tauri::window::Window")<R>

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