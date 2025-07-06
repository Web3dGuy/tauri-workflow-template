# Radio

A radio button typically represents a single option in a mutually exclusive list (where only one item can be
selected at a time). Blueprint provides **Radio** and **RadioGroup** components for these two layers.

Determine lunchSoupSaladSandwich

##### Props

DisabledInlineLarge

Align indicator 

StartEnd

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/radioExample.tsx)

## Usage

Typically, radio buttons are used in a group to choose one option from several, similar to how a `<select>` element
contains several `<option>` elements. As such, you can use the **RadioGroup** component with a series of **Radio** children.
**RadioGroup** is responsible for managing state and interaction.

```
<RadioGroup label="Lunch special" onChange={handleMealChange} selectedValue={mealType}>  
    <Radio label="Soup" value="one" />  
    <Radio label="Salad" value="two" />  
    <Radio label="Sandwich" value="three" />  
</RadioGroup>  

```

## Props interface

**Radio** supports the full range of HTML `<input>` attributes.

type alias RadioProps

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/forms/controls.tsx#L144)

Radio component props.

= [ControlProps](#api/ControlProps)

### RadioGroup

interface RadioGroupProps extends [Props](#api/Props), [HTMLDivProps](#api/HTMLDivProps)<>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/forms/radioGroup.tsx#L36)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `children` | `ReactNode` Radio elements. This prop is mutually exclusive with `options`. If passing custom children, ensure options have `role="radio"` or `input` with `type="radio"`. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `disabled` | `boolean` Whether the group and *all* its radios are disabled. Individual radios can be disabled using their `disabled` prop. |
| `inline` | `boolean` Whether the radio buttons are to be displayed inline horizontally. |
| `label` | `ReactNode` Optional label text to display above the radio buttons. |
| `name` | `string` Name of the group, used to link radio buttons together in HTML. If omitted, a unique name will be generated internally. |
| `onChange` | `(event: FormEvent<HTMLInputElement>) => void` Callback invoked when the currently selected radio changes. Use `event.currentTarget.value` to read the currently selected value. This prop is required because this component only supports controlled usage.  Required |
| `options` | `readonly OptionProps<string | number>[]` Array of options to render in the group. This prop is mutually exclusive with `children`: either provide an array of `OptionProps` objects or provide `<Radio>` children elements. |
| `selectedValue` | `string | number` Value of the selected radio. The child with this value will be `:checked`. |

interface OptionProps extends [Props](#api/Props)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/common/props.ts#L118)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `disabled` | `boolean` Whether this option is non-interactive. |
| `label` | `string` Label text for this option. If omitted, `value` is used as the label. |
| `value` | `T` Value of this option.  Required |

## CSS

##### Deprecated API: use [`<Checkbox>`](#core/components/checkbox)

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

Blueprint's custom radio buttons use an extra `.bp5-control-indicator` element after the `<input>` to achieve their
custom styling. You should then wrap the whole thing in a `<label>` with the classes `.bp5-control.bp5-radio`.

Note that attribute modifiers (`:checked`, `:disabled`) are applied on the internal `<input>` element.

Radio

`:checked`

Selected

`:disabled`

Disabled. Also add `.bp5-disabled` to `.bp5-control` to change text color (not shown below).

`.bp5-align-right`

Right-aligned indicator

`.bp5-large`

Large

```
<label class="bp5-control bp5-radio {{.modifier}}">  
  <input type="radio" name="docs-radio-regular" {{:modifier}} />  
  <span class="bp5-control-indicator"></span>  
  Radio  
</label>  

```