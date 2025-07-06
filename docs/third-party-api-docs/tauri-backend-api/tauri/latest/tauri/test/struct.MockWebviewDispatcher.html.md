# Struct MockWebviewDispatcherCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/test/mock_runtime.rs.html#308-313)

```
pub struct MockWebviewDispatcher { /* private fields */ }
```

Available on **crate feature `test`** only.

## Implementations[§](#implementations)

[Source](../../src/tauri/test/mock_runtime.rs.html#315-319)[§](#impl-MockWebviewDispatcher)

### impl [MockWebviewDispatcher](struct.MockWebviewDispatcher.html.md "struct tauri::test::MockWebviewDispatcher")

[Source](../../src/tauri/test/mock_runtime.rs.html#316-318)

#### pub fn [last\_evaluated\_script](#method.last_evaluated_script)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>

## Trait Implementations[§](#trait-implementations)

[Source](../../src/tauri/test/mock_runtime.rs.html#307)[§](#impl-Clone-for-MockWebviewDispatcher)

### impl [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [MockWebviewDispatcher](struct.MockWebviewDispatcher.html.md "struct tauri::test::MockWebviewDispatcher")

[Source](../../src/tauri/test/mock_runtime.rs.html#307)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> [MockWebviewDispatcher](struct.MockWebviewDispatcher.html.md "struct tauri::test::MockWebviewDispatcher")

Returns a copy of the value. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#174)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &Self)

Performs copy-assignment from `source`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)

[Source](../../src/tauri/test/mock_runtime.rs.html#307)[§](#impl-Debug-for-MockWebviewDispatcher)

### impl [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [MockWebviewDispatcher](struct.MockWebviewDispatcher.html.md "struct tauri::test::MockWebviewDispatcher")

[Source](../../src/tauri/test/mock_runtime.rs.html#307)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/fmt/type.Result.html "type core::fmt::Result")

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](../../src/tauri/test/mock_runtime.rs.html#517-642)[§](#impl-WebviewDispatch%3CT%3E-for-MockWebviewDispatcher)

### impl<T: [UserEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.UserEvent.html "trait tauri_runtime::UserEvent")> [WebviewDispatch](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html "trait tauri_runtime::WebviewDispatch")<T> for [MockWebviewDispatcher](struct.MockWebviewDispatcher.html.md "struct tauri::test::MockWebviewDispatcher")

[Source](../../src/tauri/test/mock_runtime.rs.html#518)[§](#associatedtype.Runtime)

#### type [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#associatedtype.Runtime) = [MockRuntime](struct.MockRuntime.html.md "struct tauri::test::MockRuntime")

The runtime this [`WebviewDispatch`](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html "trait tauri_runtime::WebviewDispatch") runs under.

[Source](../../src/tauri/test/mock_runtime.rs.html#520-522)[§](#method.run_on_main_thread)

#### fn [run\_on\_main\_thread](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.run_on_main_thread)<F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")() + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>(&self, f: F) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Run a task on the main thread.

[Source](../../src/tauri/test/mock_runtime.rs.html#524-529)[§](#method.on_webview_event)

#### fn [on\_webview\_event](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.on_webview_event)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[WebviewEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/enum.WebviewEvent.html "enum tauri_runtime::window::WebviewEvent")) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>( &self, f: F, ) -> [WebviewEventId](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.WebviewEventId.html "type tauri_runtime::WebviewEventId")

Registers a webview event handler.

[Source](../../src/tauri/test/mock_runtime.rs.html#531-533)[§](#method.with_webview)

#### fn [with\_webview](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.with_webview)<F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")([Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<dyn [Any](https://doc.rust-lang.org/nightly/core/any/trait.Any.html "trait core::any::Any")>) + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>( &self, f: F, ) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Runs a closure with the platform webview object as argument.

[Source](../../src/tauri/test/mock_runtime.rs.html#536)[§](#method.open_devtools)

#### fn [open\_devtools](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.open_devtools)(&self)

Open the web inspector which is usually called devtools.

[Source](../../src/tauri/test/mock_runtime.rs.html#539)[§](#method.close_devtools)

#### fn [close\_devtools](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.close_devtools)(&self)

Close the web inspector which is usually called devtools.

[Source](../../src/tauri/test/mock_runtime.rs.html#542-544)[§](#method.is_devtools_open)

#### fn [is\_devtools\_open](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.is_devtools_open)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Gets the devtools window’s current open state.

[Source](../../src/tauri/test/mock_runtime.rs.html#546-548)[§](#method.set_zoom)

#### fn [set\_zoom](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.set_zoom)(&self, scale\_factor: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Set the webview zoom level

[Source](../../src/tauri/test/mock_runtime.rs.html#550-557)[§](#method.eval_script)

#### fn [eval\_script](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.eval_script)<S: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>>(&self, script: S) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Executes javascript on the window this [`WindowDispatch`](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WindowDispatch.html "trait tauri_runtime::WindowDispatch") represents.

[Source](../../src/tauri/test/mock_runtime.rs.html#559-561)[§](#method.url)

#### fn [url](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.url)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>

Returns the webview’s current URL.

[Source](../../src/tauri/test/mock_runtime.rs.html#563-565)[§](#method.bounds)

#### fn [bounds](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.bounds)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[Rect](..\struct.Rect.html.md "struct tauri::Rect")>

Returns the webview’s bounds.

[Source](../../src/tauri/test/mock_runtime.rs.html#567-569)[§](#method.position)

#### fn [position](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.position)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[PhysicalPosition](..\struct.PhysicalPosition.html.md "struct tauri::PhysicalPosition")<[i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html)>>

Returns the position of the top-left hand corner of the webviews’s client area relative to the top-left hand corner of the window.

[Source](../../src/tauri/test/mock_runtime.rs.html#571-576)[§](#method.size)

#### fn [size](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.size)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[PhysicalSize](..\struct.PhysicalSize.html.md "struct tauri::PhysicalSize")<[u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html)>>

Returns the physical size of the webviews’s client area.

[Source](../../src/tauri/test/mock_runtime.rs.html#578-581)[§](#method.navigate)

#### fn [navigate](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.navigate)(&self, url: [Url](..\struct.Url.html.md "struct tauri::Url")) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Navigate to the given URL.

[Source](../../src/tauri/test/mock_runtime.rs.html#583-585)[§](#method.reload)

#### fn [reload](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.reload)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Reloads the current page.

[Source](../../src/tauri/test/mock_runtime.rs.html#587-589)[§](#method.print)

#### fn [print](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.print)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Opens the dialog to prints the contents of the webview.

[Source](../../src/tauri/test/mock_runtime.rs.html#591-593)[§](#method.close)

#### fn [close](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.close)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Closes the webview.

[Source](../../src/tauri/test/mock_runtime.rs.html#595-597)[§](#method.set_bounds)

#### fn [set\_bounds](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.set_bounds)(&self, bounds: [Rect](..\struct.Rect.html.md "struct tauri::Rect")) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets the webview’s bounds.

[Source](../../src/tauri/test/mock_runtime.rs.html#599-601)[§](#method.set_size)

#### fn [set\_size](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.set_size)(&self, \_size: [Size](..\enum.Size.html.md "enum tauri::Size")) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Resizes the webview.

[Source](../../src/tauri/test/mock_runtime.rs.html#603-605)[§](#method.set_position)

#### fn [set\_position](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.set_position)(&self, \_position: [Position](..\enum.Position.html.md "enum tauri::Position")) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Updates the webview position.

[Source](../../src/tauri/test/mock_runtime.rs.html#607-609)[§](#method.set_focus)

#### fn [set\_focus](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.set_focus)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Bring the window to front and focus the webview.

[Source](../../src/tauri/test/mock_runtime.rs.html#611-613)[§](#method.reparent)

#### fn [reparent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.reparent)(&self, window\_id: [WindowId](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/struct.WindowId.html "struct tauri_runtime::window::WindowId")) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Moves the webview to the given window.

[Source](../../src/tauri/test/mock_runtime.rs.html#615-617)[§](#method.cookies)

#### fn [cookies](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.cookies)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[Cookie](..\webview\struct.Cookie.html.md "struct tauri::webview::Cookie")<'static>>>

Return all cookies in the cookie store. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.cookies)

[Source](../../src/tauri/test/mock_runtime.rs.html#619-621)[§](#method.cookies_for_url)

#### fn [cookies\_for\_url](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.cookies_for_url)(&self, url: [Url](..\struct.Url.html.md "struct tauri::Url")) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[Cookie](..\webview\struct.Cookie.html.md "struct tauri::webview::Cookie")<'static>>>

Get cookies for a particular url. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.cookies_for_url)

[Source](../../src/tauri/test/mock_runtime.rs.html#623-625)[§](#method.set_auto_resize)

#### fn [set\_auto\_resize](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.set_auto_resize)(&self, auto\_resize: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Sets whether the webview should automatically grow and shrink its size and position when the parent window resizes.

[Source](../../src/tauri/test/mock_runtime.rs.html#627-629)[§](#method.clear_all_browsing_data)

#### fn [clear\_all\_browsing\_data](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.clear_all_browsing_data)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Clear all browsing data for this webview.

[Source](../../src/tauri/test/mock_runtime.rs.html#631-633)[§](#method.hide)

#### fn [hide](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.hide)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Hide the webview

[Source](../../src/tauri/test/mock_runtime.rs.html#635-637)[§](#method.show)

#### fn [show](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.show)(&self) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Show the webview

[Source](../../src/tauri/test/mock_runtime.rs.html#639-641)[§](#method.set_background_color)

#### fn [set\_background\_color](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.WebviewDispatch.html#tymethod.set_background_color)(&self, color: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Color](..\webview\struct.Color.html.md "struct tauri::webview::Color")>) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Set the webview background.

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-MockWebviewDispatcher)

### impl [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [MockWebviewDispatcher](struct.MockWebviewDispatcher.html.md "struct tauri::test::MockWebviewDispatcher")

[§](#impl-RefUnwindSafe-for-MockWebviewDispatcher)

### impl ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [MockWebviewDispatcher](struct.MockWebviewDispatcher.html.md "struct tauri::test::MockWebviewDispatcher")

[§](#impl-Send-for-MockWebviewDispatcher)

### impl [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [MockWebviewDispatcher](struct.MockWebviewDispatcher.html.md "struct tauri::test::MockWebviewDispatcher")

[§](#impl-Sync-for-MockWebviewDispatcher)

### impl [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [MockWebviewDispatcher](struct.MockWebviewDispatcher.html.md "struct tauri::test::MockWebviewDispatcher")

[§](#impl-Unpin-for-MockWebviewDispatcher)

### impl [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [MockWebviewDispatcher](struct.MockWebviewDispatcher.html.md "struct tauri::test::MockWebviewDispatcher")

[§](#impl-UnwindSafe-for-MockWebviewDispatcher)

### impl ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [MockWebviewDispatcher](struct.MockWebviewDispatcher.html.md "struct tauri::test::MockWebviewDispatcher")

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