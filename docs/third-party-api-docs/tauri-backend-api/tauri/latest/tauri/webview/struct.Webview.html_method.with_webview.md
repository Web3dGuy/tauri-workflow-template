# Struct WebviewCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/webview/mod.rs.html#906-915)

```
pub struct Webview<R: Runtime = Wry> { /* private fields */ }
```

Expand description

Webview.

## Implementations[§](#implementations)

[Source](../../src/tauri/webview/mod.rs.html#956-1085)[§](#impl-Webview%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>

Base webview functions.

[Source](../../src/tauri/webview/mod.rs.html#978-980)

#### pub fn [builder](#method.builder)<L: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>>(label: L, url: [WebviewUrl](..\enum.WebviewUrl.html.md "enum tauri::WebviewUrl")) -> [WebviewBuilder](struct.WebviewBuilder.html.md "struct tauri::webview::WebviewBuilder")<R>

Available on **crate feature `unstable`** only.

Initializes a webview builder with the given window label and URL to load on the webview.

Data URLs are only supported with the `webview-data-url` feature flag.

[Source](../../src/tauri/webview/mod.rs.html#983-989)

#### pub fn [run\_on\_main\_thread](#method.run_on_main_thread)<F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")() + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>( &self, f: F, ) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Runs the given closure on the main thread.

[Source](../../src/tauri/webview/mod.rs.html#992-994)

#### pub fn [label](#method.label)(&self) -> &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

The webview label.

[Source](../../src/tauri/webview/mod.rs.html#1002-1007)

#### pub fn [on\_webview\_event](#method.on_webview_event)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[WebviewEvent](..\enum.WebviewEvent.html.md "enum tauri::WebviewEvent")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>(&self, f: F)

Registers a window event listener.

[Source](../../src/tauri/webview/mod.rs.html#1047-1084)

#### pub fn [resolve\_command\_scope](#method.resolve_command_scope)<T: [ScopeObject](..\ipc\trait.ScopeObject.html.md "trait tauri::ipc::ScopeObject")>( &self, plugin: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), command: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), ) -> [Result](..\type.Result.html.md "type tauri::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[ResolvedScope](struct.ResolvedScope.html.md "struct tauri::webview::ResolvedScope")<T>>>

Resolves the given command scope for this webview on the currently loaded URL.

If the command is not allowed, returns None.

If the scope cannot be deserialized to the given type, an error is returned.

In a command context this can be directly resolved from the command arguments via [CommandScope](..\ipc\struct.CommandScope.html.md "struct tauri::ipc::CommandScope"):

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

[Source](../../src/tauri/webview/mod.rs.html#1089-1198)[§](#impl-Webview%3CR%3E-1)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>

Desktop webview setters and actions.

[Source](../../src/tauri/webview/mod.rs.html#1093-1095)

#### pub fn [print](#method.print)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Opens the dialog to prints the contents of the webview.
Currently only supported on macOS on `wry`.
`window.print()` works on all platforms.

[Source](../../src/tauri/webview/mod.rs.html#1105-1107)

#### pub fn [cursor\_position](#method.cursor_position)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PhysicalPosition](..\struct.PhysicalPosition.html.md "struct tauri::PhysicalPosition")<[f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)>>

Get the cursor position relative to the top-left hand corner of the desktop.

Note that the top-left hand corner of the desktop is not necessarily the same as the screen.
If the user uses a desktop with multiple monitors,
the top-left hand corner of the desktop is the top-left hand corner of the main monitor on Windows and macOS
or the top-left of the leftmost monitor on X11.

The coordinates can be negative if the top-left hand corner of the window is outside of the visible screen region.

[Source](../../src/tauri/webview/mod.rs.html#1110-1114)

#### pub fn [close](#method.close)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Closes this webview.

[Source](../../src/tauri/webview/mod.rs.html#1117-1123)

#### pub fn [set\_bounds](#method.set_bounds)(&self, bounds: [Rect](..\struct.Rect.html.md "struct tauri::Rect")) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Resizes this webview.

[Source](../../src/tauri/webview/mod.rs.html#1126-1132)

#### pub fn [set\_size](#method.set_size)<S: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Size](..\enum.Size.html.md "enum tauri::Size")>>(&self, size: S) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Resizes this webview.

[Source](../../src/tauri/webview/mod.rs.html#1135-1141)

#### pub fn [set\_position](#method.set_position)<Pos: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Position](..\enum.Position.html.md "enum tauri::Position")>>(&self, position: Pos) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets this webviews’s position.

[Source](../../src/tauri/webview/mod.rs.html#1144-1146)

#### pub fn [set\_focus](#method.set_focus)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Focus the webview.

[Source](../../src/tauri/webview/mod.rs.html#1149-1151)

#### pub fn [hide](#method.hide)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Hide the webview.

[Source](../../src/tauri/webview/mod.rs.html#1154-1156)

#### pub fn [show](#method.show)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Show the webview.

[Source](../../src/tauri/webview/mod.rs.html#1159-1170)

#### pub fn [reparent](#method.reparent)(&self, window: &[Window](..\window\struct.Window.html.md "struct tauri::window::Window")<R>) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Move the webview to the given window.

[Source](../../src/tauri/webview/mod.rs.html#1173-1179)

#### pub fn [set\_auto\_resize](#method.set_auto_resize)(&self, auto\_resize: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets whether the webview should automatically grow and shrink its size and position when the parent window resizes.

[Source](../../src/tauri/webview/mod.rs.html#1182-1184)

#### pub fn [bounds](#method.bounds)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[Rect](..\struct.Rect.html.md "struct tauri::Rect")>

Returns the bounds of the webviews’s client area.

[Source](../../src/tauri/webview/mod.rs.html#1190-1192)

#### pub fn [position](#method.position)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PhysicalPosition](..\struct.PhysicalPosition.html.md "struct tauri::PhysicalPosition")<[i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html)>>

Returns the webview position.

* For child webviews, returns the position of the top-left hand corner of the webviews’s client area relative to the top-left hand corner of the parent window.
* For webview window, returns the inner position of the window.

[Source](../../src/tauri/webview/mod.rs.html#1195-1197)

#### pub fn [size](#method.size)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PhysicalSize](..\struct.PhysicalSize.html.md "struct tauri::PhysicalSize")<[u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html)>>

Returns the physical size of the webviews’s client area.

[Source](../../src/tauri/webview/mod.rs.html#1201-1774)[§](#impl-Webview%3CR%3E-2)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>

Webview APIs.

[Source](../../src/tauri/webview/mod.rs.html#1203-1205)

#### pub fn [window](#method.window)(&self) -> [Window](..\window\struct.Window.html.md "struct tauri::window::Window")<R>

The window that is hosting this webview.

[Source](../../src/tauri/webview/mod.rs.html#1208-1210)

#### pub fn [window\_ref](#method.window_ref)(&self) -> [MutexGuard](https://doc.rust-lang.org/nightly/std/sync/poison/mutex/struct.MutexGuard.html "struct std::sync::poison::mutex::MutexGuard")<'\_, [Window](..\window\struct.Window.html.md "struct tauri::window::Window")<R>>

A reference to the window that is hosting this webview.

[Source](../../src/tauri/webview/mod.rs.html#1278-1287)

#### pub fn [with\_webview](#method.with_webview)<F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")([PlatformWebview](struct.PlatformWebview.html.md "struct tauri::webview::PlatformWebview")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>( &self, f: F, ) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Executes a closure, providing it with the webview handle that is specific to the current platform.

The closure is executed on the main thread.

Note that `webview2-com`, `webkit2gtk`, `objc2_web_kit` and similar crates may be updated in minor releases of Tauri.
Therefore it’s recommended to pin Tauri to at least a minor version when you’re using `with_webview`.

##### [§](#examples-1)Examples

```
use tauri::Manager;

fn main() {
  tauri::Builder::default()
    .setup(|app| {
      let main_webview = app.get_webview("main").unwrap();
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
          // see https://docs.rs/webview2-com/0.19.1/webview2_com/Microsoft/Web/WebView2/Win32/struct.ICoreWebView2Controller.html
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

[Source](../../src/tauri/webview/mod.rs.html#1290-1296)

#### pub fn [url](#method.url)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[Url](..\struct.Url.html.md "struct tauri::Url")>

Returns the current url of the webview.

[Source](../../src/tauri/webview/mod.rs.html#1299-1301)

#### pub fn [navigate](#method.navigate)(&self, url: [Url](..\struct.Url.html.md "struct tauri::Url")) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Navigates the webview to the defined url.

[Source](../../src/tauri/webview/mod.rs.html#1304-1306)

#### pub fn [reload](#method.reload)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Reloads the current page.

[Source](../../src/tauri/webview/mod.rs.html#1352-1522)

#### pub fn [on\_message](#method.on_message)( self, request: [InvokeRequest](struct.InvokeRequest.html.md "struct tauri::webview::InvokeRequest"), responder: [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<[OwnedInvokeResponder](..\ipc\type.OwnedInvokeResponder.html.md "type tauri::ipc::OwnedInvokeResponder")<R>>, )

Handles this window receiving an [`InvokeRequest`](struct.InvokeRequest.html.md "struct tauri::webview::InvokeRequest").

[Source](../../src/tauri/webview/mod.rs.html#1525-1527)

#### pub fn [eval](#method.eval)(&self, js: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Evaluates JavaScript on this window.

[Source](../../src/tauri/webview/mod.rs.html#1603-1605)

#### pub fn [open\_devtools](#method.open_devtools)(&self)

Available on **debug-assertions enabled or crate feature `devtools`** only.

Opens the developer tools window (Web Inspector).
The devtools is only enabled on debug builds or with the `devtools` feature flag.

###### [§](#platform-specific)Platform-specific

* **macOS:** Only supported on macOS 10.15+.
  This is a private API on macOS, so you cannot use this if your application will be published on the App Store.

##### [§](#examples-2)Examples

```
use tauri::Manager;
tauri::Builder::default()
  .setup(|app| {
    #[cfg(debug_assertions)]
    app.get_webview("main").unwrap().open_devtools();
    Ok(())
  });
```

[Source](../../src/tauri/webview/mod.rs.html#1641-1643)

#### pub fn [close\_devtools](#method.close_devtools)(&self)

Available on **debug-assertions enabled or crate feature `devtools`** only.

Closes the developer tools window (Web Inspector).
The devtools is only enabled on debug builds or with the `devtools` feature flag.

###### [§](#platform-specific-1)Platform-specific

* **macOS:** Only supported on macOS 10.15+.
  This is a private API on macOS, so you cannot use this if your application will be published on the App Store.
* **Windows:** Unsupported.

##### [§](#examples-3)Examples

```
use tauri::Manager;
tauri::Builder::default()
  .setup(|app| {
    #[cfg(debug_assertions)]
    {
      let webview = app.get_webview("main").unwrap();
      webview.open_devtools();
      std::thread::spawn(move || {
        std::thread::sleep(std::time::Duration::from_secs(10));
        webview.close_devtools();
      });
    }
    Ok(())
  });
```

[Source](../../src/tauri/webview/mod.rs.html#1677-1683)

#### pub fn [is\_devtools\_open](#method.is_devtools_open)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Available on **debug-assertions enabled or crate feature `devtools`** only.

Checks if the developer tools window (Web Inspector) is opened.
The devtools is only enabled on debug builds or with the `devtools` feature flag.

###### [§](#platform-specific-2)Platform-specific

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
      let webview = app.get_webview("main").unwrap();
      if !webview.is_devtools_open() {
        webview.open_devtools();
      }
    }
    Ok(())
  });
```

[Source](../../src/tauri/webview/mod.rs.html#1692-1698)

#### pub fn [set\_zoom](#method.set_zoom)(&self, scale\_factor: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Set the webview zoom level

###### [§](#platform-specific-3)Platform-specific:

* **Android**: Not supported.
* **macOS**: available on macOS 11+ only.
* **iOS**: available on iOS 14+ only.

[Source](../../src/tauri/webview/mod.rs.html#1708-1714)

#### pub fn [set\_background\_color](#method.set_background_color)(&self, color: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Color](struct.Color.html.md "struct tauri::webview::Color")>) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Specify the webview background color.

###### [§](#platfrom-specific)Platfrom-specific:

* **macOS / iOS**: Not implemented.
* **Windows**:
  + On Windows 7, transparency is not supported and the alpha value will be ignored.
  + On Windows higher than 7: translucent colors are not supported so any alpha value other than `0` will be replaced by `255`

[Source](../../src/tauri/webview/mod.rs.html#1717-1723)

#### pub fn [clear\_all\_browsing\_data](#method.clear_all_browsing_data)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Clear all browsing data for this webview.

[Source](../../src/tauri/webview/mod.rs.html#1742-1748)

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

[Source](../../src/tauri/webview/mod.rs.html#1771-1773)

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

###### [§](#platform-specific-4)Platform-specific

* **Android**: Unsupported, always returns an empty [`Vec`](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec").

## Trait Implementations[§](#trait-implementations)

[Source](../../src/tauri/webview/webview_window.rs.html#1028-1032)[§](#impl-AsRef%3CWebview%3CR%3E%3E-for-WebviewWindow%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>> for [WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

[Source](../../src/tauri/webview/webview_window.rs.html#1029-1031)[§](#method.as_ref)

#### fn [as\_ref](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html#tymethod.as_ref)(&self) -> &[Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>

Converts this type into a shared reference of the (usually inferred) input type.

[Source](../../src/tauri/webview/mod.rs.html#927-938)[§](#impl-Clone-for-Webview%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>

[Source](../../src/tauri/webview/mod.rs.html#928-937)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> Self

Returns a copy of the value. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#174)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &Self)

Performs copy-assignment from `source`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)

[Source](../../src/tauri/webview/mod.rs.html#1892-1897)[§](#impl-CommandArg%3C'de,+R%3E-for-Webview%3CR%3E)

### impl<'de, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [CommandArg](..\ipc\trait.CommandArg.html.md "trait tauri::ipc::CommandArg")<'de, R> for [Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>

[Source](../../src/tauri/webview/mod.rs.html#1894-1896)[§](#method.from_command)

#### fn [from\_command](..\ipc\trait.CommandArg.html_tymethod.from_command.md)(command: [CommandItem](..\ipc\struct.CommandItem.html.md "struct tauri::ipc::CommandItem")<'de, R>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Self, [InvokeError](..\ipc\struct.InvokeError.html.md "struct tauri::ipc::InvokeError")>

Grabs the [`Webview`](struct.Webview.html.md "struct tauri::webview::Webview") from the [`CommandItem`](..\ipc\struct.CommandItem.html.md "struct tauri::ipc::CommandItem"). This will never fail.

[Source](../../src/tauri/webview/mod.rs.html#917-925)[§](#impl-Debug-for-Webview%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>

[Source](../../src/tauri/webview/mod.rs.html#918-924)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/fmt/type.Result.html "type core::fmt::Result")

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](../../src/tauri/webview/mod.rs.html#1863)[§](#impl-Emitter%3CR%3E-for-Webview%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Emitter](..\trait.Emitter.html.md "trait tauri::Emitter")<R> for [Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>

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

[Source](../../src/tauri/lib.rs.html#1136-1140)[§](#impl-FunctionArg-for-Webview%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [FunctionArg](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/function/arg/trait.FunctionArg.html "trait specta::function::arg::FunctionArg") for [Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>

[Source](../../src/tauri/lib.rs.html#1137-1139)[§](#method.to_datatype)

#### fn [to\_datatype](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/function/arg/trait.FunctionArg.html#tymethod.to_datatype)(\_: &mut TypeMap) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[DataType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/enum.DataType.html "enum specta::datatype::DataType")>

Gets the type of an argument as a [`DataType`](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/enum.DataType.html "enum specta::datatype::DataType"). [Read more](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/function/arg/trait.FunctionArg.html#tymethod.to_datatype)

[Source](../../src/tauri/webview/mod.rs.html#940-945)[§](#impl-Hash-for-Webview%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Hash](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html "trait core::hash::Hash") for [Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>

[Source](../../src/tauri/webview/mod.rs.html#942-944)[§](#method.hash)

#### fn [hash](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#tymethod.hash)<H: [Hasher](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher")>(&self, state: [&mut H](https://doc.rust-lang.org/nightly/std/primitive.reference.html))

Only use the [`Webview`](struct.Webview.html.md "struct tauri::webview::Webview")’s label to represent its hash.

1.3.0 · [Source](https://doc.rust-lang.org/nightly/src/core/hash/mod.rs.html#235-237)[§](#method.hash_slice)

#### fn [hash\_slice](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#method.hash_slice)<H>(data: &[Self], state: [&mut H](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) where H: [Hasher](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Feeds a slice of this type into the given [`Hasher`](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"). [Read more](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#method.hash_slice)

[Source](../../src/tauri/webview/mod.rs.html#1776-1861)[§](#impl-Listener%3CR%3E-for-Webview%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Listener](..\trait.Listener.html.md "trait tauri::Listener")<R> for [Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>

[Source](../../src/tauri/webview/mod.rs.html#1798-1810)[§](#method.listen)

#### fn [listen](..\trait.Listener.html_tymethod.listen.md)<F>(&self, event: impl [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, handler: F) -> [EventId](..\type.EventId.html.md "type tauri::EventId") where F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([Event](..\struct.Event.html.md "struct tauri::Event")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Listen to an event on this webview.

##### [§](#examples-5)Examples

```
use tauri::{Manager, Listener};

tauri::Builder::default()
  .setup(|app| {
    let webview = app.get_webview("main").unwrap();
    webview.listen("component-loaded", move |event| {
      println!("webview just loaded a component");
    });

    Ok(())
  });
```

[Source](../../src/tauri/webview/mod.rs.html#1815-1827)[§](#method.once)

#### fn [once](..\trait.Listener.html_tymethod.once.md)<F>(&self, event: impl [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, handler: F) -> [EventId](..\type.EventId.html.md "type tauri::EventId") where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")([Event](..\struct.Event.html.md "struct tauri::Event")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Listen to an event on this webview only once.

See [`Self::listen`](struct.Webview.html_method.listen.md "method tauri::webview::Webview::listen") for more information.

[Source](../../src/tauri/webview/mod.rs.html#1858-1860)[§](#method.unlisten)

#### fn [unlisten](..\trait.Listener.html_tymethod.unlisten.md)(&self, id: [EventId](..\type.EventId.html.md "type tauri::EventId"))

Unlisten to an event on this webview.

##### [§](#examples-6)Examples

```
use tauri::{Manager, Listener};

tauri::Builder::default()
  .setup(|app| {
    let webview = app.get_webview("main").unwrap();
    let webview_ = webview.clone();
    let handler = webview.listen("component-loaded", move |event| {
      println!("webview just loaded a component");

      // we no longer need to listen to the event
      // we also could have used `webview.once` instead
      webview_.unlisten(event.id());
    });

    // stop listening to the event when you do not need it anymore
    webview.unlisten(handler);

    Ok(())
  });
```

[Source](../../src/tauri/lib.rs.html#926-932)[§](#method.listen_any)

#### fn [listen\_any](..\trait.Listener.html_method.listen_any.md)<F>(&self, event: impl [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, handler: F) -> [EventId](..\type.EventId.html.md "type tauri::EventId") where F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([Event](..\struct.Event.html.md "struct tauri::Event")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Listen to an emitted event to any [target](..\enum.EventTarget.html.md "enum tauri::EventTarget"). [Read more](..\trait.Listener.html_method.listen_any.md)

[Source](../../src/tauri/lib.rs.html#939-945)[§](#method.once_any)

#### fn [once\_any](..\trait.Listener.html_method.once_any.md)<F>(&self, event: impl [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, handler: F) -> [EventId](..\type.EventId.html.md "type tauri::EventId") where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")([Event](..\struct.Event.html.md "struct tauri::Event")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Listens once to an emitted event to any [target](..\enum.EventTarget.html.md "enum tauri::EventTarget") . [Read more](..\trait.Listener.html_method.once_any.md)

[Source](../../src/tauri/webview/mod.rs.html#1865-1872)[§](#impl-Manager%3CR%3E-for-Webview%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R> for [Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>

[Source](../../src/tauri/webview/mod.rs.html#1866-1871)[§](#method.resources_table)

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

[Source](../../src/tauri/webview/mod.rs.html#948-953)[§](#impl-PartialEq-for-Webview%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq") for [Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>

[Source](../../src/tauri/webview/mod.rs.html#950-952)[§](#method.eq)

#### fn [eq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#tymethod.eq)(&self, other: &Self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Only use the [`Webview`](struct.Webview.html.md "struct tauri::webview::Webview")’s label to compare equality.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#262)[§](#method.ne)

#### fn [ne](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#method.ne)(&self, other: [&Rhs](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `!=`. The default implementation is almost always sufficient,
and should not be overridden without very good reason.

[Source](../../src/tauri/webview/mod.rs.html#947)[§](#impl-Eq-for-Webview%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Eq](https://doc.rust-lang.org/nightly/core/cmp/trait.Eq.html "trait core::cmp::Eq") for [Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-Webview%3CR%3E)

### impl<R> [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R> where <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WebviewDispatcher](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.WebviewDispatcher "type tauri_runtime::Runtime::WebviewDispatcher"): [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze"), <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[Handle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.Handle "type tauri_runtime::Runtime::Handle"): [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze"),

[§](#impl-RefUnwindSafe-for-Webview%3CR%3E)

### impl<R = [Wry](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.Wry.html "struct tauri_runtime_wry::Wry")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>> ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>

[§](#impl-Send-for-Webview%3CR%3E)

### impl<R> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>

[§](#impl-Sync-for-Webview%3CR%3E)

### impl<R> [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>

[§](#impl-Unpin-for-Webview%3CR%3E)

### impl<R> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R> where <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[WebviewDispatcher](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.WebviewDispatcher "type tauri_runtime::Runtime::WebviewDispatcher"): [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin"), <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[Handle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.Handle "type tauri_runtime::Runtime::Handle"): [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin"),

[§](#impl-UnwindSafe-for-Webview%3CR%3E)

### impl<R = [Wry](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.Wry.html "struct tauri_runtime_wry::Wry")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>> ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>

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