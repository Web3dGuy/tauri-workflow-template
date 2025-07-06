# Struct WebviewAttributesCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#197)

```
pub struct WebviewAttributes {Show 25 fields
    pub url: WebviewUrl,
    pub user_agent: Option<String>,
    pub initialization_scripts: Vec<String>,
    pub data_directory: Option<PathBuf>,
    pub drag_drop_handler_enabled: bool,
    pub clipboard: bool,
    pub accept_first_mouse: bool,
    pub additional_browser_args: Option<String>,
    pub window_effects: Option<WindowEffectsConfig>,
    pub incognito: bool,
    pub transparent: bool,
    pub focus: bool,
    pub bounds: Option<Rect>,
    pub auto_resize: bool,
    pub proxy_url: Option<Url>,
    pub zoom_hotkeys_enabled: bool,
    pub browser_extensions_enabled: bool,
    pub extensions_path: Option<PathBuf>,
    pub data_store_identifier: Option<[u8; 16]>,
    pub use_https_scheme: bool,
    pub devtools: Option<bool>,
    pub background_color: Option<Color>,
    pub traffic_light_position: Option<Position>,
    pub background_throttling: Option<BackgroundThrottlingPolicy>,
    pub javascript_disabled: bool,
}
```

Expand description

The attributes used to create an webview.

## Fields[§](#fields)

