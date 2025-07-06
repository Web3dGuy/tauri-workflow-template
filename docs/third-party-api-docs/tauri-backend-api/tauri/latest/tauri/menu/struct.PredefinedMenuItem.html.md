# Struct PredefinedMenuItemCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/menu/mod.rs.html#144-165)

```
pub struct PredefinedMenuItem<R: Runtime>(/* private fields */);
```

Available on **`desktop`** only.

Expand description

A predefined (native) menu item which has a predefined behavior by the OS or by this crate.

## Implementations[§](#implementations)

[Source](../../src/tauri/menu/predefined.rs.html#13-409)[§](#impl-PredefinedMenuItem%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [PredefinedMenuItem](struct.PredefinedMenuItem.html.md "struct tauri::menu::PredefinedMenuItem")<R>

[Source](../../src/tauri/menu/predefined.rs.html#15-29)

#### pub fn [separator](#method.separator)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>>(manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Separator menu item

[Source](../../src/tauri/menu/predefined.rs.html#32-48)

#### pub fn [copy](#method.copy)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>>(manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), text: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Copy menu item

[Source](../../src/tauri/menu/predefined.rs.html#51-67)

#### pub fn [cut](#method.cut)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>>(manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), text: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Cut menu item

[Source](../../src/tauri/menu/predefined.rs.html#70-86)

#### pub fn [paste](#method.paste)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>>(manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), text: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Paste menu item

[Source](../../src/tauri/menu/predefined.rs.html#89-105)

#### pub fn [select\_all](#method.select_all)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>>( manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), text: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>, ) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

SelectAll menu item

[Source](../../src/tauri/menu/predefined.rs.html#112-128)

#### pub fn [undo](#method.undo)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>>(manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), text: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Undo menu item

###### [§](#platform-specific)Platform-specific:

* **Windows / Linux:** Unsupported.

[Source](../../src/tauri/menu/predefined.rs.html#134-150)

#### pub fn [redo](#method.redo)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>>(manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), text: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Redo menu item

###### [§](#platform-specific-1)Platform-specific:

* **Windows / Linux:** Unsupported.

[Source](../../src/tauri/menu/predefined.rs.html#157-173)

#### pub fn [minimize](#method.minimize)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>>(manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), text: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Minimize window menu item

###### [§](#platform-specific-2)Platform-specific:

* **Linux:** Unsupported.

[Source](../../src/tauri/menu/predefined.rs.html#180-196)

#### pub fn [maximize](#method.maximize)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>>(manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), text: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Maximize window menu item

###### [§](#platform-specific-3)Platform-specific:

* **Linux:** Unsupported.

[Source](../../src/tauri/menu/predefined.rs.html#203-219)

#### pub fn [fullscreen](#method.fullscreen)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>>( manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), text: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>, ) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Fullscreen menu item

###### [§](#platform-specific-4)Platform-specific:

* **Windows / Linux:** Unsupported.

[Source](../../src/tauri/menu/predefined.rs.html#226-242)

#### pub fn [hide](#method.hide)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>>(manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), text: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Hide window menu item

###### [§](#platform-specific-5)Platform-specific:

* **Linux:** Unsupported.

[Source](../../src/tauri/menu/predefined.rs.html#249-265)

#### pub fn [hide\_others](#method.hide_others)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>>( manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), text: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>, ) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Hide other windows menu item

###### [§](#platform-specific-6)Platform-specific:

* **Linux:** Unsupported.

[Source](../../src/tauri/menu/predefined.rs.html#272-288)

#### pub fn [show\_all](#method.show_all)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>>(manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), text: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Show all app windows menu item

###### [§](#platform-specific-7)Platform-specific:

* **Windows / Linux:** Unsupported.

[Source](../../src/tauri/menu/predefined.rs.html#295-311)

#### pub fn [close\_window](#method.close_window)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>>( manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), text: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>, ) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Close window menu item

###### [§](#platform-specific-8)Platform-specific:

* **Linux:** Unsupported.

[Source](../../src/tauri/menu/predefined.rs.html#318-334)

#### pub fn [quit](#method.quit)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>>(manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), text: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Quit app menu item

###### [§](#platform-specific-9)Platform-specific:

* **Linux:** Unsupported.

[Source](../../src/tauri/menu/predefined.rs.html#337-362)

#### pub fn [about](#method.about)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>>( manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), text: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>, metadata: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[AboutMetadata](struct.AboutMetadata.html.md "struct tauri::menu::AboutMetadata")<'\_>>, ) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

About app menu item

[Source](../../src/tauri/menu/predefined.rs.html#369-385)

#### pub fn [services](#method.services)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>>(manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), text: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Services menu item

###### [§](#platform-specific-10)Platform-specific:

* **Windows / Linux:** Unsupported.

[Source](../../src/tauri/menu/predefined.rs.html#388-390)

#### pub fn [id](#method.id)(&self) -> &[MenuId](struct.MenuId.html.md "struct tauri::menu::MenuId")

Returns a unique identifier associated with this menu item.

[Source](../../src/tauri/menu/predefined.rs.html#393-395)

#### pub fn [text](#method.text)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>

Get the text for this menu item.

[Source](../../src/tauri/menu/predefined.rs.html#400-403)

#### pub fn [set\_text](#method.set_text)<S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>(&self, text: S) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Set the text for this menu item. `text` could optionally contain
an `&` before a character to assign this character as the mnemonic
for this menu item. To display a `&` without assigning a mnemenonic, use `&&`.

[Source](../../src/tauri/menu/predefined.rs.html#406-408)

#### pub fn [app\_handle](#method.app_handle)(&self) -> &[AppHandle](..\struct.AppHandle.html.md "struct tauri::AppHandle")<R>

The application handle associated with this type.

## Trait Implementations[§](#trait-implementations)

[Source](../../src/tauri/menu/mod.rs.html#144-165)[§](#impl-Clone-for-PredefinedMenuItem%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [PredefinedMenuItem](struct.PredefinedMenuItem.html.md "struct tauri::menu::PredefinedMenuItem")<R>

[Source](../../src/tauri/menu/mod.rs.html#144-165)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> Self

Returns a copy of the value. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#174)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &Self)

Performs copy-assignment from `source`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)

[Source](../../src/tauri/menu/mod.rs.html#144-165)[§](#impl-IsMenuItem%3CR%3E-for-PredefinedMenuItem%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [IsMenuItem](trait.IsMenuItem.html.md "trait tauri::menu::IsMenuItem")<R> for [PredefinedMenuItem](struct.PredefinedMenuItem.html.md "struct tauri::menu::PredefinedMenuItem")<R>

[Source](../../src/tauri/menu/mod.rs.html#144-165)[§](#method.kind)

#### fn [kind](trait.IsMenuItem.html_tymethod.kind.md)(&self) -> [MenuItemKind](enum.MenuItemKind.html.md "enum tauri::menu::MenuItemKind")<R>

Returns the kind of this menu item.

[Source](../../src/tauri/menu/mod.rs.html#144-165)[§](#method.id-1)

#### fn [id](trait.IsMenuItem.html_tymethod.id.md)(&self) -> &[MenuId](struct.MenuId.html.md "struct tauri::menu::MenuId")

Returns a unique identifier associated with this menu.

[Source](../../src/tauri/menu/mod.rs.html#144-165)[§](#impl-Resource-for-PredefinedMenuItem%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Resource](..\trait.Resource.html.md "trait tauri::Resource") for [PredefinedMenuItem](struct.PredefinedMenuItem.html.md "struct tauri::menu::PredefinedMenuItem")<R>

[Source](../../src/tauri/resources/mod.rs.html#30-32)[§](#method.name)

#### fn [name](..\trait.Resource.html_method.name.md)(&self) -> [Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'\_, [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>

Returns a string representation of the resource. The default implementation
returns the Rust type name, but specific resource types may override this
trait method.

[Source](../../src/tauri/resources/mod.rs.html#37)[§](#method.close)

#### fn [close](..\trait.Resource.html_method.close.md)(self: [Arc](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc")<Self>)

Resources may implement the `close()` trait method if they need to do
resource specific clean-ups, such as cancelling pending futures, after a
resource has been removed from the resource table.

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-PredefinedMenuItem%3CR%3E)

### impl<R> [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [PredefinedMenuItem](struct.PredefinedMenuItem.html.md "struct tauri::menu::PredefinedMenuItem")<R>

[§](#impl-RefUnwindSafe-for-PredefinedMenuItem%3CR%3E)

### impl<R> ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [PredefinedMenuItem](struct.PredefinedMenuItem.html.md "struct tauri::menu::PredefinedMenuItem")<R>

[§](#impl-Send-for-PredefinedMenuItem%3CR%3E)

### impl<R> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [PredefinedMenuItem](struct.PredefinedMenuItem.html.md "struct tauri::menu::PredefinedMenuItem")<R>

[§](#impl-Sync-for-PredefinedMenuItem%3CR%3E)

### impl<R> [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [PredefinedMenuItem](struct.PredefinedMenuItem.html.md "struct tauri::menu::PredefinedMenuItem")<R>

[§](#impl-Unpin-for-PredefinedMenuItem%3CR%3E)

### impl<R> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [PredefinedMenuItem](struct.PredefinedMenuItem.html.md "struct tauri::menu::PredefinedMenuItem")<R>

[§](#impl-UnwindSafe-for-PredefinedMenuItem%3CR%3E)

### impl<R> ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [PredefinedMenuItem](struct.PredefinedMenuItem.html.md "struct tauri::menu::PredefinedMenuItem")<R>

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