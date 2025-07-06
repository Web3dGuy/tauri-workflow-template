# Struct TrayIconBuilderCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/tray/mod.rs.html#213-217)

```
pub struct TrayIconBuilder<R: Runtime> { /* private fields */ }
```

Available on **`desktop` and crate feature `tray-icon`** only.

Expand description

[`TrayIcon`](struct.TrayIcon.html.md "struct tauri::tray::TrayIcon") builder struct and associated methods.

## Implementations[§](#implementations)

[Source](../../src/tauri/tray/mod.rs.html#219-393)[§](#impl-TrayIconBuilder%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [TrayIconBuilder](struct.TrayIconBuilder.html.md "struct tauri::tray::TrayIconBuilder")<R>

[Source](../../src/tauri/tray/mod.rs.html#226-232)

#### pub fn [new](#method.new)() -> Self

Creates a new tray icon builder.

###### [§](#platform-specific)Platform-specific:

* **Linux:** Sometimes the icon won’t be visible unless a menu is set.
  Setting an empty [`Menu`](..\menu\struct.Menu.html.md "struct tauri::menu::Menu") is enough.

[Source](../../src/tauri/tray/mod.rs.html#240-244)

#### pub fn [with\_id](#method.with_id)<I: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")>>(id: I) -> Self

Creates a new tray icon builder with the specified id.

###### [§](#platform-specific-1)Platform-specific:

* **Linux:** Sometimes the icon won’t be visible unless a menu is set.
  Setting an empty [`Menu`](..\menu\struct.Menu.html.md "struct tauri::menu::Menu") is enough.

[Source](../../src/tauri/tray/mod.rs.html#251-254)

#### pub fn [menu](#method.menu)<M: [ContextMenu](..\menu\trait.ContextMenu.html.md "trait tauri::menu::ContextMenu")>(self, menu: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> Self

Set the a menu for this tray icon.

###### [§](#platform-specific-2)Platform-specific:

* **Linux**: once a menu is set, it cannot be removed or replaced but you can change its content.

[Source](../../src/tauri/tray/mod.rs.html#262-268)

#### pub fn [icon](#method.icon)(self, icon: [Image](..\image\struct.Image.html.md "struct tauri::image::Image")<'\_>) -> Self

Set an icon for this tray icon.

###### [§](#platform-specific-3)Platform-specific:

* **Linux:** Sometimes the icon won’t be visible unless a menu is set.
  Setting an empty [`Menu`](..\menu\struct.Menu.html.md "struct tauri::menu::Menu") is enough.

[Source](../../src/tauri/tray/mod.rs.html#275-278)

#### pub fn [tooltip](#method.tooltip)<S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(self, s: S) -> Self

Set a tooltip for this tray icon.

###### [§](#platform-specific-4)Platform-specific:

* **Linux:** Unsupported.

[Source](../../src/tauri/tray/mod.rs.html#290-293)

#### pub fn [title](#method.title)<S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(self, title: S) -> Self

Set the tray icon title.

###### [§](#platform-specific-5)Platform-specific

* **Linux:** The title will not be shown unless there is an icon
  as well. The title is useful for numerical and other frequently
  updated information. In general, it shouldn’t be shown unless a
  user requests it as it can take up a significant amount of space
  on the user’s panel. This may not be shown in all visualizations.
* **Windows:** Unsupported.

[Source](../../src/tauri/tray/mod.rs.html#299-302)

#### pub fn [temp\_dir\_path](#method.temp_dir_path)<P: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[Path](https://doc.rust-lang.org/nightly/std/path/struct.Path.html "struct std::path::Path")>>(self, s: P) -> Self

Set tray icon temp dir path. **Linux only**.

On Linux, we need to write the icon to the disk and usually it will
be `$XDG_RUNTIME_DIR/tray-icon` or `$TEMP/tray-icon`.

[Source](../../src/tauri/tray/mod.rs.html#305-308)

#### pub fn [icon\_as\_template](#method.icon_as_template)(self, is\_template: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Use the icon as a [template](https://developer.apple.com/documentation/appkit/nsimage/1520017-template?language=objc). **macOS only**.

[Source](../../src/tauri/tray/mod.rs.html#319-322)

#### pub fn [menu\_on\_left\_click](#method.menu_on_left_click)(self, enable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

👎Deprecated since 2.2.0: Use `TrayIconBuiler::show_menu_on_left_click` instead.

Whether to show the tray menu on left click or not, default is `true`.

###### [§](#platform-specific-6)Platform-specific:

* **Linux:** Unsupported.

[Source](../../src/tauri/tray/mod.rs.html#329-332)

#### pub fn [show\_menu\_on\_left\_click](#method.show_menu_on_left_click)(self, enable: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Whether to show the tray menu on left click or not, default is `true`.

###### [§](#platform-specific-7)Platform-specific:

* **Linux:** Unsupported.

[Source](../../src/tauri/tray/mod.rs.html#338-344)

#### pub fn [on\_menu\_event](#method.on_menu_event)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[AppHandle](..\struct.AppHandle.html.md "struct tauri::AppHandle")<R>, [MenuEvent](..\menu\struct.MenuEvent.html.md "struct tauri::menu::MenuEvent")) + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>( self, f: F, ) -> Self

Set a handler for menu events.

Note that this handler is called for any menu event,
whether it is coming from this window, another window or from the tray icon menu.

[Source](../../src/tauri/tray/mod.rs.html#347-353)

#### pub fn [on\_tray\_icon\_event](#method.on_tray_icon_event)<F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")(&[TrayIcon](struct.TrayIcon.html.md "struct tauri::tray::TrayIcon")<R>, [TrayIconEvent](enum.TrayIconEvent.html.md "enum tauri::tray::TrayIconEvent")) + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static>( self, f: F, ) -> Self

Set a handler for this tray icon events.

[Source](../../src/tauri/tray/mod.rs.html#357-359)

#### pub fn [id](#method.id)(&self) -> &[TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

Access the unique id that will be assigned to the tray icon
this builder will create.

[Source](../../src/tauri/tray/mod.rs.html#362-392)

#### pub fn [build](#method.build)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>>(self, manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[TrayIcon](struct.TrayIcon.html.md "struct tauri::tray::TrayIcon")<R>>

Builds and adds a new [`TrayIcon`](struct.TrayIcon.html.md "struct tauri::tray::TrayIcon") to the system tray.

## Trait Implementations[§](#trait-implementations)

[Source](../../src/tauri/tray/mod.rs.html#212)[§](#impl-Default-for-TrayIconBuilder%3CR%3E)

### impl<R: [Default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html "trait core::default::Default") + [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html "trait core::default::Default") for [TrayIconBuilder](struct.TrayIconBuilder.html.md "struct tauri::tray::TrayIconBuilder")<R>

[Source](../../src/tauri/tray/mod.rs.html#212)[§](#method.default)

#### fn [default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html#tymethod.default)() -> [TrayIconBuilder](struct.TrayIconBuilder.html.md "struct tauri::tray::TrayIconBuilder")<R>

Returns the “default value” for a type. [Read more](https://doc.rust-lang.org/nightly/core/default/trait.Default.html#tymethod.default)

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-TrayIconBuilder%3CR%3E)

### impl<R> [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [TrayIconBuilder](struct.TrayIconBuilder.html.md "struct tauri::tray::TrayIconBuilder")<R>

[§](#impl-RefUnwindSafe-for-TrayIconBuilder%3CR%3E)

### impl<R> ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [TrayIconBuilder](struct.TrayIconBuilder.html.md "struct tauri::tray::TrayIconBuilder")<R>

[§](#impl-Send-for-TrayIconBuilder%3CR%3E)

### impl<R> ![Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [TrayIconBuilder](struct.TrayIconBuilder.html.md "struct tauri::tray::TrayIconBuilder")<R>

[§](#impl-Sync-for-TrayIconBuilder%3CR%3E)

### impl<R> ![Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [TrayIconBuilder](struct.TrayIconBuilder.html.md "struct tauri::tray::TrayIconBuilder")<R>

[§](#impl-Unpin-for-TrayIconBuilder%3CR%3E)

### impl<R> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [TrayIconBuilder](struct.TrayIconBuilder.html.md "struct tauri::tray::TrayIconBuilder")<R>

[§](#impl-UnwindSafe-for-TrayIconBuilder%3CR%3E)

### impl<R> ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [TrayIconBuilder](struct.TrayIconBuilder.html.md "struct tauri::tray::TrayIconBuilder")<R>

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