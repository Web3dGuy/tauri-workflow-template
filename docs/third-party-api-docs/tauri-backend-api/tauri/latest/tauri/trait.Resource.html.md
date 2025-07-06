# Trait ResourceCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](../src/tauri/resources/mod.rs.html#26-38)

```
pub trait Resource:
    Any
    + 'static
    + Send
    + Sync {
    // Provided methods
    fn name(&self) -> Cow<'_, str> { ... }
    fn close(self: Arc<Self>) { ... }
}
```

Expand description

Resources are Rust objects that are stored in [ResourceTable](struct.ResourceTable.html.md "struct tauri::ResourceTable") and managed by tauri.
They are identified in JS by a numeric ID (the resource ID, or rid).
Resources can be created in commands. Resources can also be retrieved in commands by
their rid. Resources are thread-safe.

Resources are reference counted in Rust. This means that they can be
cloned and passed around. When the last reference is dropped, the resource
is automatically closed. As long as the resource exists in the resource
table, the reference count is at least 1.

## Provided Methods[§](#provided-methods)

[Source](../src/tauri/resources/mod.rs.html#30-32)

#### fn [name](#method.name)(&self) -> [Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'\_, [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>

Returns a string representation of the resource. The default implementation
returns the Rust type name, but specific resource types may override this
trait method.

[Source](../src/tauri/resources/mod.rs.html#37)

#### fn [close](#method.close)(self: [Arc](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc")<Self>)

Resources may implement the `close()` trait method if they need to do
resource specific clean-ups, such as cancelling pending futures, after a
resource has been removed from the resource table.

## Implementors[§](#implementors)

[Source](../src/tauri/image/mod.rs.html#22)[§](#impl-Resource-for-Image%3C'static%3E)

### impl [Resource](trait.Resource.html.md "trait tauri::Resource") for [Image](image\struct.Image.html.md "struct tauri::image::Image")<'static>

[Source](../src/tauri/menu/mod.rs.html#144-165)[§](#impl-Resource-for-CheckMenuItem%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Resource](trait.Resource.html.md "trait tauri::Resource") for [CheckMenuItem](menu\struct.CheckMenuItem.html.md "struct tauri::menu::CheckMenuItem")<R>

Available on **`desktop`** only.

[Source](../src/tauri/menu/mod.rs.html#144-165)[§](#impl-Resource-for-IconMenuItem%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Resource](trait.Resource.html.md "trait tauri::Resource") for [IconMenuItem](menu\struct.IconMenuItem.html.md "struct tauri::menu::IconMenuItem")<R>

Available on **`desktop`** only.

[Source](../src/tauri/menu/mod.rs.html#144-165)[§](#impl-Resource-for-Menu%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Resource](trait.Resource.html.md "trait tauri::Resource") for [Menu](menu\struct.Menu.html.md "struct tauri::menu::Menu")<R>

Available on **`desktop`** only.

[Source](../src/tauri/menu/mod.rs.html#144-165)[§](#impl-Resource-for-MenuItem%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Resource](trait.Resource.html.md "trait tauri::Resource") for [MenuItem](menu\struct.MenuItem.html.md "struct tauri::menu::MenuItem")<R>

Available on **`desktop`** only.

[Source](../src/tauri/menu/mod.rs.html#144-165)[§](#impl-Resource-for-PredefinedMenuItem%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Resource](trait.Resource.html.md "trait tauri::Resource") for [PredefinedMenuItem](menu\struct.PredefinedMenuItem.html.md "struct tauri::menu::PredefinedMenuItem")<R>

Available on **`desktop`** only.

[Source](../src/tauri/menu/mod.rs.html#144-165)[§](#impl-Resource-for-Submenu%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Resource](trait.Resource.html.md "trait tauri::Resource") for [Submenu](menu\struct.Submenu.html.md "struct tauri::menu::Submenu")<R>

Available on **`desktop`** only.

[Source](../src/tauri/tray/mod.rs.html#599-603)[§](#impl-Resource-for-TrayIcon%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Resource](trait.Resource.html.md "trait tauri::Resource") for [TrayIcon](tray\struct.TrayIcon.html.md "struct tauri::tray::TrayIcon")<R>

Available on **`desktop` and crate feature `tray-icon`** only.