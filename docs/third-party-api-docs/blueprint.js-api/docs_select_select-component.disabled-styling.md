# Select

The **Select** component renders a UI to choose one item from a list. Its children are wrapped in a
[**Popover**](#core/components/popover) that contains the list and an optional
[**InputGroup**](#core/components/input-group) to filter it.
You may provide a predicate to customize the filtering algorithm. The value of a **Select**
(the currently chosen item) is uncontrolled: listen to changes with the `onItemSelect` callback prop.

(No selection)

##### Props

FilterableGroupedReset on closeReset on queryReset on selectUse initial contentDisable films before 2000Allow creating new itemsCreate new position: first

##### Appearance props

DisabledFill container width

##### Popover props

Match target widthMinimal popover style

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/select-examples/selectExample.tsx)

## Usage

In TypeScript, `Select<T>` is a *generic component* so you must define a local type that specifies `<T>`, the type of
one item in `items`. The props on this local type will now operate on your data type so you can easily define handlers
without transformation steps, but most props are required as a result.

```
import { Button, MenuItem } from "@blueprintjs/core";  
import { ItemPredicate, ItemRenderer, Select } from "@blueprintjs/select";  
import * as React from "react";  
import * as ReactDOM from "react-dom/client";  
  
export interface Film {  
    title: string;  
    year: number;  
    rank: number;  
}  
  
const TOP_100_FILMS: Film[] = [  
    { title: "The Shawshank Redemption", year: 1994 },  
    { title: "The Godfather", year: 1972 },  
    // ...  
].map((f, index) => ({ ...f, rank: index + 1 }));  
  
const filterFilm: ItemPredicate<Film> = (query, film, _index, exactMatch) => {  
    const normalizedTitle = film.title.toLowerCase();  
    const normalizedQuery = query.toLowerCase();  
  
    if (exactMatch) {  
        return normalizedTitle === normalizedQuery;  
    } else {  
        return `${film.rank}. ${normalizedTitle} ${film.year}`.indexOf(normalizedQuery) >= 0;  
    }  
};  
  
const renderFilm: ItemRenderer<Film> = (film, { handleClick, handleFocus, modifiers, query }) => {  
    if (!modifiers.matchesPredicate) {  
        return null;  
    }  
    return (  
        <MenuItem  
            active={modifiers.active}  
            disabled={modifiers.disabled}  
            key={film.rank}  
            label={film.year.toString()}  
            onClick={handleClick}  
            onFocus={handleFocus}  
            roleStructure="listoption"  
            text={`${film.rank}. ${film.title}`}  
        />  
    );  
};  
  
const FilmSelect: React.FC = () => {  
    const [selectedFilm, setSelectedFilm] = React.useState<Film | undefined>();  
    return (  
        <Select<Film>  
            items={TOP_100_FILMS}  
            itemPredicate={filterFilm}  
            itemRenderer={renderFilm}  
            noResults={<MenuItem disabled={true} text="No results." roleStructure="listoption" />}  
            onItemSelect={setSelectedFilm}  
        >  
            <Button text={selectedFilm?.title ?? "Select a film"} endIcon="double-caret-vertical" />  
        </Select>  
    );  
};  
  
const root = ReactDOM.createRoot(document.getElementById("root"));  
root.render(<FilmSelect />);  

```

## Props interface

interface SelectProps extends [ListItemsProps](#api/ListItemsProps)<T>, [SelectPopoverProps](#api/SelectPopoverProps)

[@blueprintjs/select](https://github.com/palantir/blueprint/blob/d356c8eea/packages/select/src/components/select/select.tsx#L40)

Reusable generic props for a component that operates on a filterable, selectable list of `items`.

| Props | Description |
| --- | --- |
| `activeItem` | `null | CreateNewItem | T` The currently focused item for keyboard interactions, or `null` to indicate that no item is active. If omitted or `undefined`, this prop will be uncontrolled (managed by the component's state). Use `onActiveItemChange` to listen for updates.  Inherited from `ListItemsProps.activeItem` |
| `children` | `ReactNode` Element which triggers the select popover. In most cases, you should display the name or label of the curently selected item here. |
| `createNewItemFromQuery` | `(query: string) => T | T[]` If provided, allows new items to be created using the current query string. This is invoked when user interaction causes one or many items to be created, either by pressing the `Enter` key or by clicking on the "Create Item" option. It transforms a query string into one or many items type.  Inherited from `ListItemsProps.createNewItemFromQuery` |
| `createNewItemPosition` | `"first" | "last"'last'` Determines the position of the `createNewItem` within the list: first or last. Only relevant when `createNewItemRenderer` is defined.  Inherited from `ListItemsProps.createNewItemPosition` |
| `createNewItemRenderer` | `(query: string, active: boolean, handleClick: MouseEventHandler<HTMLElement>) => undefined | Element<>` Custom renderer to transform the current query string into a selectable "Create Item" option. If this function is provided, a "Create Item" option will be rendered at the end of the list of items. If this function is not provided, a "Create Item" option will not be displayed.  Inherited from `ListItemsProps.createNewItemRenderer` |
| `disabled` | `booleanfalse` Whether the component is non-interactive. If true, the list's item renderer will not be called. Note that you'll also need to disable the component's children, if appropriate. |
| `fill` | `boolean` Whether the component should take up the full width of its container. You also have to ensure that the child component has `fill` set to `true` or is styled appropriately. |
| `filterable` | `booleantrue` Whether the dropdown list can be filtered. Disabling this option will remove the `InputGroup` and ignore `inputProps`. |
| `initialContent` | `ReactNode` React content to render when query is empty. If omitted, all items will be rendered (or result of `itemListPredicate` with empty query). If explicit `null`, nothing will be rendered when query is empty.  This prop is ignored if a custom `itemListRenderer` is supplied.  Inherited from `ListItemsProps.initialContent` |
| `inputProps` | `Partial<Omit<InputGroupProps, "value" | "onChange">>` Props to pass to the query [InputGroup component](#core/components/input-group).  Some properties are unavailable:   * `inputProps.value`: use `query` instead * `inputProps.onChange`: use `onQueryChange` instead |
| `itemDisabled` | `keyof T | (item: T, index: number) => boolean` Determine if the given item is disabled. Provide a callback function, or simply provide the name of a boolean property on the item that exposes its disabled state.  Inherited from `ListItemsProps.itemDisabled` |
| `itemListPredicate` | `ItemListPredicate<T>` Customize querying of entire `items` array. Return new list of items. This method can reorder, add, or remove items at will. (Supports filter algorithms that operate on the entire set, rather than individual items.)  If `itemPredicate` is also defined, this prop takes priority and the other will be ignored.  Inherited from `ListItemsProps.itemListPredicate` |
| `itemListRenderer` | `ItemListRenderer<T>` Custom renderer for the contents of the dropdown.  The default implementation invokes `itemRenderer` for each item that passes the predicate and wraps them all in a `Menu` element. If the query is empty then `initialContent` is returned, and if there are no items that match the predicate then `noResults` is returned.  Inherited from `ListItemsProps.itemListRenderer` |
| `itemPredicate` | `ItemPredicate<T>` Customize querying of individual items.  **Filtering a list of items.** This function is invoked to filter the list of items as a query is typed. Return `true` to keep the item, or `false` to hide. This method is invoked once for each item, so it should be performant. For more complex queries, use `itemListPredicate` to operate once on the entire array. For the purposes of filtering the list, this prop is ignored if `itemListPredicate` is also defined.  **Matching a pasted value to an item.** This function is also invoked to match a pasted value to an existing item if possible. In this case, the function will receive `exactMatch=true`, and the function should return true only if the item *exactly* matches the query. For the purposes of matching pasted values, this prop will be invoked even if `itemListPredicate` is defined.  Inherited from `ListItemsProps.itemPredicate` |
| `itemRenderer` | `ItemRenderer<T>` Custom renderer for an item in the dropdown list. Receives a boolean indicating whether this item is active (selected by keyboard arrows) and an `onClick` event handler that should be attached to the returned element.  RequiredInherited from `ListItemsProps.itemRenderer` |
| `items` | `T[]` Array of items in the list.  RequiredInherited from `ListItemsProps.items` |
| `itemsEqual` | `ItemsEqualProp<T>` Specifies how to test if two items are equal. By default, simple strict equality (`===`) is used to compare two items.  If your items have a unique identifier field, simply provide the name of a property on the item that can be compared with strict equality to determine equivalence: `itemsEqual="id"` will check `a.id === b.id`.  If more complex comparison logic is required, provide an equality comparator function that returns `true` if the two items are equal. The arguments to this function will never be `null` or `undefined`, as those values are handled before calling the function.  Inherited from `ListItemsProps.itemsEqual` |
| `menuProps` | `HTMLAttributes<HTMLUListElement>` HTML attributes to add to the `Menu` listbox containing the selectable options. |
| `noResults` | `ReactNode` React content to render when filtering items returns zero results. If omitted, nothing will be rendered in this case.  This prop is ignored if a custom `itemListRenderer` is supplied.  NOTE: if passing a `MenuItem`, ensure it has `roleStructure="listoption"` prop.  Inherited from `ListItemsProps.noResults` |
| `onActiveItemChange` | `(activeItem: null | T, isCreateNewItem: boolean) => void` Invoked when user interaction should change the active item: arrow keys move it up/down in the list, selecting an item makes it active, and changing the query may reset it to the first item in the list if it no longer matches the filter.  If the "Create Item" option is displayed and currently active, then `isCreateNewItem` will be `true` and `activeItem` will be `null`. In this case, you should provide a valid `CreateNewItem` object to the `activeItem` *prop* in order for the "Create Item" option to appear as active.  **Note:** You can instantiate a `CreateNewItem` object using the `getCreateNewItem()` utility exported from this package.  Inherited from `ListItemsProps.onActiveItemChange` |
| `onItemSelect` | `(item: T, event?: SyntheticEvent<HTMLElement, Event<>>) => void` Callback invoked when an item from the list is selected, typically by clicking or pressing `enter` key.  RequiredInherited from `ListItemsProps.onItemSelect` |
| `onItemsPaste` | `(items: T[]) => void` Callback invoked when multiple items are selected at once via pasting.  Inherited from `ListItemsProps.onItemsPaste` |
| `onQueryChange` | `(query: string, event?: ChangeEvent<HTMLInputElement>) => void` Callback invoked when the query string changes.  Inherited from `ListItemsProps.onQueryChange` |
| `placeholder` | `string"Filter..."` A placeholder string passed to the filter text input. Applicable only when `filterable` is `true`. |
| `popoverContentProps` | `HTMLAttributes<HTMLDivElement>` HTML attributes to spread to the popover content container element.  Inherited from `SelectPopoverProps.popoverContentProps` |
| `popoverProps` | `Partial<Omit<PopoverProps<DefaultPopoverTargetHTMLProps>, "fill" | "content" | "defaultIsOpen" | "renderTarget">>` Props to spread to the popover.  Note that `content` cannot be changed, but you may apply some props to the content wrapper element with `popoverContentProps`. Likewise, `targetProps` is no longer supported as it was in Blueprint v4, but you may use `popoverTargetProps` instead.  N.B. `disabled` is supported here, as this can be distinct from disabling the entire select button / input control element. There are some cases where we only want to disable the popover interaction.  Inherited from `SelectPopoverProps.popoverProps` |
| `popoverRef` | `RefObject<Popover<DefaultPopoverTargetHTMLProps>>` Optional ref for the Popover component instance. This is sometimes useful to reposition the popover.  Note that this is defined as a specific kind of Popover instance which should be compatible with most use cases, since it uses the default target props interface.  Inherited from `SelectPopoverProps.popoverRef` |
| `popoverTargetProps` | `HTMLAttributes<HTMLElement>` HTML attributes to add to the popover target element.  Inherited from `SelectPopoverProps.popoverTargetProps` |
| `query` | `string` Query string passed to `itemListPredicate` or `itemPredicate` to filter items. This value is controlled: its state must be managed externally by attaching an `onChange` handler to the relevant element in your `renderer` implementation.  Inherited from `ListItemsProps.query` |
| `resetOnClose` | `booleanfalse` Whether the active item should be reset to the first matching item *when the popover closes*. The query will also be reset to the empty string. |
| `resetOnQuery` | `booleantrue` Whether the active item should be reset to the first matching item *every time the query changes* (via prop or by user input).  Inherited from `ListItemsProps.resetOnQuery` |
| `resetOnSelect` | `booleanfalse` Whether the active item should be reset to the first matching item *when an item is selected*. The query will also be reset to the empty string.  Inherited from `ListItemsProps.resetOnSelect` |
| `scrollToActiveItem` | `booleantrue` When `activeItem` is controlled, whether the active item should *always* be scrolled into view when the prop changes. If `false`, only changes that result from built-in interactions (clicking, querying, or using arrow keys) will scroll the active item into view. Ignored if the `activeItem` prop is omitted (uncontrolled behavior).  Inherited from `ListItemsProps.scrollToActiveItem` |

## Querying

Supply a predicate to automatically query items based on the **InputGroup** value. Use `itemPredicate` to filter each item
individually; this is great for lightweight searches. Use `itemListPredicate` to query the entire array in one go, and
even reorder it, such as with [fuzz-aldrin-plus](https://github.com/jeancroy/fuzz-aldrin-plus). The array of filtered
items is cached internally by `QueryList` state and only recomputed when `query` or `items`-related props change.

Omitting both `itemPredicate` and `itemListPredicate` props will cause the component to always render all `items`. It
will not hide the **InputGroup**; use the `filterable` prop for that. In this case, you can implement your own filtering
and change the `items` prop.

The **@blueprintjs/select** package exports `ItemPredicate<T>` and `ItemListPredicate<T>` type aliases to simplify the
process of implementing these functions. See the code sample in
[Item Renderer API](#select/select-component.item-renderer) below for more info.

### Non-ideal states

If the query returns no results or `items` is empty, then `noResults` will be rendered in place of the usual list.
You also have the option to provide `initialContent`, which will render in place of the item list if the query is empty.

## Styling

### Button styling

**Select** accepts arbitrary child elements, but in most cases this will be a single **Button** component. To make this
button appear like a typical dropdown, apply some common button props such `alignText` and `endIcon`:

```
const MySelectDropdown: React.FC = () => (  
    // many props omitted here for brevity  
    <Select>  
        <Button alignText="start" fill={true} endIcon="caret-down" text="Dropdown">  
    </Select>  
);  

```

### Placeholder styling

When a **Select** has no selected item, you may wish to display placeholder text. Use the **Button** component's
`textClassName` prop to accomplish this:

```
const MySelectDropdown: React.FC = () => {  
    const [selectedValue, setSelectedValue] = React.useState<string | undefined>(undefined);  
    return (  
        // many props omitted here for brevity  
        <Select<string> onItemSelect={setSelectedValue}>  
            <Button  
                endIcon="caret-down"  
                textClassName={classNames({  
                    [Classes.TEXT_MUTED]: selectedValue === undefined,  
                })}  
                text={selectedValue ?? "(No selection)"}  
            />  
        </Select>  
    );  
};  

```

### Disabled styling

Disabling a **Select** requires setting the `disabled={true}` prop *and also* disabling its children. For example:

```
const FilmSelect: React.FC = () => (  
    // many props omitted here for brevity  
    <Select disabled={true}>  
        <Button disabled={true}>  
    </Select>  
);  

```

## Custom menu

By default, **Select** renders the displayed items in a [**Menu**](#core/components/menu). This behavior can be
overridden by providing the `itemListRenderer` prop, giving you full control over the layout of the items. For example,
you can group items under a common heading, or render large data sets using
[react-virtualized](https://github.com/bvaughn/react-virtualized).

Note that the non-ideal states of `noResults` and `initialContent` are specific to the default renderer. If you provide
the `itemListRenderer` prop, these props will be ignored.

See the code sample in [Item List Renderer API](#select/select-component.item-list-renderer) below for more info.

## Controlled usage

The input value can be controlled with the `query` and `onQueryChange` props. *Do not use `inputProps` for this;*
the component ignores `inputProps.value` and `inputProps.onChange` in favor of `query` and `onQueryChange`
(as noted in the prop documentation).

The focused item (for keyboard interactions) can be controlled with the `activeItem` and `onActiveItemChange` props.

```
const FilmSelect: React.FC = () => (  
    <Select<Film>  
        items={myFilter(ALL_ITEMS, this.state.myQuery)}  
        itemRenderer={...}  
        onItemSelect={...}  
        // controlled active item  
        activeItem={this.state.myActiveItem}  
        onActiveItemChange={this.handleActiveItemChange}  
        // controlled query  
        query={this.state.myQuery}  
        onQueryChange={this.handleQueryChange}  
    />  
);  

```

This controlled usage allows you to implement all sorts of advanced behavior on top of the basic **Select**
interactions, such as windowed filtering for large data sets.

To control the active item when a "Create Item" option is present, See
[Controlling the active item](#select/select-component.controlling-the-active-item) in the "Creating new items"
section below.

## Creating new items

If you wish, you can allow users to select a brand new item that doesn't appear in the list, based on the current query
string. Use `createNewItemFromQuery` and `createNewItemRenderer` to enable this:

* `createNewItemFromQuery`: Specifies how to convert a user-entered query string into an item of type `<T>` that
  **Select** understands.
* `createNewItemRenderer`: Renders a custom "Create Item" element that will be shown at the bottom of the list. When
  selected via click or `Enter`, this element will invoke `onItemSelect` with the item returned from
  `createNewItemFromQuery`.

##### Avoiding type conflicts

The "Create Item" option is represented by the reserved type `CreateNewItem` exported from this package. It is
exceedingly unlikely but technically possible for your custom type `<T>` to conflict with this type. If your type
conflicts, you may see unexpected behavior; to resolve, consider changing the schema for your items.

```
function createFilm(title: string): Film {  
    return {  
        rank: /* ... */,  
        title,  
        year: /* ... */,  
    };  
}  
  
function renderCreateFilmOption(  
    query: string,  
    active: boolean,  
    handleClick: React.MouseEventHandler<HTMLElement>,  
) {  
    return (  
        <MenuItem  
            icon="add"  
            text={`Create "${query}"`}  
            roleStructure="listoption"  
            active={active}  
            onClick={handleClick}  
            shouldDismissPopover={false}  
        />  
    )  
}  
  
const FilmSelect: React.FC = () => (  
    <Select<Film>  
        createNewItemFromQuery={createFilm}  
        createNewItemRenderer={renderCreateFilmOption}  
        items={Films.items}  
        itemPredicate={Films.itemPredicate}  
        itemRenderer={Films.itemRenderer}  
        noResults={<MenuItem disabled={true} text="No results."  roleStructure="listoption" />}  
        onItemSelect={...}  
    />  
);  

```

### Controlling the active item

Controlling the active item is slightly more involved when the "Create Item" option is present. At a high level, the
process works the same way as before: control the `activeItem` value and listen for updates via `onActiveItemChange`.
However, some special handling is required.

When the "Create Item" option is present, the callback will emit `activeItem=null` and `isCreateNewItem=true`:

```
onActiveItemChange(null, true);  

```

You can then make the "Create Item" option active by passing the result of `getCreateNewItem()` to the `activeItem`
prop (the `getCreateNewItem` function is exported from this package):

```
activeItem={isCreateNewItemActive ? getCreateNewItem() : activeItem}  

```

Altogether, the code might look something like this:

```
const currentActiveItem: Film | CreateNewItem | null;  
const isCreateNewItemActive: Film | CreateNewItem | null;  
  
function handleActiveItemChange(  
    activeItem: Film | CreateNewItem | null,  
    isCreateNewItem: boolean,  
) {  
    currentActiveItem = activeItem;  
    isCreateNewItemActive = isCreateNewItem;  
}  
  
function getActiveItem() {  
    return isCreateNewItemActive ? getCreateNewItem() : currentActiveItem;  
}  
  
const FilmSelect: React.FC = () => (  
    <Select<Film>  
        {...} // Other required props (see previous examples).  
        activeItem={getActiveItem()}  
        createNewItemFromQuery={...}  
        createNewItemRenderer={...}  
        onActiveItemChange={handleActiveItemChange}  
    />  
);  

```

### Item renderer

A **Select** component's `itemRenderer` will be called for each item and receives the item and a props object containing
data specific to rendering this item in this frame.

A few things to keep in mind:

* The renderer is called for all items, so don't forget to respect `modifiers.matchesPredicate` to hide items which
  do not match the predicate.
* Make sure to forward the provided `ref` to the rendered element (usually via `<MenuItem ref={ref} />`) to ensure
  that scrolling to active items works correctly.
* Also, don't forget to define a `key` for each item, or face React's console wrath!

```
import { Classes, MenuItem } from "@blueprintjs/core";  
import { ItemRenderer, ItemPredicate, Select } from "@blueprintjs/select";  
  
const filterFilm: ItemPredicate<Film> = (query, film) => {  
    return film.title.toLowerCase().indexOf(query.toLowerCase()) >= 0;  
};  
  
const renderFilm: ItemRenderer<Film> = (film, { handleClick, handleFocus, modifiers }) => {  
    if (!modifiers.matchesPredicate) {  
        return null;  
    }  
    return (  
        <MenuItem  
            text={film.title}  
            label={film.year}  
            roleStructure="listoption"  
            active={modifiers.active}  
            key={film.title}  
            onClick={handleClick}  
            onFocus={handleFocus}  
        />  
    );  
};  
  
const FilmSelect: React.FC = () => (  
    <Select<Film>  
        itemPredicate={filterFilm}  
        itemRenderer={renderFilm}  
        items={...}  
        onItemSelect={...}  
    />  
);  

```

interface ItemRendererProps

[@blueprintjs/select](https://github.com/palantir/blueprint/blob/d356c8eea/packages/select/src/common/itemRenderer.ts#L39)

An object describing how to render a particular item.
An `itemRenderer` receives the item as its first argument, and this object as its second argument.

Make sure to forward the provided `ref` to the rendered element (usually via `<MenuItem ref={ref} />`)
to ensure that scrolling to active items works correctly.

| Props | Description |
| --- | --- |
| `handleClick` | `MouseEventHandler<HTMLElement>` Click event handler to select this item.  Required |
| `handleFocus` | `() => void` Focus event handler to set this as the "active" item.  N.B. this is optional to preserve backwards-compatibility with @blueprintjs/select version < 4.2.0 |
| `index` | `number` Index of the item in the QueryList items array.  Required |
| `modifiers` | `ItemModifiers` Modifiers that describe how to render this item, such as `active` or `disabled`.  Required |
| `query` | `string` The current query string used to filter the items.  Required |
| `ref` | `Ref<T>` A ref attached the native HTML element rendered by this item.  N.B. this is optional to preserve backwards-compatibilty with @blueprintjs/select version < 4.9.0 |

### Item list renderer

If provided, the `itemListRenderer` prop will be called to render the contents of the dropdown menu. It has access to the items, the current query, and a `renderItem` callback for rendering a single item. A ref handler (`itemsParentRef`) is given as well; it should be attached to the parent element of the rendered menu items so that the currently selected item can be scrolled into view automatically.

```
import { ItemListRenderer } from "@blueprintjs/select";  
  
const renderMenu: ItemListRenderer<Film> = ({ items, itemsParentRef, query, renderItem, menuProps }) => {  
    const renderedItems = items.map(renderItem).filter(item => item != null);  
    return (  
        <Menu role="listbox" ulRef={itemsParentRef} {...menuProps}>  
            <MenuItem  
                disabled={true}  
                text={`Found ${renderedItems.length} items matching "${query}"`}  
                roleStructure="listoption"  
            />  
            {renderedItems}  
        </Menu>  
    );  
};  
  
const FilmSelect: React.FC = () => (  
    <Select<Film>  
        itemListRenderer={renderMenu}  
        itemPredicate={filterFilm}  
        itemRenderer={renderFilm}  
        items={...}  
        onItemSelect={...}  
    />  
);  

```

interface ItemListRendererProps

[@blueprintjs/select](https://github.com/palantir/blueprint/blob/d356c8eea/packages/select/src/common/itemListRenderer.ts#L23)

An object describing how to render the list of items.
An `itemListRenderer` receives this object as its sole argument.

| Props | Description |
| --- | --- |
| `activeItem` | `null | CreateNewItem | T` The currently focused item (for keyboard interactions), or `null` to indicate that no item is active.  Required |
| `filteredItems` | `T[]` Array of items filtered by `itemListPredicate` or `itemPredicate`. See `items` for the full list of items.  Use `renderFilteredItems()` utility function from this library to map each item in this array through `renderItem`, with support for optional `noResults` and `initialContent` states.  Required |
| `items` | `T[]` Array of all items in the list. See `filteredItems` for a filtered array based on `query` and predicate props.  Required |
| `itemsParentRef` | `Ref<HTMLUListElement>` A ref handler that should be attached to the parent HTML element of the menu items. This is required for the active item to scroll into view automatically.  Required |
| `menuProps` | `HTMLAttributes<HTMLUListElement>` Props to apply to the `Menu` created within the `itemListRenderer` |
| `query` | `string` The current query string.  Required |
| `renderCreateItem` | `() => undefined | null | Element` Call this function to render the "create new item" view component.  @returns [object Object]  Required |
| `renderItem` | `(item: T, index: number) => null | Element` Call this function to render an item. This retrieves the modifiers for the item and delegates actual rendering to the owner component's `itemRenderer` prop.  Required |