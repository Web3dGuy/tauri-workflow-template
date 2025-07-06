# Struct WebviewBuilderCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/webview/mod.rs.html#232-242)

```
pub struct WebviewBuilder<R: Runtime> { /* private fields */ }
```

Available on **crate feature `unstable`** only.

Expand description

A builder for a webview.

## Implementations[§](#implementations)

[Source](../../src/tauri/webview/mod.rs.html#245-623)[§](#impl-WebviewBuilder%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [WebviewBuilder](struct.WebviewBuilder.html.md "struct tauri::webview::WebviewBuilder")<R>

[Source](../../src/tauri/webview/mod.rs.html#309-318)

#### pub fn [new](#method.new)<L: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>>(label: L, url: [WebviewUrl](..\enum.WebviewUrl.html.md "enum tauri::WebviewUrl")) -> Self

Initializes a webview builder with the given webview label and URL to load.

##### [§](#known-issues)Known issues

On Windows, this function deadlocks when used in a synchronous command or event handlers, see [the Webview2 issue](https://github.com/tauri-apps/wry/issues/583).
You should use `async` commands and separate threads when creating webviews.

##### [§](#examples)Examples

* Create a webview in the setup hook:

```
tauri::Builder::default()
  .setup(|app| {
    let window = tauri::window::WindowBuilder::new(app, "label").build()?;
    let webview_builder = tauri::webview::WebviewBuilder::new("label", tauri::WebviewUrl::App("index.html".into()));
    let webview = window.add_child(webview_builder, tauri::LogicalPosition::new(0, 0), window.inner_size().unwrap());
    Ok(())
  });
```

* Create a webview in a separate thread:

```
tauri::Builder::default()
  .setup(|app| {
    let handle = app.handle().clone();
    std::thread::spawn(move || {
      let window = tauri::window::WindowBuilder::new(&handle, "label").build().unwrap();
      let webview_builder = tauri::webview::WebviewBuilder::new("label", tauri::WebviewUrl::App("index.html".into()));
      window.add_child(webview_builder, tauri::LogicalPosition::new(0, 0), window.inner_size().unwrap());
    });
    Ok(())
  });
```

* Create a webview in a command:

```
#[tauri::command]
async fn create_window(app: tauri::AppHandle) {
  let window = tauri::window::WindowBuilder::new(&app, "label").build().unwrap();
  let webview_builder = tauri::webview::WebviewBuilder::new("label", tauri::WebviewUrl::External("https://tauri.app/".parse().unwrap()));
  window.add_child(webview_builder, tauri::LogicalPosition::new(0, 0), window.inner_size().unwrap());
}
```

[Source](../../src/tauri/webview/mod.rs.html#348-357)

#### pub fn [from\_config](#method.from_config)(config: &[WindowConfig](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowConfig.html "struct tauri_utils::config::WindowConfig")) -> Self

Initializes a webview builder from a [`WindowConfig`](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowConfig.html "struct tauri_utils::config::WindowConfig") from tauri.conf.json.
Keep in mind that you can’t create 2 webviews with the same `label` so make sure
that the initial webview was closed or change the label of the new [`WebviewBuilder`](struct.WebviewBuilder.html.md "struct tauri::webview::WebviewBuilder").

##### [§](#known-issues-1)Known issues

On Windows, this function deadlocks when used in a synchronous command or event handlers, see [the Webview2 issue](https://github.com/tauri-apps/wry/issues/583).
You should use `async` commands and separate threads when creating webviews.

##### [§](#examples-1)Examples

* Create a webview in a command:

```
#[tauri::command]
async fn create_window(app: tauri::AppHandle) {
  let window = tauri::window::WindowBuilder::new(&app, "label").build().unwrap();
  let webview_builder = tauri::webview::WebviewBuilder::from_config(&app.config().app.windows.get(0).unwrap().clone());
  window.add_child(webview_builder, tauri::LogicalPosition::new(0, 0), window.inner_size().unwrap());
}
```

[Source](../../src/tauri/webview/mod.rs.html#406-414)

#### pub fn [on\_web\_resource\_request](#method.on_web_resource_request)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([Request](https://docs.rs/http/1.3.1/x86_64-unknown-linux-gnu/http/request/struct.Request.html "struct http::request::Request")<[Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)>>, &mut [Response](https://docs.rs/http/1.3.1/x86_64-unknown-linux-gnu/http/response/struct.Response.html "struct http::response::Response")<[Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'static, [[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)]>>) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( self, f: F, ) -> Self

Defines a closure to be executed when the webview makes an HTTP request for a web resource, allowing you to modify the response.

Currently only implemented for the `tauri` URI protocol.

**NOTE:** Currently this is **not** executed when using external URLs such as a development server,
but it might be implemented in the future. **Always** check the request URL.

##### [§](#examples-2)Examples

```
use tauri::{
  utils::config::{Csp, CspDirectiveSources, WebviewUrl},
  window::WindowBuilder,
  webview::WebviewBuilder,
};
use http::header::HeaderValue;
use std::collections::HashMap;
tauri::Builder::default()
  .setup(|app| {
    let window = tauri::window::WindowBuilder::new(app, "label").build()?;

    let webview_builder = WebviewBuilder::new("core", WebviewUrl::App("index.html".into()))
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
      });

    let webview = window.add_child(webview_builder, tauri::LogicalPosition::new(0, 0), window.inner_size().unwrap())?;

    Ok(())
  });
```

[Source](../../src/tauri/webview/mod.rs.html#447-450)

#### pub fn [on\_navigation](#method.on_navigation)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[Url](..\struct.Url.html.md "struct tauri::Url")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>(self, f: F) -> Self

Defines a closure to be executed when the webview navigates to a URL. Returning `false` cancels the navigation.

##### [§](#examples-3)Examples

```
use tauri::{
  utils::config::{Csp, CspDirectiveSources, WebviewUrl},
  window::WindowBuilder,
  webview::WebviewBuilder,
};
use http::header::HeaderValue;
use std::collections::HashMap;
tauri::Builder::default()
  .setup(|app| {
    let window = tauri::window::WindowBuilder::new(app, "label").build()?;

    let webview_builder = WebviewBuilder::new("core", WebviewUrl::App("index.html".into()))
      .on_navigation(|url| {
        // allow the production URL or localhost on dev
        url.scheme() == "tauri" || (cfg!(dev) && url.host_str() == Some("localhost"))
      });

    let webview = window.add_child(webview_builder, tauri::LogicalPosition::new(0, 0), window.inner_size().unwrap())?;
    Ok(())
  });
```

[Source](../../src/tauri/webview/mod.rs.html#493-499)

#### pub fn [on\_download](#method.on_download)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>, [DownloadEvent](enum.DownloadEvent.html.md "enum tauri::webview::DownloadEvent")<'\_>) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( self, f: F, ) -> Self

Set a download event handler to be notified when a download is requested or finished.

Returning `false` prevents the download from happening on a [`DownloadEvent::Requested`](enum.DownloadEvent.html_variant.Requested.md "variant tauri::webview::DownloadEvent::Requested") event.

##### [§](#examples-4)Examples

```
use tauri::{
  utils::config::{Csp, CspDirectiveSources, WebviewUrl},
  window::WindowBuilder,
  webview::{DownloadEvent, WebviewBuilder},
};

tauri::Builder::default()
  .setup(|app| {
    let window = WindowBuilder::new(app, "label").build()?;
    let webview_builder = WebviewBuilder::new("core", WebviewUrl::App("index.html".into()))
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
      });

    let webview = window.add_child(webview_builder, tauri::LogicalPosition::new(0, 0), window.inner_size().unwrap())?;
    Ok(())
  });
```

[Source](../../src/tauri/webview/mod.rs.html#538-544)

#### pub fn [on\_page\_load](#method.on_page_load)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([Webview](struct.Webview.html.md "struct tauri::webview::Webview")<R>, [PageLoadPayload](struct.PageLoadPayload.html.md "struct tauri::webview::PageLoadPayload")<'\_>) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( self, f: F, ) -> Self

Defines a closure to be executed when a page load event is triggered.
The event can be either [`PageLoadEvent::Started`](enum.PageLoadEvent.html_variant.Started.md "variant tauri::webview::PageLoadEvent::Started") if the page has started loading
or [`PageLoadEvent::Finished`](enum.PageLoadEvent.html_variant.Finished.md "variant tauri::webview::PageLoadEvent::Finished") when the page finishes loading.

##### [§](#examples-5)Examples

```
use tauri::{
  utils::config::{Csp, CspDirectiveSources, WebviewUrl},
  window::WindowBuilder,
  webview::{PageLoadEvent, WebviewBuilder},
};
use http::header::HeaderValue;
use std::collections::HashMap;
tauri::Builder::default()
  .setup(|app| {
    let window = tauri::window::WindowBuilder::new(app, "label").build()?;
    let webview_builder = WebviewBuilder::new("core", WebviewUrl::App("index.html".into()))
      .on_page_load(|webview, payload| {
        match payload.event() {
          PageLoadEvent::Started => {
            println!("{} finished loading", payload.url());
          }
          PageLoadEvent::Finished => {
            println!("{} finished loading", payload.url());
          }
        }
      });
    let webview = window.add_child(webview_builder, tauri::LogicalPosition::new(0, 0), window.inner_size().unwrap())?;
    Ok(())
  });
```

[Source](../../src/tauri/webview/mod.rs.html#626-902)[§](#impl-WebviewBuilder%3CR%3E-1)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [WebviewBuilder](struct.WebviewBuilder.html.md "struct tauri::webview::WebviewBuilder")<R>

Webview attributes.

[Source](../../src/tauri/webview/mod.rs.html#629-632)

#### pub fn [accept\_first\_mouse](#method.accept_first_mouse)(self, accept: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Sets whether clicking an inactive window also clicks through to the webview.

[Source](../../src/tauri/webview/mod.rs.html#670-676)

#### pub fn [initialization\_script](#method.initialization_script)(self, script: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> Self

Adds the provided JavaScript to a list of scripts that should be run after the global object has been created,
but before the HTML document has been parsed and before any other script included by the HTML document is run.

Since it runs on all top-level document and child frame page navigations,
it’s recommended to check the `window.location` to guard your script from running on unexpected origins.

##### [§](#examples-6)Examples

```
use tauri::{WindowBuilder, Runtime};

const INIT_SCRIPT: &str = r#"
  if (window.location.origin === 'https://tauri.app') {
    console.log("hello world from js init script");

    window.__MY_CUSTOM_PROPERTY__ = { foo: 'bar' };
  }
"#;

fn main() {
  tauri::Builder::default()
    .setup(|app| {
      let window = tauri::window::WindowBuilder::new(app, "label").build()?;
      let webview_builder = tauri::webview::WebviewBuilder::new("label", tauri::WebviewUrl::App("index.html".into()))
        .initialization_script(INIT_SCRIPT);
      let webview = window.add_child(webview_builder, tauri::LogicalPosition::new(0, 0), window.inner_size().unwrap())?;
      Ok(())
    });
}
```

[Source](../../src/tauri/webview/mod.rs.html#680-683)

#### pub fn [user\_agent](#method.user_agent)(self, user\_agent: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> Self

Set the user agent for the webview

[Source](../../src/tauri/webview/mod.rs.html#696-699)

#### pub fn [additional\_browser\_args](#method.additional_browser_args)(self, additional\_args: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> Self

Set additional arguments for the webview.

###### [§](#platform-specific)Platform-specific

* **macOS / Linux / Android / iOS**: Unsupported.

###### [§](#warning)Warning

By default wry passes `--disable-features=msWebOOUI,msPdfOOUI,msSmartScreenProtection`
so if you use this method, you also need to disable these components by yourself if you want.

[Source](../../src/tauri/webview/mod.rs.html#703-709)

#### pub fn [data\_directory](#method.data_directory)(self, data\_directory: [PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")) -> Self

Data directory for the webview.

[Source](../../src/tauri/webview/mod.rs.html#713-716)

#### pub fn [disable\_drag\_drop\_handler](#method.disable_drag_drop_handler)(self) -> Self

Disables the drag and drop handler. This is required to use HTML5 drag and drop APIs on the frontend on Windows.

[Source](../../src/tauri/webview/mod.rs.html#723-726)

#### pub fn [enable\_clipboard\_access](#method.enable_clipboard_access)(self) -> Self

Enables clipboard access for the page rendered on **Linux** and **Windows**.

**macOS** doesn’t provide such method and is always enabled by default,
but you still need to add menu item accelerators to use shortcuts.

[Source](../../src/tauri/webview/mod.rs.html#737-740)

#### pub fn [incognito](#method.incognito)(self, incognito: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Enable or disable incognito mode for the WebView.

###### [§](#platform-specific-1)Platform-specific:

* **Windows**: Requires WebView2 Runtime version 101.0.1210.39 or higher, does nothing on older versions,
  see https://learn.microsoft.com/en-us/microsoft-edge/webview2/release-notes/archive?tabs=dotnetcsharp#10121039
* **Android**: Unsupported.
* **macOS / iOS**: Uses the nonPersistent DataStore

[Source](../../src/tauri/webview/mod.rs.html#750-753)

#### pub fn [proxy\_url](#method.proxy_url)(self, url: [Url](..\struct.Url.html.md "struct tauri::Url")) -> Self

Set a proxy URL for the WebView for all network requests.

Must be either a `http://` or a `socks5://` URL.

###### [§](#platform-specific-2)Platform-specific

* **macOS**: Requires the `macos-proxy` feature flag and only compiles for macOS 14+.

[Source](../../src/tauri/webview/mod.rs.html#762-765)

#### pub fn [transparent](#method.transparent)(self, transparent: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Available on **non-macOS or crate feature `macos-private-api`** only.

Enable or disable transparency for the WebView.

[Source](../../src/tauri/webview/mod.rs.html#769-772)

#### pub fn [focused](#method.focused)(self, focus: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the webview should be focused or not.

[Source](../../src/tauri/webview/mod.rs.html#776-779)

#### pub fn [auto\_resize](#method.auto_resize)(self) -> Self

Sets the webview to automatically grow and shrink its size and position when the parent window resizes.

[Source](../../src/tauri/webview/mod.rs.html#791-794)

#### pub fn [zoom\_hotkeys\_enabled](#method.zoom_hotkeys_enabled)(self, enabled: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether page zooming by hotkeys and mousewheel should be enabled or not.

###### [§](#platform-specific-3)Platform-specific:

* **Windows**: Controls WebView2’s [`IsZoomControlEnabled`](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/winrt/microsoft_web_webview2_core/corewebview2settings?view=webview2-winrt-1.0.2420.47#iszoomcontrolenabled) setting.
* **MacOS / Linux**: Injects a polyfill that zooms in and out with `Ctrl/Cmd + [- = +]` hotkeys or mousewheel events,
  20% in each step, ranging from 20% to 1000%. Requires `core:webview:allow-set-webview-zoom` permission
* **Android / iOS**: Unsupported.

[Source](../../src/tauri/webview/mod.rs.html#803-806)

#### pub fn [browser\_extensions\_enabled](#method.browser_extensions_enabled)(self, enabled: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether browser extensions can be installed for the webview process

###### [§](#platform-specific-4)Platform-specific:

* **Windows**: Enables the WebView2 environment’s [`AreBrowserExtensionsEnabled`](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/winrt/microsoft_web_webview2_core/corewebview2environmentoptions?view=webview2-winrt-1.0.2739.15#arebrowserextensionsenabled)
* **MacOS / Linux / iOS / Android** - Unsupported.

[Source](../../src/tauri/webview/mod.rs.html#815-818)

#### pub fn [extensions\_path](#method.extensions_path)(self, path: impl [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[Path](https://doc.rust-lang.org/nightly/std/path/struct.Path.html "struct std::path::Path")>) -> Self

Set the path from which to load extensions from. Extensions stored in this path should be unpacked Chrome extensions on Windows, and compiled `.so` extensions on Linux.

###### [§](#platform-specific-5)Platform-specific:

* **Windows**: Browser extensions must first be enabled. See [`browser_extensions_enabled`](struct.WebviewBuilder.html_method.browser_extensions_enabled.md "method tauri::webview::WebviewBuilder::browser_extensions_enabled")
* **MacOS / iOS / Android** - Unsupported.

[Source](../../src/tauri/webview/mod.rs.html#828-831)

#### pub fn [data\_store\_identifier](#method.data_store_identifier)(self, data\_store\_identifier: [[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html); [16](https://doc.rust-lang.org/nightly/std/primitive.array.html)]) -> Self

Initialize the WebView with a custom data store identifier.
Can be used as a replacement for data\_directory not being available in WKWebView.

* **macOS / iOS**: Available on macOS >= 14 and iOS >= 17
* **Windows / Linux / Android**: Unsupported.

Note: Enable incognito mode to use the `nonPersistent` DataStore.

[Source](../../src/tauri/webview/mod.rs.html#843-846)

#### pub fn [use\_https\_scheme](#method.use_https_scheme)(self, enabled: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Sets whether the custom protocols should use `https://<scheme>.localhost` instead of the default `http://<scheme>.localhost` on Windows and Android. Defaults to `false`.

###### [§](#note)Note

Using a `https` scheme will NOT allow mixed content when trying to fetch `http` endpoints and therefore will not match the behavior of the `<scheme>://localhost` protocols used on macOS and Linux.

###### [§](#warning-1)Warning

Changing this value between releases will change the IndexedDB, cookies and localstorage location and your app will not be able to access the old data.

[Source](../../src/tauri/webview/mod.rs.html#858-861)

#### pub fn [devtools](#method.devtools)(self, enabled: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether web inspector, which is usually called browser devtools, is enabled or not. Enabled by default.

This API works in **debug** builds, but requires `devtools` feature flag to enable it in **release** builds.

###### [§](#platform-specific-6)Platform-specific

* macOS: This will call private functions on **macOS**
* Android: Open `chrome://inspect/#devices` in Chrome to get the devtools window. Wry’s `WebView` devtools API isn’t supported on Android.
* iOS: Open Safari > Develop > [Your Device Name] > [Your WebView] to get the devtools window.

[Source](../../src/tauri/webview/mod.rs.html#871-874)

#### pub fn [background\_color](#method.background_color)(self, color: [Color](struct.Color.html.md "struct tauri::webview::Color")) -> Self

Set the webview background color.

###### [§](#platform-specific-7)Platform-specific:

* **macOS / iOS**: Not implemented.
* **Windows**: On Windows 7, alpha channel is ignored.
* **Windows**: On Windows 8 and newer, if alpha channel is not `0`, it will be ignored.

[Source](../../src/tauri/webview/mod.rs.html#891-894)

#### pub fn [background\_throttling](#method.background_throttling)(self, policy: [BackgroundThrottlingPolicy](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/enum.BackgroundThrottlingPolicy.html "enum tauri_utils::config::BackgroundThrottlingPolicy")) -> Self

Change the default background throttling behaviour.

By default, browsers use a suspend policy that will throttle timers and even unload
the whole tab (view) to free resources after roughly 5 minutes when a view became
minimized or hidden. This will pause all tasks until the documents visibility state
changes back from hidden to visible by bringing the view back to the foreground.

###### [§](#platform-specific-8)Platform-specific

* **Linux / Windows / Android**: Unsupported. Workarounds like a pending WebLock transaction might suffice.
* **iOS**: Supported since version 17.0+.
* **macOS**: Supported since version 14.0+.

see https://github.com/tauri-apps/tauri/issues/5250#issuecomment-2569380578

[Source](../../src/tauri/webview/mod.rs.html#898-901)

#### pub fn [disable\_javascript](#method.disable_javascript)(self) -> Self

Whether JavaScript should be disabled.

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-WebviewBuilder%3CR%3E)

### impl<R> [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [WebviewBuilder](struct.WebviewBuilder.html.md "struct tauri::webview::WebviewBuilder")<R>

[§](#impl-RefUnwindSafe-for-WebviewBuilder%3CR%3E)

### impl<R> ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [WebviewBuilder](struct.WebviewBuilder.html.md "struct tauri::webview::WebviewBuilder")<R>

[§](#impl-Send-for-WebviewBuilder%3CR%3E)

### impl<R> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [WebviewBuilder](struct.WebviewBuilder.html.md "struct tauri::webview::WebviewBuilder")<R>

[§](#impl-Sync-for-WebviewBuilder%3CR%3E)

### impl<R> ![Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [WebviewBuilder](struct.WebviewBuilder.html.md "struct tauri::webview::WebviewBuilder")<R>

[§](#impl-Unpin-for-WebviewBuilder%3CR%3E)

### impl<R> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [WebviewBuilder](struct.WebviewBuilder.html.md "struct tauri::webview::WebviewBuilder")<R>

[§](#impl-UnwindSafe-for-WebviewBuilder%3CR%3E)

### impl<R> ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [WebviewBuilder](struct.WebviewBuilder.html.md "struct tauri::webview::WebviewBuilder")<R>

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