# Enum ErrorCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](../src/tauri/error.rs.html#33-169)

```

#[non_exhaustive]

pub enum Error {
Show 38 variants    Runtime(Error),
    WindowLabelAlreadyExists(String),
    WebviewLabelAlreadyExists(String),
    CannotReparentWebviewWindow,
    AssetNotFound(String),
    Json(Error),
    Io(Error),
    InvalidIcon(Error),
    InvalidArgs(&'static str, &'static str, Error),
    Setup(SetupError),
    PluginInitialization(String, String),
    InvalidUrl(ParseError),
    JoinError(JoinError),
    InvalidWebviewUrl(&'static str),
    GlobPattern(PatternError),
    Image(ImageError),
    InvalidWindowHandle,
    FailedToReceiveMessage,
    Menu(Error),
    BadMenuIcon(BadIcon),
    Tray(Error),
    BadTrayIcon(BadIcon),
    NoParent,
    NoExtension,
    NoBasename,
    CurrentDir(Error),
    UnknownPath,
    WindowNotFound,
    BadResourceId(ResourceId),
    Anyhow(Error),
    WebviewNotFound,
    UnstableFeatureNotSupported,
    CannotDeserializeScope(Box<dyn Error + Send + Sync>),
    RawHandleError(HandleError),
    Csprng(Error),
    InvokeKey,
    IllegalEventName(String),
    TokioOneshotRecv(RecvError),
}
```

Expand description

Runtime errors that can happen inside a Tauri application.

## Variants (Non-exhaustive)[§](#variants)

This enum is marked as non-exhaustive

Non-exhaustive enums could have additional variants added in future. Therefore, when matching against variants of non-exhaustive enums, an extra wildcard arm must be added to account for any future variants.

