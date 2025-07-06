# Struct MenuBuilderCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/menu/builders/menu.rs.html#40-44)

```
pub struct MenuBuilder<'m, R: Runtime, M: Manager<R>> { /* private fields */ }
```

Available on **`desktop`** only.

Expand description

A builder type for [`Menu`](struct.Menu.html.md "struct tauri::menu::Menu")

### [§](#platform-specific)Platform-specific:

* **macOS**: if using [`MenuBuilder`](struct.MenuBuilder.html.md "struct tauri::menu::MenuBuilder") for the global menubar, it can only contain [`Submenu`](struct.Submenu.html.md "struct tauri::menu::Submenu")s

## [§](#example)Example

```
use tauri::menu::*;
tauri::Builder::default()
  .setup(move |app| {
    let handle = app.handle();
    let menu = MenuBuilder::new(handle)
      .item(&MenuItem::new(handle, "MenuItem 1", true, None::<&str>)?)
      .items(&[
        &CheckMenuItem::new(handle, "CheckMenuItem 1", true, true, None::<&str>)?,
        &IconMenuItem::new(handle, "IconMenuItem 1", true, Some(icon1), None::<&str>)?,
      ])
      .separator()
      .cut()
      .copy()
      .paste()
      .separator()
      .text("item2", "MenuItem 2")
      .check("checkitem2", "CheckMenuItem 2")
      .icon("iconitem2", "IconMenuItem 2", app.default_window_icon().cloned().unwrap())
      .build()?;
    app.set_menu(menu);
    Ok(())
  });
```

## Implementations[§](#implementations)

