# Struct WebviewWindowBuilderCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/webview/webview_window.rs.html#53-56)

```
pub struct WebviewWindowBuilder<'a, R: Runtime, M: Manager<R>> { /* private fields */ }
```

Expand description

A builder for [`WebviewWindow`](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow"), a window that hosts a single webview.

## Implementations[§](#implementations)

[Source](../../src/tauri/webview/webview_window.rs.html#58-357)[§](#impl-WebviewWindowBuilder%3C'a,+R,+M%3E)

### impl<'a, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"), M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>> [WebviewWindowBuilder](struct.WebviewWindowBuilder.html.md "struct tauri::webview::WebviewWindowBuilder")<'a, R, M>

[Source](../../src/tauri/webview/webview_window.rs.html#106-112)

#### pub fn [new](#method.new)<L: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>>(manager: [&'a M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), label: L, url: [WebviewUrl](..\enum.WebviewUrl.html.md "enum tauri::WebviewUrl")) -> Self

Initializes a webview window builder with the given window label.

##### [§](#known-issues)Known issues

On Windows, this function deadlocks when used in a synchronous command and event handlers, see [the Webview2 issue](https://github.com/tauri-apps/wry/issues/583).
You should use `async` commands and separate threads when creating windows.

##### [§](#examples)Examples

* Create a window in the setup hook:

```
tauri::Builder::default()
  .setup(|app| {
    let webview_window = tauri::WebviewWindowBuilder::new(app, "label", tauri::WebviewUrl::App("index.html".into()))
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
      let webview_window = tauri::WebviewWindowBuilder::new(&handle, "label", tauri::WebviewUrl::App("index.html".into()))
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
  let webview_window = tauri::WebviewWindowBuilder::new(&app, "label", tauri::WebviewUrl::App("index.html".into()))
    .build()
    .unwrap();
}
```

[Source](../../src/tauri/webview/webview_window.rs.html#138-143)

#### pub fn [from\_config](#method.from_config)(manager: [&'a M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), config: &[WindowConfig](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowConfig.html "struct tauri_utils::config::WindowConfig")) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Initializes a webview window builder from a [`WindowConfig`](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowConfig.html "struct tauri_utils::config::WindowConfig") from tauri.conf.json.
Keep in mind that you can’t create 2 windows with the same `label` so make sure
that the initial window was closed or change the label of the new [`WebviewWindowBuilder`](struct.WebviewWindowBuilder.html.md "struct tauri::webview::WebviewWindowBuilder").

##### [§](#known-issues-1)Known issues

On Windows, this function deadlocks when used in a synchronous command or event handlers, see [the Webview2 issue](https://github.com/tauri-apps/wry/issues/583).
You should use `async` commands and separate threads when creating windows.

##### [§](#examples-1)Examples

* Create a window in a command:

```
#[tauri::command]
async fn reopen_window(app: tauri::AppHandle) {
  let webview_window = tauri::WebviewWindowBuilder::from_config(&app, &app.config().app.windows.get(0).unwrap().clone())
    .unwrap()
    .build()
    .unwrap();
}
```

[Source](../../src/tauri/webview/webview_window.rs.html#179-185)

#### pub fn [on\_menu\_event](#method.on_menu_event)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[Window](..\window\struct.Window.html.md "struct tauri::window::Window")<R>, [MenuEvent](..\menu\struct.MenuEvent.html.md "struct tauri::menu::MenuEvent")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( self, f: F, ) -> Self

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
    let webview_window = tauri::WebviewWindowBuilder::new(app, "editor", tauri::WebviewUrl::App("index.html".into()))
      .menu(menu)
      .on_menu_event(move |window, event| {
        if event.id == save_menu_item.id() {
          // save menu item
        }
      })
      .build()
      .unwrap();

    Ok(())
  });
```

[Source](../../src/tauri/webview/webview_window.rs.html#223-231)

#### pub fn [on\_web\_resource\_request](#method.on_web_resource_request)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([Request](https://docs.rs/http/1.3.1/x86_64-unknown-linux-gnu/http/request/struct.Request.html "struct http::request::Request")<[Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)>>, &mut [Response](https://docs.rs/http/1.3.1/x86_64-unknown-linux-gnu/http/response/struct.Response.html "struct http::response::Response")<[Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'static, [[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)]>>) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( self, f: F, ) -> Self

Defines a closure to be executed when the webview makes an HTTP request for a web resource, allowing you to modify the response.

Currently only implemented for the `tauri` URI protocol.

**NOTE:** Currently this is **not** executed when using external URLs such as a development server,
but it might be implemented in the future. **Always** check the request URL.

##### [§](#examples-3)Examples

```
use tauri::{
  utils::config::{Csp, CspDirectiveSources, WebviewUrl},
  webview::WebviewWindowBuilder,
};
use http::header::HeaderValue;
use std::collections::HashMap;
tauri::Builder::default()
  .setup(|app| {
    let webview_window = WebviewWindowBuilder::new(app, "core", WebviewUrl::App("index.html".into()))
      .on_web_resource_request(|request, response| {
        if request.uri().scheme_str() == Some("tauri") {
          // if we have a CSP header, Tauri is loading an HTML file
          //  for this example, let's dynamically change the CSP
          if let Some(csp) = response.headers_mut().get_mut("Content-Security-Policy") {
            // use the tauri helper to parse the CSP policy to a map
            let mut csp_map: HashMap<String, CspDirectiveSources> = Csp::Policy(csp.to_str().unwrap().to_string()).into();
            csp_map.entry("script-src".to_string()).or_insert_with(Default::default).push("'unsafe-inline'");
            // use the tauri helper to get a CSP string from the map
            let csp_string = Csp::from(csp_map).to_string();
            *csp = HeaderValue::from_str(&csp_string).unwrap();
          }
        }
      })
      .build()?;
    Ok(())
  });
```

[Source](../../src/tauri/webview/webview_window.rs.html#254-257)

#### pub fn [on\_navigation](#method.on_navigation)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[Url](..\struct.Url.html.md "struct tauri::Url")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>(self, f: F) -> Self

Defines a closure to be executed when the webview navigates to a URL. Returning `false` cancels the navigation.

##### [§](#examples-4)Examples

```
use tauri::{
  utils::config::{Csp, CspDirectiveSources, WebviewUrl},
  webview::WebviewWindowBuilder,
};
use http::header::HeaderValue;
use std::collections::HashMap;
tauri::Builder::default()
  .setup(|app| {
    let webview_window = WebviewWindowBuilder::new(app, "core", WebviewUrl::App("index.html".into()))
      .on_navigation(|url| {
        // allow the production URL or localhost on dev
        url.scheme() == "tauri" || (cfg!(dev) && url.host_str() == Some("localhost"))
      })
      .build()?;
    Ok(())
  });
```

[Source](../../src/tauri/webview/webview_window.rs.html#299-305)

#### pub fn [on\_download](#method.on_download)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>, [DownloadEvent](enum.DownloadEvent.html.md "enum tauri::webview::DownloadEvent")<'\_>) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( self, f: F, ) -> Self

Set a download event handler to be notified when a download is requested or finished.

Returning `false` prevents the download from happening on a [`DownloadEvent::Requested`](enum.DownloadEvent.html_variant.Requested.md "variant tauri::webview::DownloadEvent::Requested") event.

##### [§](#examples-5)Examples

```
use tauri::{
  utils::config::{Csp, CspDirectiveSources, WebviewUrl},
  webview::{DownloadEvent, WebviewWindowBuilder},
};

tauri::Builder::default()
  .setup(|app| {
    let handle = app.handle();
    let webview_window = WebviewWindowBuilder::new(handle, "core", WebviewUrl::App("index.html".into()))
      .on_download(|webview, event| {
        match event {
          DownloadEvent::Requested { url, destination } => {
            println!("downloading {}", url);
            *destination = "/home/tauri/target/path".into();
          }
          DownloadEvent::Finished { url, path, success } => {
            println!("downloaded {} to {:?}, success: {}", url, path, success);
          }
          _ => (),
        }
        // let the download start
        true
      })
      .build()?;

    Ok(())
  });
```

[Source](../../src/tauri/webview/webview_window.rs.html#336-350)

#### pub fn [on\_page\_load](#method.on_page_load)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>, [PageLoadPayload](struct.PageLoadPayload.html.md "struct tauri::webview::PageLoadPayload")<'\_>) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( self, f: F, ) -> Self

Defines a closure to be executed when a page load event is triggered.
The event can be either [`tauri_runtime::webview::PageLoadEvent::Started`](enum.PageLoadEvent.html_variant.Started.md "variant tauri::webview::PageLoadEvent::Started") if the page has started loading
or [`tauri_runtime::webview::PageLoadEvent::Finished`](enum.PageLoadEvent.html_variant.Finished.md "variant tauri::webview::PageLoadEvent::Finished") when the page finishes loading.

##### [§](#examples-6)Examples

```
use tauri::{
  utils::config::{Csp, CspDirectiveSources, WebviewUrl},
  webview::{PageLoadEvent, WebviewWindowBuilder},
};
use http::header::HeaderValue;
use std::collections::HashMap;
tauri::Builder::default()
  .setup(|app| {
    let webview_window = WebviewWindowBuilder::new(app, "core", WebviewUrl::App("index.html".into()))
      .on_page_load(|window, payload| {
        match payload.event() {
          PageLoadEvent::Started => {
            println!("{} finished loading", payload.url());
          }
          PageLoadEvent::Finished => {
            println!("{} finished loading", payload.url());
          }
        }
      })
      .build()?;
    Ok(())
  });
```

[Source](../../src/tauri/webview/webview_window.rs.html#353-356)

#### pub fn [build](#method.build)(self) -> [Result](..\type.Result.html.md "type tauri::Result")<[WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>>

Creates a new window.

[Source](../../src/tauri/webview/webview_window.rs.html#361-754)[§](#impl-WebviewWindowBuilder%3C'a,+R,+M%3E-1)

### impl<'a, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"), M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>> [WebviewWindowBuilder](struct.WebviewWindowBuilder.html.md "struct tauri::webview::WebviewWindowBuilder")<'a, R, M>

Desktop APIs.

[Source](../../src/tauri/webview/webview_window.rs.html#364-367)

#### pub fn [menu](#method.menu)(self, menu: [Menu](..\menu\struct.Menu.html.md "struct tauri::menu::Menu")<R>) -> Self

Sets the menu for the window.

[Source](../../src/tauri/webview/webview_window.rs.html#371-374)

#### pub fn [center](#method.center)(self) -> Self

Show window in the center of the screen.

[Source](../../src/tauri/webview/webview_window.rs.html#378-381)

#### pub fn [position](#method.position)(self, x: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), y: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> Self

The initial position of the window’s.

[Source](../../src/tauri/webview/webview_window.rs.html#385-388)

#### pub fn [inner\_size](#method.inner_size)(self, width: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), height: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> Self

Window size.

[Source](../../src/tauri/webview/webview_window.rs.html#392-395)

#### pub fn [min\_inner\_size](#method.min_inner_size)(self, min\_width: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), min\_height: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> Self

Window min inner size.

[Source](../../src/tauri/webview/webview_window.rs.html#399-402)

#### pub fn [max\_inner\_size](#method.max_inner_size)(self, max\_width: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), max\_height: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> Self

Window max inner size.

[Source](../../src/tauri/webview/webview_window.rs.html#406-412)

#### pub fn [inner\_size\_constraints](#method.inner_size_constraints)(self, constraints: [WindowSizeConstraints](..\struct.WindowSizeConstraints.html.md "struct tauri::WindowSizeConstraints")) -> Self

Window inner size constraints.

[Source](../../src/tauri/webview/webview_window.rs.html#417-420)

#### pub fn [resizable](#method.resizable)(self, resizable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window is resizable or not.
When resizable is set to false, native window’s maximize button is automatically disabled.

[Source](../../src/tauri/webview/webview_window.rs.html#430-433)

#### pub fn [maximizable](#method.maximizable)(self, maximizable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window’s native maximize button is enabled or not.
If resizable is set to false, this setting is ignored.

###### [§](#platform-specific)Platform-specific

* **macOS:** Disables the “zoom” button in the window titlebar, which is also used to enter fullscreen mode.
* **Linux / iOS / Android:** Unsupported.

[Source](../../src/tauri/webview/webview_window.rs.html#441-444)

#### pub fn [minimizable](#method.minimizable)(self, minimizable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window’s native minimize button is enabled or not.

###### [§](#platform-specific-1)Platform-specific

* **Linux / iOS / Android:** Unsupported.

[Source](../../src/tauri/webview/webview_window.rs.html#454-457)

#### pub fn [closable](#method.closable)(self, closable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window’s native close button is enabled or not.

###### [§](#platform-specific-2)Platform-specific

* **Linux:** “GTK+ will do its best to convince the window manager not to show a close button.
  Depending on the system, this function may not have any effect when called on a window that is already visible”
* **iOS / Android:** Unsupported.

[Source](../../src/tauri/webview/webview_window.rs.html#461-464)

#### pub fn [title](#method.title)<S: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>>(self, title: S) -> Self

The title of the window in the title bar.

[Source](../../src/tauri/webview/webview_window.rs.html#468-471)

#### pub fn [fullscreen](#method.fullscreen)(self, fullscreen: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether to start the window in fullscreen or not.

[Source](../../src/tauri/webview/webview_window.rs.html#479-483)

#### pub fn [focus](#method.focus)(self) -> Self

👎Deprecated since 1.2.0: The window is automatically focused by default. This function Will be removed in 3.0.0. Use `focused` instead.

Sets the window to be initially focused.

[Source](../../src/tauri/webview/webview_window.rs.html#487-491)

#### pub fn [focused](#method.focused)(self, focused: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window will be initially focused or not.

[Source](../../src/tauri/webview/webview_window.rs.html#495-498)

#### pub fn [maximized](#method.maximized)(self, maximized: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window should be maximized upon creation.

[Source](../../src/tauri/webview/webview_window.rs.html#502-505)

#### pub fn [visible](#method.visible)(self, visible: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window should be immediately visible upon creation.

[Source](../../src/tauri/webview/webview_window.rs.html#513-516)

#### pub fn [theme](#method.theme)(self, theme: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Theme](..\enum.Theme.html.md "enum tauri::Theme")>) -> Self

Forces a theme or uses the system settings if None was provided.

###### [§](#platform-specific-3)Platform-specific

* **macOS**: Only supported on macOS 10.14+.

[Source](../../src/tauri/webview/webview_window.rs.html#520-523)

#### pub fn [decorations](#method.decorations)(self, decorations: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window should have borders and bars.

[Source](../../src/tauri/webview/webview_window.rs.html#527-530)

#### pub fn [always\_on\_bottom](#method.always_on_bottom)(self, always\_on\_bottom: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window should always be below other windows.

[Source](../../src/tauri/webview/webview_window.rs.html#534-537)

#### pub fn [always\_on\_top](#method.always_on_top)(self, always\_on\_top: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window should always be on top of other windows.

[Source](../../src/tauri/webview/webview_window.rs.html#541-546)

#### pub fn [visible\_on\_all\_workspaces](#method.visible_on_all_workspaces)(self, visible\_on\_all\_workspaces: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window will be visible on all workspaces or virtual desktops.

[Source](../../src/tauri/webview/webview_window.rs.html#550-553)

#### pub fn [content\_protected](#method.content_protected)(self, protected: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Prevents the window contents from being captured by other apps.

[Source](../../src/tauri/webview/webview_window.rs.html#556-559)

#### pub fn [icon](#method.icon)(self, icon: [Image](..\image\struct.Image.html.md "struct tauri::image::Image")<'a>) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Sets the window icon.

[Source](../../src/tauri/webview/webview_window.rs.html#567-570)

#### pub fn [skip\_taskbar](#method.skip_taskbar)(self, skip: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Sets whether or not the window icon should be hidden from the taskbar.

###### [§](#platform-specific-4)Platform-specific

* **macOS**: Unsupported.

[Source](../../src/tauri/webview/webview_window.rs.html#574-577)

#### pub fn [window\_classname](#method.window_classname)<S: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>>(self, classname: S) -> Self

Sets custom name for Windows’ window class. **Windows only**.

[Source](../../src/tauri/webview/webview_window.rs.html#589-592)

#### pub fn [shadow](#method.shadow)(self, enable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Sets whether or not the window has shadow.

###### [§](#platform-specific-5)Platform-specific

* **Windows:**
  + `false` has no effect on decorated window, shadows are always ON.
  + `true` will make undecorated window have a 1px white border,
    and on Windows 11, it will have a rounded corners.
* **Linux:** Unsupported.

[Source](../../src/tauri/webview/webview_window.rs.html#605-608)

#### pub fn [parent](#method.parent)(self, parent: &[WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Sets a parent to the window to be created.

###### [§](#platform-specific-6)Platform-specific

* **Windows**: This sets the passed parent as an owner window to the window to be created.
  From [MSDN owned windows docs](https://docs.microsoft.com/en-us/windows/win32/winmsg/window-features#owned-windows):
  + An owned window is always above its owner in the z-order.
  + The system automatically destroys an owned window when its owner is destroyed.
  + An owned window is hidden when its owner is minimized.
* **Linux**: This makes the new window transient for parent, see <https://docs.gtk.org/gtk3/method.Window.set_transient_for.html>
* **macOS**: This adds the window as a child of parent, see <https://developer.apple.com/documentation/appkit/nswindow/1419152-addchildwindow?language=objc>

[Source](../../src/tauri/webview/webview_window.rs.html#671-674)

#### pub fn [transient\_for](#method.transient_for)(self, parent: &[WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Sets the window to be created transient for parent.

See <https://docs.gtk.org/gtk3/method.Window.set_transient_for.html>

[Source](../../src/tauri/webview/webview_window.rs.html#687-690)

#### pub fn [transient\_for\_raw](#method.transient_for_raw)(self, parent: &impl [IsA](https://docs.rs/glib/0.18.5/x86_64-unknown-linux-gnu/glib/object/trait.IsA.html "trait glib::object::IsA")<[Window](https://docs.rs/gtk/0.18.2/x86_64-unknown-linux-gnu/gtk/auto/window/struct.Window.html "struct gtk::auto::window::Window")>) -> Self

Sets the window to be created transient for parent.

See <https://docs.gtk.org/gtk3/method.Window.set_transient_for.html>

[Source](../../src/tauri/webview/webview_window.rs.html#750-753)

#### pub fn [effects](#method.effects)(self, effects: [WindowEffectsConfig](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowEffectsConfig.html "struct tauri_utils::config::WindowEffectsConfig")) -> Self

Sets window effects.

Requires the window to be transparent.

###### [§](#platform-specific-7)Platform-specific:

* **Windows**: If using decorations or shadows, you may want to try this workaround <https://github.com/tauri-apps/tao/issues/72#issuecomment-975607891>
* **Linux**: Unsupported

[Source](../../src/tauri/webview/webview_window.rs.html#757-1018)[§](#impl-WebviewWindowBuilder%3C'_,+R,+M%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"), M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>> [WebviewWindowBuilder](struct.WebviewWindowBuilder.html.md "struct tauri::webview::WebviewWindowBuilder")<'\_, R, M>

Webview attributes.

[Source](../../src/tauri/webview/webview_window.rs.html#760-763)

#### pub fn [accept\_first\_mouse](#method.accept_first_mouse)(self, accept: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Sets whether clicking an inactive window also clicks through to the webview.

[Source](../../src/tauri/webview/webview_window.rs.html#795-798)

#### pub fn [initialization\_script](#method.initialization_script)(self, script: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> Self

Adds the provided JavaScript to a list of scripts that should be run after the global object has been created,
but before the HTML document has been parsed and before any other script included by the HTML document is run.

Since it runs on all top-level document and child frame page navigations,
it’s recommended to check the `window.location` to guard your script from running on unexpected origins.

##### [§](#examples-7)Examples

```
use tauri::{WebviewWindowBuilder, Runtime};

const INIT_SCRIPT: &str = r#"
  if (window.location.origin === 'https://tauri.app') {
    console.log("hello world from js init script");

    window.__MY_CUSTOM_PROPERTY__ = { foo: 'bar' };
  }
"#;

fn main() {
  tauri::Builder::default()
    .setup(|app| {
      let webview = tauri::WebviewWindowBuilder::new(app, "label", tauri::WebviewUrl::App("index.html".into()))
        .initialization_script(INIT_SCRIPT)
        .build()?;
      Ok(())
    });
}
```

[Source](../../src/tauri/webview/webview_window.rs.html#802-805)

#### pub fn [user\_agent](#method.user_agent)(self, user\_agent: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> Self

Set the user agent for the webview

[Source](../../src/tauri/webview/webview_window.rs.html#818-823)

#### pub fn [additional\_browser\_args](#method.additional_browser_args)(self, additional\_args: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> Self

Set additional arguments for the webview.

###### [§](#platform-specific-8)Platform-specific

* **macOS / Linux / Android / iOS**: Unsupported.

###### [§](#warning)Warning

By default wry passes `--disable-features=msWebOOUI,msPdfOOUI,msSmartScreenProtection`
so if you use this method, you also need to disable these components by yourself if you want.

[Source](../../src/tauri/webview/webview_window.rs.html#827-830)

#### pub fn [data\_directory](#method.data_directory)(self, data\_directory: [PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")) -> Self

Data directory for the webview.

[Source](../../src/tauri/webview/webview_window.rs.html#834-837)

#### pub fn [disable\_drag\_drop\_handler](#method.disable_drag_drop_handler)(self) -> Self

Disables the drag and drop handler. This is required to use HTML5 drag and drop APIs on the frontend on Windows.

[Source](../../src/tauri/webview/webview_window.rs.html#844-847)

#### pub fn [enable\_clipboard\_access](#method.enable_clipboard_access)(self) -> Self

Enables clipboard access for the page rendered on **Linux** and **Windows**.

**macOS** doesn’t provide such method and is always enabled by default,
but you still need to add menu item accelerators to use shortcuts.

[Source](../../src/tauri/webview/webview_window.rs.html#855-858)

#### pub fn [incognito](#method.incognito)(self, incognito: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Enable or disable incognito mode for the WebView..

###### [§](#platform-specific-9)Platform-specific:

**Android**: Unsupported.

[Source](../../src/tauri/webview/webview_window.rs.html#862-865)

#### pub fn [auto\_resize](#method.auto_resize)(self) -> Self

Sets the webview to automatically grow and shrink its size and position when the parent window resizes.

[Source](../../src/tauri/webview/webview_window.rs.html#871-874)

#### pub fn [proxy\_url](#method.proxy_url)(self, url: [Url](..\struct.Url.html.md "struct tauri::Url")) -> Self

Set a proxy URL for the WebView for all network requests.

Must be either a `http://` or a `socks5://` URL.

[Source](../../src/tauri/webview/webview_window.rs.html#884-891)

#### pub fn [transparent](#method.transparent)(self, transparent: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Available on **non-macOS or crate feature `macos-private-api`** only.

Whether the window should be transparent. If this is true, writing colors
with alpha values different than `1.0` will produce a transparent window.

[Source](../../src/tauri/webview/webview_window.rs.html#903-906)

#### pub fn [zoom\_hotkeys\_enabled](#method.zoom_hotkeys_enabled)(self, enabled: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether page zooming by hotkeys and mousewheel should be enabled or not.

###### [§](#platform-specific-10)Platform-specific:

* **Windows**: Controls WebView2’s [`IsZoomControlEnabled`](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/winrt/microsoft_web_webview2_core/corewebview2settings?view=webview2-winrt-1.0.2420.47#iszoomcontrolenabled) setting.
* **MacOS / Linux**: Injects a polyfill that zooms in and out with `Ctrl/Cmd + [- = +]` hotkeys or mousewheel events,
  20% in each step, ranging from 20% to 1000%. Requires `core:webview:allow-set-webview-zoom` permission
* **Android / iOS**: Unsupported.

[Source](../../src/tauri/webview/webview_window.rs.html#915-918)

#### pub fn [browser\_extensions\_enabled](#method.browser_extensions_enabled)(self, enabled: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether browser extensions can be installed for the webview process

###### [§](#platform-specific-11)Platform-specific:

* **Windows**: Enables the WebView2 environment’s [`AreBrowserExtensionsEnabled`](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/winrt/microsoft_web_webview2_core/corewebview2environmentoptions?view=webview2-winrt-1.0.2739.15#arebrowserextensionsenabled)
* **MacOS / Linux / iOS / Android** - Unsupported.

[Source](../../src/tauri/webview/webview_window.rs.html#927-930)

#### pub fn [extensions\_path](#method.extensions_path)(self, path: impl [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[Path](https://doc.rust-lang.org/nightly/std/path/struct.Path.html "struct std::path::Path")>) -> Self

Set the path from which to load extensions from. Extensions stored in this path should be unpacked Chrome extensions on Windows, and compiled `.so` extensions on Linux.

###### [§](#platform-specific-12)Platform-specific:

* **Windows**: Browser extensions must first be enabled. See [`browser_extensions_enabled`](struct.WebviewWindowBuilder.html_method.browser_extensions_enabled.md "method tauri::webview::WebviewWindowBuilder::browser_extensions_enabled")
* **MacOS / iOS / Android** - Unsupported.

[Source](../../src/tauri/webview/webview_window.rs.html#938-943)

#### pub fn [data\_store\_identifier](#method.data_store_identifier)(self, data\_store\_identifier: [[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html); [16](https://doc.rust-lang.org/nightly/std/primitive.array.html)]) -> Self

Initialize the WebView with a custom data store identifier.
Can be used as a replacement for data\_directory not being available in WKWebView.

* **macOS / iOS**: Available on macOS >= 14 and iOS >= 17
* **Windows / Linux / Android**: Unsupported.

[Source](../../src/tauri/webview/webview_window.rs.html#955-958)

#### pub fn [use\_https\_scheme](#method.use_https_scheme)(self, enabled: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Sets whether the custom protocols should use `https://<scheme>.localhost` instead of the default `http://<scheme>.localhost` on Windows and Android. Defaults to `false`.

###### [§](#note)Note

Using a `https` scheme will NOT allow mixed content when trying to fetch `http` endpoints and therefore will not match the behavior of the `<scheme>://localhost` protocols used on macOS and Linux.

###### [§](#warning-1)Warning

Changing this value between releases will change the IndexedDB, cookies and localstorage location and your app will not be able to access the old data.

[Source](../../src/tauri/webview/webview_window.rs.html#970-973)

#### pub fn [devtools](#method.devtools)(self, enabled: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether web inspector, which is usually called browser devtools, is enabled or not. Enabled by default.

This API works in **debug** builds, but requires `devtools` feature flag to enable it in **release** builds.

###### [§](#platform-specific-13)Platform-specific

* macOS: This will call private functions on **macOS**.
* Android: Open `chrome://inspect/#devices` in Chrome to get the devtools window. Wry’s `WebView` devtools API isn’t supported on Android.
* iOS: Open Safari > Develop > [Your Device Name] > [Your WebView] to get the devtools window.

[Source](../../src/tauri/webview/webview_window.rs.html#986-990)

#### pub fn [background\_color](#method.background_color)(self, color: [Color](struct.Color.html.md "struct tauri::webview::Color")) -> Self

Set the window and webview background color.

###### [§](#platform-specific-14)Platform-specific:

* **Android / iOS:** Unsupported for the window layer.
* **macOS / iOS**: Not implemented for the webview layer.
* **Windows**:
  + alpha channel is ignored for the window layer.
  + On Windows 7, alpha channel is ignored for the webview layer.
  + On Windows 8 and newer, if alpha channel is not `0`, it will be ignored.

[Source](../../src/tauri/webview/webview_window.rs.html#1007-1010)

#### pub fn [background\_throttling](#method.background_throttling)(self, policy: [BackgroundThrottlingPolicy](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/enum.BackgroundThrottlingPolicy.html "enum tauri_utils::config::BackgroundThrottlingPolicy")) -> Self

Change the default background throttling behaviour.

By default, browsers use a suspend policy that will throttle timers and even unload
the whole tab (view) to free resources after roughly 5 minutes when a view became
minimized or hidden. This will pause all tasks until the documents visibility state
changes back from hidden to visible by bringing the view back to the foreground.

###### [§](#platform-specific-15)Platform-specific

* **Linux / Windows / Android**: Unsupported. Workarounds like a pending WebLock transaction might suffice.
* **iOS**: Supported since version 17.0+.
* **macOS**: Supported since version 14.0+.

see https://github.com/tauri-apps/tauri/issues/5250#issuecomment-2569380578

[Source](../../src/tauri/webview/webview_window.rs.html#1014-1017)

#### pub fn [disable\_javascript](#method.disable_javascript)(self) -> Self

Whether JavaScript should be disabled.

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-WebviewWindowBuilder%3C'a,+R,+M%3E)

### impl<'a, R, M> [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [WebviewWindowBuilder](struct.WebviewWindowBuilder.html.md "struct tauri::webview::WebviewWindowBuilder")<'a, R, M> where <<R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WindowDispatcher](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.WindowDispatcher "type tauri_runtime::Runtime::WindowDispatcher") as [WindowDispatch](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html "trait tauri_runtime::WindowDispatch")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WindowBuilder](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#associatedtype.WindowBuilder "type tauri_runtime::WindowDispatch::WindowBuilder"): [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze"),

[§](#impl-RefUnwindSafe-for-WebviewWindowBuilder%3C'a,+R,+M%3E)

### impl<'a, R, M> ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [WebviewWindowBuilder](struct.WebviewWindowBuilder.html.md "struct tauri::webview::WebviewWindowBuilder")<'a, R, M>

[§](#impl-Send-for-WebviewWindowBuilder%3C'a,+R,+M%3E)

### impl<'a, R, M> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [WebviewWindowBuilder](struct.WebviewWindowBuilder.html.md "struct tauri::webview::WebviewWindowBuilder")<'a, R, M> where <<R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WindowDispatcher](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.WindowDispatcher "type tauri_runtime::Runtime::WindowDispatcher") as [WindowDispatch](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html "trait tauri_runtime::WindowDispatch")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WindowBuilder](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#associatedtype.WindowBuilder "type tauri_runtime::WindowDispatch::WindowBuilder"): [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send"), M: [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync"),

[§](#impl-Sync-for-WebviewWindowBuilder%3C'a,+R,+M%3E)

### impl<'a, R, M> ![Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [WebviewWindowBuilder](struct.WebviewWindowBuilder.html.md "struct tauri::webview::WebviewWindowBuilder")<'a, R, M>

[§](#impl-Unpin-for-WebviewWindowBuilder%3C'a,+R,+M%3E)

### impl<'a, R, M> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [WebviewWindowBuilder](struct.WebviewWindowBuilder.html.md "struct tauri::webview::WebviewWindowBuilder")<'a, R, M> where <<R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WindowDispatcher](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.WindowDispatcher "type tauri_runtime::Runtime::WindowDispatcher") as [WindowDispatch](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html "trait tauri_runtime::WindowDispatch")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WindowBuilder](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html#associatedtype.WindowBuilder "type tauri_runtime::WindowDispatch::WindowBuilder"): [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin"),

[§](#impl-UnwindSafe-for-WebviewWindowBuilder%3C'a,+R,+M%3E)

### impl<'a, R, M> ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [WebviewWindowBuilder](struct.WebviewWindowBuilder.html.md "struct tauri::webview::WebviewWindowBuilder")<'a, R, M>

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