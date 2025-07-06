# Crate tauriCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](../src/tauri/lib.rs.html#5-1266)

Expand description

Tauri is a framework for building tiny, blazing fast binaries for all major desktop platforms.
Developers can integrate any front-end framework that compiles to HTML, JS and CSS for building their user interface.
The backend of the application is a rust-sourced binary with an API that the front-end can interact with.

## [§](#cargo-features)Cargo features

The following are a list of [Cargo features](https://doc.rust-lang.org/stable/cargo/reference/manifest.html#the-features-section) that can be enabled or disabled:

* **wry** *(enabled by default)*: Enables the [wry](https://github.com/tauri-apps/wry) runtime. Only disable it if you want a custom runtime.
* **common-controls-v6** *(enabled by default)*: Enables [Common Controls v6](https://learn.microsoft.com/en-us/windows/win32/controls/common-control-versions) support on Windows, mainly for the predefined `about` menu item.
* **unstable**: Enables unstable features. Be careful, it might introduce breaking changes in future minor releases.
* **tracing**: Enables [`tracing`](https://docs.rs/tracing/latest/tracing) for window startup, plugins, `Window::eval`, events, IPC, updater and custom protocol request handlers.
* **test**: Enables the [`test`](test\index.html.md "mod tauri::test") module exposing unit test helpers.
* **objc-exception**: This feature flag is no-op since 2.3.0.
* **linux-libxdo**: Enables linking to libxdo which enables Cut, Copy, Paste and SelectAll menu items to work on Linux.
* **isolation**: Enables the isolation pattern. Enabled by default if the `app > security > pattern > use` config option is set to `isolation` on the `tauri.conf.json` file.
* **custom-protocol**: Feature managed by the Tauri CLI. When enabled, Tauri assumes a production environment instead of a development one.
* **devtools**: Enables the developer tools (Web inspector) and [`window::Window`](window\struct.Window.html_method.open_devtools.md "struct tauri::window::Window"). Enabled by default on debug builds.
  On macOS it uses private APIs, so you can’t enable it if your app will be published to the App Store.
* **native-tls**: Provides TLS support to connect over HTTPS.
* **native-tls-vendored**: Compile and statically link to a vendored copy of OpenSSL.
* **rustls-tls**: Provides TLS support to connect over HTTPS using rustls.
* **process-relaunch-dangerous-allow-symlink-macos**: Allows the [`process::current_binary`](process\fn.current_binary.html.md "fn tauri::process::current_binary") function to allow symlinks on macOS (this is dangerous, see the Security section in the documentation website).
* **tray-icon**: Enables application tray icon APIs. Enabled by default if the `trayIcon` config is defined on the `tauri.conf.json` file.
* **macos-private-api**: Enables features only available in **macOS**’s private APIs, currently the `transparent` window functionality and the `fullScreenEnabled` preference setting to `true`. Enabled by default if the `tauri > macosPrivateApi` config flag is set to `true` on the `tauri.conf.json` file.
* **webview-data-url**: Enables usage of data URLs on the webview.
* **compression** \*(enabled by default): Enables asset compression. You should only disable this if you want faster compile times in release builds - it produces larger binaries.
* **config-json5**: Adds support to JSON5 format for `tauri.conf.json`.
* **config-toml**: Adds support to TOML format for the configuration `Tauri.toml`.
* **image-ico**: Adds support to parse `.ico` image, see [`Image`].
* **image-png**: Adds support to parse `.png` image, see [`Image`].
* **macos-proxy**: Adds support for [`WebviewBuilder::proxy_url`](webview\struct.WebviewBuilder.html_method.proxy_url.md "method tauri::webview::WebviewBuilder::proxy_url") on macOS. Requires macOS 14+.
* **specta**: Add support for [`specta::specta`](https://docs.rs/specta/%5E2.0.0-rc.9/specta/attr.specta.html) with Tauri arguments such as [`State`](struct.State.html.md "struct tauri::State"), [`Window`](window\struct.Window.html.md "struct tauri::window::Window") and [`AppHandle`](struct.AppHandle.html.md "struct tauri::AppHandle")

### [§](#cargo-allowlist-features)Cargo allowlist features

The following are a list of [Cargo features](https://doc.rust-lang.org/stable/cargo/reference/manifest.html#the-features-section) that enables commands for Tauri’s API package.
These features are automatically enabled by the Tauri CLI based on the `allowlist` configuration under `tauri.conf.json`.

#### [§](#protocol-allowlist)Protocol allowlist

* **protocol-asset**: Enables the `asset` custom protocol.

## Re-exports[§](#reexports)

`pub use self::webview::Webview;`

`pub use self::webview::WebviewWindow;`

`pub use self::webview::WebviewWindowBuilder;`

`pub use self::window::Monitor;`

`pub use self::window::Window;`

`pub use self::webview::WebviewBuilder;``unstable`

`pub use self::window::WindowBuilder;``unstable`

`pub use tauri_utils as utils;`

`pub use http;`

`pub use scope::*;`

## Modules[§](#modules)

[async\_runtime](async_runtime\index.html.md "mod tauri::async_runtime")
:   The singleton async runtime used by Tauri and exposed to users.

[image](image\index.html.md "mod tauri::image")
:   Image types used by this crate and also referenced by the JavaScript API layer.

[ipc](ipc\index.html.md "mod tauri::ipc")
:   Types and functions related to Inter Procedure Call(IPC).

[menu](menu\index.html.md "mod tauri::menu")`desktop`
:   Menu types and utilities.

[path](path\index.html.md "mod tauri::path")
:   Path APIs.

[plugin](plugin\index.html.md "mod tauri::plugin")
:   The Tauri plugin extension to expand Tauri functionality.

[process](process\index.html.md "mod tauri::process")
:   Types and functions related to child processes management.

[scope](scope\index.html.md "mod tauri::scope")
:   The allowlist scopes.

[test](test\index.html.md "mod tauri::test")`test`
:   Utilities for unit testing on Tauri applications.

[tray](tray\index.html.md "mod tauri::tray")`desktop` and `tray-icon`
:   Tray icon types and utilities.

[webview](webview\index.html.md "mod tauri::webview")
:   The Tauri webview types and functions.

[window](window\index.html.md "mod tauri::window")
:   The Tauri window types and functions.

## Macros[§](#macros)

[generate\_context](macro.generate_context.html.md "macro tauri::generate_context")
:   Reads the config file at compile time and generates a [`Context`](struct.Context.html.md "struct tauri::Context") based on its content.

[generate\_handler](macro.generate_handler.html.md "macro tauri::generate_handler")
:   Accepts a list of command functions. Creates a handler that allows commands to be called from JS with invoke().

[include\_image](macro.include_image.html.md "macro tauri::include_image")
:   Convert a .png or .ico icon to an Image
    for things like `tauri::tray::TrayIconBuilder` to consume,
    relative paths are resolved from `CARGO_MANIFEST_DIR`, not current file

[tauri\_build\_context](macro.tauri_build_context.html.md "macro tauri::tauri_build_context")
:   Include a [`Context`](struct.Context.html.md "struct tauri::Context") that was generated by [`tauri-build`](https://docs.rs/tauri-build) inside your build script.

## Structs[§](#structs)

[App](struct.App.html.md "struct tauri::App")
:   The instance of the currently running application.

[AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")
:   A handle to the currently running application.

[Asset](struct.Asset.html.md "struct tauri::Asset")
:   A resolved asset.

[AssetResolver](struct.AssetResolver.html.md "struct tauri::AssetResolver")
:   The asset resolver is a helper to access the [`tauri_utils::assets::Assets`] interface.

[Builder](struct.Builder.html.md "struct tauri::Builder")
:   Builds a Tauri application.

[CloseRequestApi](struct.CloseRequestApi.html.md "struct tauri::CloseRequestApi")
:   Api exposed on the `CloseRequested` event.

[Config](struct.Config.html.md "struct tauri::Config")
:   The Tauri configuration object.
    It is read from a file where you can define your frontend assets,
    configure the bundler and define a tray icon.

[Context](struct.Context.html.md "struct tauri::Context")
:   User supplied data required inside of a Tauri application.

[Env](struct.Env.html.md "struct tauri::Env")
:   Information about environment variables.

[Event](struct.Event.html.md "struct tauri::Event")
:   An event that was emitted.

[ExitRequestApi](struct.ExitRequestApi.html.md "struct tauri::ExitRequestApi")
:   Api exposed on the `ExitRequested` event.

[LogicalPosition](struct.LogicalPosition.html.md "struct tauri::LogicalPosition")
:   A position represented in logical pixels.

[LogicalSize](struct.LogicalSize.html.md "struct tauri::LogicalSize")
:   A size represented in logical pixels.

[PackageInfo](struct.PackageInfo.html.md "struct tauri::PackageInfo")
:   `tauri::App` package information.

[PhysicalPosition](struct.PhysicalPosition.html.md "struct tauri::PhysicalPosition")
:   A position represented in physical pixels.

[PhysicalSize](struct.PhysicalSize.html.md "struct tauri::PhysicalSize")
:   A size represented in physical pixels.

[Rect](struct.Rect.html.md "struct tauri::Rect")
:   A rectangular region.

[ResourceTable](struct.ResourceTable.html.md "struct tauri::ResourceTable")
:   Map-like data structure storing Tauri’s resources (equivalent to file
    descriptors).

[State](struct.State.html.md "struct tauri::State")
:   A guard for a state value.

[StateManager](struct.StateManager.html.md "struct tauri::StateManager")
:   The Tauri state manager.

[UriSchemeContext](struct.UriSchemeContext.html.md "struct tauri::UriSchemeContext")
:   Uri scheme protocol context

[UriSchemeResponder](struct.UriSchemeResponder.html.md "struct tauri::UriSchemeResponder")
:   Async uri scheme protocol responder.

[Url](struct.Url.html.md "struct tauri::Url")
:   A parsed URL record.

[WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")
:   The attributes used to create an webview.

[WindowSizeConstraints](struct.WindowSizeConstraints.html.md "struct tauri::WindowSizeConstraints")
:   Window size constraints

## Enums[§](#enums)

[CursorIcon](enum.CursorIcon.html.md "enum tauri::CursorIcon")
:   Describes the appearance of the mouse cursor.

[DeviceEventFilter](enum.DeviceEventFilter.html.md "enum tauri::DeviceEventFilter")

[DragDropEvent](enum.DragDropEvent.html.md "enum tauri::DragDropEvent")
:   The drag drop event payload.

[Error](enum.Error.html.md "enum tauri::Error")
:   Runtime errors that can happen inside a Tauri application.

[EventLoopMessage](enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")
:   The user event type.

[EventTarget](enum.EventTarget.html.md "enum tauri::EventTarget")
:   Event Target

[Pattern](enum.Pattern.html.md "enum tauri::Pattern")
:   An application pattern.

[Position](enum.Position.html.md "enum tauri::Position")
:   A position that’s either physical or logical.

[RunEvent](enum.RunEvent.html.md "enum tauri::RunEvent")
:   An application event, triggered from the event loop.

[Size](enum.Size.html.md "enum tauri::Size")
:   A size that’s either physical or logical.

[Theme](enum.Theme.html.md "enum tauri::Theme")
:   System theme.

[UserAttentionType](enum.UserAttentionType.html.md "enum tauri::UserAttentionType")
:   Type of user attention requested on a window.

[WebviewEvent](enum.WebviewEvent.html.md "enum tauri::WebviewEvent")
:   An event from a window.

[WebviewUrl](enum.WebviewUrl.html.md "enum tauri::WebviewUrl")
:   An URL to open on a Tauri webview window.

[WindowEvent](enum.WindowEvent.html.md "enum tauri::WindowEvent")
:   An event from a window.

## Constants[§](#constants)

[RESTART\_EXIT\_CODE](constant.RESTART_EXIT_CODE.html.md "constant tauri::RESTART_EXIT_CODE")
:   The exit code on [`RunEvent::ExitRequested`](enum.RunEvent.html_variant.ExitRequested.md "variant tauri::RunEvent::ExitRequested") when [`AppHandle`](struct.AppHandle.html_method.restart.md "struct tauri::AppHandle") is called.

[VERSION](constant.VERSION.html.md "constant tauri::VERSION")
:   The Tauri version.

## Traits[§](#traits)

[Assets](trait.Assets.html.md "trait tauri::Assets")
:   Represents a container of file assets that are retrievable during runtime.

[Emitter](trait.Emitter.html.md "trait tauri::Emitter")
:   Emit events.

[Listener](trait.Listener.html.md "trait tauri::Listener")
:   Listen to events.

[Manager](trait.Manager.html.md "trait tauri::Manager")
:   Manages a running application.

[Pixel](trait.Pixel.html.md "trait tauri::Pixel")

[Resource](trait.Resource.html.md "trait tauri::Resource")
:   Resources are Rust objects that are stored in [ResourceTable](struct.ResourceTable.html.md "struct tauri::ResourceTable") and managed by tauri.
    They are identified in JS by a numeric ID (the resource ID, or rid).
    Resources can be created in commands. Resources can also be retrieved in commands by
    their rid. Resources are thread-safe.

[Runtime](trait.Runtime.html.md "trait tauri::Runtime")
:   The webview runtime interface. A wrapper around [`runtime::Runtime`](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime") with the proper user event type associated.

[RuntimeHandle](trait.RuntimeHandle.html.md "trait tauri::RuntimeHandle")
:   The webview runtime handle. A wrapper arond [`runtime::RuntimeHandle`](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.RuntimeHandle.html "trait tauri_runtime::RuntimeHandle") with the proper user event type associated.

## Functions[§](#functions)

[is\_dev](fn.is_dev.html.md "fn tauri::is_dev")
:   Whether we are running in development mode or not.

[webview\_version](fn.webview_version.html.md "fn tauri::webview_version")`wry`
:   Get WebView/Webkit version on current platform.

## Type Aliases[§](#types)

[EventId](type.EventId.html.md "type tauri::EventId")
:   Unique id of an event.

[ResourceId](type.ResourceId.html.md "type tauri::ResourceId")
:   A `ResourceId` is an integer value referencing a resource. It could be
    considered to be the tauri equivalent of a `file descriptor` in POSIX like
    operating systems.

[Result](type.Result.html.md "type tauri::Result")
:   `Result<T, ::tauri::Error>`

[SyncTask](type.SyncTask.html.md "type tauri::SyncTask")
:   A task to run on the main thread.

[Wry](type.Wry.html.md "type tauri::Wry")`wry`
:   A Tauri [`Runtime`](trait.Runtime.html.md "trait tauri::Runtime") wrapper around wry.

[WryHandle](type.WryHandle.html.md "type tauri::WryHandle")`wry`
:   A Tauri [`RuntimeHandle`](trait.RuntimeHandle.html.md "trait tauri::RuntimeHandle") wrapper around wry.

## Attribute Macros[§](#attributes)

[command](attr.command.html.md "attr tauri::command")
:   Mark a function as a command handler. It creates a wrapper function with the necessary glue code.

{"&[u8]":"<h3>Notable traits for <code>&amp;[<a class=\"primitive\" href=\"https://doc.rust-lang.org/nightly/std/primitive.u8.html\">u8</a>]</code></h3><pre><code><div class=\"where\">impl <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/std/io/trait.Read.html\" title=\"trait std::io::Read\">Read</a> for &amp;[<a class=\"primitive\" href=\"https://doc.rust-lang.org/nightly/std/primitive.u8.html\">u8</a>]</div>"}