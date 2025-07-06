# Icon

See the [**Icons package**](#icons) for a searchable list of all available UI icons.

Blueprint provides icons in two formats (SVG and fonts). It's easy to change their color
or apply effects like text shadows via standard SVG or CSS properties.

This section describes two ways of using Blueprint's UI icons:
via the `Icon` component to render SVG images or via CSS classes to use the icon font.

Many Blueprint components provide an `icon` prop which accepts an icon name
(such as `"history"`) or a JSX element to use as the icon. When you specify
the name as a string, these components render `<Icon icon="..." />` under the hood.

##### Props

Icon

calendar

Intent 

NonePrimarySuccessWarningDangerOpen dropdown

Icon size

0

20

40

60

80

100

16

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/iconExample.tsx)

## Usage

Use the `<Icon>` component to easily render **SVG icons** in React. The `icon`
prop is typed such that editors can offer autocomplete for known icon names. The
optional `size` prop determines the exact width and height of the icon
image; the icon element itself can be also be sized using CSS.

Icons may be configured to load in various ways, see ["Loading icons"](#icons/loading-icons).

The HTML element rendered by `<Icon>` can be customized with the `tagName` prop
(defaults to `span`), and additional props are passed to this element.

Data files in the **@blueprintjs/icons** package provide SVG path information
for Blueprint's 500+ icons for 16px and 20px grids. The `icon` prop specifies
which SVG is rendered and the `size` prop determines which pixel grid is used:
`size >= 20` will use the 20px grid and smaller icons will use the 16px grid.

If `title` is *not* provided to an `<Icon>`, `aria-hidden` will be set to true as
it will be assumed that the icon is decorative since it is unlabeled.

```
import { Icon, IconSize } from "@blueprintjs/core";  
  
// icon name string literals are type checked  
<Icon icon="cross" />  
<Icon icon="globe" size={20} />  
  
// constants are provided for standard sizes  
<Icon icon="graph" size={IconSize.LARGE} intent="primary" />  
  
// you can also pass all valid HTML props  
<Icon icon="add" onClick={this.handleAdd} onKeyDown={this.handleAddKeys} />  

```

Custom sizes are supported. The following React element:

```
<Icon icon="globe" size={30} />  

```

...renders this HTML markup:

```
<span class="bp5-icon bp5-icon-globe" aria-hidden="true">  
    <svg data-icon="globe" width="30" height="30" viewBox="0 0 20 20" role="img">  
        <path d="..."></path>  
    </svg>  
</span>  

```

## Props interface

interface DefaultIconProps extends [IntentProps](#api/IntentProps), [Props](#api/Props)<>, [DefaultSVGIconProps](#api/DefaultSVGIconProps)<>, IconOwnProps<>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/icon/icon.tsx#L92)

The default `<Icon>` props interface, equivalent to `IconProps` with its default type parameter.
This is primarly exported for documentation purposes; users should reference `IconProps<T>` instead.

| Props | Description |
| --- | --- |
| `autoLoad` | `booleantrue` Whether the component should automatically load icon contents using an async import.  Inherited from `IconOwnProps.autoLoad` |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `icon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon, or an icon element, to render. This prop is required because it determines the content of the component, but it can be explicitly set to falsy values to render nothing.   * If `null` or `undefined` or `false`, this component will render nothing. * If given an `IconName` (a string literal union of all icon names), that   icon will be rendered as an `<svg>` with `<path>` tags. Unknown strings   will render a blank icon to occupy space. * If given a `React.JSX.Element`, that element will be rendered and *all other   props on this component are ignored.* This type is supported to   simplify icon support in other Blueprint components. As a consumer, you   should avoid using `<Icon icon={<Element />}` directly; simply render   `<Element />` instead.  RequiredInherited from `IconOwnProps.icon` |
| `iconSize` | `number` Alias for `size` prop. Kept around for backwards-compatibility with Blueprint v4.x, will be removed in v6.0.  DeprecatedInherited from `IconOwnProps.iconSize` |
| `intent` | `Intent` Visual intent color to apply to element.  Inherited from `IntentProps.intent` |

## DOM attributes

The `<Icon>` component forwards extra HTML attributes to its root DOM element. By default,
the root element is a `<span>` wrapper around the icon `<svg>`. The tag name of this element
may be customized via the `tagName` prop as either:

* a custom HTML tag name (for example `<div>` instead of the default `<span>` wrapper), or
* `null`, which makes the component omit the wrapper element and only render the `<svg>` as its root element

By default, `<Icon>` supports a limited set of DOM attributes which are assignable to *all* HTML and SVG
elements. In some cases, you may want to use more specific attributes which are only available on HTML elements
or SVG elements. The `<Icon>` component has a generic type which allows for this more advanced usage. You can
specify a type parameter on the component opening tag to (for example) set an HTML-only attribute:

```
import { Icon } from "@blueprintjs/core";  
import * as React from "react";  
  
function Example() {  
    const [isDraggable, setIsDraggable] = React.useState();  
    // explicitly declare type of the root element so that we can set the "draggable" DOM attribute  
    return <Icon<HTMLSpanElement> icon="drag-handle-horizontal" draggable={isDraggable} />;  
}  

```

Another use case for this type parameter API may be to get the correct type definition for an event handler
on the root element when *omitting* the icon wrapper element:

```
import { Icon } from "@blueprintjs/core";  
import * as React from "react";  
  
function Example() {  
    const handleClick: React.MouseEventHandler<SVGSVGElement> = () => {  
        /* ... */  
    };  
    // explicitly declare type of the root element so that we can narrow the type of the event handler  
    return <Icon<SVGSVGElement> icon="add" onClick={handleClick} tagName={null} />;  
}  

```

## Static components

The `<Icon>` component loads icon paths via dynamic module imports by default. An alternative API
is available in the **@blueprintjs/icons** package which provides static imports of each icon as
a React component. The example below uses the `<Calendar>` component.

Note that some `<Icon>` props are not yet supported for these components, such as `intent`.

##### Props

Icon size

0

20

40

60

80

100

16

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/iconGeneratedComponentExample.tsx)

interface DefaultSVGIconProps extends RefAttributes<Element>, [SVGIconAttributes](#api/SVGIconAttributes)<Element>, SVGIconOwnProps

[@blueprintjs/icons](https://github.com/palantir/blueprint/blob/d356c8eea/packages/icons/src/svgIconProps.ts#L124)

The default SVG icon props interface, equivalent to `SVGIconProps` with its default type parameter.
This is primarly exported for documentation purposes; users should reference `SVGIconProps<T>` instead.

| Props | Description |
| --- | --- |
| `children` | `undefined` This component does not support child nodes.  Inherited from `SVGIconOwnProps.children` |
| `className` | `string` A space-delimited list of class names to pass along to the SVG element.  Inherited from `SVGIconOwnProps.className` |
| `color` | `string` Color of icon. This is used as the `fill` attribute on the `<svg>` image so it will override any CSS `color` property, including that set by `intent`. If this prop is omitted, icon color is inherited from surrounding text.  Inherited from `SVGIconOwnProps.color` |
| `htmlTitle` | `string` String for the `title` attribute on the rendered element, which will appear on hover as a native browser tooltip.  Inherited from `SVGIconOwnProps.htmlTitle` |
| `size` | `number16` Size of the icon, in pixels. Blueprint contains 16px and 20px SVG icon images, and chooses the appropriate resolution based on this prop.  Inherited from `SVGIconOwnProps.size` |
| `svgProps` | `HTMLAttributes<SVGElement>` Props to apply to the `SVG` element  Inherited from `SVGIconOwnProps.svgProps` |
| `tagName` | `null | keyof IntrinsicElements"span"` HTML tag to use for the rendered element. Commonly "span" or "div". If `null`, no wrapper will be rendered, just the `<svg>` element.  Inherited from `SVGIconOwnProps.tagName` |
| `title` | `null | string | false` Description string. This string does not appear in normal browsers, but it increases accessibility. For instance, screen readers will use it for aural feedback.  If this value is nullish, `false`, or an empty string, the component will assume that the icon is decorative and `aria-hidden="true"` will be applied (can be overridden by manually passing `aria-hidden` prop).  See: [object Object]  Inherited from `SVGIconOwnProps.title` |

## CSS API

The CSS-only icons API uses the **icon fonts** from the **@blueprintjs/icons** package.
Note that *none of Blueprint's React components use the icon font*; it is only provided
for convenience to Blueprint consumers for rare situations where an icon font may be
preferred over icon SVGs.

To use Blueprint UI icons via CSS, you must apply two classes to a `<span>` element:

* a **sizing class**, either `bp5-icon-standard` (16px) or `bp5-icon-large` (20px)
* an **icon name class**, such as `bp5-icon-projects`

Icon classes also support the four `.bp5-intent-*` modifiers to color the image.

```
<span class="bp5-icon-{{size}} bp5-icon-{{name}}"></span>  
  
<span class="bp5-icon-standard bp5-icon-projects"></span>  
<span class="bp5-icon-large bp5-icon-geosearch bp5-intent-success"></span>  

```

##### Non-standard sizes

Generally, font icons should only be used at either 16px or 20px. However, if a non-standard size is
necessary, set a `font-size` that is whole multiple of 16 or 20 with the relevant size class.
You can instead use the class `bp5-icon` to make the icon inherit its size from surrounding text.