# Switch

**Switch** is a form control for toggling between boolean states. It is similar to
[**Checkbox**](#core/components/checkbox), but presents a more skeuomorphic appearance that mimics a physical switch.

Its whole label is interactive and it supports a few visual modifiers for different UI layouts.

Privacy setting 

**Enabled***Public*Cooperative

on

off

Containing Text

This example uses `labelElement` to demonstrate JSX labels.

##### Props

DisabledInlineLarge

Align indicator 

StartEnd

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/switchExample.tsx)

## Props interface

interface SwitchProps extends [ControlProps](#api/ControlProps)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/forms/controls.tsx#L89)

Switch component props.

| Props | Description |
| --- | --- |
| `alignIndicator` | `AlignmentAlignment.START` Alignment of the indicator within container.  Inherited from `ControlProps.alignIndicator` |
| `checked` | `boolean` Whether the control is checked.  Inherited from `ControlProps.checked` |
| `children` | `ReactNode` JSX label for the control.  Inherited from `ControlProps.children` |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `ControlProps.className` |
| `defaultChecked` | `boolean` Whether the control is initially checked (uncontrolled mode).  Inherited from `ControlProps.defaultChecked` |
| `disabled` | `boolean` Whether the control is non-interactive.  Inherited from `ControlProps.disabled` |
| `inline` | `boolean` Whether the control should appear as an inline element.  Inherited from `ControlProps.inline` |
| `innerLabel` | `string` Text to display inside the switch indicator when unchecked. |
| `innerLabelChecked` | `stringinnerLabel` Text to display inside the switch indicator when checked. If `innerLabel` is provided and this prop is omitted, then `innerLabel` will be used for both states. |
| `inputRef` | `Ref<HTMLInputElement>` Ref attached to the HTML `<input>` element backing this component.  Inherited from `ControlProps.inputRef` |
| `label` | `string` Text label for the control.  Use `children` or `labelElement` to supply JSX content. This prop actually supports JSX elements, but TypeScript will throw an error because `HTMLAttributes` only allows strings.  Inherited from `ControlProps.label` |
| `labelElement` | `ReactNode` JSX element label for the control.  This prop is a workaround for TypeScript consumers as the type definition for `label` only accepts strings. JavaScript consumers can provide a JSX element directly to `label`.  Inherited from `ControlProps.labelElement` |
| `large` | `booleanfalse` Whether this control should use large styles.  DeprecatedInherited from `ControlProps.large` |
| `onChange` | `ChangeEventHandler<HTMLInputElement>` Event handler invoked when input value is changed.  Inherited from `ControlProps.onChange` |
| `size` | `NonSmallSize"medium"` Size of the control.  Inherited from `ControlProps.size` |
| `tagName` | `keyof IntrinsicElements"label"` Name of the HTML tag that wraps the checkbox.  By default a `<label>` is used, which effectively enlarges the click target to include all of its children. Supply a different tag name if this behavior is undesirable or you're listening to click events from a parent element (as the label can register duplicate clicks).  Inherited from `ControlProps.tagName` |

## CSS API

##### Deprecated API: use [`<Switch>`](#core/components/switch)

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

Switch

`:checked`

Selected

`:disabled`

Disabled. Also add `.bp5-disabled` to `.bp5-control` to change text color (not shown below).

`.bp5-align-right`

Right-aligned indicator

`.bp5-large`

Large

```
<label class="bp5-control bp5-switch {{.modifier}}">  
  <input type="checkbox" {{:modifier}} />  
  <span class="bp5-control-indicator"></span>  
  Switch  
</label>  

```