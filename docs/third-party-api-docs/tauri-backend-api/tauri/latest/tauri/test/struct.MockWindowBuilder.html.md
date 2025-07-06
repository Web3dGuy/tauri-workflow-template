# Struct MockWindowBuilderCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/test/mock_runtime.rs.html#328)

```
pub struct MockWindowBuilder {}
```

Available on **crate feature `test`** only.

## Trait Implementations[§](#trait-implementations)

[Source](../../src/tauri/test/mock_runtime.rs.html#327)[§](#impl-Clone-for-MockWindowBuilder)

### impl [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [MockWindowBuilder](struct.MockWindowBuilder.html.md "struct tauri::test::MockWindowBuilder")

[Source](../../src/tauri/test/mock_runtime.rs.html#327)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> [MockWindowBuilder](struct.MockWindowBuilder.html.md "struct tauri::test::MockWindowBuilder")

Returns a copy of the value. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#174)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &Self)

Performs copy-assignment from `source`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)

[Source](../../src/tauri/test/mock_runtime.rs.html#327)[§](#impl-Debug-for-MockWindowBuilder)

### impl [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [MockWindowBuilder](struct.MockWindowBuilder.html.md "struct tauri::test::MockWindowBuilder")

[Source](../../src/tauri/test/mock_runtime.rs.html#327)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/fmt/type.Result.html "type core::fmt::Result")

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](../../src/tauri/test/mock_runtime.rs.html#332-515)[§](#impl-WindowBuilder-for-MockWindowBuilder)

### impl [WindowBuilder](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html "trait tauri_runtime::window::WindowBuilder") for [MockWindowBuilder](struct.MockWindowBuilder.html.md "struct tauri::test::MockWindowBuilder")

[Source](../../src/tauri/test/mock_runtime.rs.html#333-335)[§](#method.new)

#### fn [new](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.new)() -> Self

Initializes a new window attributes builder.

[Source](../../src/tauri/test/mock_runtime.rs.html#337-339)[§](#method.with_config)

#### fn [with\_config](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.with_config)(config: &[WindowConfig](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowConfig.html "struct tauri_utils::config::WindowConfig")) -> Self

Initializes a new window builder from a [`WindowConfig`](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowConfig.html "struct tauri_utils::config::WindowConfig")

[Source](../../src/tauri/test/mock_runtime.rs.html#341-343)[§](#method.center)

#### fn [center](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.center)(self) -> Self

Show window in the center of the screen.

[Source](../../src/tauri/test/mock_runtime.rs.html#345-347)[§](#method.position)

#### fn [position](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.position)(self, x: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), y: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> Self

The initial position of the window’s.

[Source](../../src/tauri/test/mock_runtime.rs.html#349-351)[§](#method.inner_size)

#### fn [inner\_size](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.inner_size)(self, min\_width: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), min\_height: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> Self

Window size.

[Source](../../src/tauri/test/mock_runtime.rs.html#353-355)[§](#method.min_inner_size)

#### fn [min\_inner\_size](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.min_inner_size)(self, min\_width: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), min\_height: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> Self

Window min inner size.

[Source](../../src/tauri/test/mock_runtime.rs.html#357-359)[§](#method.max_inner_size)

#### fn [max\_inner\_size](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.max_inner_size)(self, max\_width: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), max\_height: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> Self

Window max inner size.

[Source](../../src/tauri/test/mock_runtime.rs.html#361-366)[§](#method.inner_size_constraints)

#### fn [inner\_size\_constraints](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.inner_size_constraints)(self, constraints: [WindowSizeConstraints](..\struct.WindowSizeConstraints.html.md "struct tauri::WindowSizeConstraints")) -> Self

Window inner size constraints.

[Source](../../src/tauri/test/mock_runtime.rs.html#368-370)[§](#method.resizable)

#### fn [resizable](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.resizable)(self, resizable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window is resizable or not.
When resizable is set to false, native window’s maximize button is automatically disabled.

[Source](../../src/tauri/test/mock_runtime.rs.html#372-374)[§](#method.maximizable)

#### fn [maximizable](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.maximizable)(self, resizable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window’s native maximize button is enabled or not.
If resizable is set to false, this setting is ignored. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.maximizable)

[Source](../../src/tauri/test/mock_runtime.rs.html#376-378)[§](#method.minimizable)

#### fn [minimizable](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.minimizable)(self, resizable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window’s native minimize button is enabled or not. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.minimizable)

[Source](../../src/tauri/test/mock_runtime.rs.html#380-382)[§](#method.closable)

#### fn [closable](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.closable)(self, resizable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window’s native close button is enabled or not. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.closable)

[Source](../../src/tauri/test/mock_runtime.rs.html#384-386)[§](#method.title)

#### fn [title](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.title)<S: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>>(self, title: S) -> Self

The title of the window in the title bar.

[Source](../../src/tauri/test/mock_runtime.rs.html#388-390)[§](#method.fullscreen)

#### fn [fullscreen](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.fullscreen)(self, fullscreen: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether to start the window in fullscreen or not.

[Source](../../src/tauri/test/mock_runtime.rs.html#392-394)[§](#method.focused)

#### fn [focused](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.focused)(self, focused: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window will be initially focused or not.

[Source](../../src/tauri/test/mock_runtime.rs.html#396-398)[§](#method.maximized)

#### fn [maximized](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.maximized)(self, maximized: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window should be maximized upon creation.

[Source](../../src/tauri/test/mock_runtime.rs.html#400-402)[§](#method.visible)

#### fn [visible](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.visible)(self, visible: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window should be immediately visible upon creation.

[Source](../../src/tauri/test/mock_runtime.rs.html#409-411)[§](#method.transparent)

#### fn [transparent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.transparent)(self, transparent: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Available on **non-macOS or crate feature `macos-private-api`** only.

Whether the window should be transparent. If this is true, writing colors
with alpha values different than `1.0` will produce a transparent window.

[Source](../../src/tauri/test/mock_runtime.rs.html#413-415)[§](#method.decorations)

#### fn [decorations](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.decorations)(self, decorations: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window should have borders and bars.

[Source](../../src/tauri/test/mock_runtime.rs.html#417-419)[§](#method.always_on_bottom)

#### fn [always\_on\_bottom](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.always_on_bottom)(self, always\_on\_bottom: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window should always be below other windows.

[Source](../../src/tauri/test/mock_runtime.rs.html#421-423)[§](#method.always_on_top)

#### fn [always\_on\_top](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.always_on_top)(self, always\_on\_top: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window should always be on top of other windows.

[Source](../../src/tauri/test/mock_runtime.rs.html#425-427)[§](#method.visible_on_all_workspaces)

#### fn [visible\_on\_all\_workspaces](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.visible_on_all_workspaces)(self, visible\_on\_all\_workspaces: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether the window should be visible on all workspaces or virtual desktops.

[Source](../../src/tauri/test/mock_runtime.rs.html#429-431)[§](#method.content_protected)

#### fn [content\_protected](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.content_protected)(self, protected: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Prevents the window contents from being captured by other apps.

[Source](../../src/tauri/test/mock_runtime.rs.html#433-435)[§](#method.icon)

#### fn [icon](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.icon)(self, icon: [Icon](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/struct.Icon.html "struct tauri_runtime::Icon")<'\_>) -> [Result](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/type.Result.html "type tauri_runtime::Result")<Self>

Sets the window icon.

[Source](../../src/tauri/test/mock_runtime.rs.html#437-439)[§](#method.skip_taskbar)

#### fn [skip\_taskbar](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.skip_taskbar)(self, skip: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Sets whether or not the window icon should be added to the taskbar.

[Source](../../src/tauri/test/mock_runtime.rs.html#441-443)[§](#method.window_classname)

#### fn [window\_classname](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.window_classname)<S: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>>(self, classname: S) -> Self

Sets custom name for Windows’ window class. **Windows only**.

[Source](../../src/tauri/test/mock_runtime.rs.html#445-447)[§](#method.shadow)

#### fn [shadow](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.shadow)(self, enable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Sets whether or not the window has shadow. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.shadow)

[Source](../../src/tauri/test/mock_runtime.rs.html#471-473)[§](#method.transient_for)

#### fn [transient\_for](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.transient_for)(self, parent: &impl [IsA](https://docs.rs/glib/0.18.5/x86_64-unknown-linux-gnu/glib/object/trait.IsA.html "trait glib::object::IsA")<[Window](https://docs.rs/gtk/0.18.2/x86_64-unknown-linux-gnu/gtk/auto/window/struct.Window.html "struct gtk::auto::window::Window")>) -> Self

Sets the window to be created transient for parent. [Read more](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.transient_for)

[Source](../../src/tauri/test/mock_runtime.rs.html#500-502)[§](#method.theme)

#### fn [theme](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.theme)(self, theme: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Theme](..\enum.Theme.html.md "enum tauri::Theme")>) -> Self

Forces a theme or uses the system settings if None was provided.

[Source](../../src/tauri/test/mock_runtime.rs.html#504-506)[§](#method.has_icon)

#### fn [has\_icon](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.has_icon)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Whether the icon was set or not.

[Source](../../src/tauri/test/mock_runtime.rs.html#508-510)[§](#method.get_theme)

#### fn [get\_theme](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.get_theme)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Theme](..\enum.Theme.html.md "enum tauri::Theme")>

[Source](../../src/tauri/test/mock_runtime.rs.html#512-514)[§](#method.background_color)

#### fn [background\_color](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilder.html#tymethod.background_color)(self, \_color: [Color](..\webview\struct.Color.html.md "struct tauri::webview::Color")) -> Self

Set the window background color.

[Source](../../src/tauri/test/mock_runtime.rs.html#330)[§](#impl-WindowBuilderBase-for-MockWindowBuilder)

### impl [WindowBuilderBase](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/window/trait.WindowBuilderBase.html "trait tauri_runtime::window::WindowBuilderBase") for [MockWindowBuilder](struct.MockWindowBuilder.html.md "struct tauri::test::MockWindowBuilder")

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-MockWindowBuilder)

### impl [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [MockWindowBuilder](struct.MockWindowBuilder.html.md "struct tauri::test::MockWindowBuilder")

[§](#impl-RefUnwindSafe-for-MockWindowBuilder)

### impl [RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [MockWindowBuilder](struct.MockWindowBuilder.html.md "struct tauri::test::MockWindowBuilder")

[§](#impl-Send-for-MockWindowBuilder)

### impl [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [MockWindowBuilder](struct.MockWindowBuilder.html.md "struct tauri::test::MockWindowBuilder")

[§](#impl-Sync-for-MockWindowBuilder)

### impl [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [MockWindowBuilder](struct.MockWindowBuilder.html.md "struct tauri::test::MockWindowBuilder")

[§](#impl-Unpin-for-MockWindowBuilder)

### impl [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [MockWindowBuilder](struct.MockWindowBuilder.html.md "struct tauri::test::MockWindowBuilder")

[§](#impl-UnwindSafe-for-MockWindowBuilder)

### impl [UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [MockWindowBuilder](struct.MockWindowBuilder.html.md "struct tauri::test::MockWindowBuilder")

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