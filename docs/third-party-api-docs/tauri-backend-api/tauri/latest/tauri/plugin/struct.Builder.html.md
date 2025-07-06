# Struct BuilderCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/plugin.rs.html#241-253)

```
pub struct Builder<R: Runtime, C: DeserializeOwned = ()> { /* private fields */ }
```

Expand description

Builds a [`TauriPlugin`](struct.TauriPlugin.html.md "struct tauri::plugin::TauriPlugin").

This Builder offers a more concise way to construct Tauri plugins than implementing the Plugin trait directly.

## [§](#conventions)Conventions

When using the Builder Pattern it is encouraged to export a function called `init` that constructs and returns the plugin.
While plugin authors can provide every possible way to construct a plugin,
sticking to the `init` function convention helps users to quickly identify the correct function to call.

```
use tauri::{plugin::{Builder, TauriPlugin}, Runtime};

pub fn init<R: Runtime>() -> TauriPlugin<R> {
  Builder::new("example")
    .build()
}
```

When plugins expose more complex configuration options, it can be helpful to provide a Builder instead:

```
use tauri::{plugin::{Builder as PluginBuilder, TauriPlugin}, Runtime};

pub struct Builder {
  option_a: String,
  option_b: String,
  option_c: bool
}

impl Default for Builder {
  fn default() -> Self {
    Self {
      option_a: "foo".to_string(),
      option_b: "bar".to_string(),
      option_c: false
    }
  }
}

impl Builder {
  pub fn new() -> Self {
    Default::default()
  }

  pub fn option_a(mut self, option_a: String) -> Self {
    self.option_a = option_a;
    self
  }

  pub fn option_b(mut self, option_b: String) -> Self {
    self.option_b = option_b;
    self
  }

  pub fn option_c(mut self, option_c: bool) -> Self {
    self.option_c = option_c;
    self
  }

  pub fn build<R: Runtime>(self) -> TauriPlugin<R> {
    PluginBuilder::new("example")
      .setup(move |app_handle, api| {
        // use the options here to do stuff
        println!("a: {}, b: {}, c: {}", self.option_a, self.option_b, self.option_c);

        Ok(())
      })
      .build()
  }
}
```

## Implementations[§](#implementations)

