# Control card

A control card is an interactive [**Card**](#core/components/card) with an embedded form control.
There are a few supported form controls, each has a corresponding component API:

The label may be specified as either `children` (`React.ReactNode`) or the `label` prop (`string`).

Users may click anywhere inside the card to toggle the control state.

By default, a "checked" control card will be displayed with the same appearance as a "selected" card.
This behavior may be toggled with the `showAsSelectedWhenChecked` prop.

## Switch card

Card with an embedded [**Switch**](#core/components/switch) control (end-aligned by default).

Most of the properties in [**CardProps**](#core/components/card.props-interface) and
[**SwitchProps**](#core/components/switch.props-interface) are available on the root component.

##### Communication Settings

Wifi

Bluetooth

VPN

##### Props

CompactDisabled

Show as selected   
when checked

Align control indicator 

StartEnd

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/switchCardExample.tsx)

## Checkbox card

Card with an embedded [**Checkbox**](#core/components/checkbox) control (start-aligned by default).

Most of the properties in [**CardProps**](#core/components/card.props-interface) and
[**CheckboxProps**](#core/components/checkbox.props-interface) are available on the root component.

##### Lunch Special

Soup  
Tomato Basil or Broccoli Cheddar

Salad  
Caesar, Caprese, or Fresh fruit

Sandwich  
Chicken, Turkey, or Vegetable

##### Props

CompactDisabled

Show as selected   
when checked

Align control indicator 

StartEnd

##### Content

Show sub text

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/checkboxCardExample.tsx)

## Radio card

Card with an embedded [**Radio**](#core/components/radio) control (start-aligned by default).

Most of the properties in [**CardProps**](#core/components/card.props-interface) and
[**RadioProps**](#core/components/radio.props-interface) are available on the root component.

Just like the **Radio** component, a **RadioCard** is usually contained in a
[**RadioCardGroup**](#core/components/radio.radiogroup) which manages its selection state.

```
import { RadioGroup, RadioCard } from "@blueprintjs/core";  
import React from "react";  
  
function RadioCardGroupExample() {  
    const [selectedValue, setSelectedValue] = React.useState<string | undefined>();  
    const handleChange = React.useCallback((event: React.FormEvent<HTMLInputElement>) => {  
        setSelectedValue(event.currentTarget.value);  
    }, []);  
  
    return (  
        <RadioGroup selectedValue={selectedValue} onChange={handleChange} label="Lunch Special">  
            <RadioCard label="Soup" value="soup" />  
            <RadioCard label="Salad" value="salad" />  
            <RadioCard label="Sandwich" value="sandwich" />  
        </RadioGroup>  
    );  
}  

```

##### Lunch Special

Soup  
Tomato Basil or Broccoli Cheddar

Salad  
Caesar, Caprese, or Fresh fruit

Sandwich  
Chicken, Turkey, or Vegetable

##### Props

CompactDisabled

Show as selected   
when checked

Align control indicator 

StartEnd

##### Content

Show sub text

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/radioCardGroupExample.tsx)

## Props interface

interface ControlCardProps extends SupportedCardProps, SupportedControlProps<>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/control-card/controlCard.tsx#L47)

Shared props interface for all control card components, including `CheckboxCard`, `RadioCard`, and `SwitchCard`.
The label content may be specified as either `label` or `children`, but not both.

| Props | Description |
| --- | --- |
| `alignIndicator` | `AlignmentAlignment.START` Alignment of the indicator within container.  Inherited from `SupportedControlProps.alignIndicator` |
| `checked` | `boolean` Whether the control is checked.  Inherited from `SupportedControlProps.checked` |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `SupportedCardProps.className` |
| `compact` | `booleanfalse` Whether this component should use compact styles with reduced visual padding.  Inherited from `SupportedCardProps.compact` |
| `controlKind` | `ControlKind` Which kind of form control to render inside the card.  Required |
| `disabled` | `boolean` Whether the control is non-interactive.  Inherited from `SupportedControlProps.disabled` |
| `elevation` | `Elevation0` Controls the intensity of the drop shadow beneath the card: the higher the elevation, the higher the drop shadow. At elevation `0`, no drop shadow is applied.  Inherited from `SupportedCardProps.elevation` |
| `inputProps` | `Omit<HTMLInputProps, "size">` HTML input attributes to forward to the control `<input>` element. |
| `inputRef` | `Ref<HTMLInputElement>` Ref attached to the HTML `<input>` element backing this component.  Inherited from `SupportedControlProps.inputRef` |
| `label` | `string` Text label for the control.  Use `children` or `labelElement` to supply JSX content. This prop actually supports JSX elements, but TypeScript will throw an error because `HTMLAttributes` only allows strings.  Inherited from `SupportedControlProps.label` |
| `onChange` | `ChangeEventHandler<HTMLInputElement>` Event handler invoked when input value is changed.  Inherited from `SupportedControlProps.onChange` |
| `onClick` | `(e: MouseEvent<HTMLDivElement, MouseEvent<>>) => void` Callback invoked when the card is clicked. Recommended when `interactive` is `true`.  Inherited from `SupportedCardProps.onClick` |
| `selected` | `booleanundefined` Whether this card should appear selected.  Inherited from `SupportedCardProps.selected` |
| `showAsSelectedWhenChecked` | `booleantrue` Whether the component should use "selected" Card styling when checked. |

## Combining with CardList

Control cards work just like regular cards inside a [**CardList**](#core/components/card-list).

###### System settings

Appearance

Dark theme

Show scrollbars

Developer mode

##### Section & CardList Props

Compact

##### SwitchCard Props

Disabled

Show as selected   
when checked

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/controlCardListExample.tsx)