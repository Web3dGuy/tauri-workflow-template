# Segmented control

A **SegmentedControl** is a linear collection of buttons which allows a user to choose an option from multiple choices,
similar to a [**Radio**](#core/components/radio) group.

Compared to the [**ButtonGroup**](#core/components/button-group) component, **SegmentedControl** has affordances
to signify a selection UI and a reduced visual weight which is appropriate for forms.

ListGridDisabledGallery

##### Props

InlineFill

Intent 

NonePrimary

Size 

SmallMediumLarge

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/segmentedControlExample.tsx)

## Usage

**SegmentedControl** can be used as either a controlled or uncontrolled component with the `value`, `defaultValue`,
and `onChange` props.

Options are specified as `OptionProps` objects, just like [RadioGroup](#core/components/radio.radiogroup) and
[HTMLSelect](#core/components/html-select).

```
<SegmentedControl  
    options={[  
        {  
            label: "List",  
            value: "list",  
        },  
        {  
            label: "Grid",  
            value: "grid",  
        },  
        {  
            label: "Gallery",  
            value: "gallery",  
        },  
    ]}  
    defaultValue="list"  
/>  

```

## Props interface

interface SegmentedControlProps extends [Props](#api/Props), [ControlledValueProps](#api/ControlledValueProps)<string>, RefAttributes<HTMLDivElement>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/segmented-control/segmentedControl.tsx#L37)

SegmentedControl component props.

| Props | Description |
| --- | --- |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `defaultValue` | `string` Initial value for uncontrolled usage. Mutually exclusive with `value` prop.  Inherited from `ControlledValueProps.defaultValue` |
| `fill` | `booleanfalse` Whether the control should take up the full width of its container. |
| `inline` | `boolean` Whether the control should appear as an inline element. |
| `intent` | `SegmentedControlIntent` Visual intent to apply to the selected value. |
| `large` | `booleanfalse` Whether this control should use large buttons.  Deprecated |
| `onValueChange` | `(value: string, targetElement: null | HTMLElement) => void` Callback invoked when the component value changes, typically via user interaction, in both controlled and uncontrolled mode.  Using this prop instead of `onChange` can help avoid common bugs in React 16 related to Event Pooling where developers forget to save the text value from a change event or call `event.persist()`.  See: [object Object]  Inherited from `ControlledValueProps.onValueChange` |
| `options` | `OptionProps<string>[]` List of available options.  Required |
| `role` | `"toolbar" | "group" | "radiogroup"'radiogroup'` Aria role for the overall component. Child buttons get appropriate roles.  See: [object Object] |
| `size` | `Size"medium"` The size of the control. |
| `small` | `booleanfalse` Whether this control should use small buttons.  Deprecated |
| `value` | `string` Controlled value. Mutually exclusive with `defaultValue` prop.  Inherited from `ControlledValueProps.value` |