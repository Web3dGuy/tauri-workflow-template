# Trait PluginCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/plugin.rs.html#36-89)

```
pub trait Plugin<R: Runtime>: Send {
    // Required method
    fn name(&self) -> &'static str;

    // Provided methods
    fn initialize(
        &mut self,
        app: &AppHandle<R>,
        config: JsonValue,
    ) -> Result<(), Box<dyn Error>> { ... }
    fn initialization_script(&self) -> Option<String> { ... }
    fn window_created(&mut self, window: Window<R>) { ... }
    fn webview_created(&mut self, webview: Webview<R>) { ... }
    fn on_navigation(&mut self, webview: &Webview<R>, url: &Url) -> bool { ... }
    fn on_page_load(
        &mut self,
        webview: &Webview<R>,
        payload: &PageLoadPayload<'_>,
    ) { ... }
    fn on_event(&mut self, app: &AppHandle<R>, event: &RunEvent) { ... }
    fn extend_api(&mut self, invoke: Invoke<R>) -> bool { ... }
}
```

Expand description

The plugin interface.

## Required Methods[§](#required-methods)

[Source](../../src/tauri/plugin.rs.html#38)

#### fn [name](#tymethod.name)(&self) -> &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

The plugin name. Used as key on the plugin config object.

## Provided Methods[§](#provided-methods)

[Source](../../src/tauri/plugin.rs.html#42-48)

#### fn [initialize](#method.initialize)( &mut self, app: &[AppHandle](..\struct.AppHandle.html.md "struct tauri::AppHandle")<R>, config: [JsonValue](https://docs.rs/serde_json/1.0.140/x86_64-unknown-linux-gnu/serde_json/value/enum.Value.html "enum serde_json::value::Value"), ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<dyn [Error](https://doc.rust-lang.org/nightly/core/error/trait.Error.html "trait core::error::Error")>>

Initializes the plugin.

[Source](../../src/tauri/plugin.rs.html#58-60)

#### fn [initialization\_script](#method.initialization_script)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>

Add the provided JavaScript to a list of scripts that should be run after the global object has been created,
but before the HTML document has been parsed and before any other script included by the HTML document is run.

Since it runs on all top-level document and child frame page navigations,
it’s recommended to check the `window.location` to guard your script from running on unexpected origins.

The script is wrapped into its own context with `(function () { /* your script here */ })();`,
so global variables must be assigned to `window` instead of implicitly declared.

[Source](../../src/tauri/plugin.rs.html#64)

#### fn [window\_created](#method.window_created)(&mut self, window: [Window](..\window\struct.Window.html.md "struct tauri::window::Window")<R>)

Callback invoked when the window is created.

[Source](../../src/tauri/plugin.rs.html#68)

#### fn [webview\_created](#method.webview_created)(&mut self, webview: [Webview](..\webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>)

Callback invoked when the webview is created.

[Source](../../src/tauri/plugin.rs.html#72-74)

#### fn [on\_navigation](#method.on_navigation)(&mut self, webview: &[Webview](..\webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>, url: &[Url](..\struct.Url.html.md "struct tauri::Url")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Callback invoked when webview tries to navigate to the given Url. Returning falses cancels navigation.

[Source](../../src/tauri/plugin.rs.html#78)

#### fn [on\_page\_load](#method.on_page_load)(&mut self, webview: &[Webview](..\webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>, payload: &[PageLoadPayload](..\webview\struct.PageLoadPayload.html.md "struct tauri::webview::PageLoadPayload")<'\_>)

Callback invoked when the webview performs a navigation to a page.

[Source](../../src/tauri/plugin.rs.html#82)

#### fn [on\_event](#method.on_event)(&mut self, app: &[AppHandle](..\struct.AppHandle.html.md "struct tauri::AppHandle")<R>, event: &[RunEvent](..\enum.RunEvent.html.md "enum tauri::RunEvent"))

Callback invoked when the event loop receives a new event.

[Source](../../src/tauri/plugin.rs.html#86-88)

#### fn [extend\_api](#method.extend_api)(&mut self, invoke: [Invoke](..\ipc\struct.Invoke.html.md "struct tauri::ipc::Invoke")<R>) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Extend commands to [`crate::Builder::invoke_handler`](..\struct.Builder.html_method.invoke_handler.md "method tauri::Builder::invoke_handler").

## Implementors[§](#implementors)

[Source](../../src/tauri/plugin.rs.html#716-780)[§](#impl-Plugin%3CR%3E-for-TauriPlugin%3CR,+C%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"), C: [DeserializeOwned](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.DeserializeOwned.html "trait serde::de::DeserializeOwned")> [Plugin](trait.Plugin.html.md "trait tauri::plugin::Plugin")<R> for [TauriPlugin](struct.TauriPlugin.html.md "struct tauri::plugin::TauriPlugin")<R, C>