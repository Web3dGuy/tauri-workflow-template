# Struct BuilderCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](../src/tauri/app.rs.html#1321-1375)

```
pub struct Builder<R: Runtime> { /* private fields */ }
```

Expand description

Builds a Tauri application.

## [§](#examples)Examples

```
tauri::Builder::default()
  // on an actual app, remove the string argument
  .run(tauri::generate_context!("test/fixture/src-tauri/tauri.conf.json"))
 .expect("error while running tauri application");
```

## Implementations[§](#implementations)

[Source](../src/tauri/app.rs.html#1405-1442)[§](#impl-Builder%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Builder](struct.Builder.html.md "struct tauri::Builder")<R>

[Source](../src/tauri/app.rs.html#1407-1441)

#### pub fn [new](#method.new)() -> Self

Creates a new App builder.

[Source](../src/tauri/app.rs.html#1444-2238)[§](#impl-Builder%3CR%3E-1)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Builder](struct.Builder.html.md "struct tauri::Builder")<R>

[Source](../src/tauri/app.rs.html#1453-1456)

#### pub fn [any\_thread](#method.any_thread)(self) -> Self

Available on **Windows or Linux** only.

Builds a new Tauri application running on any thread, bypassing the main thread requirement.

###### [§](#platform-specific)Platform-specific

* **macOS:** on macOS the application *must* be executed on the main thread, so this function is not exposed.

[Source](../src/tauri/app.rs.html#1473-1479)

#### pub fn [invoke\_handler](#method.invoke_handler)<F>(self, invoke\_handler: F) -> Self where F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([Invoke](ipc\struct.Invoke.html.md "struct tauri::ipc::Invoke")<R>) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static,

Defines the JS message handler callback.

##### [§](#examples-1)Examples

```
#[tauri::command]
fn command_1() -> String {
  return "hello world".to_string();
}
tauri::Builder::default()
  .invoke_handler(tauri::generate_handler![
    command_1,
    // etc...
  ]);
```

[Source](../src/tauri/app.rs.html#1500-1504)

#### pub fn [invoke\_system](#method.invoke_system)(self, initialization\_script: [String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")) -> Self

Defines a custom JS message system.

The `initialization_script` is a script that initializes `window.__TAURI_INTERNALS__.postMessage`.
That function must take the `(message: object, options: object)` arguments and send it to the backend.

Additionally, the script must include a `__INVOKE_KEY__` token that is replaced with a value that must be sent with the IPC payload
to check the integrity of the message by the [`crate::WebviewWindow::on_message`](webview\struct.WebviewWindow.html_method.on_message.md "method tauri::webview::WebviewWindow::on_message") API, e.g.

```
const invokeKey = __INVOKE_KEY__;
fetch('my-impl://command', {
  headers: {
    'Tauri-Invoke-Key': invokeKey,
  }
})
```

Note that the implementation details is up to your implementation.

[Source](../src/tauri/app.rs.html#1512-1520)

#### pub fn [channel\_interceptor](#method.channel_interceptor)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[Webview](webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>, [CallbackFn](ipc\struct.CallbackFn.html.md "struct tauri::ipc::CallbackFn"), [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), &[InvokeResponseBody](ipc\enum.InvokeResponseBody.html.md "enum tauri::ipc::InvokeResponseBody")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( self, interceptor: F, ) -> Self

Registers a channel interceptor that can overwrite the default channel implementation.

If the event has been consumed, it must return `true`.

The channel automatically orders the messages, so the third closure argument represents the message number.
The payload expected by the channel receiver is in the form of `{ id: usize, message: T }`.

[Source](../src/tauri/app.rs.html#1559-1567)

#### pub fn [append\_invoke\_initialization\_script](#method.append_invoke_initialization_script)( self, initialization\_script: impl [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>, ) -> Self

Append a custom initialization script.

Allow to append custom initialization script instend of replacing entire invoke system.

##### [§](#examples-2)Examples

```
let custom_script = r#"
// A custom call system bridge build on top of tauri invoke system.
async function invoke(cmd, args = {}) {
  if (!args) args = {};

  let prefix = "";

  if (args?.__module) {
    prefix = `plugin:hybridcall.${args.__module}|`;
  }

  const command = `${prefix}tauri_${cmd}`;

  const invoke = window.__TAURI_INTERNALS__.invoke;

  return invoke(command, args).then(result => {
    if (window.build.debug) {
      console.log(`call: ${command}`);
      console.log(`args: ${JSON.stringify(args)}`);
      console.log(`return: ${JSON.stringify(result)}`);
    }

    return result;
  });
}
"#;

tauri::Builder::default()
  .append_invoke_initialization_script(custom_script);
```

[Source](../src/tauri/app.rs.html#1587-1593)

#### pub fn [setup](#method.setup)<F>(self, setup: F) -> Self where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(&mut [App](struct.App.html.md "struct tauri::App")<R>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<dyn [Error](https://doc.rust-lang.org/nightly/core/error/trait.Error.html "trait core::error::Error")>> + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Defines the setup hook.

##### [§](#examples-3)Examples

```
use tauri::Manager;
tauri::Builder::default()
  .setup(|app| {
    let main_window = app.get_window("main").unwrap();
    main_window.set_title("Tauri!")?;
    Ok(())
  });
```

[Source](../src/tauri/app.rs.html#1597-1603)

#### pub fn [on\_page\_load](#method.on_page_load)<F>(self, on\_page\_load: F) -> Self where F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[Webview](webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>, &[PageLoadPayload](webview\struct.PageLoadPayload.html.md "struct tauri::webview::PageLoadPayload")<'\_>) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static,

Defines the page load hook.

[Source](../src/tauri/app.rs.html#1647-1650)

#### pub fn [plugin](#method.plugin)<P: [Plugin](plugin\trait.Plugin.html.md "trait tauri::plugin::Plugin")<R> + 'static>(self, plugin: P) -> Self

Adds a Tauri application plugin.

A plugin is created using the [`crate::plugin::Builder`](plugin\struct.Builder.html.md "struct tauri::plugin::Builder") struct.Check its documentation for more information.

##### [§](#examples-4)Examples

```
mod plugin {
  use tauri::{plugin::{Builder as PluginBuilder, TauriPlugin}, RunEvent, Runtime};

  // this command can be called in the frontend using `invoke('plugin:window|do_something')`.
  #[tauri::command]
  async fn do_something<R: Runtime>(app: tauri::AppHandle<R>, window: tauri::Window<R>) -> Result<(), String> {
    println!("command called");
    Ok(())
  }
  pub fn init<R: Runtime>() -> TauriPlugin<R> {
    PluginBuilder::new("window")
      .setup(|app, api| {
        // initialize the plugin here
        Ok(())
      })
      .on_event(|app, event| {
        match event {
          RunEvent::Ready => {
            println!("app is ready");
          }
          RunEvent::WindowEvent { label, event, .. } => {
            println!("window {} received an event: {:?}", label, event);
          }
          _ => (),
        }
      })
      .invoke_handler(tauri::generate_handler![do_something])
      .build()
  }
}

tauri::Builder::default()
  .plugin(plugin::init());
```

[Source](../src/tauri/app.rs.html#1731-1741)

#### pub fn [manage](#method.manage)<T>(self, state: T) -> Self where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static,

Add `state` to the state managed by the application.

This method can be called any number of times as long as each call
refers to a different `T`.

Managed state can be retrieved by any command handler via the
[`crate::State`](struct.State.html.md "struct tauri::State") guard. In particular, if a value of type `T`
is managed by Tauri, adding `State<T>` to the list of arguments in a
command handler instructs Tauri to retrieve the managed value.
Additionally, [`state`](trait.Manager.html_method.state.md "trait tauri::Manager") can be used to retrieve the value manually.

##### [§](#panics)Panics

Panics if state of type `T` is already being managed.

##### [§](#mutability)Mutability

Since the managed state is global and must be [`Send`](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [`Sync`](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync"), mutations can only happen through interior mutability:

```
use std::{collections::HashMap, sync::Mutex};
use tauri::State;
// here we use Mutex to achieve interior mutability
struct Storage {
  store: Mutex<HashMap<u64, String>>,
}
struct Connection;
struct DbConnection {
  db: Mutex<Option<Connection>>,
}

#[tauri::command]
fn connect(connection: State<DbConnection>) {
  // initialize the connection, mutating the state with interior mutability
  *connection.db.lock().unwrap() = Some(Connection {});
}

#[tauri::command]
fn storage_insert(key: u64, value: String, storage: State<Storage>) {
  // mutate the storage behind the Mutex
  storage.store.lock().unwrap().insert(key, value);
}

tauri::Builder::default()
  .manage(Storage { store: Default::default() })
  .manage(DbConnection { db: Default::default() })
  .invoke_handler(tauri::generate_handler![connect, storage_insert])
  // on an actual app, remove the string argument
  .run(tauri::generate_context!("test/fixture/src-tauri/tauri.conf.json"))
  .expect("error while running tauri application");
```

##### [§](#examples-5)Examples

```
use tauri::State;

struct MyInt(isize);
struct MyString(String);

#[tauri::command]
fn int_command(state: State<MyInt>) -> String {
    format!("The stateful int is: {}", state.0)
}

#[tauri::command]
fn string_command<'r>(state: State<'r, MyString>) {
    println!("state: {}", state.inner().0);
}

tauri::Builder::default()
  .manage(MyInt(10))
  .manage(MyString("Hello, managed state!".to_string()))
  .invoke_handler(tauri::generate_handler![int_command, string_command])
  // on an actual app, remove the string argument
  .run(tauri::generate_context!("test/fixture/src-tauri/tauri.conf.json"))
  .expect("error while running tauri application");
```

[Source](../src/tauri/app.rs.html#1765-1771)

#### pub fn [menu](#method.menu)<F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(&[AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>) -> [Result](type.Result.html.md "type tauri::Result")<[Menu](menu\struct.Menu.html.md "struct tauri::menu::Menu")<R>> + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>( self, f: F, ) -> Self

Sets the menu to use on all windows.

##### [§](#examples-6)Examples

```
use tauri::menu::{Menu, MenuItem, PredefinedMenuItem, Submenu};

tauri::Builder::default()
  .menu(|handle| Menu::with_items(handle, &[
    &Submenu::with_items(
      handle,
      "File",
      true,
      &[
        &PredefinedMenuItem::close_window(handle, None)?,
        #[cfg(target_os = "macos")]
        &MenuItem::new(handle, "Hello", true, None::<&str>)?,
      ],
    )?
  ]));
```

[Source](../src/tauri/app.rs.html#1788-1794)

#### pub fn [on\_menu\_event](#method.on_menu_event)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>, [MenuEvent](menu\struct.MenuEvent.html.md "struct tauri::menu::MenuEvent")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( self, f: F, ) -> Self

Registers an event handler for any menu event.

##### [§](#examples-7)Examples

```
use tauri::menu::*;

tauri::Builder::default()
  .on_menu_event(|app, event| {
     if event.id() == "quit" {
       app.exit(0);
     }
  });
```

[Source](../src/tauri/app.rs.html#1811-1817)

#### pub fn [on\_tray\_icon\_event](#method.on_tray_icon_event)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>, [TrayIconEvent](tray\enum.TrayIconEvent.html.md "enum tauri::tray::TrayIconEvent")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( self, f: F, ) -> Self

Available on **`desktop` and crate feature `tray-icon`** only.

Registers an event handler for any tray icon event.

##### [§](#examples-8)Examples

```
use tauri::Manager;

tauri::Builder::default()
  .on_tray_icon_event(|app, event| {
     let tray = app.tray_by_id(event.id()).expect("can't find tray icon");
     let _ = tray.set_visible(false);
  });
```

[Source](../src/tauri/app.rs.html#1827-1830)

#### pub fn [enable\_macos\_default\_menu](#method.enable_macos_default_menu)(self, enable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Enable or disable the default menu on macOS. Enabled by default.

##### [§](#examples-9)Examples

```
tauri::Builder::default()
  .enable_macos_default_menu(false);
```

[Source](../src/tauri/app.rs.html#1848-1854)

#### pub fn [on\_window\_event](#method.on_window_event)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[Window](window\struct.Window.html.md "struct tauri::window::Window")<R>, &[WindowEvent](enum.WindowEvent.html.md "enum tauri::WindowEvent")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( self, handler: F, ) -> Self

Registers a window event handler for all windows.

##### [§](#examples-10)Examples

```
tauri::Builder::default()
  .on_window_event(|window, event| match event {
    tauri::WindowEvent::Focused(focused) => {
      // hide window whenever it loses focus
      if !focused {
        window.hide().unwrap();
      }
    }
    _ => {}
  });
```

[Source](../src/tauri/app.rs.html#1869-1875)

#### pub fn [on\_webview\_event](#method.on_webview_event)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[Webview](webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>, &[WebviewEvent](enum.WebviewEvent.html.md "enum tauri::WebviewEvent")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( self, handler: F, ) -> Self

Registers a webview event handler for all webviews.

##### [§](#examples-11)Examples

```
tauri::Builder::default()
  .on_webview_event(|window, event| match event {
    tauri::WebviewEvent::DragDrop(event) => {
      println!("{:?}", event);
    }
    _ => {}
  });
```

[Source](../src/tauri/app.rs.html#1918-1939)

#### pub fn [register\_uri\_scheme\_protocol](#method.register_uri_scheme_protocol)<N: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, T: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'static, [[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)]>>, H: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([UriSchemeContext](struct.UriSchemeContext.html.md "struct tauri::UriSchemeContext")<'\_, R>, [Request](https://docs.rs/http/1.3.1/x86_64-unknown-linux-gnu/http/request/struct.Request.html "struct http::request::Request")<[Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)>>) -> [Response](https://docs.rs/http/1.3.1/x86_64-unknown-linux-gnu/http/response/struct.Response.html "struct http::response::Response")<T> + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( self, uri\_scheme: N, protocol: H, ) -> Self

Registers a URI scheme protocol available to all webviews.

Leverages [setURLSchemeHandler](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/2875766-seturlschemehandler) on macOS,
[AddWebResourceRequestedFilter](https://docs.microsoft.com/en-us/dotnet/api/microsoft.web.webview2.core.corewebview2.addwebresourcerequestedfilter?view=webview2-dotnet-1.0.774.44) on Windows
and [webkit-web-context-register-uri-scheme](https://webkitgtk.org/reference/webkit2gtk/stable/WebKitWebContext.html#webkit-web-context-register-uri-scheme) on Linux.

##### [§](#arguments)Arguments

* `uri_scheme` The URI scheme to register, such as `example`.
* `protocol` the protocol associated with the given URI scheme. It’s a function that takes a request and returns a response.

##### [§](#examples-12)Examples

```
tauri::Builder::default()
  .register_uri_scheme_protocol("app-files", |_ctx, request| {
    // skip leading `/`
    if let Ok(data) = std::fs::read(&request.uri().path()[1..]) {
      http::Response::builder()
        .body(data)
        .unwrap()
    } else {
      http::Response::builder()
        .status(http::StatusCode::BAD_REQUEST)
        .header(http::header::CONTENT_TYPE, mime::TEXT_PLAIN.essence_str())
        .body("failed to read file".as_bytes().to_vec())
        .unwrap()
    }
  });
```

##### [§](#warning)Warning

Pages loaded from a custom protocol will have a different Origin on different platforms.
Servers which enforce CORS will need to add the exact same Origin header (or `*`) in `Access-Control-Allow-Origin`
if you wish to send requests with native `fetch` and `XmlHttpRequest` APIs. Here are the
different Origin headers across platforms:

* macOS, iOS and Linux: `<scheme_name>://localhost/<path>` (so it will be `my-scheme://localhost/path/to/page).
* Windows and Android: `http://<scheme_name>.localhost/<path>` by default (so it will be `http://my-scheme.localhost/path/to/page`).
  To use `https` instead of `http`, use [`super::webview::WebviewBuilder::use_https_scheme`](webview\struct.WebviewBuilder.html_method.use_https_scheme.md "method tauri::webview::WebviewBuilder::use_https_scheme").

[Source](../src/tauri/app.rs.html#1986-2001)

#### pub fn [register\_asynchronous\_uri\_scheme\_protocol](#method.register_asynchronous_uri_scheme_protocol)<N: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>, H: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")([UriSchemeContext](struct.UriSchemeContext.html.md "struct tauri::UriSchemeContext")<'\_, R>, [Request](https://docs.rs/http/1.3.1/x86_64-unknown-linux-gnu/http/request/struct.Request.html "struct http::request::Request")<[Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)>>, [UriSchemeResponder](struct.UriSchemeResponder.html.md "struct tauri::UriSchemeResponder")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static>( self, uri\_scheme: N, protocol: H, ) -> Self

Similar to [`Self::register_uri_scheme_protocol`](struct.Builder.html_method.register_uri_scheme_protocol.md "method tauri::Builder::register_uri_scheme_protocol") but with an asynchronous responder that allows you
to process the request in a separate thread and respond asynchronously.

##### [§](#arguments-1)Arguments

* `uri_scheme` The URI scheme to register, such as `example`.
* `protocol` the protocol associated with the given URI scheme. It’s a function that takes an URL such as `example://localhost/asset.css`.

##### [§](#examples-13)Examples

```
tauri::Builder::default()
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
  });
```

##### [§](#warning-1)Warning

Pages loaded from a custom protocol will have a different Origin on different platforms.
Servers which enforce CORS will need to add the exact same Origin header (or `*`) in `Access-Control-Allow-Origin`
if you wish to send requests with native `fetch` and `XmlHttpRequest` APIs. Here are the
different Origin headers across platforms:

* macOS, iOS and Linux: `<scheme_name>://localhost/<path>` (so it will be `my-scheme://localhost/path/to/page).
* Windows and Android: `http://<scheme_name>.localhost/<path>` by default (so it will be `http://my-scheme.localhost/path/to/page`).
  To use `https` instead of `http`, use [`super::webview::WebviewBuilder::use_https_scheme`](webview\struct.WebviewBuilder.html_method.use_https_scheme.md "method tauri::webview::WebviewBuilder::use_https_scheme").

[Source](../src/tauri/app.rs.html#2020-2023)

#### pub fn [device\_event\_filter](#method.device_event_filter)(self, filter: [DeviceEventFilter](enum.DeviceEventFilter.html.md "enum tauri::DeviceEventFilter")) -> Self

Change the device event filter mode.

Since the DeviceEvent capture can lead to high CPU usage for unfocused windows, [`tao`](https://crates.io/crates/tao)
will ignore them by default for unfocused windows on Windows. This method allows changing
the filter to explicitly capture them again.

###### [§](#platform-specific-1)Platform-specific

* \*\* Linux / macOS / iOS / Android\*\*: Unsupported.

##### [§](#examples-14)Examples

```
tauri::Builder::default()
  .device_event_filter(tauri::DeviceEventFilter::Always);
```

[Source](../src/tauri/app.rs.html#2031-2228)

#### pub fn [build](#method.build)(self, context: [Context](struct.Context.html.md "struct tauri::Context")<R>) -> [Result](type.Result.html.md "type tauri::Result")<[App](struct.App.html.md "struct tauri::App")<R>>

Builds the application.

[Source](../src/tauri/app.rs.html#2234-2237)

#### pub fn [run](#method.run)(self, context: [Context](struct.Context.html.md "struct tauri::Context")<R>) -> [Result](type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Builds the configured application and runs it.

This is a shorthand for [`Self::build`](struct.Builder.html_method.build.md "method tauri::Builder::build") followed by [`App::run`](struct.App.html_method.run.md "method tauri::App::run").
For more flexibility, consider using those functions manually.

## Trait Implementations[§](#trait-implementations)

[Source](../src/tauri/app.rs.html#1391-1395)[§](#impl-Default-for-Builder%3CWry%3CEventLoopMessage%3E%3E)

### impl [Default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html "trait core::default::Default") for [Builder](struct.Builder.html.md "struct tauri::Builder")<[Wry](type.Wry.html.md "type tauri::Wry")>

Available on **crate feature `wry`** only.

Make `Wry` the default `Runtime` for `Builder`

[Source](../src/tauri/app.rs.html#1392-1394)[§](#method.default)

#### fn [default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html#tymethod.default)() -> Self

Returns the “default value” for a type. [Read more](https://doc.rust-lang.org/nightly/core/default/trait.Default.html#tymethod.default)

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-Builder%3CR%3E)

### impl<R> ![Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [Builder](struct.Builder.html.md "struct tauri::Builder")<R>

[§](#impl-RefUnwindSafe-for-Builder%3CR%3E)

### impl<R> ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [Builder](struct.Builder.html.md "struct tauri::Builder")<R>

[§](#impl-Send-for-Builder%3CR%3E)

### impl<R> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [Builder](struct.Builder.html.md "struct tauri::Builder")<R>

[§](#impl-Sync-for-Builder%3CR%3E)

### impl<R> ![Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [Builder](struct.Builder.html.md "struct tauri::Builder")<R>

[§](#impl-Unpin-for-Builder%3CR%3E)

### impl<R> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [Builder](struct.Builder.html.md "struct tauri::Builder")<R>

[§](#impl-UnwindSafe-for-Builder%3CR%3E)

### impl<R> ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [Builder](struct.Builder.html.md "struct tauri::Builder")<R>

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