[§](#variant.Runtime)

### Runtime([Error](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.Error.html "enum tauri_runtime::Error"))

Runtime error.

[§](#variant.WindowLabelAlreadyExists)

### WindowLabelAlreadyExists([String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"))

Window label must be unique.

[§](#variant.WebviewLabelAlreadyExists)

### WebviewLabelAlreadyExists([String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"))

Webview label must be unique.

[§](#variant.CannotReparentWebviewWindow)

### CannotReparentWebviewWindow

Cannot use the webview reparent function on webview windows.

[§](#variant.AssetNotFound)

### AssetNotFound([String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"))

Embedded asset not found.

[§](#variant.Json)

### Json([Error](https://docs.rs/serde_json/1.0.140/x86_64-unknown-linux-gnu/serde_json/error/struct.Error.html "struct serde_json::error::Error"))

Failed to serialize/deserialize.

[§](#variant.Io)

### Io([Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error"))

IO error.

[§](#variant.InvalidIcon)

### InvalidIcon([Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error"))

Failed to load window icon.

[§](#variant.InvalidArgs)

### InvalidArgs(&'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), [Error](https://docs.rs/serde_json/1.0.140/x86_64-unknown-linux-gnu/serde_json/error/struct.Error.html "struct serde_json::error::Error"))

Invalid args when running a command.

[§](#variant.Setup)

### Setup(SetupError)

Encountered an error in the setup hook,

[§](#variant.PluginInitialization)

### PluginInitialization([String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"), [String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"))

Error initializing plugin.

[§](#variant.InvalidUrl)

### InvalidUrl([ParseError](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/url/parser/enum.ParseError.html "enum url::parser::ParseError"))

A part of the URL is malformed or invalid. This may occur when parsing and combining
user-provided URLs and paths.

[§](#variant.JoinError)

### JoinError([JoinError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/runtime/task/error/struct.JoinError.html "struct tokio::runtime::task::error::JoinError"))

Task join error.

[§](#variant.InvalidWebviewUrl)

### InvalidWebviewUrl(&'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html))

An invalid window URL was provided. Includes details about the error.

[§](#variant.GlobPattern)

### GlobPattern([PatternError](https://docs.rs/glob/0.3.2/x86_64-unknown-linux-gnu/glob/struct.PatternError.html "struct glob::PatternError"))

Invalid glob pattern.

[§](#variant.Image)

### Image([ImageError](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/error/enum.ImageError.html "enum image::error::ImageError"))

Image error.

[§](#variant.InvalidWindowHandle)

### InvalidWindowHandle

The Window’s raw handle is invalid for the platform.

[§](#variant.FailedToReceiveMessage)

### FailedToReceiveMessage

Failed to receive message .

[§](#variant.Menu)

### Menu([Error](https://docs.rs/muda/0.16.1/x86_64-unknown-linux-gnu/muda/error/enum.Error.html "enum muda::error::Error"))

Menu error.

[§](#variant.BadMenuIcon)

### BadMenuIcon([BadIcon](https://docs.rs/muda/0.16.1/x86_64-unknown-linux-gnu/muda/icon/enum.BadIcon.html "enum muda::icon::BadIcon"))

Bad menu icon error.

[§](#variant.Tray)

### Tray([Error](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/tray_icon/error/enum.Error.html "enum tray_icon::error::Error"))

Available on **`desktop` and crate feature `tray-icon`** only.

Tray icon error.

[§](#variant.BadTrayIcon)

### BadTrayIcon([BadIcon](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/tray_icon/icon/enum.BadIcon.html "enum tray_icon::icon::BadIcon"))

Available on **`desktop` and crate feature `tray-icon`** only.

Bad tray icon error.

[§](#variant.NoParent)

### NoParent

Path does not have a parent.

[§](#variant.NoExtension)

### NoExtension

Path does not have an extension.

[§](#variant.NoBasename)

### NoBasename

Path does not have a basename.

[§](#variant.CurrentDir)

### CurrentDir([Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error"))

Cannot resolve current directory.

[§](#variant.UnknownPath)

### UnknownPath

Unknown path.

[§](#variant.WindowNotFound)

### WindowNotFound

window not found.

[§](#variant.BadResourceId)

### BadResourceId([ResourceId](type.ResourceId.html.md "type tauri::ResourceId"))

The resource id is invalid.

[§](#variant.Anyhow)

### Anyhow([Error](https://docs.rs/anyhow/1.0.97/x86_64-unknown-linux-gnu/anyhow/struct.Error.html "struct anyhow::Error"))

The anyhow crate error.

[§](#variant.WebviewNotFound)

### WebviewNotFound

webview not found.

[§](#variant.UnstableFeatureNotSupported)

### UnstableFeatureNotSupported

API requires the unstable feature flag.

[§](#variant.CannotDeserializeScope)

### CannotDeserializeScope([Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<dyn [Error](https://doc.rust-lang.org/nightly/core/error/trait.Error.html "trait core::error::Error") + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync")>)

Failed to deserialize scope object.

[§](#variant.RawHandleError)

### RawHandleError([HandleError](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/enum.HandleError.html "enum raw_window_handle::HandleError"))

Failed to get a raw handle.

[§](#variant.Csprng)

### Csprng([Error](https://docs.rs/getrandom/0.2.15/x86_64-unknown-linux-gnu/getrandom/error/struct.Error.html "struct getrandom::error::Error"))

Something went wrong with the CSPRNG.

[§](#variant.InvokeKey)

### InvokeKey

Bad `__TAURI_INVOKE_KEY__` value received in ipc message.

[§](#variant.IllegalEventName)

### IllegalEventName([String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"))

Illegal event name.

[§](#variant.TokioOneshotRecv)

### TokioOneshotRecv([RecvError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/oneshot/error/struct.RecvError.html "struct tokio::sync::oneshot::error::RecvError"))

tokio oneshot channel failed to receive message

## Trait Implementations[§](#trait-implementations)

[Source](../src/tauri/error.rs.html#31)[§](#impl-Debug-for-Error)

### impl [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [Error](enum.Error.html.md "enum tauri::Error")

[Source](../src/tauri/error.rs.html#31)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/fmt/type.Result.html "type core::fmt::Result")

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](../src/tauri/error.rs.html#31)[§](#impl-Display-for-Error)

### impl [Display](https://doc.rust-lang.org/nightly/core/fmt/trait.Display.html "trait core::fmt::Display") for [Error](enum.Error.html.md "enum tauri::Error")

[Source](../src/tauri/error.rs.html#31)[§](#method.fmt-1)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Display.html#tymethod.fmt)(&self, \_\_formatter: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/fmt/type.Result.html "type core::fmt::Result")

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Display.html#tymethod.fmt)

[Source](../src/tauri/error.rs.html#31)[§](#impl-Error-for-Error)

### impl [Error](https://doc.rust-lang.org/nightly/core/error/trait.Error.html "trait core::error::Error") for [Error](enum.Error.html.md "enum tauri::Error")

[Source](../src/tauri/error.rs.html#31)[§](#method.source)

#### fn [source](https://doc.rust-lang.org/nightly/core/error/trait.Error.html#method.source)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&(dyn [Error](https://doc.rust-lang.org/nightly/core/error/trait.Error.html "trait core::error::Error") + 'static)>

Returns the lower-level source of this error, if any. [Read more](https://doc.rust-lang.org/nightly/core/error/trait.Error.html#method.source)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/error.rs.html#131)[§](#method.description)

#### fn [description](https://doc.rust-lang.org/nightly/core/error/trait.Error.html#method.description)(&self) -> &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

👎Deprecated since 1.42.0: use the Display impl or to\_string()

[Read more](https://doc.rust-lang.org/nightly/core/error/trait.Error.html#method.description)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/error.rs.html#141)[§](#method.cause)

#### fn [cause](https://doc.rust-lang.org/nightly/core/error/trait.Error.html#method.cause)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&dyn [Error](https://doc.rust-lang.org/nightly/core/error/trait.Error.html "trait core::error::Error")>

👎Deprecated since 1.33.0: replaced by Error::source, which can support downcasting

[Source](https://doc.rust-lang.org/nightly/src/core/error.rs.html#204)[§](#method.provide)

#### fn [provide](https://doc.rust-lang.org/nightly/core/error/trait.Error.html#method.provide)<'a>(&'a self, request: &mut [Request](https://doc.rust-lang.org/nightly/core/error/struct.Request.html "struct core::error::Request")<'a>)

🔬This is a nightly-only experimental API. (`error_generic_member_access`)

Provides type-based access to context intended for error reports. [Read more](https://doc.rust-lang.org/nightly/core/error/trait.Error.html#method.provide)

[Source](../src/tauri/error.rs.html#105)[§](#impl-From%3CBadIcon%3E-for-Error)

### impl [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[BadIcon](https://docs.rs/muda/0.16.1/x86_64-unknown-linux-gnu/muda/icon/enum.BadIcon.html "enum muda::icon::BadIcon")> for [Error](enum.Error.html.md "enum tauri::Error")

[Source](../src/tauri/error.rs.html#31)[§](#method.from-7)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(source: [BadIcon](https://docs.rs/muda/0.16.1/x86_64-unknown-linux-gnu/muda/icon/enum.BadIcon.html "enum muda::icon::BadIcon")) -> Self

Converts to this type from the input type.

[Source](../src/tauri/error.rs.html#115)[§](#impl-From%3CBadIcon%3E-for-Error-1)

### impl [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[BadIcon](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/tray_icon/icon/enum.BadIcon.html "enum tray_icon::icon::BadIcon")> for [Error](enum.Error.html.md "enum tauri::Error")

[Source](../src/tauri/error.rs.html#31)[§](#method.from-9)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(source: [BadIcon](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/tray_icon/icon/enum.BadIcon.html "enum tray_icon::icon::BadIcon")) -> Self

Converts to this type from the input type.

[Source](../src/tauri/error.rs.html#36)[§](#impl-From%3CError%3E-for-Error)

### impl [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[Error](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.Error.html "enum tauri_runtime::Error")> for [Error](enum.Error.html.md "enum tauri::Error")

[Source](../src/tauri/error.rs.html#31)[§](#method.from)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(source: [Error](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/enum.Error.html "enum tauri_runtime::Error")) -> Self

Converts to this type from the input type.

[Source](../src/tauri/error.rs.html#51)[§](#impl-From%3CError%3E-for-Error-1)

### impl [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[Error](https://docs.rs/serde_json/1.0.140/x86_64-unknown-linux-gnu/serde_json/error/struct.Error.html "struct serde_json::error::Error")> for [Error](enum.Error.html.md "enum tauri::Error")

[Source](../src/tauri/error.rs.html#31)[§](#method.from-1)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(source: [Error](https://docs.rs/serde_json/1.0.140/x86_64-unknown-linux-gnu/serde_json/error/struct.Error.html "struct serde_json::error::Error")) -> Self

Converts to this type from the input type.

[Source](../src/tauri/error.rs.html#54)[§](#impl-From%3CError%3E-for-Error-2)

### impl [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")> for [Error](enum.Error.html.md "enum tauri::Error")

[Source](../src/tauri/error.rs.html#31)[§](#method.from-2)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(source: [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")) -> Self

Converts to this type from the input type.

[Source](../src/tauri/error.rs.html#101)[§](#impl-From%3CError%3E-for-Error-3)

### impl [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[Error](https://docs.rs/muda/0.16.1/x86_64-unknown-linux-gnu/muda/error/enum.Error.html "enum muda::error::Error")> for [Error](enum.Error.html.md "enum tauri::Error")

[Source](../src/tauri/error.rs.html#31)[§](#method.from-6)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(source: [Error](https://docs.rs/muda/0.16.1/x86_64-unknown-linux-gnu/muda/error/enum.Error.html "enum muda::error::Error")) -> Self

Converts to this type from the input type.

[Source](../src/tauri/error.rs.html#110)[§](#impl-From%3CError%3E-for-Error-4)

### impl [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[Error](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/tray_icon/error/enum.Error.html "enum tray_icon::error::Error")> for [Error](enum.Error.html.md "enum tauri::Error")

[Source](../src/tauri/error.rs.html#31)[§](#method.from-8)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(source: [Error](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/tray_icon/error/enum.Error.html "enum tray_icon::error::Error")) -> Self

Converts to this type from the input type.

[Source](../src/tauri/error.rs.html#144)[§](#impl-From%3CError%3E-for-Error-5)

### impl [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[Error](https://docs.rs/anyhow/1.0.97/x86_64-unknown-linux-gnu/anyhow/struct.Error.html "struct anyhow::Error")> for [Error](enum.Error.html.md "enum tauri::Error")

[Source](../src/tauri/error.rs.html#31)[§](#method.from-10)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(source: [Error](https://docs.rs/anyhow/1.0.97/x86_64-unknown-linux-gnu/anyhow/struct.Error.html "struct anyhow::Error")) -> Self

Converts to this type from the input type.

[Source](../src/tauri/error.rs.html#171-175)[§](#impl-From%3CError%3E-for-Error-6)

### impl [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[Error](https://docs.rs/getrandom/0.2.15/x86_64-unknown-linux-gnu/getrandom/error/struct.Error.html "struct getrandom::error::Error")> for [Error](enum.Error.html.md "enum tauri::Error")

[Source](../src/tauri/error.rs.html#172-174)[§](#method.from-13)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(value: [Error](https://docs.rs/getrandom/0.2.15/x86_64-unknown-linux-gnu/getrandom/error/struct.Error.html "struct getrandom::error::Error")) -> Self

Converts to this type from the input type.

[Source](../src/tauri/ipc/mod.rs.html#244-249)[§](#impl-From%3CError%3E-for-InvokeError)

### impl [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[Error](enum.Error.html.md "enum tauri::Error")> for [InvokeError](ipc\struct.InvokeError.html.md "struct tauri::ipc::InvokeError")

[Source](../src/tauri/ipc/mod.rs.html#246-248)[§](#method.from-14)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(error: [Error](enum.Error.html.md "enum tauri::Error")) -> Self

Converts to this type from the input type.

[Source](../src/tauri/error.rs.html#156)[§](#impl-From%3CHandleError%3E-for-Error)

### impl [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[HandleError](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/enum.HandleError.html "enum raw_window_handle::HandleError")> for [Error](enum.Error.html.md "enum tauri::Error")

[Source](../src/tauri/error.rs.html#31)[§](#method.from-11)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(source: [HandleError](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/enum.HandleError.html "enum raw_window_handle::HandleError")) -> Self

Converts to this type from the input type.

[Source](../src/tauri/error.rs.html#87)[§](#impl-From%3CImageError%3E-for-Error)

### impl [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[ImageError](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/error/enum.ImageError.html "enum image::error::ImageError")> for [Error](enum.Error.html.md "enum tauri::Error")

[Source](../src/tauri/error.rs.html#31)[§](#method.from-5)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(source: [ImageError](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/error/enum.ImageError.html "enum image::error::ImageError")) -> Self

Converts to this type from the input type.

[Source](../src/tauri/error.rs.html#73)[§](#impl-From%3CJoinError%3E-for-Error)

### impl [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[JoinError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/runtime/task/error/struct.JoinError.html "struct tokio::runtime::task::error::JoinError")> for [Error](enum.Error.html.md "enum tauri::Error")

[Source](../src/tauri/error.rs.html#31)[§](#method.from-3)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(source: [JoinError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/runtime/task/error/struct.JoinError.html "struct tokio::runtime::task::error::JoinError")) -> Self

Converts to this type from the input type.

[Source](../src/tauri/error.rs.html#83)[§](#impl-From%3CPatternError%3E-for-Error)

### impl [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[PatternError](https://docs.rs/glob/0.3.2/x86_64-unknown-linux-gnu/glob/struct.PatternError.html "struct glob::PatternError")> for [Error](enum.Error.html.md "enum tauri::Error")

[Source](../src/tauri/error.rs.html#31)[§](#method.from-4)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(source: [PatternError](https://docs.rs/glob/0.3.2/x86_64-unknown-linux-gnu/glob/struct.PatternError.html "struct glob::PatternError")) -> Self

Converts to this type from the input type.

[Source](../src/tauri/error.rs.html#168)[§](#impl-From%3CRecvError%3E-for-Error)

### impl [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[RecvError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/oneshot/error/struct.RecvError.html "struct tokio::sync::oneshot::error::RecvError")> for [Error](enum.Error.html.md "enum tauri::Error")

[Source](../src/tauri/error.rs.html#31)[§](#method.from-12)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(source: [RecvError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/oneshot/error/struct.RecvError.html "struct tokio::sync::oneshot::error::RecvError")) -> Self

Converts to this type from the input type.

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-Error)

### impl [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [Error](enum.Error.html.md "enum tauri::Error")

[§](#impl-RefUnwindSafe-for-Error)

### impl ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [Error](enum.Error.html.md "enum tauri::Error")

[§](#impl-Send-for-Error)

### impl [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [Error](enum.Error.html.md "enum tauri::Error")

[§](#impl-Sync-for-Error)

### impl [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [Error](enum.Error.html.md "enum tauri::Error")

[§](#impl-Unpin-for-Error)

### impl [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [Error](enum.Error.html.md "enum tauri::Error")

[§](#impl-UnwindSafe-for-Error)

### impl ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [Error](enum.Error.html.md "enum tauri::Error")

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

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#770)[§](#method.from-15)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(t: T) -> T

Returns the argument unchanged.

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#750-752)[§](#impl-Into%3CU%3E-for-T)

### impl<T, U> [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<U> for T where U: [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<T>,

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#760)[§](#method.into)

#### fn [into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html#tymethod.into)(self) -> U

Calls `U::from(self)`.

That is, this conversion is whatever the implementation of
`From<T> for U` chooses to do.

[Source](https://doc.rust-lang.org/nightly/src/alloc/string.rs.html#2744)[§](#impl-ToString-for-T)

### impl<T> [ToString](https://doc.rust-lang.org/nightly/alloc/string/trait.ToString.html "trait alloc::string::ToString") for T where T: [Display](https://doc.rust-lang.org/nightly/core/fmt/trait.Display.html "trait core::fmt::Display") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/string.rs.html#2746)[§](#method.to_string)

#### fn [to\_string](https://doc.rust-lang.org/nightly/alloc/string/trait.ToString.html#tymethod.to_string)(&self) -> [String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")

Converts the given value to a `String`. [Read more](https://doc.rust-lang.org/nightly/alloc/string/trait.ToString.html#tymethod.to_string)

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