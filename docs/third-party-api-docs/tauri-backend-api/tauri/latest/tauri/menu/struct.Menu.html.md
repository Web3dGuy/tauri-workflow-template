# Struct MenuCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/menu/mod.rs.html#144-165)

```
pub struct Menu<R: Runtime>(/* private fields */);
```

Available on **`desktop`** only.

Expand description

A type that is either a menu bar on the window
on Windows and Linux or as a global menu in the menubar on macOS.

### [§](#platform-specific)Platform-specific:

* **macOS**: if using [`Menu`](struct.Menu.html.md "struct tauri::menu::Menu") for the global menubar, it can only contain [`Submenu`](struct.Submenu.html.md "struct tauri::menu::Submenu")s

## Implementations[§](#implementations)

[Source](../../src/tauri/menu/menu.rs.html#91-408)[§](#impl-Menu%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Menu](struct.Menu.html.md "struct tauri::menu::Menu")<R>

[Source](../../src/tauri/menu/menu.rs.html#93-107)

#### pub fn [new](#method.new)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>>(manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Creates a new menu.

[Source](../../src/tauri/menu/menu.rs.html#110-125)

#### pub fn [with\_id](#method.with_id)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>, I: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[MenuId](struct.MenuId.html.md "struct tauri::menu::MenuId")>>( manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), id: I, ) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Creates a new menu with the specified id.

[Source](../../src/tauri/menu/menu.rs.html#128-135)

#### pub fn [with\_items](#method.with_items)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>>( manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), items: &[&dyn [IsMenuItem](trait.IsMenuItem.html.md "trait tauri::menu::IsMenuItem")<R>], ) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Creates a new menu with given `items`. It calls [`Menu::new`](struct.Menu.html_method.new.md "associated function tauri::menu::Menu::new") and [`Menu::append_items`](struct.Menu.html_method.append_items.md "method tauri::menu::Menu::append_items") internally.

[Source](../../src/tauri/menu/menu.rs.html#139-147)

#### pub fn [with\_id\_and\_items](#method.with_id_and_items)<M: [Manager](..\trait.Manager.html.md "trait tauri::Manager")<R>, I: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[MenuId](struct.MenuId.html.md "struct tauri::menu::MenuId")>>( manager: [&M](https://doc.rust-lang.org/nightly/std/primitive.reference.html), id: I, items: &[&dyn [IsMenuItem](trait.IsMenuItem.html.md "trait tauri::menu::IsMenuItem")<R>], ) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Creates a new menu with the specified id and given `items`.
It calls [`Menu::new`](struct.Menu.html_method.new.md "associated function tauri::menu::Menu::new") and [`Menu::append_items`](struct.Menu.html_method.append_items.md "method tauri::menu::Menu::append_items") internally.

[Source](../../src/tauri/menu/menu.rs.html#150-249)

#### pub fn [default](#method.default)(app\_handle: &[AppHandle](..\struct.AppHandle.html.md "struct tauri::AppHandle")<R>) -> [Result](..\type.Result.html.md "type tauri::Result")<Self>

Creates a menu filled with default menu items and submenus.

[Source](../../src/tauri/menu/menu.rs.html#256-258)

#### pub fn [app\_handle](#method.app_handle)(&self) -> &[AppHandle](..\struct.AppHandle.html.md "struct tauri::AppHandle")<R>

The application handle associated with this type.

[Source](../../src/tauri/menu/menu.rs.html#261-263)

#### pub fn [id](#method.id)(&self) -> &[MenuId](struct.MenuId.html.md "struct tauri::menu::MenuId")

Returns a unique identifier associated with this menu.

[Source](../../src/tauri/menu/menu.rs.html#272-278)

#### pub fn [append](#method.append)(&self, item: &dyn [IsMenuItem](trait.IsMenuItem.html.md "trait tauri::menu::IsMenuItem")<R>) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Add a menu item to the end of this menu.

###### [§](#platform-specific-1)Platform-specific:

* **macOS:** Only [`Submenu`](struct.Submenu.html.md "struct tauri::menu::Submenu") can be added to the menu.

[Source](../../src/tauri/menu/menu.rs.html#287-293)

#### pub fn [append\_items](#method.append_items)(&self, items: &[&dyn [IsMenuItem](trait.IsMenuItem.html.md "trait tauri::menu::IsMenuItem")<R>]) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Add menu items to the end of this menu. It calls [`Menu::append`](struct.Menu.html_method.append.md "method tauri::menu::Menu::append") in a loop internally.

###### [§](#platform-specific-2)Platform-specific:

* **macOS:** Only [`Submenu`](struct.Submenu.html.md "struct tauri::menu::Submenu") can be added to the menu

[Source](../../src/tauri/menu/menu.rs.html#302-308)

#### pub fn [prepend](#method.prepend)(&self, item: &dyn [IsMenuItem](trait.IsMenuItem.html.md "trait tauri::menu::IsMenuItem")<R>) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Add a menu item to the beginning of this menu.

###### [§](#platform-specific-3)Platform-specific:

* **macOS:** Only [`Submenu`](struct.Submenu.html.md "struct tauri::menu::Submenu") can be added to the menu

[Source](../../src/tauri/menu/menu.rs.html#317-319)

#### pub fn [prepend\_items](#method.prepend_items)(&self, items: &[&dyn [IsMenuItem](trait.IsMenuItem.html.md "trait tauri::menu::IsMenuItem")<R>]) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Add menu items to the beginning of this menu. It calls [`Menu::insert_items`](struct.Menu.html_method.insert_items.md "method tauri::menu::Menu::insert_items") with position of `0` internally.

###### [§](#platform-specific-4)Platform-specific:

* **macOS:** Only [`Submenu`](struct.Submenu.html.md "struct tauri::menu::Submenu") can be added to the menu

[Source](../../src/tauri/menu/menu.rs.html#328-334)

#### pub fn [insert](#method.insert)(&self, item: &dyn [IsMenuItem](trait.IsMenuItem.html.md "trait tauri::menu::IsMenuItem")<R>, position: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Insert a menu item at the specified `position` in the menu.

###### [§](#platform-specific-5)Platform-specific:

* **macOS:** Only [`Submenu`](struct.Submenu.html.md "struct tauri::menu::Submenu") can be added to the menu

[Source](../../src/tauri/menu/menu.rs.html#343-349)

#### pub fn [insert\_items](#method.insert_items)( &self, items: &[&dyn [IsMenuItem](trait.IsMenuItem.html.md "trait tauri::menu::IsMenuItem")<R>], position: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), ) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Insert menu items at the specified `position` in the menu.

###### [§](#platform-specific-6)Platform-specific:

* **macOS:** Only [`Submenu`](struct.Submenu.html.md "struct tauri::menu::Submenu") can be added to the menu

[Source](../../src/tauri/menu/menu.rs.html#352-358)

#### pub fn [remove](#method.remove)(&self, item: &dyn [IsMenuItem](trait.IsMenuItem.html.md "trait tauri::menu::IsMenuItem")<R>) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Remove a menu item from this menu.

[Source](../../src/tauri/menu/menu.rs.html#361-368)

#### pub fn [remove\_at](#method.remove_at)(&self, position: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [Result](..\type.Result.html.md "type tauri::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[MenuItemKind](enum.MenuItemKind.html.md "enum tauri::menu::MenuItemKind")<R>>>

Remove the menu item at the specified position from this menu and returns it.

[Source](../../src/tauri/menu/menu.rs.html#371-381)

#### pub fn [get](#method.get)<'a, I>(&self, id: [&'a I](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[MenuItemKind](enum.MenuItemKind.html.md "enum tauri::menu::MenuItemKind")<R>> where I: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), [MenuId](struct.MenuId.html.md "struct tauri::menu::MenuId"): [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq")<[&'a I](https://doc.rust-lang.org/nightly/std/primitive.reference.html)>,

Retrieves the menu item matching the given identifier.

[Source](../../src/tauri/menu/menu.rs.html#384-393)

#### pub fn [items](#method.items)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[MenuItemKind](enum.MenuItemKind.html.md "enum tauri::menu::MenuItemKind")<R>>>

Returns a list of menu items that has been added to this menu.

[Source](../../src/tauri/menu/menu.rs.html#398-400)

#### pub fn [set\_as\_app\_menu](#method.set_as_app_menu)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Menu](struct.Menu.html.md "struct tauri::menu::Menu")<R>>>

Set this menu as the application menu.

This is an alias for [`AppHandle::set_menu`](..\struct.AppHandle.html_method.set_menu.md "method tauri::AppHandle::set_menu").

[Source](../../src/tauri/menu/menu.rs.html#405-407)

#### pub fn [set\_as\_window\_menu](#method.set_as_window_menu)(&self, window: &[Window](..\window\struct.Window.html.md "struct tauri::window::Window")<R>) -> [Result](..\type.Result.html.md "type tauri::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Menu](struct.Menu.html.md "struct tauri::menu::Menu")<R>>>

Set this menu as the window menu.

This is an alias for [`Window::set_menu`](..\window\struct.Window.html_method.set_menu.md "method tauri::window::Window::set_menu").

## Trait Implementations[§](#trait-implementations)

[Source](../../src/tauri/menu/mod.rs.html#144-165)[§](#impl-Clone-for-Menu%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [Menu](struct.Menu.html.md "struct tauri::menu::Menu")<R>

[Source](../../src/tauri/menu/mod.rs.html#144-165)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> Self

Returns a copy of the value. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#174)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &Self)

Performs copy-assignment from `source`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)

[Source](../../src/tauri/menu/menu.rs.html#23-40)[§](#impl-ContextMenu-for-Menu%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [ContextMenu](trait.ContextMenu.html.md "trait tauri::menu::ContextMenu") for [Menu](struct.Menu.html.md "struct tauri::menu::Menu")<R>

[Source](../../src/tauri/menu/menu.rs.html#29-31)[§](#method.popup)

#### fn [popup](trait.ContextMenu.html_tymethod.popup.md)<T: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")>(&self, window: [Window](..\window\struct.Window.html.md "struct tauri::window::Window")<T>) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Popup this menu as a context menu on the specified window at the cursor position.

[Source](../../src/tauri/menu/menu.rs.html#33-39)[§](#method.popup_at)

#### fn [popup\_at](trait.ContextMenu.html_tymethod.popup_at.md)<T: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"), P: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Position](..\enum.Position.html.md "enum tauri::Position")>>( &self, window: [Window](..\window\struct.Window.html.md "struct tauri::window::Window")<T>, position: P, ) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Popup this menu as a context menu on the specified window at the specified position. [Read more](trait.ContextMenu.html_tymethod.popup_at.md)

[Source](../../src/tauri/menu/mod.rs.html#144-165)[§](#impl-Resource-for-Menu%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Resource](..\trait.Resource.html.md "trait tauri::Resource") for [Menu](struct.Menu.html.md "struct tauri::menu::Menu")<R>

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

[§](#impl-Freeze-for-Menu%3CR%3E)

### impl<R> [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [Menu](struct.Menu.html.md "struct tauri::menu::Menu")<R>

[§](#impl-RefUnwindSafe-for-Menu%3CR%3E)

### impl<R> ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [Menu](struct.Menu.html.md "struct tauri::menu::Menu")<R>

[§](#impl-Send-for-Menu%3CR%3E)

### impl<R> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [Menu](struct.Menu.html.md "struct tauri::menu::Menu")<R>

[§](#impl-Sync-for-Menu%3CR%3E)

### impl<R> [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [Menu](struct.Menu.html.md "struct tauri::menu::Menu")<R>

[§](#impl-Unpin-for-Menu%3CR%3E)

### impl<R> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [Menu](struct.Menu.html.md "struct tauri::menu::Menu")<R>

[§](#impl-UnwindSafe-for-Menu%3CR%3E)

### impl<R> ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [Menu](struct.Menu.html.md "struct tauri::menu::Menu")<R>

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