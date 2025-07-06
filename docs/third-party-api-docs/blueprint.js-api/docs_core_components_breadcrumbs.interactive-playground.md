# Breadcrumbs

**Breadcrumbs** represent the path to the current resource within an application's hierarchical structure.

## Import

```
import { Breadcrumbs } from "@blueprintjs/core";  

```

## Usage

The **Breadcrumbs** component accepts an `items` array of
[breadcrumb props](#core/components/breadcrumbs.breadcrumb) and renders them as an ordered list.

1. Blueprint
2. Docs
3. Components
4. Breadcrumbs

```
<Breadcrumbs  
    items={[  
        { text: "Blueprint" },  
        { text: "Docs" },  
        { text: "Components" },  
        { text: "Breadcrumbs" },  
    ]}  
/>  

```

## Overflow

**Breadcrumbs** uses an [**OverflowList**](#core/components/overflow-list)
to collapse breadcrumbs that exceed the available space.

2. Photos
3. Wednesday
4. image.jpg

```
<Breadcrumbs  
    items={[  
        { text: "All files" },  
        { text: "Users" },  
        { text: "Janet" },  
        { text: "Photos" },  
        { text: "Wednesday" },  
        { text: "image.jpg", current: true },  
    ]}  
    minVisibleItems={3}  
/>  

```

## Customizing breadcrumbs

The **Breadcrumbs** component supports customization through the `breadcrumbRenderer`
and `currentBreadcrumbRenderer` props, which allow custom rendering of individual breadcrumbs.

1. [Users](/users)
2. [Janet](/users/janet)
3. image.jpg

```
<Breadcrumbs  
    currentBreadcrumbRenderer={({ text, ...rest }) => (  
        <Breadcrumb {...rest}>  
            {text}&nbsp;  
            <Icon icon="star" />  
        </Breadcrumb>  
    )}  
    items={[  
        { href: "/users", icon: "folder-close", text: "Users" },  
        { href: "/users/janet", icon: "folder-close", text: "Janet" },  
        { icon: "document", text: "image.jpg" },  
    ]}  
/>  

```

## Interactive Playground

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

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/breadcrumbsPlaygroundExample.tsx)

## Props interface

interface BreadcrumbsProps extends [Props](#api/Props)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/breadcrumbs/breadcrumbs.tsx#L28)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `breadcrumbRenderer` | `(props: BreadcrumbProps) => Element<>` Callback invoked to render visible breadcrumbs. Best practice is to render a `<Breadcrumb>` element. If `currentBreadcrumbRenderer` is also supplied, that callback will be used for the current breadcrumb instead. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `collapseFrom` | `BoundaryBoundary.START` Which direction the breadcrumbs should collapse from: start or end. |
| `currentBreadcrumbRenderer` | `(props: BreadcrumbProps) => Element<>` Callback invoked to render the current breadcrumb, which is the last element in the `items` array.  If this prop is omitted, `breadcrumbRenderer` will be invoked for the current breadcrumb instead. |
| `items` | `readonly BreadcrumbProps[]` All breadcrumbs to display. Breadcrumbs that do not fit in the container will be rendered in an overflow menu instead.  Required |
| `minVisibleItems` | `number0` The minimum number of visible breadcrumbs that should never collapse into the overflow menu, regardless of DOM dimensions. |
| `overflowButtonProps` | `HTMLProps<HTMLSpanElement>` Props to spread to the `OverflowList` popover target. |
| `overflowListProps` | `Partial<Omit<OverflowListProps<BreadcrumbProps>, "items" | "overflowRenderer" | "visibleItemRenderer">>` Props to spread to `OverflowList`. Note that `items`, `overflowRenderer`, and `visibleItemRenderer` cannot be changed. |
| `popoverProps` | `Partial<Omit<PopoverProps<DefaultPopoverTargetHTMLProps>, "fill" | "content" | "disabled" | "defaultIsOpen" | "renderTarget" | "targetTagName">>` Props to spread to the popover showing the overflow menu. |

## Breadcrumb

The **Breadcrumb** component renders an `a.bp5-breadcrumb` if an `href` or `onClick`
is provided; otherwise, it renders a `span.bp5-breadcrumb`. Typically, breadcrumbs
are supplied as an array of `BreadcrumbProps` to the `items` prop of **Breadcrumbs**,
but the component can also be used directly when implementing a custom `breadcrumbRenderer`.

interface BreadcrumbProps extends [ActionProps](#api/ActionProps)<HTMLAnchorElement>, [LinkProps](#api/LinkProps)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/breadcrumbs/breadcrumb.tsx#L23)

Interface for a clickable action, such as a button or menu item.
These props can be spready directly to a `<Button>` or `<MenuItem>` element.

| Props | Description |
| --- | --- |
| `children` | `ReactNode` |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `ActionProps.className` |
| `current` | `boolean` Whether this breadcrumb is the current breadcrumb. |
| `disabled` | `boolean` Whether this action is non-interactive.  Inherited from `ActionProps.disabled` |
| `href` | `string` Link URL.  Inherited from `LinkProps.href` |
| `icon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon (or an icon element) to render before the text.  Inherited from `ActionProps.icon` |
| `iconTitle` | `string` Pass through value to icon's title attribute. Should be used for breadcrumbs without text or children defined. |
| `intent` | `Intent` Visual intent color to apply to element.  Inherited from `ActionProps.intent` |
| `onClick` | `(event: MouseEvent<HTMLAnchorElement, MouseEvent<>>) => void` Click event handler.  Inherited from `ActionProps.onClick` |
| `onFocus` | `(event: FocusEvent<HTMLAnchorElement, Element<>>) => void` Focus event handler.  Inherited from `ActionProps.onFocus` |
| `target` | `HTMLAttributeAnchorTarget` Link target attribute. Use `"_blank"` to open in a new window.  Inherited from `LinkProps.target` |
| `text` | `ReactNode` Action text. Can be any single React renderable.  Inherited from `ActionProps.text` |