[Source](../../src/tauri/plugin.rs.html#255-690)[§](#impl-Builder%3CR,+C%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"), C: [DeserializeOwned](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.DeserializeOwned.html "trait serde::de::DeserializeOwned")> [Builder](struct.Builder.html.md "struct tauri::plugin::Builder")<R, C>

[Source](../../src/tauri/plugin.rs.html#257-271)

#### pub fn [new](#method.new)(name: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> Self

Creates a new Plugin builder.

[Source](../../src/tauri/plugin.rs.html#297-303)

#### pub fn [invoke\_handler](#method.invoke_handler)<F>(self, invoke\_handler: F) -> Self where F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([Invoke](..\ipc\struct.Invoke.html.md "struct tauri::ipc::Invoke")<R>) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static,

Defines the JS message handler callback.
It is recommended you use the [tauri::generate\_handler](..\macro.generate_handler.html.md) to generate the input to this method, as the input type is not considered stable yet.

##### [§](#examples)Examples

```
use tauri::{plugin::{Builder, TauriPlugin}, Runtime};

#[tauri::command]
async fn foobar<R: Runtime>(app: tauri::AppHandle<R>, window: tauri::Window<R>) -> Result<(), String> {
  println!("foobar");

  Ok(())
}

fn init<R: Runtime>() -> TauriPlugin<R> {
  Builder::new("example")
    .invoke_handler(tauri::generate_handler![foobar])
    .build()
}

```

[Source](../../src/tauri/plugin.rs.html#336-339)

#### pub fn [js\_init\_script](#method.js_init_script)(self, js\_init\_script: [String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")) -> Self

Sets the provided JavaScript to be run after the global object has been created,
but before the HTML document has been parsed and before any other script included by the HTML document is run.

Since it runs on all top-level document and child frame page navigations,
it’s recommended to check the `window.location` to guard your script from running on unexpected origins.

The script is wrapped into its own context with `(function () { /* your script here */ })();`,
so global variables must be assigned to `window` instead of implicitly declared.

Note that calling this function multiple times overrides previous values.

##### [§](#examples-1)Examples

```
use tauri::{plugin::{Builder, TauriPlugin}, Runtime};

const INIT_SCRIPT: &str = r#"
  if (window.location.origin === 'https://tauri.app') {
    console.log("hello world from js init script");

    window.__MY_CUSTOM_PROPERTY__ = { foo: 'bar' };
  }
"#;

fn init<R: Runtime>() -> TauriPlugin<R> {
  Builder::new("example")
    .js_init_script(INIT_SCRIPT.to_string())
    .build()
}
```

[Source](../../src/tauri/plugin.rs.html#365-373)

#### pub fn [setup](#method.setup)<F>(self, setup: F) -> Self where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(&[AppHandle](..\struct.AppHandle.html.md "struct tauri::AppHandle")<R>, [PluginApi](struct.PluginApi.html.md "struct tauri::plugin::PluginApi")<R, C>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<dyn [Error](https://doc.rust-lang.org/nightly/core/error/trait.Error.html "trait core::error::Error")>> + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Define a closure that runs when the plugin is registered.

##### [§](#examples-2)Examples

```
use tauri::{plugin::{Builder, TauriPlugin}, Runtime, Manager};
use std::path::PathBuf;

#[derive(Debug, Default)]
struct PluginState {
   dir: Option<PathBuf>
}

fn init<R: Runtime>() -> TauriPlugin<R> {
Builder::new("example")
  .setup(|app, api| {
    app.manage(PluginState::default());

    Ok(())
  })
  .build()
}
```

[Source](../../src/tauri/plugin.rs.html#392-398)

#### pub fn [on\_navigation](#method.on_navigation)<F>(self, on\_navigation: F) -> Self where F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[Webview](..\webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>, &[Url](..\struct.Url.html.md "struct tauri::Url")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Callback invoked when the webview tries to navigate to a URL. Returning false cancels the navigation.

#Example

```
use tauri::{plugin::{Builder, TauriPlugin}, Runtime};

fn init<R: Runtime>() -> TauriPlugin<R> {
  Builder::new("example")
    .on_navigation(|webview, url| {
      // allow the production URL or localhost on dev
      url.scheme() == "tauri" || (cfg!(dev) && url.host_str() == Some("localhost"))
    })
    .build()
}
```

[Source](../../src/tauri/plugin.rs.html#416-422)

#### pub fn [on\_page\_load](#method.on_page_load)<F>(self, on\_page\_load: F) -> Self where F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(&[Webview](..\webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>, &[PageLoadPayload](..\webview\struct.PageLoadPayload.html.md "struct tauri::webview::PageLoadPayload")<'\_>) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Callback invoked when the webview performs a navigation to a page.

##### [§](#examples-3)Examples

```
use tauri::{plugin::{Builder, TauriPlugin}, Runtime};

fn init<R: Runtime>() -> TauriPlugin<R> {
  Builder::new("example")
    .on_page_load(|webview, payload| {
      println!("{:?} URL {} in webview {}", payload.event(), payload.url(), webview.label());
    })
    .build()
}
```

[Source](../../src/tauri/plugin.rs.html#440-446)

#### pub fn [on\_window\_ready](#method.on_window_ready)<F>(self, on\_window\_ready: F) -> Self where F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")([Window](..\window\struct.Window.html.md "struct tauri::window::Window")<R>) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Callback invoked when the window is created.

##### [§](#examples-4)Examples

```
use tauri::{plugin::{Builder, TauriPlugin}, Runtime};

fn init<R: Runtime>() -> TauriPlugin<R> {
  Builder::new("example")
    .on_window_ready(|window| {
      println!("created window {}", window.label());
    })
    .build()
}
```

[Source](../../src/tauri/plugin.rs.html#464-470)

#### pub fn [on\_webview\_ready](#method.on_webview_ready)<F>(self, on\_webview\_ready: F) -> Self where F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")([Webview](..\webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Callback invoked when the webview is created.

##### [§](#examples-5)Examples

```
use tauri::{plugin::{Builder, TauriPlugin}, Runtime};

fn init<R: Runtime>() -> TauriPlugin<R> {
  Builder::new("example")
    .on_webview_ready(|webview| {
      println!("created webview {}", webview.label());
    })
    .build()
}
```

[Source](../../src/tauri/plugin.rs.html#496-502)

#### pub fn [on\_event](#method.on_event)<F>(self, on\_event: F) -> Self where F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(&[AppHandle](..\struct.AppHandle.html.md "struct tauri::AppHandle")<R>, &[RunEvent](..\enum.RunEvent.html.md "enum tauri::RunEvent")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Callback invoked when the event loop receives a new event.

##### [§](#examples-6)Examples

```
use tauri::{plugin::{Builder, TauriPlugin}, RunEvent, Runtime};

fn init<R: Runtime>() -> TauriPlugin<R> {
  Builder::new("example")
    .on_event(|app_handle, event| {
      match event {
        RunEvent::ExitRequested { api, .. } => {
          // Prevents the app from exiting.
          // This will cause the core thread to continue running in the background even without any open windows.
          api.prevent_exit();
        }
        // Ignore all other cases.
        _ => {}
      }
    })
    .build()
}
```

[Source](../../src/tauri/plugin.rs.html#521-527)

#### pub fn [on\_drop](#method.on_drop)<F>(self, on\_drop: F) -> Self where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")([AppHandle](..\struct.AppHandle.html.md "struct tauri::AppHandle")<R>) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Callback invoked when the plugin is dropped.

##### [§](#examples-7)Examples

```
use tauri::{plugin::{Builder, TauriPlugin}, Runtime};

fn init<R: Runtime>() -> TauriPlugin<R> {
  Builder::new("example")
    .on_drop(|app| {
      println!("plugin has been dropped and is no longer running");
      // you can run cleanup logic here
    })
    .build()
}
```

[Source](../../src/tauri/plugin.rs.html#569-590)

#### pub fn [register\_uri\_scheme\_protocol](#method.register_uri_scheme_protocol)<N: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, T: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'static, [[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)]>>, H: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([UriSchemeContext](..\struct.UriSchemeContext.html.md "struct tauri::UriSchemeContext")<'\_, R>, [Request](https://docs.rs/http/1.3.1/x86_64-unknown-linux-gnu/http/request/struct.Request.html "struct http::request::Request")<[Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)>>) -> [Response](https://docs.rs/http/1.3.1/x86_64-unknown-linux-gnu/http/response/struct.Response.html "struct http::response::Response")<T> + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( self, uri\_scheme: N, protocol: H, ) -> Self

Registers a URI scheme protocol available to all webviews.

Leverages [setURLSchemeHandler](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/2875766-seturlschemehandler) on macOS,
[AddWebResourceRequestedFilter](https://docs.microsoft.com/en-us/dotnet/api/microsoft.web.webview2.core.corewebview2.addwebresourcerequestedfilter?view=webview2-dotnet-1.0.774.44) on Windows
and [webkit-web-context-register-uri-scheme](https://webkitgtk.org/reference/webkit2gtk/stable/WebKitWebContext.html#webkit-web-context-register-uri-scheme) on Linux.

##### [§](#known-limitations)Known limitations

URI scheme protocols are registered when the webview is created. Due to this limitation, if the plugin is registered after a webview has been created, this protocol won’t be available.

##### [§](#arguments)Arguments

* `uri_scheme` The URI scheme to register, such as `example`.
* `protocol` the protocol associated with the given URI scheme. It’s a function that takes an URL such as `example://localhost/asset.css`.

##### [§](#examples-8)Examples

```
use tauri::{plugin::{Builder, TauriPlugin}, Runtime};

fn init<R: Runtime>() -> TauriPlugin<R> {
  Builder::new("myplugin")
    .register_uri_scheme_protocol("myscheme", |_ctx, req| {
      http::Response::builder().body(Vec::new()).unwrap()
    })
    .build()
}
```

##### [§](#warning)Warning

Pages loaded from a custom protocol will have a different Origin on different platforms.
Servers which enforce CORS will need to add the exact same Origin header (or `*`) in `Access-Control-Allow-Origin`
if you wish to send requests with native `fetch` and `XmlHttpRequest` APIs. Here are the
different Origin headers across platforms:

* macOS, iOS and Linux: `<scheme_name>://localhost/<path>` (so it will be `my-scheme://localhost/path/to/page).
* Windows and Android: `http://<scheme_name>.localhost/<path>` by default (so it will be `http://my-scheme.localhost/path/to/page`).
  To use `https` instead of `http`, use [`super::webview::WebviewBuilder::use_https_scheme`](..\webview\struct.WebviewBuilder.html_method.use_https_scheme.md "method tauri::webview::WebviewBuilder::use_https_scheme").

[Source](../../src/tauri/plugin.rs.html#643-658)

#### pub fn [register\_asynchronous\_uri\_scheme\_protocol](#method.register_asynchronous_uri_scheme_protocol)<N: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, H: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([UriSchemeContext](..\struct.UriSchemeContext.html.md "struct tauri::UriSchemeContext")<'\_, R>, [Request](https://docs.rs/http/1.3.1/x86_64-unknown-linux-gnu/http/request/struct.Request.html "struct http::request::Request")<[Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)>>, [UriSchemeResponder](..\struct.UriSchemeResponder.html.md "struct tauri::UriSchemeResponder")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( self, uri\_scheme: N, protocol: H, ) -> Self

Similar to [`Self::register_uri_scheme_protocol`](struct.Builder.html_method.register_uri_scheme_protocol.md "method tauri::plugin::Builder::register_uri_scheme_protocol") but with an asynchronous responder that allows you
to process the request in a separate thread and respond asynchronously.

##### [§](#arguments-1)Arguments

* `uri_scheme` The URI scheme to register, such as `example`.
* `protocol` the protocol associated with the given URI scheme. It’s a function that takes an URL such as `example://localhost/asset.css`.

##### [§](#examples-9)Examples

```
use tauri::{plugin::{Builder, TauriPlugin}, Runtime};

fn init<R: Runtime>() -> TauriPlugin<R> {
  Builder::new("myplugin")
    .register_asynchronous_uri_scheme_protocol("app-files", |_ctx, request, responder| {
      // skip leading `/`
      let path = request.uri().path()[1..].to_string();
      std::thread::spawn(move || {
        if let Ok(data) = std::fs::read(path) {
          responder.respond(
            http::Response::builder()
              .body(data)
              .unwrap()
          );
        } else {
          responder.respond(
            http::Response::builder()
              .status(http::StatusCode::BAD_REQUEST)
              .header(http::header::CONTENT_TYPE, mime::TEXT_PLAIN.essence_str())
              .body("failed to read file".as_bytes().to_vec())
              .unwrap()
          );
        }
      });
    })
    .build()
}
```

##### [§](#warning-1)Warning

Pages loaded from a custom protocol will have a different Origin on different platforms.
Servers which enforce CORS will need to add the exact same Origin header (or `*`) in `Access-Control-Allow-Origin`
if you wish to send requests with native `fetch` and `XmlHttpRequest` APIs. Here are the
different Origin headers across platforms:

* macOS, iOS and Linux: `<scheme_name>://localhost/<path>` (so it will be `my-scheme://localhost/path/to/page).
* Windows and Android: `http://<scheme_name>.localhost/<path>` by default (so it will be `http://my-scheme.localhost/path/to/page`).
  To use `https` instead of `http`, use [`super::webview::WebviewBuilder::use_https_scheme`](..\webview\struct.WebviewBuilder.html_method.use_https_scheme.md "method tauri::webview::WebviewBuilder::use_https_scheme").

[Source](../../src/tauri/plugin.rs.html#661-680)

#### pub fn [try\_build](#method.try_build)(self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[TauriPlugin](struct.TauriPlugin.html.md "struct tauri::plugin::TauriPlugin")<R, C>, [BuilderError](enum.BuilderError.html.md "enum tauri::plugin::BuilderError")>

Builds the [`TauriPlugin`](struct.TauriPlugin.html.md "struct tauri::plugin::TauriPlugin").

[Source](../../src/tauri/plugin.rs.html#687-689)

#### pub fn [build](#method.build)(self) -> [TauriPlugin](struct.TauriPlugin.html.md "struct tauri::plugin::TauriPlugin")<R, C>

Builds the [`TauriPlugin`](struct.TauriPlugin.html.md "struct tauri::plugin::TauriPlugin").

##### [§](#panics)Panics

If the builder returns an error during [`Self::try_build`](struct.Builder.html_method.try_build.md "method tauri::plugin::Builder::try_build"), then this method will panic.

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-Builder%3CR,+C%3E)

### impl<R, C> [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [Builder](struct.Builder.html.md "struct tauri::plugin::Builder")<R, C>

[§](#impl-RefUnwindSafe-for-Builder%3CR,+C%3E)

### impl<R, C = [()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [Builder](struct.Builder.html.md "struct tauri::plugin::Builder")<R, C>

[§](#impl-Send-for-Builder%3CR,+C%3E)

### impl<R, C> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [Builder](struct.Builder.html.md "struct tauri::plugin::Builder")<R, C>

[§](#impl-Sync-for-Builder%3CR,+C%3E)

### impl<R, C = [()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> ![Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [Builder](struct.Builder.html.md "struct tauri::plugin::Builder")<R, C>

[§](#impl-Unpin-for-Builder%3CR,+C%3E)

### impl<R, C> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [Builder](struct.Builder.html.md "struct tauri::plugin::Builder")<R, C>

[§](#impl-UnwindSafe-for-Builder%3CR,+C%3E)

### impl<R, C = [()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [Builder](struct.Builder.html.md "struct tauri::plugin::Builder")<R, C>

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