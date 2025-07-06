# Trait ContextMenuCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/menu/mod.rs.html#735-756)

```
pub trait ContextMenu:
    ContextMenuBase
    + Send
    + Sync {
    // Required methods
    fn popup<R: Runtime>(&self, window: Window<R>) -> Result<()>;
    fn popup_at<R: Runtime, P: Into<Position>>(
        &self,
        window: Window<R>,
        position: P,
    ) -> Result<()>;
}
```

Available on **`desktop`** only.

Expand description

A helper trait with methods to help creating a context menu.

## [§](#safety)Safety

This trait is ONLY meant to be implemented internally by the crate.

## Required Methods[§](#required-methods)

[Source](../../src/tauri/menu/mod.rs.html#746)

#### fn [popup](#tymethod.popup)<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")>(&self, window: [Window](..\window\struct.Window.html.md "struct tauri::window::Window")<R>) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Popup this menu as a context menu on the specified window at the cursor position.

[Source](../../src/tauri/menu/mod.rs.html#751-755)

#### fn [popup\_at](#tymethod.popup_at)<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"), P: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Position](..\enum.Position.html.md "enum tauri::Position")>>( &self, window: [Window](..\window\struct.Window.html.md "struct tauri::window::Window")<R>, position: P, ) -> [Result](..\type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Popup this menu as a context menu on the specified window at the specified position.

The position is relative to the window’s top-left corner.

## Dyn Compatibility[§](#dyn-compatibility)

This trait is **not** [dyn compatible](https://doc.rust-lang.org/nightly/reference/items/traits.html#dyn-compatibility).

*In older versions of Rust, dyn compatibility was called "object safety", so this trait is not object safe.*

## Implementors[§](#implementors)

[Source](../../src/tauri/menu/menu.rs.html#23-40)[§](#impl-ContextMenu-for-Menu%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [ContextMenu](trait.ContextMenu.html.md "trait tauri::menu::ContextMenu") for [Menu](struct.Menu.html.md "struct tauri::menu::Menu")<R>

[Source](../../src/tauri/menu/submenu.rs.html#15-32)[§](#impl-ContextMenu-for-Submenu%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [ContextMenu](trait.ContextMenu.html.md "trait tauri::menu::ContextMenu") for [Submenu](struct.Submenu.html.md "struct tauri::menu::Submenu")<R>