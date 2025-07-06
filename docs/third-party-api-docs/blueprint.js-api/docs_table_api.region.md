g# JavaScript API

The **Table**, **Column**, **Cell**, **ColumnHeaderCell**, **EditableName**, and **EditableCell2**
components are available in the **@blueprintjs/table** package.

## Table

The top-level component of the table is **Table2**. You must at least define the number of rows (`numRows` prop)
as well as a set of **Column** children.

interface Table2Props extends [TableProps](#api/TableProps)

[@blueprintjs/table](https://github.com/palantir/blueprint/blob/d356c8eea/packages/table/src/table2.tsx#L71)

| Props | Description |
| --- | --- |
| `bodyContextMenuRenderer` | `ContextMenuRenderer` An optional callback for displaying a context menu when right-clicking on the table body. The callback is supplied with an array of `Region`s. If the mouse click was on a selection, the array will contain all selected regions. Otherwise it will have one `Region` that represents the clicked cell.  Inherited from `TableProps.bodyContextMenuRenderer` |
| `cellRendererDependencies` | `DependencyList` This dependency list may be used to trigger a re-render of all cells when one of its elements changes (compared using shallow equality checks). This is done by invalidating the grid, which forces TableQuadrantStack to re-render. |
| `children` | `ReactElement<ColumnProps, string | JSXElementConstructor<any>> | ReactElement<ColumnProps, string | JSXElementConstructor<any>>[]` The children of a `Table` component, which must be React elements that use `ColumnProps`.  Inherited from `TableProps.children` |
| `columnWidths` | `(undefined | null | number)[]` A sparse number array with a length equal to the number of columns. Any non-null value will be used to set the width of the column at the same index. Note that if you want to update these values when the user drag-resizes a column, you may define a callback for `onColumnWidthChanged`.  Inherited from `TableProps.columnWidths` |
| `defaultColumnWidth` | `number`   Inherited from `TableProps.defaultColumnWidth` |
| `defaultRowHeight` | `number`   Inherited from `TableProps.defaultRowHeight` |
| `enableBodyContextMenu` | `booleantrue if bodyContextMenuRenderer is defined` Whether the body context menu is enabled.  Inherited from `TableProps.enableBodyContextMenu` |
| `enableColumnHeader` | `booleantrue` If `false`, hides the column headers.  Inherited from `TableProps.enableColumnHeader` |
| `enableColumnInteractionBar` | `booleanfalse` If `true`, adds an interaction bar on top of all column header cells, and moves interaction triggers into it.  Inherited from `TableProps.enableColumnInteractionBar` |
| `enableColumnReordering` | `booleanfalse` If `false`, disables reordering of columns.  Inherited from `TableProps.enableColumnReordering` |
| `enableColumnResizing` | `booleantrue` If `false`, disables resizing of columns.  Inherited from `TableProps.enableColumnResizing` |
| `enableFocusedCell` | `booleanfalse` If `true`, there will be a single "focused" cell at all times, which can be used to interact with the table as though it is a spreadsheet. When false, no such cell will exist.  DeprecatedInherited from `TableProps.enableFocusedCell` |
| `enableGhostCells` | `booleanfalse` If `true`, empty space in the table container will be filled with empty cells instead of a blank background.  Inherited from `TableProps.enableGhostCells` |
| `enableMultipleSelection` | `booleantrue` If `false`, only a single region of a single column/row/cell may be selected at one time. Using `ctrl` or `meta` key will have no effect, and a mouse drag will select the current column/row/cell only.  Inherited from `TableProps.enableMultipleSelection` |
| `enableRowHeader` | `booleantrue` If `false`, hides the row headers and settings menu.  Inherited from `TableProps.enableRowHeader` |
| `enableRowReordering` | `booleanfalse` If `false`, disables reordering of rows.  Inherited from `TableProps.enableRowReordering` |
| `enableRowResizing` | `booleantrue` If `false`, disables resizing of rows.  Inherited from `TableProps.enableRowResizing` |
| `focusedCell` | `FocusedCellCoordinates` If defined, will set the focused cell state. This changes the focused cell to controlled mode, meaning you are in charge of setting the focus in response to events in the `onFocusedCell` callback.  DeprecatedInherited from `TableProps.focusedCell` |
| `focusedRegion` | `FocusedRegion` If defined, will set the focused region state. This changes the focused region to controlled mode, meaning yo uare in charge of setting the focus in response to events in the `onFocusedRegion` callback. The shape of the region is defined by the `focusMode` prop.  This API is only supported on `Table2`. When using `Table`, use `focusedCell` and `onFocusedCell instead.  Inherited from `TableProps.focusedRegion` |
| `focusMode` | `FocusModeundefined` If this is defined, there will be a single focused cell or row at all times which can be used to interact with the table as though it is a spread sheet. The type of allowed focus area is given by the value. If undefined is passed, then this focus state will be disabled.  This API is only supported on `Table2`. When using `Table`, use `enableFocusedCell` instead.  Inherited from `TableProps.focusMode` |
| `forceRerenderOnSelectionChange` | `booleanfalse` If `true`, selection state changes will cause the component to re-render. If `false`, selection state is ignored when deciding to re-render.  Inherited from `TableProps.forceRerenderOnSelectionChange` |
| `getCellClipboardData` | `(row: number, col: number, celRenderer: CellRenderer) => any` If defined, this callback will be invoked for each cell when the user attempts to copy a selection via `mod+c`. The returned data will be copied to the clipboard and need not match the display value of the `<Cell>`. The data will be invisibly added as `textContent` into the DOM before copying. If not defined, a default implementation will be used that turns the rendered cell elements into strings using 'react-innertext'.  Inherited from `TableProps.getCellClipboardData` |
| `loadingOptions` | `TableLoadingOption[]` A list of `TableLoadingOption`. Set this prop to specify whether to render the loading state for the column header, row header, and body sections of the table.  Inherited from `TableProps.loadingOptions` |
| `maxColumnWidth` | `number`   Inherited from `TableProps.maxColumnWidth` |
| `maxRowHeight` | `number`   Inherited from `TableProps.maxRowHeight` |
| `minColumnWidth` | `number`   Inherited from `TableProps.minColumnWidth` |
| `minRowHeight` | `number`   Inherited from `TableProps.minRowHeight` |
| `numFrozenColumns` | `number0` The number of columns to freeze to the left side of the table, counting from the leftmost column.  Inherited from `TableProps.numFrozenColumns` |
| `numFrozenRows` | `number0` The number of rows to freeze to the top of the table, counting from the topmost row.  Inherited from `TableProps.numFrozenRows` |
| `numRows` | `number` The number of rows in the table.  Inherited from `TableProps.numRows` |
| `onColumnsReordered` | `(oldIndex: number, newIndex: number, length: number) => void` If reordering is enabled, this callback will be invoked when the user finishes drag-reordering one or more columns.  Inherited from `TableProps.onColumnsReordered` |
| `onColumnWidthChanged` | `IndexedResizeCallback` If resizing is enabled, this callback will be invoked when the user finishes drag-resizing a column.  Inherited from `TableProps.onColumnWidthChanged` |
| `onCompleteRender` | `() => void` An optional callback invoked when all cells in view have completely rendered. Will be invoked on initial mount and whenever cells update (e.g., on scroll).  Inherited from `TableProps.onCompleteRender` |
| `onCopy` | `(success: boolean) => void` If you want to do something after the copy or if you want to notify the user if a copy fails, you may provide this optional callback.  Due to browser limitations, the copy can fail. This usually occurs if the selection is too large, like 20,000+ cells. The copy will also fail if the browser does not support the copy method (see `Clipboard.isCopySupported`).  Inherited from `TableProps.onCopy` |
| `onFocusedCell` | `(focusedCell: FocusedCellCoordinates) => void` A callback called when the focus is changed in the table.  Inherited from `TableProps.onFocusedCell` |
| `onFocusedRegion` | `(focusedRegion: FocusedRegion) => void` A callback called when the focused region is changed in the table.  This API is only supported for `Table2`. When using `Table`, use `onFocusedCell` instead.  Inherited from `TableProps.onFocusedRegion` |
| `onRowHeightChanged` | `IndexedResizeCallback` If resizing is enabled, this callback will be invoked when the user finishes drag-resizing a row.  Inherited from `TableProps.onRowHeightChanged` |
| `onRowsReordered` | `(oldIndex: number, newIndex: number, length: number) => void` If reordering is enabled, this callback will be invoked when the user finishes drag-reordering one or more rows.  Inherited from `TableProps.onRowsReordered` |
| `onSelection` | `(selectedRegions: Region[]) => void` A callback called when the selection is changed in the table.  Inherited from `TableProps.onSelection` |
| `onVisibleCellsChange` | `(rowIndices: RowIndices, columnIndices: ColumnIndices) => void` A callback called when the visible cell indices change in the table.  Inherited from `TableProps.onVisibleCellsChange` |
| `renderMode` | `RenderModeRenderMode.BATCH_ON_UPDATE` Dictates how cells should be rendered. Supported modes are:   * `RenderMode.BATCH`: renders cells in batches to improve performance * `RenderMode.BATCH_ON_UPDATE`: renders cells synchronously on mount and   in batches on update * `RenderMode.NONE`: renders cells synchronously all at once  Inherited from `TableProps.renderMode` |
| `rowHeaderCellRenderer` | `RowHeaderRenderer` Render each row's header cell.  Inherited from `TableProps.rowHeaderCellRenderer` |
| `rowHeights` | `(undefined | null | number)[]` A sparse number array with a length equal to the number of rows. Any non-null value will be used to set the height of the row at the same index. Note that if you want to update these values when the user drag-resizes a row, you may define a callback for `onRowHeightChanged`.  Inherited from `TableProps.rowHeights` |
| `selectedRegions` | `Region[]` If defined, will set the selected regions in the cells. If defined, this changes table selection to controlled mode, meaning you in charge of setting the selections in response to events in the `onSelection` callback.  Note that the `selectionModes` prop controls which types of events are triggered to the `onSelection` callback, but does not restrict what selection you can pass to the `selectedRegions` prop. Therefore you can, for example, convert cell clicks into row selections.  Inherited from `TableProps.selectedRegions` |
| `selectedRegionTransform` | `SelectedRegionTransform` An optional transform function that will be applied to the located `Region`.  This allows you to, for example, convert cell `Region`s into row `Region`s while maintaining the existing multi-select and meta-click functionality.  Inherited from `TableProps.selectedRegionTransform` |
| `selectionModes` | `RegionCardinality[]SelectionModes.ALL` A `SelectionModes` enum value indicating the selection mode. You may equivalently provide an array of `RegionCardinality` enum values for precise configuration.  The `SelectionModes` enum values are:   * `ALL` * `NONE` * `COLUMNS_AND_CELLS` * `COLUMNS_ONLY` * `ROWS_AND_CELLS` * `ROWS_ONLY`  The `RegionCardinality` enum values are: - `FULL_COLUMNS` - `FULL_ROWS` - `FULL_TABLE` `CELLS`  Inherited from `TableProps.selectionModes` |
| `styledRegionGroups` | `StyledRegionGroup[]` Styled region groups are rendered as overlays above the table and are marked with their own `className` for custom styling.  Inherited from `TableProps.styledRegionGroups` |

### Instance methods

method resizeRowsByTallestCell

[@blueprintjs/table](https://github.com/palantir/blueprint/blob/d356c8eea/packages/table/src/table.tsx#L346)

| Returns |  |
| --- | --- |
| `void` | Resize all rows in the table to the height of the tallest visible cell in the specified columns. If no indices are provided, default to using the tallest visible cell from all columns in view. |

| Parameters | Description |
| --- | --- |
| `columnIndices` | `number | number[]` |

method resizeRowsByApproximateHeight

[@blueprintjs/table](https://github.com/palantir/blueprint/blob/d356c8eea/packages/table/src/table.tsx#L328)

| Returns |  |
| --- | --- |
| `void` | **Experimental!** Resizes all rows in the table to the approximate maximum height of wrapped cell content in each row. Works best when each cell contains plain text of a consistent font style (though font style may vary between cells). Since this function uses approximate measurements, results may not be perfect.  Approximation parameters can be configured for the entire table or on a per-cell basis. Default values are fine-tuned to work well with default Table font styles. |

| Parameters | Description |
| --- | --- |
| `getCellText` | `CellMapper<string>`   Required |
| `options` | `ResizeRowsByApproximateHeightOptions` |

`CellMapper` is a function that takes a cell-coordinate and returns a generic type:

```
type CellMapper<T> = (rowIndex: number, columnIndex: number) => T;  

```

method scrollToRegion

[@blueprintjs/table](https://github.com/palantir/blueprint/blob/d356c8eea/packages/table/src/table.tsx#L380)

| Returns |  |
| --- | --- |
| `void` | Scrolls the table to the target region in a fashion appropriate to the target region's cardinality:   * CELLS: Scroll the top-left cell in the target region to the top-left corner of the viewport. * FULL\_ROWS: Scroll the top-most row in the target region to the top of the viewport. * FULL\_COLUMNS: Scroll the left-most column in the target region to the left side of the viewport. * FULL\_TABLE: Scroll the top-left cell in the table to the top-left corner of the viewport.   If there are active frozen rows and/or columns, the target region will be positioned in the top-left corner of the non-frozen area (unless the target region itself is in the frozen area).  If the target region is close to the bottom-right corner of the table, this function will simply scroll the target region as close to the top-left as possible until the bottom-right corner is reached. |

| Parameters | Description |
| --- | --- |
| `region` | `Region`   Required |

method scrollByOffset

[@blueprintjs/table](https://github.com/palantir/blueprint/blob/d356c8eea/packages/table/src/table2.tsx#L434)

| Returns |  |
| --- | --- |
| `void` | Scrolls the table by a specified number of offset pixels in either the horizontal or vertical dimension. Will set a scroll indicator gradient which can be cleared by calling scrollByOffset(null); |

| Parameters | Description |
| --- | --- |
| `relativeOffset` | `null |`  How much to scroll the table body in pixels relative to the current scroll offset  Required |

## Column

**Column** contains props for defining how the header and cells of that column are rendered.

The table is designed to best support columnar data, meaning data where each column has only one type of value
(for example, strings, dates, currency amounts). Because of this, the table's children are a list of **Column**
components.

Use the `rowHeaderCellRenderer` prop of **Table** to define row headers.

interface ColumnProps extends ColumnNameProps, [Props](#api/Props)<>

[@blueprintjs/table](https://github.com/palantir/blueprint/blob/d356c8eea/packages/table/src/column.tsx#L26)

| Props | Description |
| --- | --- |
| `cellRenderer` | `CellRenderer` An instance of `CellRenderer`, a function that takes a row and column index, and returns a `Cell` React element. |
| `columnHeaderCellRenderer` | `ColumnHeaderRenderer` An instance of `ColumnHeaderRenderer`, a function that takes a column index and returns a `ColumnHeaderCell` React element. |
| `id` | `string | number` A unique ID, similar to React's `key`. This is used, for example, to maintain the width of a column between re-ordering and rendering. If no IDs are provided, widths will be persisted across renders using a column's index only. Columns widths can also be persisted outside the `Table` component, then passed in with the `columnWidths` prop. |
| `loadingOptions` | `ColumnLoadingOption[]` Set this prop to specify whether to render the loading state of the column header and cells in this column. Column-level `loadingOptions` override `Table`-level `loadingOptions`. For example, if you set `loadingOptions=[ TableLoadingOption.CELLS ]` on `Table` and `loadingOptions=[ ColumnLoadingOption.HEADER ]` on a `Column`, the cells in that column will *not* show their loading state. |
| `name` | `string` The name displayed in the header of the column.  Inherited from `ColumnNameProps.name` |
| `nameRenderer` | `(name: string, index?: number) => ReactElement<Props, string | JSXElementConstructor<any>>` A callback to override the default name rendering behavior. The default behavior is to simply use the `ColumnHeaderCell`s name prop.  This render callback can be used, for example, to provide a `EditableName` component for editing column names.  If you define this callback, we recommend you also set `<Table enableColumnInteractionBar={true}>` to avoid issues with menus or selection.  The callback will also receive the column index if an `index` was originally provided via props.  Inherited from `ColumnNameProps.nameRenderer` |

## Cell

The **Cell** component renders content in the table body. `<Cell>` elements should be returned from the
`cellRenderer` method of each **Column**.

interface CellProps extends [IntentProps](#api/IntentProps), [Props](#api/Props)<>

[@blueprintjs/table](https://github.com/palantir/blueprint/blob/d356c8eea/packages/table/src/cell/cell.tsx#L33)

| Props | Description |
| --- | --- |
| `cellRef` | `Ref<HTMLDivElement>` A ref handle to capture the outer div of this cell. Used internally. |
| `children` | `ReactNode` |
| `columnIndex` | `number` The column index of the cell. If provided, this will be passed as an argument to any callbacks when they are invoked. |
| `interactive` | `booleanfalse` If `true`, the cell will be rendered above overlay layers to enable mouse interactions within the cell. |
| `key` | `string` |
| `loading` | `booleanfalse` An optional native tooltip that is displayed on hover. If `true`, content will be replaced with a fixed-height skeleton. |
| `onKeyDown` | `KeyboardEventHandler<HTMLElement>` Callback invoked when the cell is focused and a key is pressed down. |
| `onKeyPress` | `KeyboardEventHandler<HTMLElement>` Callback invoked when a character-key is pressed. |
| `onKeyUp` | `KeyboardEventHandler<HTMLElement>` Callback invoked when the cell is focused and a key is released. |
| `rowIndex` | `number` The row index of the cell. If provided, this will be passed as an argument to any callbacks when they are invoked. |
| `style` | `CSSProperties` |
| `tabIndex` | `number` Allows for setting a tab index on the cell, so the cell can be browser-focusable. |
| `tooltip` | `string` An optional native tooltip that is displayed on hover. |
| `truncated` | `booleantrue` If `true`, the cell contents will be wrapped in a `div` with styling that will prevent the content from overflowing the cell. |
| `wrapText` | `booleanfalse` If `true`, the cell contents will be wrapped in a `div` with styling that will cause text to wrap, rather than displaying it on a single line. |

## ColumnHeaderCell

Optionally customize how each column header is displayed.

The `columnHeaderCellRenderer` method on each **Column** should return a `<ColumnHeaderCell>`. Children of a
**ColumnHeaderCell** are rendered below the name of the column. If you want to override the render behavior of the
name, you can supply a `nameRenderer` prop to the **ColumnHeaderCell**.

interface ColumnHeaderCellProps extends HeaderCellProps, ColumnNameProps<>

[@blueprintjs/table](https://github.com/palantir/blueprint/blob/d356c8eea/packages/table/src/headers/columnHeaderCell.tsx#L60)

| Props | Description |
| --- | --- |
| `children` | `ReactNode`   Inherited from `HeaderCellProps.children` |
| `enableColumnInteractionBar` | `booleanfalse` If `true`, adds an interaction bar on top of all column header cells, and moves interaction triggers into it. |
| `enableColumnReordering` | `boolean` Specifies if the column is reorderable. |
| `index` | `number` The index of the cell in the header. If provided, this will be passed as an argument to any callbacks when they are invoked.  Inherited from `HeaderCellProps.index` |
| `isActive` | `boolean` If `true`, will apply the active class to the header to indicate it is part of an external operation.  Inherited from `HeaderCellProps.isActive` |
| `isColumnSelected` | `boolean` Specifies if the full column is part of a selection. |
| `loading` | `booleanfalse` If `true`, the row/column `name` will be replaced with a fixed-height skeleton, and the `resizeHandle` will not be rendered. If passing in additional children to this component, you will also want to conditionally apply `Classes.SKELETON` where appropriate.  Inherited from `HeaderCellProps.loading` |
| `menuIcon` | `Element | BlueprintIcons_16Id"chevron-down"` The icon name or element for the header's menu button. |
| `menuPopoverProps` | `Omit<PopoverProps<DefaultPopoverTargetHTMLProps>, "content" | keyof OverlayLifecycleProps>` Optional props to forward to the dropdown menu popover. This has no effect if `menuRenderer` is undefined. |
| `menuRenderer` | `(index?: number) => Element` A callback that returns an element, like a `<Menu>`, which is displayed by right-clicking anywhere in the header. The callback will receive the cell index if it was provided via props.  Inherited from `HeaderCellProps.menuRenderer` |
| `name` | `string` The name displayed in the header of the row/column.  Inherited from `HeaderCellProps.name` |
| `nameRenderer` | `(name: string, index?: number) => ReactElement<Props, string | JSXElementConstructor<any>>` A callback to override the default name rendering behavior. The default behavior is to simply use the `ColumnHeaderCell`s name prop.  This render callback can be used, for example, to provide a `EditableName` component for editing column names.  If you define this callback, we recommend you also set `<Table enableColumnInteractionBar={true}>` to avoid issues with menus or selection.  The callback will also receive the column index if an `index` was originally provided via props.  Inherited from `ColumnNameProps.nameRenderer` |
| `reorderHandle` | `Element` A `ReorderHandle` React component that allows users to drag-reorder the column header.  Inherited from `HeaderCellProps.reorderHandle` |
| `resizeHandle` | `Element` A `ResizeHandle` React component that allows users to drag-resize the header.  Inherited from `HeaderCellProps.resizeHandle` |
| `selectCellsOnMenuClick` | `booleantrue` If `true`, clicks on the header menu target element will cause the column's cells to be selected. |
| `style` | `CSSProperties` CSS styles for the top level element.  Inherited from `HeaderCellProps.style` |
| `targetRef` | `RefObject<HTMLElement>` Required for Draggable to attach a DOM ref.  Inherited from `HeaderCellProps.targetRef` |

## EditableName

Return a `<EditableName>` from the `nameRenderer` prop on a **ColumnHeaderCell** to enable click-to-edit functionality
in the column header.

interface EditableNameProps extends [IntentProps](#api/IntentProps), [Props](#api/Props)<>, RefAttributes<HTMLDivElement>

[@blueprintjs/table](https://github.com/palantir/blueprint/blob/d356c8eea/packages/table/src/headers/editableName.tsx#L24)

| Props | Description |
| --- | --- |
| `index` | `number` The index of the name in the header. If provided, this will be passed as an argument to any callbacks when they are invoked. |
| `name` | `string` The name displayed in the text box. Be sure to update this value when rendering this component after a confirmed change. |
| `onCancel` | `(value: string, columnIndex?: number) => void` A listener that is triggered if the user cancels the edit. This is important to listen to if you are doing anything with `onChange` events, since you'll likely want to revert whatever changes you made. |
| `onChange` | `(value: string, columnIndex?: number) => void` A listener that is triggered as soon as the editable name is modified. This can be due, for example, to keyboard input or the clipboard. |
| `onConfirm` | `(value: string, columnIndex?: number) => void` A listener that is triggered once the editing is confirmed. This is usually due to the `return` (or `enter`) key press. |

## EditableCell2

Return an `<EditableCell2>` component from the `cellRenderer` prop on a **Column** to enable double-click-to-edit
functionality in the table body.

interface EditableCell2Props extends Omit<[CellProps](#api/CellProps), "onKeyDown" | "onKeyUp">

[@blueprintjs/table](https://github.com/palantir/blueprint/blob/d356c8eea/packages/table/src/cell/editableCell2.tsx#L34)

| Props | Description |
| --- | --- |
| `cellRef` | `Ref<HTMLDivElement>` A ref handle to capture the outer div of this cell. Used internally.  Inherited from `Omit.cellRef` |
| `children` | `ReactNode`   Inherited from `Omit.children` |
| `columnIndex` | `number` The column index of the cell. If provided, this will be passed as an argument to any callbacks when they are invoked.  Inherited from `Omit.columnIndex` |
| `editableTextProps` | `Omit<EditableTextProps, "elementRef">` Props that should be passed to the EditableText when it is used to edit |
| `interactive` | `booleanfalse` If `true`, the cell will be rendered above overlay layers to enable mouse interactions within the cell.  Inherited from `Omit.interactive` |
| `isFocused` | `boolean` Whether the given cell is the current active/focused cell. |
| `key` | `string`   Inherited from `Omit.key` |
| `loading` | `booleanfalse` An optional native tooltip that is displayed on hover. If `true`, content will be replaced with a fixed-height skeleton.  Inherited from `Omit.loading` |
| `onCancel` | `(value: string, rowIndex?: number, columnIndex?: number) => void` A listener that is triggered if the user cancels the edit. This is important to listen to if you are doing anything with `onChange` events, since you'll likely want to revert whatever changes you made. The callback will also receive the row index and column index if they were originally provided via props. |
| `onChange` | `(value: string, rowIndex?: number, columnIndex?: number) => void` A listener that is triggered as soon as the editable name is modified. This can be due, for example, to keyboard input or the clipboard. The callback will also receive the row index and column index if they were originally provided via props. |
| `onConfirm` | `(value: string, rowIndex?: number, columnIndex?: number) => void` A listener that is triggered once the editing is confirmed. This is usually due to the `return` (or `enter`) key press. The callback will also receive the row index and column index if they were originally provided via props. |
| `onKeyPress` | `KeyboardEventHandler<HTMLElement>` Callback invoked when a character-key is pressed.  Inherited from `Omit.onKeyPress` |
| `rowIndex` | `number` The row index of the cell. If provided, this will be passed as an argument to any callbacks when they are invoked.  Inherited from `Omit.rowIndex` |
| `style` | `CSSProperties`   Inherited from `Omit.style` |
| `tabIndex` | `number` Allows for setting a tab index on the cell, so the cell can be browser-focusable.  Inherited from `Omit.tabIndex` |
| `tooltip` | `string` An optional native tooltip that is displayed on hover.  Inherited from `Omit.tooltip` |
| `truncated` | `booleantrue` If `true`, the cell contents will be wrapped in a `div` with styling that will prevent the content from overflowing the cell.  Inherited from `Omit.truncated` |
| `value` | `string` The value displayed in the text box. Be sure to update this value when rendering this component after a confirmed change. |
| `wrapText` | `booleanfalse` If `true`, the cell contents will be wrapped in a `div` with styling that will cause text to wrap, rather than displaying it on a single line.  Inherited from `Omit.wrapText` |

## RowHeaderCell

Optionally customize how each row header is displayed.

In order to use this API, supply a custom renderer function which returns a `<RowHeaderCell>` from the
`rowHeaderCellRenderer` prop on the overall **Table2**.

interface RowHeaderCellProps extends HeaderCellProps, [Props](#api/Props)<>

[@blueprintjs/table](https://github.com/palantir/blueprint/blob/d356c8eea/packages/table/src/headers/rowHeaderCell.tsx#L26)

| Props | Description |
| --- | --- |
| `children` | `ReactNode`   Inherited from `HeaderCellProps.children` |
| `enableRowReordering` | `boolean` Specifies if the row is reorderable. |
| `index` | `number` The index of the cell in the header. If provided, this will be passed as an argument to any callbacks when they are invoked.  Inherited from `HeaderCellProps.index` |
| `isActive` | `boolean` If `true`, will apply the active class to the header to indicate it is part of an external operation.  Inherited from `HeaderCellProps.isActive` |
| `isRowSelected` | `boolean` Specifies whether the full row is part of a selection. |
| `loading` | `booleanfalse` If `true`, the row/column `name` will be replaced with a fixed-height skeleton, and the `resizeHandle` will not be rendered. If passing in additional children to this component, you will also want to conditionally apply `Classes.SKELETON` where appropriate.  Inherited from `HeaderCellProps.loading` |
| `menuRenderer` | `(index?: number) => Element` A callback that returns an element, like a `<Menu>`, which is displayed by right-clicking anywhere in the header. The callback will receive the cell index if it was provided via props.  Inherited from `HeaderCellProps.menuRenderer` |
| `name` | `string` The name displayed in the header of the row/column.  Inherited from `HeaderCellProps.name` |
| `nameRenderer` | `(name: string, index?: number) => ReactElement<Props, string | JSXElementConstructor<any>>` A callback to override the default name rendering behavior. The default behavior is to simply use the `RowHeaderCell`s name prop.  This render callback can be used, for example, to provide a `EditableName` component for editing row names.  The callback will also receive the row index if an `index` was originally provided via props. |
| `reorderHandle` | `Element` A `ReorderHandle` React component that allows users to drag-reorder the column header.  Inherited from `HeaderCellProps.reorderHandle` |
| `resizeHandle` | `Element` A `ResizeHandle` React component that allows users to drag-resize the header.  Inherited from `HeaderCellProps.resizeHandle` |
| `style` | `CSSProperties` CSS styles for the top level element.  Inherited from `HeaderCellProps.style` |
| `targetRef` | `RefObject<HTMLElement>` Required for Draggable to attach a DOM ref.  Inherited from `HeaderCellProps.targetRef` |

## Region

A region is a rectangular group of cells in the table.

Regions are typically used to describe boundaries for selections (via the `selectedRegions` prop) and custom overlays
(via the `styledRegionGroups` prop). You may also wish to scroll directly to a region in the table via the
[`Table.scrollToRegion`](#table/api.instance-methods) instance method.

There are four different types of regions:

* **Cell region:** contains a finite, rectangular group of table cells
* **Row region:** represents all cells within one or more consecutive rows
* **Column region:** represents all cells within one or more consecutive columns
* **Table region:** represents all cells in the table

Regions are defined in code according to the `Region` interface:

interface Region

[@blueprintjs/table](https://github.com/palantir/blueprint/blob/d356c8eea/packages/table/src/regions.ts#L100)

See: [object Object]

| Props | Description |
| --- | --- |
| `cols` | `null | CellInterval` The first and last column indices in the region, inclusive and zero-indexed. If `cols` is `null`, then all columns are understood to be included in the region. |
| `rows` | `null | CellInterval` The first and last row indices in the region, inclusive and zero-indexed. If `rows` is `null`, then all rows are understood to be included in the region. |

You can construct region objects manually according to this interface, but we recommend using our exported
**factory methods** to help you construct the appropriate schema for your desired region type:

```
import { Regions } from "@blueprintjs/table";  
  
const singleCellRegion = Regions.cell(0, 0); // { rows: [0, 0], cols: [0, 0] }  
const singleColumnRegion = Regions.column(0); // { rows: null, cols: [0, 0] }  
const singleRowRegion = Regions.row(0); // { rows: [0, 0], cols: null }  
  
const multiCellRegion = Regions.cell(0, 0, 2, 2); // { rows: [0, 2], cols: [0, 2] }  
const multiColumnRegion = Regions.column(0, 2); // { rows: null, cols: [0, 2] }  
const multiRowRegion = Regions.row(0, 2); // { rows: [0, 2], cols: null }  
  
const tableRegion = Regions.table(); // { rows: null, cols: null }  

```

The table package also exports a `RegionCardinality` enumeration to describe the various region types in code:

* `RegionCardinality.CELLS`: describes a cell region
* `RegionCardinality.FULL_ROWS`: describes a row region
* `RegionCardinality.FULL_COLUMNS`: describes a column region
* `RegionCardinality.FULL_TABLE`: describes a table region

This enumeration is primarily used with the `selectionModes` prop to inform the **Table** about which kinds of regions
are selectable:

```
import { RegionCardinality } from "@blueprintjs/table";  
  
// disables selection of all region types  
<Table selectionModes={[]} />  
  
// enables selection of cell regions only  
<Table selectionModes={[RegionCardinality.CELLS]} />  
  
// enables selection of cell and row regions only  
<Table selectionModes={[RegionCardinality.CELLS, RegionCardinality.FULL_ROWS]} />  
  
// enables selection of the full table only  
<Table selectionModes={[RegionCardinality.FULL_TABLE]} />  

```

You may also use the exported `SelectionModes` enumeration to express common selection-mode combinations more concisely:

```
import { SelectionModes } from "@blueprintjs/table";  
  
<Table selectionModes={SelectionModes.ALL} />  
<Table selectionModes={SelectionModes.COLUMNS_AND_CELLS} />  
<Table selectionModes={SelectionModes.COLUMNS_ONLY} />  
<Table selectionModes={SelectionModes.NONE} />  
<Table selectionModes={SelectionModes.ROWS_AND_CELLS} />  
<Table selectionModes={SelectionModes.ROWS_ONLY} />  

```

Every region object has a well-defined cardinality. If necessary, you can determine the cardinality of any region using
the exported `Regions.getRegionCardinality()` function:

```
import { Regions } from "@blueprintjs/table";  
  
const cardinalities = [  
    Regions.getRegionCardinality(Regions.cell(0, 0)), // RegionCardinality.CELLS  
    Regions.getRegionCardinality(Regions.row(0)), // RegionCardinality.FULL_ROWS  
    Regions.getRegionCardinality(Regions.column(0)), // RegionCardinality.FULL_COLUMNS  
    Regions.getRegionCardinality(Regions.table()), // RegionCardinality.FULL_TABLE  
];  

```

method getRegionCardinality

[@blueprintjs/table](https://github.com/palantir/blueprint/blob/d356c8eea/packages/table/src/regions.ts#L158)

| Returns |  |
| --- | --- |
| `RegionCardinality` | Determines the cardinality of a region. We use null values to indicate an unbounded interval. Therefore, an example of a region containing the second and third columns would be:   ``` { rows: null, cols: [1, 2] }  ```   In this case, this method would return `RegionCardinality.FULL_COLUMNS`.  If both rows and columns are unbounded, then the region covers the entire table. Therefore, a region like this:   ``` { rows: null, cols: null }  ```   will return `RegionCardinality.FULL_TABLE`.  An example of a region containing a single cell in the table would be:   ``` { rows: [5, 5], cols: [2, 2] }  ```   In this case, this method would return `RegionCardinality.CELLS`. |

| Parameters | Description |
| --- | --- |
| `region` | `Region`   Required |

## TruncatedFormat

Wrap your cell contents with a **TruncatedFormat** component like so:

```
const content = "A very long string...";  
return (  
    <Cell>  
        <TruncatedFormat>{content}</TruncatedFormat>  
    </Cell>  
);  

```

interface TruncatedFormatProps extends [Props](#api/Props)

[@blueprintjs/table](https://github.com/palantir/blueprint/blob/d356c8eea/packages/table/src/cell/formats/truncatedFormat.tsx#L79)

| Props | Description |
| --- | --- |
| `children` | `string` |
| `detectTruncation` | `booleanfalse;` Should the component keep track of the truncation state of the string content. If true, the value of `truncateLength` is ignored. When combined with a `showPopover` value of `WHEN_TRUNCATED`, popovers will only render when necessary. |
| `measureByApproxOptions` | `TrucatedFormateMeasureByApproximateOptions` Values to use for character width, line height, cell padding, and buffer lines desired, when using approximate truncation. These values are used to guess at the size of the text and determine if the popover should be drawn. They should work well enough for default table styles, but may need to be overridden for more accuracy if the default styles or font size, etc are changed. |
| `parentCellHeight` | `number` Height of the parent cell. Used by shouldComponentUpdate only |
| `parentCellWidth` | `number` Width of the parent cell. Used by shouldComponentUpdate only |
| `preformatted` | `booleanfalse` Sets the popover content style to `white-space: pre` if `true` or `white-space: normal` if `false`. |
| `showPopover` | `TruncatedPopoverModeWHEN_TRUNCATED` Configures when the popover is shown with the `TruncatedPopoverMode` enum.  The enum values are:   * `ALWAYS`: show the popover. * `NEVER`: don't show the popover. * `WHEN_TRUNCATED`: show the popover only when the text is truncated (default). * `WHEN_TRUNCATED_APPROX`: show the popover only when the text is trunctated, but use   a formula to calculate this based on text length, which is faster but less accurate. |
| `truncateLength` | `number2000` Number of characters that are displayed before being truncated and appended with the `truncationSuffix` prop. A value of 0 will disable truncation. This prop is ignored if `detectTruncation` is `true`. |
| `truncationSuffix` | `string"..."` The string that is appended to the display string if it is truncated. |

## JSONFormat

Wrap your JavaScript object cell contents with a **JSONFormat** component like so:

```
const content = { any: "javascript variable", even: [null, "is", "okay", "too"] };  
return (  
    <Cell>  
        <JSONFormat>{content}</JSONFormat>  
    </Cell>  
);  

```

interface JSONFormatProps extends [TruncatedFormatProps](#api/TruncatedFormatProps)

[@blueprintjs/table](https://github.com/palantir/blueprint/blob/d356c8eea/packages/table/src/cell/formats/jsonFormat.tsx#L26)

| Props | Description |
| --- | --- |
| `children` | `any` |
| `detectTruncation` | `booleanfalse;` Should the component keep track of the truncation state of the string content. If true, the value of `truncateLength` is ignored. When combined with a `showPopover` value of `WHEN_TRUNCATED`, popovers will only render when necessary.  Inherited from `TruncatedFormatProps.detectTruncation` |
| `measureByApproxOptions` | `TrucatedFormateMeasureByApproximateOptions` Values to use for character width, line height, cell padding, and buffer lines desired, when using approximate truncation. These values are used to guess at the size of the text and determine if the popover should be drawn. They should work well enough for default table styles, but may need to be overridden for more accuracy if the default styles or font size, etc are changed.  Inherited from `TruncatedFormatProps.measureByApproxOptions` |
| `omitQuotesOnStrings` | `booleantrue` By default, we omit stringifying native JavaScript strings since `JSON.stringify` awkwardly adds double-quotes to the display value. This behavior can be turned off by setting this boolean to `false`. |
| `parentCellHeight` | `number` Height of the parent cell. Used by shouldComponentUpdate only  Inherited from `TruncatedFormatProps.parentCellHeight` |
| `parentCellWidth` | `number` Width of the parent cell. Used by shouldComponentUpdate only  Inherited from `TruncatedFormatProps.parentCellWidth` |
| `preformatted` | `booleanfalse` Sets the popover content style to `white-space: pre` if `true` or `white-space: normal` if `false`.  Inherited from `TruncatedFormatProps.preformatted` |
| `showPopover` | `TruncatedPopoverModeWHEN_TRUNCATED` Configures when the popover is shown with the `TruncatedPopoverMode` enum.  The enum values are:   * `ALWAYS`: show the popover. * `NEVER`: don't show the popover. * `WHEN_TRUNCATED`: show the popover only when the text is truncated (default). * `WHEN_TRUNCATED_APPROX`: show the popover only when the text is trunctated, but use   a formula to calculate this based on text length, which is faster but less accurate.  Inherited from `TruncatedFormatProps.showPopover` |
| `stringify` | `(obj: any) => string` Optionally specify the stringify method. Default is `JSON.stringify` with 2-space indentation. |
| `truncateLength` | `number2000` Number of characters that are displayed before being truncated and appended with the `truncationSuffix` prop. A value of 0 will disable truncation. This prop is ignored if `detectTruncation` is `true`.  Inherited from `TruncatedFormatProps.truncateLength` |
| `truncationSuffix` | `string"..."` The string that is appended to the display string if it is truncated.  Inherited from `TruncatedFormatProps.truncationSuffix` |