[Source](../../src/tauri/menu/builders/menu.rs.html#46-80)[§](#impl-MenuBuilder%3C'm,+R,+M%3E)

### impl<'m, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"), M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>> [MenuBuilder](struct.MenuBuilder.html.md "struct tauri::menu::MenuBuilder")<'m, R, M>

[Source](../../src/tauri/menu/builders/menu.rs.html#48-54)

#### pub fn [new](#method.new)(manager: [&'m M](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> Self

Create a new menu builder.

[Source](../../src/tauri/menu/builders/menu.rs.html#57-63)

#### pub fn [with\_id](#method.with_id)<I: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[MenuId](struct.MenuId.html.md "struct tauri::menu::MenuId")>>(manager: [&'m M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), id: I) -> Self

Create a new menu builder with the specified id.

[Source](../../src/tauri/menu/builders/menu.rs.html#66-79)

#### pub fn [build](#method.build)(self) -> [Result](..\type.Result.html.md "type tauri::Result")<[Menu](struct.Menu.html.md "struct tauri::menu::Menu")<R>>

Builds this menu

[Source](../../src/tauri/menu/builders/menu.rs.html#611)[§](#impl-MenuBuilder%3C'm,+R,+M%3E-1)

### impl<'m, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"), M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>> [MenuBuilder](struct.MenuBuilder.html.md "struct tauri::menu::MenuBuilder")<'m, R, M>

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [id](#method.id)<I: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[MenuId](struct.MenuId.html.md "struct tauri::menu::MenuId")>>(self, id: I) -> Self

Set the id for this menu.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [item](#method.item)(self, item: &dyn [IsMenuItem](trait.IsMenuItem.html.md "trait tauri::menu::IsMenuItem")<R>) -> Self

Add this item to the menu.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [items](#method.items)(self, items: &[&dyn [IsMenuItem](trait.IsMenuItem.html.md "trait tauri::menu::IsMenuItem")<R>]) -> Self

Add these items to the menu.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [text](#method.text)<I: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[MenuId](struct.MenuId.html.md "struct tauri::menu::MenuId")>, S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(self, id: I, text: S) -> Self

Add a [MenuItem](struct.MenuItem.html.md "struct tauri::menu::MenuItem") to the menu.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [check](#method.check)<I: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[MenuId](struct.MenuId.html.md "struct tauri::menu::MenuId")>, S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(self, id: I, text: S) -> Self

Add a [CheckMenuItem](struct.CheckMenuItem.html.md "struct tauri::menu::CheckMenuItem") to the menu.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [icon](#method.icon)<I: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[MenuId](struct.MenuId.html.md "struct tauri::menu::MenuId")>, S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>( self, id: I, text: S, icon: [Image](..\image\struct.Image.html.md "struct tauri::image::Image")<'\_>, ) -> Self

Add an [IconMenuItem](struct.IconMenuItem.html.md "struct tauri::menu::IconMenuItem") to the menu.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [native\_icon](#method.native_icon)<I: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[MenuId](struct.MenuId.html.md "struct tauri::menu::MenuId")>, S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>( self, id: I, text: S, icon: [NativeIcon](enum.NativeIcon.html.md "enum tauri::menu::NativeIcon"), ) -> Self

Add an [IconMenuItem](struct.IconMenuItem.html.md "struct tauri::menu::IconMenuItem") with a native icon to the menu.

###### [§](#platform-specific-1)Platform-specific:

* **Windows / Linux**: Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [separator](#method.separator)(self) -> Self

Add Separator menu item to the menu.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [copy](#method.copy)(self) -> Self

Add Copy menu item to the menu.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [copy\_with\_text](#method.copy_with_text)<S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(self, text: S) -> Self

Add Copy menu item with specified text to the menu.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [cut](#method.cut)(self) -> Self

Add Cut menu item to the menu.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [cut\_with\_text](#method.cut_with_text)<S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(self, text: S) -> Self

Add Cut menu item with specified text to the menu.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [paste](#method.paste)(self) -> Self

Add Paste menu item to the menu.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [paste\_with\_text](#method.paste_with_text)<S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(self, text: S) -> Self

Add Paste menu item with specified text to the menu.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [select\_all](#method.select_all)(self) -> Self

Add SelectAll menu item to the menu.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [select\_all\_with\_text](#method.select_all_with_text)<S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(self, text: S) -> Self

Add SelectAll menu item with specified text to the menu.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [undo](#method.undo)(self) -> Self

Add Undo menu item to the menu.

###### [§](#platform-specific-2)Platform-specific:

* **Windows / Linux:** Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [undo\_with\_text](#method.undo_with_text)<S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(self, text: S) -> Self

Add Undo menu item with specified text to the menu.

###### [§](#platform-specific-3)Platform-specific:

* **Windows / Linux:** Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [redo](#method.redo)(self) -> Self

Add Redo menu item to the menu.

###### [§](#platform-specific-4)Platform-specific:

* **Windows / Linux:** Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [redo\_with\_text](#method.redo_with_text)<S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(self, text: S) -> Self

Add Redo menu item with specified text to the menu.

###### [§](#platform-specific-5)Platform-specific:

* **Windows / Linux:** Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [minimize](#method.minimize)(self) -> Self

Add Minimize window menu item to the menu.

###### [§](#platform-specific-6)Platform-specific:

* **Linux:** Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [minimize\_with\_text](#method.minimize_with_text)<S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(self, text: S) -> Self

Add Minimize window menu item with specified text to the menu.

###### [§](#platform-specific-7)Platform-specific:

* **Linux:** Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [maximize](#method.maximize)(self) -> Self

Add Maximize window menu item to the menu.

###### [§](#platform-specific-8)Platform-specific:

* **Linux:** Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [maximize\_with\_text](#method.maximize_with_text)<S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(self, text: S) -> Self

Add Maximize window menu item with specified text to the menu.

###### [§](#platform-specific-9)Platform-specific:

* **Linux:** Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [fullscreen](#method.fullscreen)(self) -> Self

Add Fullscreen menu item to the menu.

###### [§](#platform-specific-10)Platform-specific:

* **Windows / Linux:** Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [fullscreen\_with\_text](#method.fullscreen_with_text)<S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(self, text: S) -> Self

Add Fullscreen menu item with specified text to the menu.

###### [§](#platform-specific-11)Platform-specific:

* **Windows / Linux:** Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [hide](#method.hide)(self) -> Self

Add Hide window menu item to the menu.

###### [§](#platform-specific-12)Platform-specific:

* **Linux:** Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [hide\_with\_text](#method.hide_with_text)<S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(self, text: S) -> Self

Add Hide window menu item with specified text to the menu.

###### [§](#platform-specific-13)Platform-specific:

* **Linux:** Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [hide\_others](#method.hide_others)(self) -> Self

Add Hide other windows menu item to the menu.

###### [§](#platform-specific-14)Platform-specific:

* **Linux:** Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [hide\_others\_with\_text](#method.hide_others_with_text)<S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(self, text: S) -> Self

Add Hide other windows menu item with specified text to the menu.

###### [§](#platform-specific-15)Platform-specific:

* **Linux:** Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [show\_all](#method.show_all)(self) -> Self

Add Show all app windows menu item to the menu.

###### [§](#platform-specific-16)Platform-specific:

* **Windows / Linux:** Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [show\_all\_with\_text](#method.show_all_with_text)<S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(self, text: S) -> Self

Add Show all app windows menu item with specified text to the menu.

###### [§](#platform-specific-17)Platform-specific:

* **Windows / Linux:** Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [close\_window](#method.close_window)(self) -> Self

Add Close window menu item to the menu.

###### [§](#platform-specific-18)Platform-specific:

* **Linux:** Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [close\_window\_with\_text](#method.close_window_with_text)<S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(self, text: S) -> Self

Add Close window menu item with specified text to the menu.

###### [§](#platform-specific-19)Platform-specific:

* **Linux:** Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [quit](#method.quit)(self) -> Self

Add Quit app menu item to the menu.

###### [§](#platform-specific-20)Platform-specific:

* **Linux:** Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [quit\_with\_text](#method.quit_with_text)<S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(self, text: S) -> Self

Add Quit app menu item with specified text to the menu.

###### [§](#platform-specific-21)Platform-specific:

* **Linux:** Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [about](#method.about)(self, metadata: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[AboutMetadata](struct.AboutMetadata.html.md "struct tauri::menu::AboutMetadata")<'\_>>) -> Self

Add About app menu item to the menu.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [about\_with\_text](#method.about_with_text)<S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>( self, text: S, metadata: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[AboutMetadata](struct.AboutMetadata.html.md "struct tauri::menu::AboutMetadata")<'\_>>, ) -> Self

Add About app menu item with specified text to the menu.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [services](#method.services)(self) -> Self

Add Services menu item to the menu.

###### [§](#platform-specific-22)Platform-specific:

* **Windows / Linux:** Unsupported.

[Source](../../src/tauri/menu/builders/menu.rs.html#611)

#### pub fn [services\_with\_text](#method.services_with_text)<S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(self, text: S) -> Self

Add Services menu item with specified text to the menu.

###### [§](#platform-specific-23)Platform-specific:

* **Windows / Linux:** Unsupported.

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-MenuBuilder%3C'm,+R,+M%3E)

### impl<'m, R, M> [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [MenuBuilder](struct.MenuBuilder.html.md "struct tauri::menu::MenuBuilder")<'m, R, M>

[§](#impl-RefUnwindSafe-for-MenuBuilder%3C'm,+R,+M%3E)

### impl<'m, R, M> ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [MenuBuilder](struct.MenuBuilder.html.md "struct tauri::menu::MenuBuilder")<'m, R, M>

[§](#impl-Send-for-MenuBuilder%3C'm,+R,+M%3E)

### impl<'m, R, M> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [MenuBuilder](struct.MenuBuilder.html.md "struct tauri::menu::MenuBuilder")<'m, R, M> where M: [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync"),

[§](#impl-Sync-for-MenuBuilder%3C'm,+R,+M%3E)

### impl<'m, R, M> [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [MenuBuilder](struct.MenuBuilder.html.md "struct tauri::menu::MenuBuilder")<'m, R, M> where M: [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync"),

[§](#impl-Unpin-for-MenuBuilder%3C'm,+R,+M%3E)

### impl<'m, R, M> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [MenuBuilder](struct.MenuBuilder.html.md "struct tauri::menu::MenuBuilder")<'m, R, M>

[§](#impl-UnwindSafe-for-MenuBuilder%3C'm,+R,+M%3E)

### impl<'m, R, M> ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [MenuBuilder](struct.MenuBuilder.html.md "struct tauri::menu::MenuBuilder")<'m, R, M>

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