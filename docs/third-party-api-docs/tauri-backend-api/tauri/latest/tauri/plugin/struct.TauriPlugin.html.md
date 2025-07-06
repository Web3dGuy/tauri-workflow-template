# Struct TauriPluginCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/plugin.rs.html#693-706)

```
pub struct TauriPlugin<R: Runtime, C: DeserializeOwned = ()> { /* private fields */ }
```

Expand description

Plugin struct that is returned by the [`Builder`](struct.Builder.html.md "struct tauri::plugin::Builder"). Should only be constructed through the builder.

## Trait Implementations[§](#trait-implementations)

[Source](../../src/tauri/plugin.rs.html#708-714)[§](#impl-Drop-for-TauriPlugin%3CR,+C%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"), C: [DeserializeOwned](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.DeserializeOwned.html "trait serde::de::DeserializeOwned")> [Drop](https://doc.rust-lang.org/nightly/core/ops/drop/trait.Drop.html "trait core::ops::drop::Drop") for [TauriPlugin](struct.TauriPlugin.html.md "struct tauri::plugin::TauriPlugin")<R, C>

[Source](../../src/tauri/plugin.rs.html#709-713)[§](#method.drop)

#### fn [drop](https://doc.rust-lang.org/nightly/core/ops/drop/trait.Drop.html#tymethod.drop)(&mut self)

Executes the destructor for this type. [Read more](https://doc.rust-lang.org/nightly/core/ops/drop/trait.Drop.html#tymethod.drop)

[Source](../../src/tauri/plugin.rs.html#716-780)[§](#impl-Plugin%3CR%3E-for-TauriPlugin%3CR,+C%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"), C: [DeserializeOwned](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.DeserializeOwned.html "trait serde::de::DeserializeOwned")> [Plugin](trait.Plugin.html.md "trait tauri::plugin::Plugin")<R> for [TauriPlugin](struct.TauriPlugin.html.md "struct tauri::plugin::TauriPlugin")<R, C>

[Source](../../src/tauri/plugin.rs.html#717-719)[§](#method.name)

#### fn [name](trait.Plugin.html_tymethod.name.md)(&self) -> &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

The plugin name. Used as key on the plugin config object.

[Source](../../src/tauri/plugin.rs.html#721-751)[§](#method.initialize)

#### fn [initialize](trait.Plugin.html_method.initialize.md)( &mut self, app: &[AppHandle](..\struct.AppHandle.html.md "struct tauri::AppHandle")<R>, config: [JsonValue](https://docs.rs/serde_json/1.0.140/x86_64-unknown-linux-gnu/serde_json/value/enum.Value.html "enum serde_json::value::Value"), ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<dyn [Error](https://doc.rust-lang.org/nightly/core/error/trait.Error.html "trait core::error::Error")>>

Initializes the plugin.

[Source](../../src/tauri/plugin.rs.html#753-755)[§](#method.initialization_script)

#### fn [initialization\_script](trait.Plugin.html_method.initialization_script.md)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>

Add the provided JavaScript to a list of scripts that should be run after the global object has been created,
but before the HTML document has been parsed and before any other script included by the HTML document is run. [Read more](trait.Plugin.html_method.initialization_script.md)

[Source](../../src/tauri/plugin.rs.html#757-759)[§](#method.window_created)

#### fn [window\_created](trait.Plugin.html_method.window_created.md)(&mut self, window: [Window](..\window\struct.Window.html.md "struct tauri::window::Window")<R>)

Callback invoked when the window is created.

[Source](../../src/tauri/plugin.rs.html#761-763)[§](#method.webview_created)

#### fn [webview\_created](trait.Plugin.html_method.webview_created.md)(&mut self, webview: [Webview](..\webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>)

Callback invoked when the webview is created.

[Source](../../src/tauri/plugin.rs.html#765-767)[§](#method.on_navigation)

#### fn [on\_navigation](trait.Plugin.html_method.on_navigation.md)(&mut self, webview: &[Webview](..\webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>, url: &[Url](..\struct.Url.html.md "struct tauri::Url")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Callback invoked when webview tries to navigate to the given Url. Returning falses cancels navigation.

[Source](../../src/tauri/plugin.rs.html#769-771)[§](#method.on_page_load)

#### fn [on\_page\_load](trait.Plugin.html_method.on_page_load.md)(&mut self, webview: &[Webview](..\webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>, payload: &[PageLoadPayload](..\webview\struct.PageLoadPayload.html.md "struct tauri::webview::PageLoadPayload")<'\_>)

Callback invoked when the webview performs a navigation to a page.

[Source](../../src/tauri/plugin.rs.html#773-775)[§](#method.on_event)

#### fn [on\_event](trait.Plugin.html_method.on_event.md)(&mut self, app: &[AppHandle](..\struct.AppHandle.html.md "struct tauri::AppHandle")<R>, event: &[RunEvent](..\enum.RunEvent.html.md "enum tauri::RunEvent"))

Callback invoked when the event loop receives a new event.

[Source](../../src/tauri/plugin.rs.html#777-779)[§](#method.extend_api)

#### fn [extend\_api](trait.Plugin.html_method.extend_api.md)(&mut self, invoke: [Invoke](..\ipc\struct.Invoke.html.md "struct tauri::ipc::Invoke")<R>) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Extend commands to [`crate::Builder::invoke_handler`](..\struct.Builder.html_method.invoke_handler.md "method tauri::Builder::invoke_handler").

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-TauriPlugin%3CR,+C%3E)

### impl<R, C> [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [TauriPlugin](struct.TauriPlugin.html.md "struct tauri::plugin::TauriPlugin")<R, C> where <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[Handle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.Handle "type tauri_runtime::Runtime::Handle"): [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze"),

[§](#impl-RefUnwindSafe-for-TauriPlugin%3CR,+C%3E)

### impl<R, C = [()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [TauriPlugin](struct.TauriPlugin.html.md "struct tauri::plugin::TauriPlugin")<R, C>

[§](#impl-Send-for-TauriPlugin%3CR,+C%3E)

### impl<R, C> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [TauriPlugin](struct.TauriPlugin.html.md "struct tauri::plugin::TauriPlugin")<R, C>

[§](#impl-Sync-for-TauriPlugin%3CR,+C%3E)

### impl<R, C = [()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> ![Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [TauriPlugin](struct.TauriPlugin.html.md "struct tauri::plugin::TauriPlugin")<R, C>

[§](#impl-Unpin-for-TauriPlugin%3CR,+C%3E)

### impl<R, C> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [TauriPlugin](struct.TauriPlugin.html.md "struct tauri::plugin::TauriPlugin")<R, C> where <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[Handle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.Handle "type tauri_runtime::Runtime::Handle"): [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin"),

[§](#impl-UnwindSafe-for-TauriPlugin%3CR,+C%3E)

### impl<R, C = [()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [TauriPlugin](struct.TauriPlugin.html.md "struct tauri::plugin::TauriPlugin")<R, C>

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