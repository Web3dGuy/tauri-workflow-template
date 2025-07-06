# Struct IconMenuItemBuilderCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/menu/builders/icon.rs.html#12-19)

```
pub struct IconMenuItemBuilder<'a> { /* private fields */ }
```

Available on **`desktop`** only.

Expand description

A builder type for [`IconMenuItem`](struct.IconMenuItem.html.md "struct tauri::menu::IconMenuItem")

## Implementations[§](#implementations)

[Source](../../src/tauri/menu/builders/icon.rs.html#21-130)[§](#impl-IconMenuItemBuilder%3C'a%3E)

### impl<'a> [IconMenuItemBuilder](struct.IconMenuItemBuilder.html.md "struct tauri::menu::IconMenuItemBuilder")<'a>

[Source](../../src/tauri/menu/builders/icon.rs.html#26-35)

#### pub fn [new](#method.new)<S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(text: S) -> Self

Create a new menu item builder.

* `text` could optionally contain an `&` before a character to assign this character as the mnemonic
  for this menu item. To display a `&` without assigning a mnemenonic, use `&&`.

[Source](../../src/tauri/menu/builders/icon.rs.html#41-50)

#### pub fn [with\_id](#method.with_id)<I: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[MenuId](struct.MenuId.html.md "struct tauri::menu::MenuId")>, S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(id: I, text: S) -> Self

Create a new menu item builder with the specified id.

* `text` could optionally contain an `&` before a character to assign this character as the mnemonic
  for this menu item. To display a `&` without assigning a mnemenonic, use `&&`.

[Source](../../src/tauri/menu/builders/icon.rs.html#53-56)

#### pub fn [id](#method.id)<I: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[MenuId](struct.MenuId.html.md "struct tauri::menu::MenuId")>>(self, id: I) -> Self

Set the id for this menu item.

[Source](../../src/tauri/menu/builders/icon.rs.html#59-62)

#### pub fn [enabled](#method.enabled)(self, enabled: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> Self

Set the enabled state for this menu item.

[Source](../../src/tauri/menu/builders/icon.rs.html#65-68)

#### pub fn [accelerator](#method.accelerator)<S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(self, accelerator: S) -> Self

Set the accelerator for this menu item.

[Source](../../src/tauri/menu/builders/icon.rs.html#74-78)

#### pub fn [icon](#method.icon)(self, icon: [Image](..\image\struct.Image.html.md "struct tauri::image::Image")<'a>) -> Self

Set the icon for this menu item.

**Note:** This method conflicts with [`Self::native_icon`](struct.IconMenuItemBuilder.html_method.native_icon.md "method tauri::menu::IconMenuItemBuilder::native_icon")
so calling one of them, will reset the other.

[Source](../../src/tauri/menu/builders/icon.rs.html#84-88)

#### pub fn [native\_icon](#method.native_icon)(self, icon: [NativeIcon](enum.NativeIcon.html.md "enum tauri::menu::NativeIcon")) -> Self

Set the icon for this menu item.

**Note:** This method conflicts with [`Self::icon`](struct.IconMenuItemBuilder.html_method.icon.md "method tauri::menu::IconMenuItemBuilder::icon")
so calling one of them, will reset the other.

[Source](../../src/tauri/menu/builders/icon.rs.html#91-129)

#### pub fn [build](#method.build)<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"), M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>>( self, manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), ) -> [Result](..\type.Result.html.md "type tauri::Result")<[IconMenuItem](struct.IconMenuItem.html.md "struct tauri::menu::IconMenuItem")<R>>

Build the menu item

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-IconMenuItemBuilder%3C'a%3E)

### impl<'a> [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [IconMenuItemBuilder](struct.IconMenuItemBuilder.html.md "struct tauri::menu::IconMenuItemBuilder")<'a>

[§](#impl-RefUnwindSafe-for-IconMenuItemBuilder%3C'a%3E)

### impl<'a> [RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [IconMenuItemBuilder](struct.IconMenuItemBuilder.html.md "struct tauri::menu::IconMenuItemBuilder")<'a>

[§](#impl-Send-for-IconMenuItemBuilder%3C'a%3E)

### impl<'a> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [IconMenuItemBuilder](struct.IconMenuItemBuilder.html.md "struct tauri::menu::IconMenuItemBuilder")<'a>

[§](#impl-Sync-for-IconMenuItemBuilder%3C'a%3E)

### impl<'a> [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [IconMenuItemBuilder](struct.IconMenuItemBuilder.html.md "struct tauri::menu::IconMenuItemBuilder")<'a>

[§](#impl-Unpin-for-IconMenuItemBuilder%3C'a%3E)

### impl<'a> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [IconMenuItemBuilder](struct.IconMenuItemBuilder.html.md "struct tauri::menu::IconMenuItemBuilder")<'a>

[§](#impl-UnwindSafe-for-IconMenuItemBuilder%3C'a%3E)

### impl<'a> [UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [IconMenuItemBuilder](struct.IconMenuItemBuilder.html.md "struct tauri::menu::IconMenuItemBuilder")<'a>

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