[§](#structfield.url)`url: WebviewUrl`[§](#structfield.user_agent)`user_agent: Option<String>`[§](#structfield.initialization_scripts)`initialization_scripts: Vec<String>`[§](#structfield.data_directory)`data_directory: Option<PathBuf>`[§](#structfield.drag_drop_handler_enabled)`drag_drop_handler_enabled: bool`[§](#structfield.clipboard)`clipboard: bool`[§](#structfield.accept_first_mouse)`accept_first_mouse: bool`[§](#structfield.additional_browser_args)`additional_browser_args: Option<String>`[§](#structfield.window_effects)`window_effects: Option<WindowEffectsConfig>`[§](#structfield.incognito)`incognito: bool`[§](#structfield.transparent)`transparent: bool`[§](#structfield.focus)`focus: bool`[§](#structfield.bounds)`bounds: Option<Rect>`[§](#structfield.auto_resize)`auto_resize: bool`[§](#structfield.proxy_url)`proxy_url: Option<Url>`[§](#structfield.zoom_hotkeys_enabled)`zoom_hotkeys_enabled: bool`[§](#structfield.browser_extensions_enabled)`browser_extensions_enabled: bool`[§](#structfield.extensions_path)`extensions_path: Option<PathBuf>`[§](#structfield.data_store_identifier)`data_store_identifier: Option<[u8; 16]>`[§](#structfield.use_https_scheme)`use_https_scheme: bool`[§](#structfield.devtools)`devtools: Option<bool>`[§](#structfield.background_color)`background_color: Option<Color>`[§](#structfield.traffic_light_position)`traffic_light_position: Option<Position>`[§](#structfield.background_throttling)`background_throttling: Option<BackgroundThrottlingPolicy>`[§](#structfield.javascript_disabled)`javascript_disabled: bool`

## Implementations[§](#implementations)

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#271)[§](#impl-WebviewAttributes)

### impl [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#273)

#### pub fn [new](#method.new)(url: [WebviewUrl](enum.WebviewUrl.html.md "enum tauri::WebviewUrl")) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Initializes the default attributes for a webview.

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#305)

#### pub fn [user\_agent](#method.user_agent)(self, user\_agent: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Sets the user agent

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#312)

#### pub fn [initialization\_script](#method.initialization_script)(self, script: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Sets the init script.

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#319)

#### pub fn [data\_directory](#method.data_directory)(self, data\_directory: [PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Data directory for the webview.

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#326)

#### pub fn [disable\_drag\_drop\_handler](#method.disable_drag_drop_handler)(self) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Disables the drag and drop handler. This is required to use HTML5 drag and drop APIs on the frontend on Windows.

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#336)

#### pub fn [enable\_clipboard\_access](#method.enable_clipboard_access)(self) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Enables clipboard access for the page rendered on **Linux** and **Windows**.

**macOS** doesn’t provide such method and is always enabled by default,
but you still need to add menu item accelerators to use shortcuts.

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#343)

#### pub fn [accept\_first\_mouse](#method.accept_first_mouse)(self, accept: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Sets whether clicking an inactive window also clicks through to the webview.

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#350)

#### pub fn [additional\_browser\_args](#method.additional_browser_args)(self, additional\_args: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Sets additional browser arguments. **Windows Only**

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#357)

#### pub fn [window\_effects](#method.window_effects)(self, effects: [WindowEffectsConfig](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowEffectsConfig.html "struct tauri_utils::config::WindowEffectsConfig")) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Sets window effects

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#364)

#### pub fn [incognito](#method.incognito)(self, incognito: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Enable or disable incognito mode for the WebView.

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#372)

#### pub fn [transparent](#method.transparent)(self, transparent: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Enable or disable transparency for the WebView.

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#379)

#### pub fn [focused](#method.focused)(self, focus: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Whether the webview should be focused or not.

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#386)

#### pub fn [auto\_resize](#method.auto_resize)(self) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Sets the webview to automatically grow and shrink its size and position when the parent window resizes.

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#393)

#### pub fn [proxy\_url](#method.proxy_url)(self, url: [Url](struct.Url.html.md "struct tauri::Url")) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Enable proxy for the WebView

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#408)

#### pub fn [zoom\_hotkeys\_enabled](#method.zoom_hotkeys_enabled)(self, enabled: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Whether page zooming by hotkeys is enabled

###### [§](#platform-specific)Platform-specific:

* **Windows**: Controls WebView2’s [`IsZoomControlEnabled`](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/winrt/microsoft_web_webview2_core/corewebview2settings?view=webview2-winrt-1.0.2420.47#iszoomcontrolenabled) setting.
* **MacOS / Linux**: Injects a polyfill that zooms in and out with `ctrl/command` + `-/=`,
  20% in each step, ranging from 20% to 1000%. Requires `webview:allow-set-webview-zoom` permission
* **Android / iOS**: Unsupported.

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#420)

#### pub fn [browser\_extensions\_enabled](#method.browser_extensions_enabled)(self, enabled: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Whether browser extensions can be installed for the webview process

###### [§](#platform-specific-1)Platform-specific:

* **Windows**: Enables the WebView2 environment’s [`AreBrowserExtensionsEnabled`](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/winrt/microsoft_web_webview2_core/corewebview2environmentoptions?view=webview2-winrt-1.0.2739.15#arebrowserextensionsenabled)
* **MacOS / Linux / iOS / Android** - Unsupported.

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#435)

#### pub fn [use\_https\_scheme](#method.use_https_scheme)(self, enabled: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Sets whether the custom protocols should use `https://<scheme>.localhost` instead of the default `http://<scheme>.localhost` on Windows and Android. Defaults to `false`.

###### [§](#note)Note

Using a `https` scheme will NOT allow mixed content when trying to fetch `http` endpoints and therefore will not match the behavior of the `<scheme>://localhost` protocols used on macOS and Linux.

###### [§](#warning)Warning

Changing this value between releases will change the IndexedDB, cookies and localstorage location and your app will not be able to access the old data.

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#450)

#### pub fn [devtools](#method.devtools)(self, enabled: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Whether web inspector, which is usually called browser devtools, is enabled or not. Enabled by default.

This API works in **debug** builds, but requires `devtools` feature flag to enable it in **release** builds.

###### [§](#platform-specific-2)Platform-specific

* macOS: This will call private functions on **macOS**.
* Android: Open `chrome://inspect/#devices` in Chrome to get the devtools window. Wry’s `WebView` devtools API isn’t supported on Android.
* iOS: Open Safari > Develop > [Your Device Name] > [Your WebView] to get the devtools window.

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#461)

#### pub fn [background\_color](#method.background_color)(self, color: [Color](webview\struct.Color.html.md "struct tauri::webview::Color")) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Set the window and webview background color.

###### [§](#platform-specific-3)Platform-specific:

* **Windows**: On Windows 7, alpha channel is ignored for the webview layer.
* **Windows**: On Windows 8 and newer, if alpha channel is not `0`, it will be ignored.

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#474)

#### pub fn [traffic\_light\_position](#method.traffic_light_position)(self, position: [Position](enum.Position.html.md "enum tauri::Position")) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Change the position of the window controls. Available on macOS only.

Requires titleBarStyle: Overlay and decorations: true.

###### [§](#platform-specific-4)Platform-specific

* **Linux / Windows / iOS / Android:** Unsupported.

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#494)

#### pub fn [background\_throttling](#method.background_throttling)( self, policy: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[BackgroundThrottlingPolicy](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/enum.BackgroundThrottlingPolicy.html "enum tauri_utils::config::BackgroundThrottlingPolicy")>, ) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Change the default background throttling behavior.

By default, browsers use a suspend policy that will throttle timers and even unload
the whole tab (view) to free resources after roughly 5 minutes when a view became
minimized or hidden. This will pause all tasks until the documents visibility state
changes back from hidden to visible by bringing the view back to the foreground.

###### [§](#platform-specific-5)Platform-specific

* **Linux / Windows / Android**: Unsupported. Workarounds like a pending WebLock transaction might suffice.
* **iOS**: Supported since version 17.0+.
* **macOS**: Supported since version 14.0+.

see https://github.com/tauri-apps/tauri/issues/5250#issuecomment-2569380578

## Trait Implementations[§](#trait-implementations)

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#196)[§](#impl-Clone-for-WebviewAttributes)

### impl [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#196)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Returns a copy of the value. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#174)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &Self)

Performs copy-assignment from `source`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#196)[§](#impl-Debug-for-WebviewAttributes)

### impl [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#196)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")>

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#225)[§](#impl-From%3C%26WindowConfig%3E-for-WebviewAttributes)

### impl [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<&[WindowConfig](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowConfig.html "struct tauri_utils::config::WindowConfig")> for [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/webview.rs.html#226)[§](#method.from)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(config: &[WindowConfig](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowConfig.html "struct tauri_utils::config::WindowConfig")) -> [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

Converts to this type from the input type.

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-WebviewAttributes)

### impl [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

[§](#impl-RefUnwindSafe-for-WebviewAttributes)

### impl [RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

[§](#impl-Send-for-WebviewAttributes)

### impl [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

[§](#impl-Sync-for-WebviewAttributes)

### impl [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

[§](#impl-Unpin-for-WebviewAttributes)

### impl [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

[§](#impl-UnwindSafe-for-WebviewAttributes)

### impl [UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [WebviewAttributes](struct.WebviewAttributes.html.md "struct tauri::WebviewAttributes")

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

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#767)[§](#impl-From%3CT%3E-for-T)

### impl<T> [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<T> for T

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#770)[§](#method.from-1)

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