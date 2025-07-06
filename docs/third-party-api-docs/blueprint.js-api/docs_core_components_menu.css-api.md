# Menu

**Menu** displays a list of interactive menu items.

* Custom SVG icon
* New text box
* New object
* New link
* Increment

  0
* Settings...

* ###### Edit

* Cut

  ⌘X
* Copy

  ⌘C
* Paste

  ⌘V
* ###### Text

* Alignment

  Open sub menu
* Style

  Open sub menu
* Miscellaneous

  Open sub menu

##### Props

Size 

SmallMediumLarge

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/menuExample.tsx)

## Usage

Blueprint's **Menu** API includes three React components:

```
<Menu>  
    <MenuItem icon="new-text-box" onClick={handleClick} text="New text box" />  
    <MenuItem icon="new-object" onClick={handleClick} text="New object" />  
    <MenuItem icon="new-link" onClick={handleClick} text="New link" />  
    <MenuDivider />  
    <MenuItem text="Settings..." icon="cog" intent="primary">  
        <MenuItem icon="tick" text="Save on edit" />  
        <MenuItem icon="blank" text="Compile on edit" />  
    </MenuItem>  
</Menu>  

```

## Props interface

`<Menu>` renders a `<ul>` container element for menu items and dividers.

interface MenuProps extends [Props](#api/Props), HTMLAttributes<HTMLUListElement>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/menu/menu.tsx#L24)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `children` | `ReactNode` Menu items. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `large` | `booleanfalse` Whether the menu items in this menu should use a large appearance.  Deprecated |
| `size` | `Size"medium"` The size of the items in this menu. |
| `small` | `booleanfalse` Whether the menu items in this menu should use a small appearance.  Deprecated |
| `ulRef` | `Ref<HTMLUListElement>` Ref handler that receives the HTML `<ul>` element backing this component. |

## Menu item

**MenuItem** is a single interactive item in a [**Menu**](#core/components/menu).

This component renders an `<li>` containing an `<a>`. You can make the **MenuItem** interactive by defining the
`href`, `target`, and `onClick` props as necessary.

Create submenus by nesting **MenuItem** elements inside each other as `children`. Remember to use the required `text`
prop to define **MenuItem** content.

* Applications

  Open sub menu

##### Props

ActiveDisabled

Selected 

undefinedtruefalse

Enable iconEnable submenu

Intent 

NonePrimarySuccessWarningDangerOpen dropdown

Role structure 

menuitemlistoption

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/menuItemExample.tsx)

interface MenuItemProps extends [ActionProps](#api/ActionProps)<HTMLAnchorElement>, AnchorHTMLAttributes<HTMLAnchorElement>, RefAttributes<HTMLLIElement>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/menu/menuItem.tsx#L36)

Note that the HTML attributes supported by this component are spread to the nested `<a>` element, while the
`ref` is attached to the root `<li>` element. This is an unfortunate quirk in the API which we keep around
for backwards-compatibility.

| Props | Description |
| --- | --- |
| `active` | `boolean` Whether this item should appear *active*, often useful to indicate keyboard focus. Note that this is distinct from *selected* appearance, which has its own prop. |
| `children` | `ReactNode` Children of this component will be rendered in a *submenu* that appears in a popover when hovering or clicking on this item.  Use `text` prop for the content of the menu item itself. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `ActionProps.className` |
| `disabled` | `boolean` Whether this menu item is non-interactive. Enabling this prop will ignore `href`, `tabIndex`, and mouse event handlers (in particular click, down, enter, leave). |
| `htmlTitle` | `string` HTML title to be passed to the  component |
| `icon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon (or an icon element) to render before the text.  Inherited from `ActionProps.icon` |
| `intent` | `Intent` Visual intent color to apply to element.  Inherited from `ActionProps.intent` |
| `label` | `string` Right-aligned label text content, useful for displaying hotkeys.  This prop actually supports JSX elements, but TypeScript will throw an error because `HTMLAttributes` only allows strings. Use `labelElement` to supply a JSX element in TypeScript. |
| `labelClassName` | `string` A space-delimited list of class names to pass along to the right-aligned label wrapper element. |
| `labelElement` | `ReactNode` Right-aligned label content, useful for displaying hotkeys. |
| `multiline` | `booleanfalse` Whether the text should be allowed to wrap to multiple lines. If `false`, text will be truncated with an ellipsis when it reaches `max-width`. |
| `onClick` | `(event: MouseEvent<HTMLAnchorElement, MouseEvent<>>) => void` Click event handler.  Inherited from `ActionProps.onClick` |
| `onFocus` | `(event: FocusEvent<HTMLAnchorElement, Element<>>) => void` Focus event handler.  Inherited from `ActionProps.onFocus` |
| `popoverProps` | `Partial<Omit<PopoverProps<DefaultPopoverTargetHTMLProps>, "content" | "minimal">>` Props to spread to the submenu popover. Note that `content` and `minimal` cannot be changed and `usePortal` defaults to `false` so all submenus will live in the same container. |
| `roleStructure` | `"none" | "menuitem" | "listitem" | "listoption""menuitem"` Changes the ARIA `role` property structure of this MenuItem to accomodate for various different `role`s of the parent Menu `ul` element.  If `menuitem`, role structure becomes:  `<li role="none"><a role="menuitem" /></li>`  which is proper role structure for a `<ul role="menu"` parent (this is the default `role` of a `Menu`).  If `listoption`, role structure becomes:  `<li role="option"><a role={undefined} /></li>`  which is proper role structure for a `<ul role="listbox"` parent, or a `<select>` parent.  If `listitem`, role structure becomes:  `<li role={undefined}><a role={undefined} /></li>`  which can be used if this item is within a basic `<ul/>` (or `role="list"`) parent.  If `none`, role structure becomes:  `<li role="none"><a role={undefined} /></li>`  which can be used if wrapping this item in a custom `<li>` parent. |
| `selected` | `booleanundefined` Whether this item should appear selected - `roleStructure` must be `"listoption"` for this to be applied. Defining this will set the `aria-selected` attribute and apply a small tick icon if `true`, and empty space for a small tick icon if `false` or `undefined`. |
| `shouldDismissPopover` | `booleantrue` Whether an enabled item without a submenu should automatically close its parent popover when clicked. |
| `submenuProps` | `Partial<MenuProps>` Props to spread to the child `Menu` component if this item has a submenu. |
| `tagName` | `keyof IntrinsicElements"a"` Name of the HTML tag that wraps the MenuItem. |
| `text` | `ReactNode` Item text, required for usability.  Required |
| `textClassName` | `string` A space-delimited list of class names to pass along to the text wrapper element. |

## Menu divider

**MenuDivider** is a decorative component used to group sets of items into sections which may optionally have a title.

interface MenuDividerProps extends [Props](#api/Props)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/menu/menuDivider.tsx#L23)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `children` | `undefined` This component does not support children. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `title` | `ReactNode` Optional header title. |
| `titleId` | `string` Optional `id` prop for the header title. |

## Dropdowns

**Menu** only renders a static list container element. To make an interactive dropdown menu, you may leverage
[**Popover**](#core/components/popover) and specify a **Menu** as the `content` property:

```
<Popover content={<Menu>...</Menu>} placement="bottom">  
    <Button alignText="start" icon="applications" endIcon="caret-down" text="Open with..." />  
</Popover>  

```

Some tips for designing dropdown menus:

* **Appearance**: it's often useful to style the target Button with `fill={true}`, `alignText="start"`, and
  `endIcon="caret-down"`. This makes it appear more like an [HTML `<select>`](#core/components/html-select) dropdown.
* **Interactions**: by default, the popover is automatically dismissed when the user clicks a menu
  item ([Popover docs](#core/components/popover.closing-on-click) have more details). If you want to opt out of this
  behavior, set `shouldDismissPopover={false}` on a **MenuItem**. For example, clicking the "Table" item in this
  dropdown menu will not dismiss the `Popover`:

Open with...

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/dropdownMenuExample.tsx)

## Submenus

To add a submenu to a **Menu**, you may nest one or more **MenuItem** elements within another **MenuItem**.
The submenu opens to the right of its parent by default, but will adjust and flip to the left if there is not enough
room to the right.

```
<Menu>  
    <MenuItem text="Submenu">  
        <MenuItem text="Child one" />  
        <MenuItem text="Child two" />  
        <MenuItem text="Child three" />  
    </MenuItem>  
</Menu>  

```

## CSS API

##### Deprecated API: use [`<Menu>` and `<MenuItem>`](#core/components/menu)

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

Menus can be constructed manually using the following HTML markup and `bp5-menu-*` classes
(available in JS/TS as `Classes.MENU_*`):

* Begin with a `ul.bp5-menu`. Each `li` child denotes a single entry in the menu.
* Put a `.bp5-menu-item` element inside an `li` to create a clickable entry. Use either `<button>` or `<a>` tags for menu items to denote interactivity.
* Add icons to menu items the same way you would to buttons: add the appropriate `bp5-icon-<name>` class\*.
* Make menu items active with the class `bp5-active` (along with `bp5-intent-*` if suitable).
* Make menu items non-interactive with the class `bp5-disabled`.
* Wrap menu item text in a `<span>` element for proper alignment. (Note that React automatically does this.)
* Add a right-aligned label to a menu item by adding a `span.bp5-menu-item-label` inside the `.bp5-menu-item`, after the content. Add an icon to the label by adding icon classes to the label element (`bp5-icon-standard` size is recommended).
* Add a divider between items with `li.bp5-menu-divider`.
* If you want the popover to close when the user clicks a menu item, add the class `bp5-popover-dismiss` to any relevant menu items.

\* You do not need to add a `bp5-icon-<sizing>` class to menu items—icon sizing is
defined as part of `.bp5-menu-item`.

Note that the following examples are `display: inline-block`; you may need to adjust
menu width in your own usage.

* Share...
* Move...
* Rename
* Delete

`.bp5-large`

Large size

`.bp5-small`

Small size

```
<ul class="bp5-menu {{.modifier}} bp5-elevation-1">  
  <li>  
    <a class="bp5-menu-item bp5-icon-people" tabindex="0">Share...</a>  
  </li>  
  <li>  
    <a class="bp5-menu-item bp5-icon-circle-arrow-right" tabindex="0">Move...</a>  
  </li>  
  <li>  
    <a class="bp5-menu-item bp5-icon-edit" tabindex="0">Rename</a>  
  </li>  
  <li class="bp5-menu-divider"></li>  
  <li>  
    <a class="bp5-menu-item bp5-icon-trash bp5-intent-danger" tabindex="0">Delete</a>  
  </li>  
</ul>  

```

### Section headers

Add an `li.bp5-menu-header`. Wrap the text in an `<h6>` tag for proper typography and borders.

* ###### Layouts

* Auto
* Circle
* Grid
* ###### Views

* History
* Favorites
* Messages

```
<ul class="bp5-menu bp5-elevation-1">  
  <li class="bp5-menu-header"><h6 class="bp5-heading">Layouts</h6></li>  
  <li><button type="button" class="bp5-menu-item bp5-icon-layout-auto">Auto</button></li>  
  <li><button type="button" class="bp5-menu-item bp5-icon-layout-circle">Circle</button></li>  
  <li><button type="button" class="bp5-menu-item bp5-icon-layout-grid">Grid</button></li>  
  <li class="bp5-menu-header"><h6 class="bp5-heading">Views</h6></li>  
  <li><button type="button" class="bp5-menu-item bp5-icon-history">History</button></li>  
  <li><button type="button" class="bp5-menu-item bp5-icon-star">Favorites</button></li>  
  <li><button type="button" class="bp5-menu-item bp5-icon-envelope">Messages</button></li>  
</ul>  

```