# Numeric input

**NumericInput** provides controls for inputting, incrementing, and decrementing numeric values.

## Interactions

The value in a numeric input can be incremented or decremented using both keyboard and mouse interactions.

##### Keyboard interactions

* `↑/↓` - change the value by one step (default: `±1`)
* `Shift + ↑/↓` - change the value by one major step (default: `±10`)
* `Alt + ↑/↓` - change the value by one minor step (default: `±0.1`)

##### Mouse interactions

* `Click ⌃/⌄` - change the value by one step (default: `±1`)
* `Shift + Click ⌃/⌄` - change the value by one major step (default: `±10`)
* `Alt + Click ⌃/⌄` - change the value by one minor step (default: `±0.1`)

## Basic example

This example shows how **NumericInput** works out of the box. It supports the basic keyboard and mouse interactions
listed above, as well as basic keyboard entry.

##### Props

DisabledFillLeft iconLeft elementNumeric characters onlySelect all on focusSelect all on increment

Minimum value 

None-10020Open dropdown

Maximum value 

None2050100Open dropdown

Button position 

NoneLeftRightOpen dropdown

Intent 

NonePrimarySuccessWarningDangerOpen dropdown

Locale 

DefaultArabic (Saudi Arabia)Bangla (Bangladesh)English (United States)French (France)Italian (Italy)Spanish (Spain)Japanese (Japan)Open dropdown

Size 

SmallMediumLarge

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/numericInputBasicExample.tsx)

## Extended example

This example shows how **NumericInput** can be extended beyond its core functionality. It supports the basic
interactions above as well as each of the following types of input:

* **Number abbreviations** (e.g. `2.1k`, `-0.3m`)
* **Scientific notation** (e.g. `2.1e3`, `-0.3e6`)
* **Addition and subtraction expressions** (e.g. `3+2`, `0.1m - 5k + 1`)

These special-case inputs are evaluated when `Enter` is pressed (via a custom `onKeyDown` callback) and when the field
loses focus (via a custom `onBlur` callback). If the input is invalid when either of these callbacks is trigged, the
field will be cleared.

This example contains non-core functionality that is meant to demonstrate the extensibility of the **NumericInput**
component. The correctness of the custom evaluation code has not been tested robustly.

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/numericInputExtendedExample.tsx)

## Usage

### Uncontrolled mode

By default, this component will function in uncontrolled mode, managing all of its own state. In uncontrolled mode,
you mus provide an `onValueChange` callback prop to access the value as the user manipulates it. The value will be
provided to the callback both as a number and as a string.

In general, uncontrolled mode is the recommended API for this component, as it allows users to type non-numeric digits
like `.` and `-` (for decimals and negative numbers, respectively) more easily.

```
import { NumericInput } from "@blueprintjs/core";  
  
export class NumericInputExample extends React.Component {  
    public render() {  
        return <NumericInput onValueChange={this.handleValueChange} />;  
    }  
  
    private handleValueChange = (valueAsNumber: number, valueAsString: string) => {  
        console.log("Value as number:", valueAsNumber);  
        console.log("Value as string:", valueAsString);  
    };  
}  

```

### Controlled mode

If you need to have more control over your numeric input's behavior, you can specify the `value` property to use the
component in **controlled mode**.

Note that NumericInput supports arbitrary text entry (not only numeric digits) so the `value`
**should always be provided as a string, not a number**. Accordingly, change event handlers should use the same data
type, namely the *second* parameter of the `onValueChange` callback. This behavior allows users to type non-numeric
characters like decimal points (".") without the component eagerly coercing those strings to their parsed numeric
equivalents (`0.` becomes `0`, fractional data entry impossible).

