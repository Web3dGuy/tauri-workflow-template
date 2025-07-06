# Checkbox

A checkbox allows the user to toggle between checked, unchecked, and (sometimes) indeterminate states.

Lunch special 

SoupSaladSandwich

##### Props

DisabledInlineLarge

Align indicator 

StartEnd

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/checkboxExample.tsx)

## Usage

Use the `checked` prop instead of `value` in controlled mode to avoid typings issues.
Enable the `indeterminate` prop for a third in-between state.

```
// simple usage for string labels  
<Checkbox checked={this.state.isEnabled} label="Enabled" onChange={this.handleEnabledChange} />  
  
// advanced usage for JSX content  
<Checkbox checked={this.state.isEnabled} onChange={this.handleEnabledChange}>  
    <Icon icon="user" />  
    John <strong>Doe</strong>  
</Checkbox>  

```

## Props interface

This component supports the full range of HTML `<input>` props.

interface CheckboxProps extends [ControlProps](#api/ControlProps)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/forms/controls.tsx#L163)

Checkbox component props.

| Props | Description |
| --- | --- |
| `alignIndicator` | `AlignmentAlignment.START` Alignment of the indicator within container.  Inherited from `ControlProps.alignIndicator` |
| `checked` | `boolean` Whether the control is checked.  Inherited from `ControlProps.checked` |
| `children` | `ReactNode` JSX label for the control.  Inherited from `ControlProps.children` |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `ControlProps.className` |
| `defaultChecked` | `boolean` Whether the control is initially checked (uncontrolled mode).  Inherited from `ControlProps.defaultChecked` |
| `defaultIndeterminate` | `boolean` Whether this checkbox is initially indeterminate (uncontrolled mode). |
| `disabled` | `boolean` Whether the control is non-interactive.  Inherited from `ControlProps.disabled` |
| `indeterminate` | `boolean` Whether this checkbox is indeterminate, or "partially checked." The checkbox will appear with a small dash instead of a tick to indicate that the value is not exactly true or false.  Note that this prop takes precendence over `checked`: if a checkbox is marked both `checked` and `indeterminate` via props, it will appear as indeterminate in the DOM. |
| `inline` | `boolean` Whether the control should appear as an inline element.  Inherited from `ControlProps.inline` |
| `inputRef` | `Ref<HTMLInputElement>` Ref attached to the HTML `<input>` element backing this component.  Inherited from `ControlProps.inputRef` |
| `label` | `string` Text label for the control.  Use `children` or `labelElement` to supply JSX content. This prop actually supports JSX elements, but TypeScript will throw an error because `HTMLAttributes` only allows strings.  Inherited from `ControlProps.label` |
| `labelElement` | `ReactNode` JSX element label for the control.  This prop is a workaround for TypeScript consumers as the type definition for `label` only accepts strings. JavaScript consumers can provide a JSX element directly to `label`.  Inherited from `ControlProps.labelElement` |
| `large` | `booleanfalse` Whether this control should use large styles.  DeprecatedInherited from `ControlProps.large` |
| `onChange` | `ChangeEventHandler<HTMLInputElement>` Event handler invoked when input value is changed.  Inherited from `ControlProps.onChange` |
| `size` | `NonSmallSize"medium"` Size of the control.  Inherited from `ControlProps.size` |
| `tagName` | `keyof IntrinsicElements"label"` Name of the HTML tag that wraps the checkbox.  By default a `<label>` is used, which effectively enlarges the click target to include all of its children. Supply a different tag name if this behavior is undesirable or you're listening to click events from a parent element (as the label can register duplicate clicks).  Inherited from `ControlProps.tagName` |

## CSS API

##### Deprecated API: use [`<Checkbox>`](#core/components/checkbox)

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

Blueprint's custom checkboxes use an extra `.bp5-control-indicator` element after the `<input>` to achieve
their custom styling. You should then wrap the whole thing in a `<label>` with the classes `.bp5-control.bp5-checkbox`.

Note that attribute modifiers (`:checked`, `:disabled`) are applied on the internal `<input>` element. Further note
that `:indeterminate` can only be set via JavaScript (the `Checkbox` React component supports it handily with a prop).

Checkbox

`:checked`

Checked

`:disabled`

Disabled. Also add `.bp5-disabled` to `.bp5-control` to change text color (not shown below).

`:indeterminate`

Indeterminate. Note that this style can only be achieved via JavaScript `input.indeterminate = true`.

`.bp5-align-right`

Right-aligned indicator

`.bp5-large`

Large

```
<label class="bp5-control bp5-checkbox {{.modifier}}">  
  <input type="checkbox" {{:modifier}} />  
  <span class="bp5-control-indicator"></span>  
  Checkbox  
</label>  

```