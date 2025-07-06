# Struct WindowBuilderCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/window/mod.rs.html#113-126)

```
pub struct WindowBuilder<'a, R: Runtime, M: Manager<R>> { /* private fields */ }
```

Available on **crate feature `unstable`** only.

Expand description

A builder for a window managed by Tauri.

## Implementations[§](#implementations)

[Source](../../src/tauri/window/mod.rs.html#138-416)[§](#impl-WindowBuilder%3C'a,+R,+M%3E)

### impl<'a, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"), M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>> [WindowBuilder](struct.WindowBuilder.html.md "struct tauri::window::WindowBuilder")<'a, R, M>

[Source](../../src/tauri/window/mod.rs.html#200-212)

#### pub fn [new](#method.new)<L: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>>(manager: [&'a M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), label: L) -> Self

Initializes a window builder with the given window label.

##### [§](#known-issues)Known issues

On Windows, this function deadlocks when used in a synchronous command or event handlers, see [the Webview2 issue](https://github.com/tauri-apps/wry/issues/583).
You should use `async` commands and separate threads when creating windows.

##### [§](#examples)Examples

* Create a window in the setup hook:

```
tauri::Builder::default()
  .setup(|app| {
    let window = tauri::window::WindowBuilder::new(app, "label")
      .build()?;
    Ok(())
  });
```

* Create a window in a separate thread:

```
tauri::Builder::default()
  .setup(|app| {
    let handle = app.handle().clone();
    std::thread::spawn(move || {
      let window = tauri::window::WindowBuilder::new(&handle, "label")
        .build()
        .unwrap();
    });
    Ok(())
  });
```

* Create a window in a command:

```
#[tauri::command]
async fn create_window(app: tauri::AppHandle) {
  let window = tauri::window::WindowBuilder::new(&app, "label")
    .build()
    .unwrap();
}
```

[Source](../../src/tauri/window/mod.rs.html#243-269)

#### pub fn [from\_config](#method.from_config)(manager: [&'a M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), config: &[WindowConfig](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowConfig.html "struct tauri_utils::config::WindowConfig")) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Initializes a window builder from a [`WindowConfig`](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowConfig.html "struct tauri_utils::config::WindowConfig") from tauri.conf.json.
Keep in mind that you can’t create 2 windows with the same `label` so make sure
that the initial window was closed or change the label of the new [`WindowBuilder`](struct.WindowBuilder.html.md "struct tauri::window::WindowBuilder").

##### [§](#known-issues-1)Known issues

On Windows, this function deadlocks when used in a synchronous command or event handlers, see [the Webview2 issue](https://github.com/tauri-apps/wry/issues/583).
You should use `async` commands and separate threads when creating windows.

##### [§](#examples-1)Examples

* Create a window in a command:

```
#[tauri::command]
async fn reopen_window(app: tauri::AppHandle) {
  let window = tauri::window::WindowBuilder::from_config(&app, &app.config().app.windows.get(0).unwrap().clone())
    .unwrap()
    .build()
    .unwrap();
}
```

[Source](../../src/tauri/window/mod.rs.html#309-315)

#### pub fn [on\_menu\_event](#method.on_menu_event)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[Window](struct.Window.html.md "struct tauri::window::Window")<R>, [MenuEvent](..\menu\struct.MenuEvent.html.md "struct tauri::menu::MenuEvent")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( self, f: F, ) -> Self

Registers a global menu event listener.

Note that this handler is called for any menu event,
whether it is coming from this window, another window or from the tray icon menu.

Also note that this handler will not be called if
the window used to register it was closed.

##### [§](#examples-2)Examples

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
      .on_menu_event(move |window, event| {
        if event.id == save_menu_item.id() {
          // save menu item
        }
      })
      .build()
      .unwrap();
  ///
    Ok(())
  });
```

[Source](../../src/tauri/window/mod.rs.html#335-337)

#### pub fn [build](#method.build)(self) -> [Result](..\type.Result.html.md "type tauri::Result")<[Window](struct.Window.html.md "struct tauri::window::Window")<R>>

Creates a new window.

[Source](../../src/tauri/window/mod.rs.html#421-846)[§](#impl-WindowBuilder%3C'a,+R,+M%3E-1)

### impl<'a, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"), M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>> [WindowBuilder](struct.WindowBuilder.html.md "struct tauri::window::WindowBuilder")<'a, R, M>

Desktop APIs.

[Source](../../src/tauri/window/mod.rs.html#424-427)

#### pub fn [menu](#method.menu)(self, menu: [Menu](..\menu\struct.Menu.html.md "struct tauri::menu::Menu")<R>) -> Self

Sets the menu for the window.

[Source](../../src/tauri/window/mod.rs.html#431-434)

#### pub fn [center](#method.center)(self) -> Self

Show window in the center of the screen.

[Source](../../src/tauri/window/mod.rs.html#438-441)

#### pub fn [position](#method.position)(self, x: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), y: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> Self

The initial position of the window’s.

[Source](../../src/tauri/window/mod.rs.html#445-448)

#### pub fn [inner\_size](#method.inner_size)(self, width: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), height: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> Self

Window size.

[Source](../../src/tauri/window/mod.rs.html#452-455)

#### pub fn [min\_inner\_size](#method.min_inner_size)(self, min\_width: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), min\_height: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> Self

Window min inner size.

[Source](../../src/tauri/window/mod.rs.html#459-462)

#### pub fn [max\_inner\_size](#method.max_inner_size)(self, max\_width: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), max\_height: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> Self

Window max inner size.

[Source](../../src/tauri/window/mod.rs.html#466-472)

#### pub fn [inner\_size\_constraints](#method.inner_size_constraints)(self, constraints: [WindowSizeConstraints](..\struct.WindowSizeConstraints.html.md "struct tauri::WindowSizeConstraints")) -> Self

Window inner size constraints.

[Source](../../src/tauri/window/mod.rs.html#477-480)

#### pub fn [resizable](#method.resizable)(self, resizable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window is resizable or not.
When resizable is set to false, native window’s maximize button is automatically disabled.

[Source](../../src/tauri/window/mod.rs.html#490-493)

#### pub fn [maximizable](#method.maximizable)(self, maximizable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window’s native maximize button is enabled or not.
If resizable is set to false, this setting is ignored.

###### [§](#platform-specific)Platform-specific

* **macOS:** Disables the “zoom” button in the window titlebar, which is also used to enter fullscreen mode.
* **Linux / iOS / Android:** Unsupported.

[Source](../../src/tauri/window/mod.rs.html#501-504)

#### pub fn [minimizable](#method.minimizable)(self, minimizable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window’s native minimize button is enabled or not.

###### [§](#platform-specific-1)Platform-specific

* **Linux / iOS / Android:** Unsupported.

[Source](../../src/tauri/window/mod.rs.html#514-517)

#### pub fn [closable](#method.closable)(self, closable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window’s native close button is enabled or not.

###### [§](#platform-specific-2)Platform-specific

* **Linux:** “GTK+ will do its best to convince the window manager not to show a close button.
  Depending on the system, this function may not have any effect when called on a window that is already visible”
* **iOS / Android:** Unsupported.

[Source](../../src/tauri/window/mod.rs.html#521-524)

#### pub fn [title](#method.title)<S: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>>(self, title: S) -> Self

The title of the window in the title bar.

[Source](../../src/tauri/window/mod.rs.html#528-531)

#### pub fn [fullscreen](#method.fullscreen)(self, fullscreen: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether to start the window in fullscreen or not.

[Source](../../src/tauri/window/mod.rs.html#539-542)

#### pub fn [focus](#method.focus)(self) -> Self

👎Deprecated since 1.2.0: The window is automatically focused by default. This function Will be removed in 3.0.0. Use `focused` instead.

Sets the window to be initially focused.

[Source](../../src/tauri/window/mod.rs.html#546-549)

#### pub fn [focused](#method.focused)(self, focused: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window will be initially focused or not.

[Source](../../src/tauri/window/mod.rs.html#553-556)

#### pub fn [maximized](#method.maximized)(self, maximized: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window should be maximized upon creation.

[Source](../../src/tauri/window/mod.rs.html#560-563)

#### pub fn [visible](#method.visible)(self, visible: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window should be immediately visible upon creation.

[Source](../../src/tauri/window/mod.rs.html#571-574)

#### pub fn [theme](#method.theme)(self, theme: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Theme](..\enum.Theme.html.md "enum tauri::Theme")>) -> Self

Forces a theme or uses the system settings if None was provided.

###### [§](#platform-specific-3)Platform-specific

* **macOS**: Only supported on macOS 10.14+.

[Source](../../src/tauri/window/mod.rs.html#584-587)

#### pub fn [transparent](#method.transparent)(self, transparent: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Available on **non-macOS or crate feature `macos-private-api`** only.

Whether the window should be transparent. If this is true, writing colors
with alpha values different than `1.0` will produce a transparent window.

[Source](../../src/tauri/window/mod.rs.html#591-594)

#### pub fn [decorations](#method.decorations)(self, decorations: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window should have borders and bars.

[Source](../../src/tauri/window/mod.rs.html#598-601)

#### pub fn [always\_on\_bottom](#method.always_on_bottom)(self, always\_on\_bottom: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window should always be below other windows.

[Source](../../src/tauri/window/mod.rs.html#605-608)

#### pub fn [always\_on\_top](#method.always_on_top)(self, always\_on\_top: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window should always be on top of other windows.

[Source](../../src/tauri/window/mod.rs.html#616-621)

#### pub fn [visible\_on\_all\_workspaces](#method.visible_on_all_workspaces)(self, visible\_on\_all\_workspaces: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window will be visible on all workspaces or virtual desktops.

###### [§](#platform-specific-4)Platform-specific

* **Windows / iOS / Android:** Unsupported.

[Source](../../src/tauri/window/mod.rs.html#625-628)

#### pub fn [content\_protected](#method.content_protected)(self, protected: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Prevents the window contents from being captured by other apps.

[Source](../../src/tauri/window/mod.rs.html#631-634)

#### pub fn [icon](#method.icon)(self, icon: [Image](..\image\struct.Image.html.md "struct tauri::image::Image")<'a>) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Sets the window icon.

[Source](../../src/tauri/window/mod.rs.html#642-645)

#### pub fn [skip\_taskbar](#method.skip_taskbar)(self, skip: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Sets whether or not the window icon should be hidden from the taskbar.

###### [§](#platform-specific-5)Platform-specific

* **macOS**: Unsupported.

[Source](../../src/tauri/window/mod.rs.html#649-652)

#### pub fn [window\_classname](#method.window_classname)<S: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>>(self, classname: S) -> Self

Sets custom name for Windows’ window class. **Windows only**.

[Source](../../src/tauri/window/mod.rs.html#664-667)

#### pub fn [shadow](#method.shadow)(self, enable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Sets whether or not the window has shadow.

###### [§](#platform-specific-6)Platform-specific

* **Windows:**
  + `false` has no effect on decorated window, shadows are always ON.
  + `true` will make undecorated window have a 1px white border,
    and on Windows 11, it will have a rounded corners.
* **Linux:** Unsupported.

[Source](../../src/tauri/window/mod.rs.html#680-703)

#### pub fn [parent](#method.parent)(self, parent: &[Window](struct.Window.html.md "struct tauri::window::Window")<R>) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Sets a parent to the window to be created.

###### [§](#platform-specific-7)Platform-specific

* **Windows**: This sets the passed parent as an owner window to the window to be created.
  From [MSDN owned windows docs](https://docs.microsoft.com/en-us/windows/win32/winmsg/window-features#owned-windows):
  + An owned window is always above its owner in the z-order.
  + The system automatically destroys an owned window when its owner is destroyed.
  + An owned window is hidden when its owner is minimized.
* **Linux**: This makes the new window transient for parent, see <https://docs.gtk.org/gtk3/method.Window.set_transient_for.html>
* **macOS**: This adds the window as a child of parent, see <https://developer.apple.com/documentation/appkit/nswindow/1419152-addchildwindow?language=objc>

[Source](../../src/tauri/window/mod.rs.html#774-777)

#### pub fn [transient\_for](#method.transient_for)(self, parent: &[Window](struct.Window.html.md "struct tauri::window::Window")<R>) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Sets the window to be created transient for parent.

See <https://docs.gtk.org/gtk3/method.Window.set_transient_for.html>

**Note:** This is a low level API. See [`Self::parent`](struct.WindowBuilder.html_method.parent.md "method tauri::window::WindowBuilder::parent") for a higher level wrapper for Tauri windows.

[Source](../../src/tauri/window/mod.rs.html#792-795)

#### pub fn [transient\_for\_raw](#method.transient_for_raw)(self, parent: &impl [IsA](https://docs.rs/glib/0.18.5/x86_64-unknown-linux-gnu/glib/object/trait.IsA.html "trait glib::object::IsA")<[Window](https://docs.rs/gtk/0.18.2/x86_64-unknown-linux-gnu/gtk/auto/window/struct.Window.html "struct gtk::auto::window::Window")>) -> Self

Sets the window to be created transient for parent.

See <https://docs.gtk.org/gtk3/method.Window.set_transient_for.html>

**Note:** This is a low level API. See [`Self::parent`](struct.WindowBuilder.html_method.parent.md "method tauri::window::WindowBuilder::parent") and [`Self::transient_for`](struct.WindowBuilder.html_method.transient_for.md "method tauri::window::WindowBuilder::transient_for") for higher level wrappers for Tauri windows.

[Source](../../src/tauri/window/mod.rs.html#842-845)

#### pub fn [effects](#method.effects)(self, effects: [WindowEffectsConfig](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowEffectsConfig.html "struct tauri_utils::config::WindowEffectsConfig")) -> Self

Sets window effects.

Requires the window to be transparent.

###### [§](#platform-specific-8)Platform-specific:

* **Windows**: If using decorations or shadows, you may want to try this workaround <https://github.com/tauri-apps/tao/issues/72#issuecomment-975607891>
* **Linux**: Unsupported

[Source](../../src/tauri/window/mod.rs.html#848-859)[§](#impl-WindowBuilder%3C'_,+R,+M%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"), M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>> [WindowBuilder](struct.WindowBuilder.html.md "struct tauri::window::WindowBuilder")<'\_, R, M>

[Source](../../src/tauri/window/mod.rs.html#855-858)

#### pub fn [background\_color](#method.background_color)(self, color: [Color](..\webview\struct.Color.html.md "struct tauri::webview::Color")) -> Self

Set the window and webview background color.

###### [§](#platform-specific-9)Platform-specific:

* **Windows**: alpha channel is ignored.

## Trait Implementations[§](#trait-implementations)

[Source](../../src/tauri/window/mod.rs.html#128-135)[§](#impl-Debug-for-WindowBuilder%3C'_,+R,+M%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"), M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>> [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [WindowBuilder](struct.WindowBuilder.html.md "struct tauri::window::WindowBuilder")<'\_, R, M>

[Source](../../src/tauri/window/mod.rs.html#129-134)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/fmt/type.Result.html "type core::fmt::Result")

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-WindowBuilder%3C'a,+R,+M%3E)

### impl<'a, R, M> [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [WindowBuilder](struct.WindowBuilder.html.md "struct tauri::window::WindowBuilder")<'a, R, M> where <<R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WindowDispatcher](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.WindowDispatcher "type tauri_runtime::Runtime::WindowDispatcher") as [WindowDispatch](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html "trait tauri_runtime::WindowDispatch")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WindowBuilder](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#associatedtype.WindowBuilder "type tauri_runtime::WindowDispatch::WindowBuilder"): [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze"),

[§](#impl-RefUnwindSafe-for-WindowBuilder%3C'a,+R,+M%3E)

### impl<'a, R, M> ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [WindowBuilder](struct.WindowBuilder.html.md "struct tauri::window::WindowBuilder")<'a, R, M>

[§](#impl-Send-for-WindowBuilder%3C'a,+R,+M%3E)

### impl<'a, R, M> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [WindowBuilder](struct.WindowBuilder.html.md "struct tauri::window::WindowBuilder")<'a, R, M> where <<R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WindowDispatcher](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.WindowDispatcher "type tauri_runtime::Runtime::WindowDispatcher") as [WindowDispatch](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html "trait tauri_runtime::WindowDispatch")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WindowBuilder](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#associatedtype.WindowBuilder "type tauri_runtime::WindowDispatch::WindowBuilder"): [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send"), M: [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync"),

[§](#impl-Sync-for-WindowBuilder%3C'a,+R,+M%3E)

### impl<'a, R, M> [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [WindowBuilder](struct.WindowBuilder.html.md "struct tauri::window::WindowBuilder")<'a, R, M> where <<R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WindowDispatcher](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.WindowDispatcher "type tauri_runtime::Runtime::WindowDispatcher") as [WindowDispatch](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html "trait tauri_runtime::WindowDispatch")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WindowBuilder](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#associatedtype.WindowBuilder "type tauri_runtime::WindowDispatch::WindowBuilder"): [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync"), M: [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync"),

[§](#impl-Unpin-for-WindowBuilder%3C'a,+R,+M%3E)

### impl<'a, R, M> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [WindowBuilder](struct.WindowBuilder.html.md "struct tauri::window::WindowBuilder")<'a, R, M> where <<R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WindowDispatcher](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.WindowDispatcher "type tauri_runtime::Runtime::WindowDispatcher") as [WindowDispatch](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html "trait tauri_runtime::WindowDispatch")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WindowBuilder](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#associatedtype.WindowBuilder "type tauri_runtime::WindowDispatch::WindowBuilder"): [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin"),

[§](#impl-UnwindSafe-for-WindowBuilder%3C'a,+R,+M%3E)

### impl<'a, R, M> ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [WindowBuilder](struct.WindowBuilder.html.md "struct tauri::window::WindowBuilder")<'a, R, M>

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