Exceptions to this rule may occur if your input only supports *positive integers*, which will not
have any non-numeric characters. See the [precision section](#core/components/numeric-input.numeric-precision)
to learn how to enforce this kind of constraint.

When handling changes in controlled mode, always use the *second* parameter of the `onValueChange` callback, which
provides the value as a string. This allows users to type non-numeric characters like decimal points (".") without the
component eagerly coercing those strings to their parsed numeric equivalents (`0.` becomes `0`, fractional data entry
impossible).

The combined support of arbitrary text entry, controlled mode, and custom callbacks makes it possible to extend the
numeric input's basic functionality in powerful ways. As shown in the example above, one could extend the numeric input
component with support for mathematical expressions as follows:

```
import { NumericInput } from "@blueprintjs/core";  
import * as SomeLibrary from "some-library";  
  
interface NumericInputExampleState = {  
    value?: number | string;  
}  
  
class NumericInputExample extends React.Component<{}, NumericInputExampleState> {  
    public state = { value: NumericInput.VALUE_EMPTY };  
  
    public render() {  
        return (  
            <NumericInput  
                onValueChange={this.handleValueChange}  
                value={this.state.value}  
            />  
        );  
    }  
  
    private handleValueChange = (_valueAsNumber: number, valueAsString: string) {  
        // Important: use the string value to allow typing decimal places and negative numbers  
        const result = SomeLibrary.evaluateMathExpression(valueAsString);  
        this.setState({ value: result });  
    }  
}  

```

### Numeric precision

**NumericInput** determines its maximum precision by looking at both the `minorStepSize` and `stepSize` props.
If `minorStepSize` is non-null, the number of decimal places in that value will be the maximum precision.
Otherwise, the component will count the decimal places in `stepSize`.

Configuring these props allows you to expand or constrain the precision of the input. For example, to limit
the input to only integers, you can set `minorStepSize={null}` and allow the default `stepSize` of `1` to take
precedence.

## Styling

**NumericInput** can be styled with the same set of visual modifier props & CSS classes as
[**ControlGroup**](#core/components/control-group). The most appropriate such modifier for **NumericInput** is `fill`,
which will make the component expand to fill all available width.

## Props interface

interface NumericInputProps extends InputSharedProps

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/forms/numericInput.tsx#L53)

| Props | Description |
| --- | --- |
| `allowNumericCharactersOnly` | `booleantrue` Whether to allow only floating-point number characters in the field, mimicking the native `input[type="number"]`. |
| `asyncControl` | `boolean` Set this to `true` if you will be controlling the `value` of this input with asynchronous updates. These may occur if you do not immediately call setState in a parent component with the value from the `onChange` handler. |
| `buttonPosition` | `"none" | "left" | "right"Position.RIGHT` The position of the buttons with respect to the input field. |
| `clampValueOnBlur` | `booleanfalse` Whether the value should be clamped to `[min, max]` on blur. The value will be clamped to each bound only if the bound is defined. Note that native `input[type="number"]` controls do *NOT* clamp on blur. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `InputSharedProps.className` |
| `defaultValue` | `string | number""` In uncontrolled mode, this sets the default value of the input. Note that this value is only used upon component instantiation and changes to this prop during the component lifecycle will be ignored. |
| `disabled` | `booleanfalse` Whether the input is disabled.  Note that `rightElement` must be disabled separately; this prop will not affect it.  Inherited from `InputSharedProps.disabled` |
| `fill` | `boolean` Whether the component should take up the full width of its container.  Inherited from `InputSharedProps.fill` |
| `inputClassName` | `string` Class name to apply to the `<input>` element (not the InputGroup container).  Inherited from `InputSharedProps.inputClassName` |
| `inputRef` | `Ref<HTMLInputElement>` Ref attached to the HTML `<input>` element backing this component.  Inherited from `InputSharedProps.inputRef` |
| `inputSize` | `number` Alias for the native HTML input `size` attribute. see: <https://developer.mozilla.org/en-US/docs/Web/API/HTMLInputElement/size> |
| `intent` | `Intent` Visual intent color to apply to element.  Inherited from `InputSharedProps.intent` |
| `large` | `booleanfalse` If set to `true`, the input will display with larger styling. This is equivalent to setting `Classes.LARGE` via className on the parent control group and on the child input group.  Deprecated |
| `leftElement` | `Element` Element to render on the left side of input. This prop is mutually exclusive with `leftIcon`.  Inherited from `InputSharedProps.leftElement` |
| `leftIcon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon to render on the left side of the input group, before the user's cursor.  This prop is mutually exclusive with `leftElement`.  Note: setting a React.JSX.Element here is deprecated; use the `leftElement` prop instead.  Inherited from `InputSharedProps.leftIcon` |
| `locale` | `string""` The locale name, which is passed to the component to format the number and allowing to type the number in the specific locale. [See MDN documentation for more info about browser locale identification](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#Locale_identification_and_negotiation). |
| `majorStepSize` | `null | number10` The increment between successive values when `shift` is held. Pass explicit `null` value to disable this interaction. |
| `max` | `number` The maximum value of the input. |
| `min` | `number` The minimum value of the input. |
| `minorStepSize` | `null | number0.1` The increment between successive values when `alt` is held. Pass explicit `null` value to disable this interaction. |
| `onButtonClick` | `(valueAsNumber: number, valueAsString: string) => void` The callback invoked when the value changes due to a button click. |
| `onValueChange` | `(valueAsNumber: number, valueAsString: string, inputElement: null | HTMLInputElement) => void` The callback invoked when the value changes due to typing, arrow keys, or button clicks. |
| `placeholder` | `string` Placeholder text in the absence of any value.  Inherited from `InputSharedProps.placeholder` |
| `readOnly` | `booleanfalse` Whether the input is read-only.  Note that `rightElement` must be disabled or made read-only separately; this prop will not affect it.  Inherited from `InputSharedProps.readOnly` |
| `rightElement` | `Element` Element to render on right side of input. For best results, use a minimal button, tag, or small spinner.  Inherited from `InputSharedProps.rightElement` |
| `selectAllOnFocus` | `booleanfalse` Whether the entire text field should be selected on focus. |
| `selectAllOnIncrement` | `booleanfalse` Whether the entire text field should be selected on increment. |
| `size` | `number | Size"medium"` Size of the input. If given a numeric value, and `inputSize` is not defined, then this will be provided as the `size` attribute for the underyling native HTML input element. Passing a numeric value this way is deprecated, use the `inputSize` prop instead. |
| `small` | `booleanfalse` If set to `true`, the input will display with smaller styling. This is equivalent to setting `Classes.SMALL` via className on the parent control group and on the child input group.  Deprecated |
| `stepSize` | `number1` The increment between successive values when no modifier keys are held. |
| `value` | `string | number` The value to display in the input field. |