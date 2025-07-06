# Suggest

**Suggest** behaves similarly to [**Select**](#select/select-component), except it renders a text input group as the
**Popover** target instead of arbitrary children. This [**InputGroup**](#core/components/input-group) can
be customized using `inputProps`.

##### Props

Close on selectOpen popover on key downReset on closeReset on queryReset on selectAllow creating new items

##### Appearance props

DisabledFill container width

##### Popover props

Match target widthMinimal popover style

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/select-examples/suggestExample.tsx)

## Props interface

interface SuggestProps extends [ListItemsProps](#api/ListItemsProps)<T>, Omit<[SelectPopoverProps](#api/SelectPopoverProps), "popoverTargetProps">

[@blueprintjs/select](https://github.com/palantir/blueprint/blob/d356c8eea/packages/select/src/components/suggest/suggest.tsx#L38)

Reusable generic props for a component that operates on a filterable, selectable list of `items`.

| Props | Description |
| --- | --- |
| `activeItem` | `null | CreateNewItem | T` The currently focused item for keyboard interactions, or `null` to indicate that no item is active. If omitted or `undefined`, this prop will be uncontrolled (managed by the component's state). Use `onActiveItemChange` to listen for updates.  Inherited from `ListItemsProps.activeItem` |
| `closeOnSelect` | `booleantrue` Whether the popover should close after selecting an item. |
| `createNewItemFromQuery` | `(query: string) => T | T[]` If provided, allows new items to be created using the current query string. This is invoked when user interaction causes one or many items to be created, either by pressing the `Enter` key or by clicking on the "Create Item" option. It transforms a query string into one or many items type.  Inherited from `ListItemsProps.createNewItemFromQuery` |
| `createNewItemPosition` | `"first" | "last"'last'` Determines the position of the `createNewItem` within the list: first or last. Only relevant when `createNewItemRenderer` is defined.  Inherited from `ListItemsProps.createNewItemPosition` |
| `createNewItemRenderer` | `(query: string, active: boolean, handleClick: MouseEventHandler<HTMLElement>) => undefined | Element<>` Custom renderer to transform the current query string into a selectable "Create Item" option. If this function is provided, a "Create Item" option will be rendered at the end of the list of items. If this function is not provided, a "Create Item" option will not be displayed.  Inherited from `ListItemsProps.createNewItemRenderer` |
| `defaultSelectedItem` | `T` The uncontrolled default selected item. This prop is ignored if `selectedItem` is used to control the state. |
| `disabled` | `boolean` Whether the input field should be disabled. |
| `fill` | `boolean` Whether the component should take up the full width of its container. |
| `initialContent` | `ReactNode` React content to render when query is empty. If omitted, all items will be rendered (or result of `itemListPredicate` with empty query). If explicit `null`, nothing will be rendered when query is empty.  This prop is ignored if a custom `itemListRenderer` is supplied.  Inherited from `ListItemsProps.initialContent` |
| `inputProps` | `Partial<Omit<InputGroupProps, "fill" | "value" | "disabled" | "onChange">>` Props to pass to the query [InputGroup component](#core/components/input-group).  Some properties are unavailable:   * `inputProps.value`: use `query` instead * `inputProps.onChange`: use `onQueryChange` instead * `inputProps.disabled`: use `disabled` instead * `inputProps.fill`: use `fill` instead   Other notes:   * `inputProps.tagName` will override `popoverProps.targetTagName` * `inputProps.className` will work as expected, but this is redundant with the simpler `className` prop |
| `inputValueRenderer` | `(item: T) => string` Custom renderer to transform an item into a string for the input value.  Required |
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
| `openOnKeyDown` | `booleanfalse` If true, the component waits until a keydown event in the TagInput before opening its popover.  If false, the popover opens immediately after a mouse click or TAB key interaction focuses the component's TagInput. |
| `popoverContentProps` | `HTMLAttributes<HTMLDivElement>` HTML attributes to spread to the popover content container element.  Inherited from `Omit.popoverContentProps` |
| `popoverProps` | `Partial<Omit<PopoverProps<DefaultPopoverTargetHTMLProps>, "fill" | "content" | "defaultIsOpen" | "renderTarget">>` Props to spread to the popover.  Note that `content` cannot be changed, but you may apply some props to the content wrapper element with `popoverContentProps`. Likewise, `targetProps` is no longer supported as it was in Blueprint v4, but you may use `popoverTargetProps` instead.  N.B. `disabled` is supported here, as this can be distinct from disabling the entire select button / input control element. There are some cases where we only want to disable the popover interaction.  Inherited from `Omit.popoverProps` |
| `popoverRef` | `RefObject<Popover<DefaultPopoverTargetHTMLProps>>` Optional ref for the Popover component instance. This is sometimes useful to reposition the popover.  Note that this is defined as a specific kind of Popover instance which should be compatible with most use cases, since it uses the default target props interface.  Inherited from `Omit.popoverRef` |
| `query` | `string` Query string passed to `itemListPredicate` or `itemPredicate` to filter items. This value is controlled: its state must be managed externally by attaching an `onChange` handler to the relevant element in your `renderer` implementation.  Inherited from `ListItemsProps.query` |
| `resetOnClose` | `booleanfalse` Whether the active item should be reset to the first matching item *when the popover closes*. The query will also be reset to the empty string. |
| `resetOnQuery` | `booleantrue` Whether the active item should be reset to the first matching item *every time the query changes* (via prop or by user input).  Inherited from `ListItemsProps.resetOnQuery` |
| `resetOnSelect` | `booleanfalse` Whether the active item should be reset to the first matching item *when an item is selected*. The query will also be reset to the empty string.  Inherited from `ListItemsProps.resetOnSelect` |
| `scrollToActiveItem` | `booleantrue` When `activeItem` is controlled, whether the active item should *always* be scrolled into view when the prop changes. If `false`, only changes that result from built-in interactions (clicking, querying, or using arrow keys) will scroll the active item into view. Ignored if the `activeItem` prop is omitted (uncontrolled behavior).  Inherited from `ListItemsProps.scrollToActiveItem` |
| `selectedItem` | `null | T` The currently selected item, or `null` to indicate that no item is selected. If omitted or `undefined`, this prop will be uncontrolled (managed by the component's state). Use `onItemSelect` to listen for updates. |