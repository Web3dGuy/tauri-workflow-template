# HTML select

Styling HTML `<select>` tags requires a wrapper element to customize the dropdown caret, so Blueprint provides
a **HTMLSelect** component to streamline this process.

The [**Select**](#select/select-component) component in the [**@blueprintjs/select**](#select)
package provides a more full-features alternative to the native HTML `<select>` tag. Notably, it
supports custom filtering logic and item rendering.

## Usage

Use **HTMLSelect** exactly like you would use a native `<select>` with `value` (or `defaultValue`) and `onChange`.
Options can be passed as `<option>` children for full flexibility or via the `options` prop for simple shorthand.

OneTwoThreeFourOpen dropdown

##### Props

FillLargeMinimalDisabled

Icon 

double-caret-verticalcaret-downOpen dropdown

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/hTMLSelectExample.tsx)

## Props interface

interface HTMLSelectProps extends RefAttributes<HTMLSelectElement>, SelectHTMLAttributes<HTMLSelectElement>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/html-select/htmlSelect.tsx#L28)

| Props | Description |
| --- | --- |
| `children` | `ReactNode` |
| `disabled` | `boolean` Whether this element is non-interactive. |
| `fill` | `boolean` Whether this element should fill its container. |
| `iconName` | `"caret-down" | "double-caret-vertical""double-caret-vertical"` Name of one of the supported icons for this component to display on the right side of the element. |
| `iconProps` | `Partial<SVGIconProps>` Props to spread to the icon element displayed on the right side of the element. |
| `large` | `boolean` Whether to use large styles. |
| `minimal` | `boolean` Whether to use minimal styles. |
| `multiple` | `undefined` Multiple select is not supported. |
| `onChange` | `ChangeEventHandler<HTMLSelectElement>` Change event handler. Use `event.currentTarget.value` to access the new value. |
| `options` | `readonly (string | number | OptionProps<string | number>)[]` Shorthand for supplying options: an array of basic types or `{ label?, value }` objects. If no `label` is supplied, `value` will be used as the label. |
| `placeholder` | `string` Placeholder text to display when no option is selected. |
| `value` | `string | number` Controlled value of this component. |

## CSS API

##### Deprecated API: use [`<HTMLSelect>`](#core/components/html-select)

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

Put class modifiers on the wrapper and attribute modifiers and event handlers directly on the `<select>`.

Choose an item...
One
Two
Three
Four

`:disabled`

Disabled. Also add `.bp5-disabled` to `.bp5-select` for icon coloring (not shown below).

`.bp5-fill`

Expand to fill parent container

`.bp5-large`

Large size

`.bp5-minimal`

Minimal appearance

```
<div class="bp5-html-select {{.modifier}}">  
  <select {{:modifier}}>  
    <option selected>Choose an item...</option>  
    <option value="1">One</option>  
    <option value="2">Two</option>  
    <option value="3">Three</option>  
    <option value="4">Four</option>  
  </select>  
  <span class="bp5-icon bp5-icon-double-caret-vertical"></span>  
</div>  

```