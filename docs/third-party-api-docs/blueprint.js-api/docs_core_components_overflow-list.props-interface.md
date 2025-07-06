# Overflow list

**OverflowList** takes a generic list of items and renders as many items as can fit inside its container. Overflowed
items that do not fit are collapsed into a single element. The visible items will be recomputed when a resize is
detected.

The `items` prop accepts an array of generic objects. The required `visibleItemRenderer` callback prop determines the
appearance of a visible item. The required `overflowRenderer` callback prop receives all overflowed items and renders
the overflow indicator.

This component uses [the `ResizeObserver` API](https://developer.mozilla.org/en-US/docs/Web/API/ResizeObserver) to efficiently detect when its dimensions change. Use
the `observeParents` prop to watch for resizing further up in the DOM tree.

2. image.jpg

##### Props

Collapse fromStartEnd

Always render overflowRender current breadcrumb as input

##### Example

Width

0%

50%

100%

50%

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/overflowListExample.tsx)

## Props interface

interface OverflowListProps extends [Props](#api/Props)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/overflow-list/overflowList.tsx#L25)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `alwaysRenderOverflow` | `booleanfalse` Whether to force the overflowRenderer to always be called, even if there are zero items overflowing. This may be useful, for example, if your overflow renderer contains a Popover which you do not want to close as the list is resized. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `collapseFrom` | `BoundaryBoundary.START` Which direction the items should collapse from: start or end of the children. This also determines whether `overflowRenderer` appears before (`START`) or after (`END`) the visible items. |
| `items` | `readonly T[]` All items to display in the list. Items that do not fit in the container will be rendered in the overflow instead.  Required |
| `minVisibleItems` | `number0` The minimum number of visible items that should never collapse into the overflow menu, regardless of DOM dimensions. |
| `observeParents` | `booleanfalse` If `true`, all parent DOM elements of the container will also be observed. If changes to a parent's size is detected, the overflow will be recalculated.  Only enable this prop if the overflow should be recalculated when a parent element resizes in a way that does not also cause the `OverflowList` to resize. |
| `onOverflow` | `(overflowItems: T[]) => void` Callback invoked when the overflowed items change. This is called once after the DOM has settled, rather that on every intermediate change. It is not invoked if resizing produces an unchanged overflow state. |
| `overflowRenderer` | `(overflowItems: T[]) => ReactNode` Callback invoked to render the overflowed items. Unlike `visibleItemRenderer`, this prop is invoked once with all items that do not fit in the container.  Typical use cases for this prop will put overflowed items in a dropdown menu or display a "+X items" label.  Required |
| `style` | `CSSProperties` CSS properties to apply to the root element. |
| `tagName` | `keyof IntrinsicElements"div"` HTML tag name for the container element. |
| `visibleItemRenderer` | `(item: T, index: number) => ReactNode` Callback invoked to render each visible item. Remember to set a `key` on the rendered element!  Required |