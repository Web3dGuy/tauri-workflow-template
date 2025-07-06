# Module menuCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/menu/mod.rs.html#5-782)

Available on **`desktop`** only.

Expand description

Menu types and utilities.

## Structs[§](#structs)

[AboutMetadata](struct.AboutMetadata.html.md "struct tauri::menu::AboutMetadata")
:   Application metadata for the [`PredefinedMenuItem::about`](struct.PredefinedMenuItem.html_method.about.md "associated function tauri::menu::PredefinedMenuItem::about").

[AboutMetadataBuilder](struct.AboutMetadataBuilder.html.md "struct tauri::menu::AboutMetadataBuilder")
:   A builder type for [`AboutMetadata`](struct.AboutMetadata.html.md "struct tauri::menu::AboutMetadata").

[CheckMenuItem](struct.CheckMenuItem.html.md "struct tauri::menu::CheckMenuItem")
:   A menu item inside a [`Menu`](struct.Menu.html.md "struct tauri::menu::Menu") or [`Submenu`](struct.Submenu.html.md "struct tauri::menu::Submenu")
    and usually contains a text and a check mark or a similar toggle
    that corresponds to a checked and unchecked states.

[CheckMenuItemBuilder](struct.CheckMenuItemBuilder.html.md "struct tauri::menu::CheckMenuItemBuilder")
:   A builder type for [`CheckMenuItem`](struct.CheckMenuItem.html.md "struct tauri::menu::CheckMenuItem")

[IconMenuItem](struct.IconMenuItem.html.md "struct tauri::menu::IconMenuItem")
:   A menu item inside a [`Menu`](struct.Menu.html.md "struct tauri::menu::Menu") or [`Submenu`](struct.Submenu.html.md "struct tauri::menu::Submenu")
    and usually contains an icon and a text.

[IconMenuItemBuilder](struct.IconMenuItemBuilder.html.md "struct tauri::menu::IconMenuItemBuilder")
:   A builder type for [`IconMenuItem`](struct.IconMenuItem.html.md "struct tauri::menu::IconMenuItem")

[Menu](struct.Menu.html.md "struct tauri::menu::Menu")
:   A type that is either a menu bar on the window
    on Windows and Linux or as a global menu in the menubar on macOS.

[MenuBuilder](struct.MenuBuilder.html.md "struct tauri::menu::MenuBuilder")
:   A builder type for [`Menu`](struct.Menu.html.md "struct tauri::menu::Menu")

[MenuEvent](struct.MenuEvent.html.md "struct tauri::menu::MenuEvent")
:   Describes a menu event emitted when a menu item is activated

[MenuId](struct.MenuId.html.md "struct tauri::menu::MenuId")
:   An unique id that is associated with a menu or a menu item.

[MenuItem](struct.MenuItem.html.md "struct tauri::menu::MenuItem")
:   A menu item inside a [`Menu`](struct.Menu.html.md "struct tauri::menu::Menu") or [`Submenu`](struct.Submenu.html.md "struct tauri::menu::Submenu") and contains only text.

[MenuItemBuilder](struct.MenuItemBuilder.html.md "struct tauri::menu::MenuItemBuilder")
:   A builder type for [`MenuItem`](struct.MenuItem.html.md "struct tauri::menu::MenuItem")

[PredefinedMenuItem](struct.PredefinedMenuItem.html.md "struct tauri::menu::PredefinedMenuItem")
:   A predefined (native) menu item which has a predefined behavior by the OS or by this crate.

[Submenu](struct.Submenu.html.md "struct tauri::menu::Submenu")
:   A type that is a submenu inside a [`Menu`](struct.Menu.html.md "struct tauri::menu::Menu") or [`Submenu`](struct.Submenu.html.md "struct tauri::menu::Submenu")

[SubmenuBuilder](struct.SubmenuBuilder.html.md "struct tauri::menu::SubmenuBuilder")
:   A builder type for [`Submenu`](struct.Submenu.html.md "struct tauri::menu::Submenu")

## Enums[§](#enums)

[MenuItemKind](enum.MenuItemKind.html.md "enum tauri::menu::MenuItemKind")
:   An enumeration of all menu item kinds that could be added to
    a [`Menu`](struct.Menu.html.md "struct tauri::menu::Menu") or [`Submenu`](struct.Submenu.html.md "struct tauri::menu::Submenu")

[NativeIcon](enum.NativeIcon.html.md "enum tauri::menu::NativeIcon")
:   A native Icon to be used for the menu item

## Constants[§](#constants)

[HELP\_SUBMENU\_ID](constant.HELP_SUBMENU_ID.html.md "constant tauri::menu::HELP_SUBMENU_ID")
:   Expected submenu id of the Help menu for macOS.

[WINDOW\_SUBMENU\_ID](constant.WINDOW_SUBMENU_ID.html.md "constant tauri::menu::WINDOW_SUBMENU_ID")
:   Expected submenu id of the Window menu for macOS.

## Traits[§](#traits)

[ContextMenu](trait.ContextMenu.html.md "trait tauri::menu::ContextMenu")
:   A helper trait with methods to help creating a context menu.

[IsMenuItem](trait.IsMenuItem.html.md "trait tauri::menu::IsMenuItem")
:   A trait that defines a generic item in a menu, which may be one of [`MenuItemKind`](enum.MenuItemKind.html.md "enum tauri::menu::MenuItemKind")