# Omnibar

**Omnibar** is a macOS Spotlight-style typeahead component built using [**Overlay**](#core/components/overlay) and
[**QueryList**](#select/query-list). Its usage is similar to that of [**Select**](#select/select-component): provide
your items and a predicate to customize the filtering algorithm.

The following example responds to a button and a hotkey.

Click to show Omnibar or press `shift``O`

##### Props

Reset on selectAllow creating new films

##### Overlay props

Has backdrop

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/select-examples/omnibarExample.tsx)

## Usage

##### [OverlaysProvider](#core/context/overlays-provider) recommended

This component renders an **Overlay2** which works best inside a React tree which includes an
**OverlaysProvider**. Blueprint v5.x includes a backwards-compatibile shim which allows this context
to be optional, but it will be required in a future major version. See the full
[migration guide](https://github.com/palantir/blueprint/wiki/Overlay2-migration) on the wiki.

In TypeScript, `Omnibar<T>` is a *generic component* where `<T>` represents the type of one item in the array of `items`.

The component is fully controlled via the `isOpen` prop, which means you can decide exactly how to trigger it.

## Props interface

interface OmnibarProps extends [ListItemsProps](#api/ListItemsProps)<T>

[@blueprintjs/select](https://github.com/palantir/blueprint/blob/d356c8eea/packages/select/src/components/omnibar/omnibar.tsx#L26)

Reusable generic props for a component that operates on a filterable, selectable list of `items`.

| Props | Description |
| --- | --- |
| `activeItem` | `null | CreateNewItem | T` The currently focused item for keyboard interactions, or `null` to indicate that no item is active. If omitted or `undefined`, this prop will be uncontrolled (managed by the component's state). Use `onActiveItemChange` to listen for updates.  Inherited from `ListItemsProps.activeItem` |
| `createNewItemFromQuery` | `(query: string) => T | T[]` If provided, allows new items to be created using the current query string. This is invoked when user interaction causes one or many items to be created, either by pressing the `Enter` key or by clicking on the "Create Item" option. It transforms a query string into one or many items type.  Inherited from `ListItemsProps.createNewItemFromQuery` |
| `createNewItemPosition` | `"first" | "last"'last'` Determines the position of the `createNewItem` within the list: first or last. Only relevant when `createNewItemRenderer` is defined.  Inherited from `ListItemsProps.createNewItemPosition` |
| `createNewItemRenderer` | `(query: string, active: boolean, handleClick: MouseEventHandler<HTMLElement>) => undefined | Element<>` Custom renderer to transform the current query string into a selectable "Create Item" option. If this function is provided, a "Create Item" option will be rendered at the end of the list of items. If this function is not provided, a "Create Item" option will not be displayed.  Inherited from `ListItemsProps.createNewItemRenderer` |
| `initialContent` | `ReactNode` React content to render when query is empty. If omitted, all items will be rendered (or result of `itemListPredicate` with empty query). If explicit `null`, nothing will be rendered when query is empty.  This prop is ignored if a custom `itemListRenderer` is supplied.  Inherited from `ListItemsProps.initialContent` |
| `inputProps` | `InputGroupProps` Props to spread to the query `InputGroup`. Use `query` and `onQueryChange` instead of `inputProps.value` and `inputProps.onChange` to control this input. |
| `isOpen` | `boolean` Toggles the visibility of the omnibar. This prop is required because the component is controlled.  Required |
| `itemDisabled` | `keyof T | (item: T, index: number) => boolean` Determine if the given item is disabled. Provide a callback function, or simply provide the name of a boolean property on the item that exposes its disabled state.  Inherited from `ListItemsProps.itemDisabled` |
| `itemListPredicate` | `ItemListPredicate<T>` Customize querying of entire `items` array. Return new list of items. This method can reorder, add, or remove items at will. (Supports filter algorithms that operate on the entire set, rather than individual items.)  If `itemPredicate` is also defined, this prop takes priority and the other will be ignored.  Inherited from `ListItemsProps.itemListPredicate` |
| `itemListRenderer` | `ItemListRenderer<T>` Custom renderer for the contents of the dropdown.  The default implementation invokes `itemRenderer` for each item that passes the predicate and wraps them all in a `Menu` element. If the query is empty then `initialContent` is returned, and if there are no items that match the predicate then `noResults` is returned.  Inherited from `ListItemsProps.itemListRenderer` |
| `itemPredicate` | `ItemPredicate<T>` Customize querying of individual items.  **Filtering a list of items.** This function is invoked to filter the list of items as a query is typed. Return `true` to keep the item, or `false` to hide. This method is invoked once for each item, so it should be performant. For more complex queries, use `itemListPredicate` to operate once on the entire array. For the purposes of filtering the list, this prop is ignored if `itemListPredicate` is also defined.  **Matching a pasted value to an item.** This function is also invoked to match a pasted value to an existing item if possible. In this case, the function will receive `exactMatch=true`, and the function should return true only if the item *exactly* matches the query. For the purposes of matching pasted values, this prop will be invoked even if `itemListPredicate` is defined.  Inherited from `ListItemsProps.itemPredicate` |
| `itemRenderer` | `ItemRenderer<T>` Custom renderer for an item in the dropdown list. Receives a boolean indicating whether this item is active (selected by keyboard arrows) and an `onClick` event handler that should be attached to the returned element.  RequiredInherited from `ListItemsProps.itemRenderer` |
| `items` | `T[]` Array of items in the list.  RequiredInherited from `ListItemsProps.items` |
| `itemsEqual` | `ItemsEqualProp<T>` Specifies how to test if two items are equal. By default, simple strict equality (`===`) is used to compare two items.  If your items have a unique identifier field, simply provide the name of a property on the item that can be compared with strict equality to determine equivalence: `itemsEqual="id"` will check `a.id === b.id`.  If more complex comparison logic is required, provide an equality comparator function that returns `true` if the two items are equal. The arguments to this function will never be `null` or `undefined`, as those values are handled before calling the function.  Inherited from `ListItemsProps.itemsEqual` |
| `noResults` | `ReactNode` React content to render when filtering items returns zero results. If omitted, nothing will be rendered in this case.  This prop is ignored if a custom `itemListRenderer` is supplied.  NOTE: if passing a `MenuItem`, ensure it has `roleStructure="listoption"` prop.  Inherited from `ListItemsProps.noResults` |
| `onActiveItemChange` | `(activeItem: null | T, isCreateNewItem: boolean) => void` Invoked when user interaction should change the active item: arrow keys move it up/down in the list, selecting an item makes it active, and changing the query may reset it to the first item in the list if it no longer matches the filter.  If the "Create Item" option is displayed and currently active, then `isCreateNewItem` will be `true` and `activeItem` will be `null`. In this case, you should provide a valid `CreateNewItem` object to the `activeItem` *prop* in order for the "Create Item" option to appear as active.  **Note:** You can instantiate a `CreateNewItem` object using the `getCreateNewItem()` utility exported from this package.  Inherited from `ListItemsProps.onActiveItemChange` |
| `onClose` | `(event?: SyntheticEvent<HTMLElement, Event<>>) => void` A callback that is invoked when user interaction causes the omnibar to close, such as clicking on the overlay or pressing the `esc` key (if enabled). Receives the event from the user's interaction, if there was an event (generally either a mouse or key event).  Note that due to controlled usage, this component will not actually close itself until the `isOpen` prop becomes `false`. . |
| `onItemSelect` | `(item: T, event?: SyntheticEvent<HTMLElement, Event<>>) => void` Callback invoked when an item from the list is selected, typically by clicking or pressing `enter` key.  RequiredInherited from `ListItemsProps.onItemSelect` |
| `onItemsPaste` | `(items: T[]) => void` Callback invoked when multiple items are selected at once via pasting.  Inherited from `ListItemsProps.onItemsPaste` |
| `onQueryChange` | `(query: string, event?: ChangeEvent<HTMLInputElement>) => void` Callback invoked when the query string changes.  Inherited from `ListItemsProps.onQueryChange` |
| `overlayProps` | `Partial<OverlayProps>` Props to spread to `Overlay`. |
| `query` | `string` Query string passed to `itemListPredicate` or `itemPredicate` to filter items. This value is controlled: its state must be managed externally by attaching an `onChange` handler to the relevant element in your `renderer` implementation.  Inherited from `ListItemsProps.query` |
| `resetOnQuery` | `booleantrue` Whether the active item should be reset to the first matching item *every time the query changes* (via prop or by user input).  Inherited from `ListItemsProps.resetOnQuery` |
| `resetOnSelect` | `booleanfalse` Whether the active item should be reset to the first matching item *when an item is selected*. The query will also be reset to the empty string.  Inherited from `ListItemsProps.resetOnSelect` |
| `scrollToActiveItem` | `booleantrue` When `activeItem` is controlled, whether the active item should *always* be scrolled into view when the prop changes. If `false`, only changes that result from built-in interactions (clicking, querying, or using arrow keys) will scroll the active item into view. Ignored if the `activeItem` prop is omitted (uncontrolled behavior).  Inherited from `ListItemsProps.scrollToActiveItem` |