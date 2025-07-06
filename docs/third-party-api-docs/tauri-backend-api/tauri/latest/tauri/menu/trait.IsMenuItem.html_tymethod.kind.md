# Trait IsMenuItemCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/menu/mod.rs.html#722-728)

```
pub trait IsMenuItem<R: Runtime>: IsMenuItemBase {
    // Required methods
    fn kind(&self) -> MenuItemKind<R>;
    fn id(&self) -> &MenuId;
}
```

Available on **`desktop`** only.

Expand description

A trait that defines a generic item in a menu, which may be one of [`MenuItemKind`](enum.MenuItemKind.html.md "enum tauri::menu::MenuItemKind")

## [§](#safety)Safety

This trait is ONLY meant to be implemented internally by the crate.

## Required Methods[§](#required-methods)

[Source](../../src/tauri/menu/mod.rs.html#724)

#### fn [kind](#tymethod.kind)(&self) -> [MenuItemKind](enum.MenuItemKind.html.md "enum tauri::menu::MenuItemKind")<R>

Returns the kind of this menu item.

[Source](../../src/tauri/menu/mod.rs.html#727)

#### fn [id](#tymethod.id)(&self) -> &[MenuId](struct.MenuId.html.md "struct tauri::menu::MenuId")

Returns a unique identifier associated with this menu.

## Implementors[§](#implementors)

[Source](../../src/tauri/menu/mod.rs.html#707-715)[§](#impl-IsMenuItem%3CR%3E-for-MenuItemKind%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [IsMenuItem](trait.IsMenuItem.html.md "trait tauri::menu::IsMenuItem")<R> for [MenuItemKind](enum.MenuItemKind.html.md "enum tauri::menu::MenuItemKind")<R>

[Source](../../src/tauri/menu/mod.rs.html#144-165)[§](#impl-IsMenuItem%3CR%3E-for-CheckMenuItem%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [IsMenuItem](trait.IsMenuItem.html.md "trait tauri::menu::IsMenuItem")<R> for [CheckMenuItem](struct.CheckMenuItem.html.md "struct tauri::menu::CheckMenuItem")<R>

[Source](../../src/tauri/menu/mod.rs.html#144-165)[§](#impl-IsMenuItem%3CR%3E-for-IconMenuItem%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [IsMenuItem](trait.IsMenuItem.html.md "trait tauri::menu::IsMenuItem")<R> for [IconMenuItem](struct.IconMenuItem.html.md "struct tauri::menu::IconMenuItem")<R>

[Source](../../src/tauri/menu/mod.rs.html#144-165)[§](#impl-IsMenuItem%3CR%3E-for-MenuItem%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [IsMenuItem](trait.IsMenuItem.html.md "trait tauri::menu::IsMenuItem")<R> for [MenuItem](struct.MenuItem.html.md "struct tauri::menu::MenuItem")<R>

[Source](../../src/tauri/menu/mod.rs.html#144-165)[§](#impl-IsMenuItem%3CR%3E-for-PredefinedMenuItem%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [IsMenuItem](trait.IsMenuItem.html.md "trait tauri::menu::IsMenuItem")<R> for [PredefinedMenuItem](struct.PredefinedMenuItem.html.md "struct tauri::menu::PredefinedMenuItem")<R>

[Source](../../src/tauri/menu/mod.rs.html#144-165)[§](#impl-IsMenuItem%3CR%3E-for-Submenu%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [IsMenuItem](trait.IsMenuItem.html.md "trait tauri::menu::IsMenuItem")<R> for [Submenu](struct.Submenu.html.md "struct tauri::menu::Submenu")<R>