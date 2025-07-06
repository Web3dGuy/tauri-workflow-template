# Slider

A slider is a numeric input for choosing numbers between lower and upper bounds.
It also has a labeled axis that supports custom formatting.

To adjust a slider value, the user clicks and drags a handle or clicks the axis
to move the nearest handle to that spot. Users can also use arrow keys on the
keyboard to adjust individual handles.

Use `Slider` for choosing a single value, `RangeSlider` for choosing two values,
and `MultiSlider` for more advanced use cases.

## Slider

Use `Slider` to choose a single value on a number line. It is a controlled
component, so the `value` prop determines its current appearance. Provide an
`onChange` handler to receive updates and an `onRelease` handler to determine
when the user has stopped interacting with the slider.

0.0

10.0

2.5

0%

14%

28%

42%

56%

70%

0%

£-12,000

£-2,000

£8,000

£18,000

£28,000

£38,000

£48,000

£30,000

##### Props

Vertical

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/sliderExample.tsx)

interface SliderProps extends [SliderBaseProps](#api/SliderBaseProps)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/slider/slider.tsx#L25)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `children` | `ReactNode`   Inherited from `SliderBaseProps.children` |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `SliderBaseProps.className` |
| `disabled` | `booleanfalse` Whether the slider is non-interactive.  Inherited from `SliderBaseProps.disabled` |
| `handleHtmlProps` | `HandleHtmlProps` A limited subset of HTML props to apply to the slider Handle |
| `initialValue` | `number0` Initial value of the slider. This determines the other end of the track fill: from `initialValue` to `value`. |
| `intent` | `Intent` Visual intent color to apply to element.  Inherited from `SliderBaseProps.intent` |
| `labelPrecision` | `numberinferred from stepSize` Number of decimal places to use when rendering label value. Default value is the number of decimals used in the `stepSize` prop. This prop has *no effect* if you supply a custom `labelRenderer` callback.  Inherited from `SliderBaseProps.labelPrecision` |
| `labelRenderer` | `boolean | (value: number, opts?: ) => string | Elementtrue` Callback to render a single label. Useful for formatting numbers as currency or percentages. If `true`, labels will use number value formatted to `labelPrecision` decimal places. If `false`, labels will not be shown.  The callback is provided a numeric value and optional rendering options, which include:   * isHandleTooltip: whether this label is being rendered within a handle tooltip  Inherited from `SliderBaseProps.labelRenderer` |
| `labelStepSize` | `numberinferred (if labelStepSize is undefined)` Increment between successive labels. Must be greater than zero.  Inherited from `SliderBaseProps.labelStepSize` |
| `labelValues` | `readonly number[]` Array of specific values for the label placement. This prop is mutually exclusive with `labelStepSize`.  Inherited from `SliderBaseProps.labelValues` |
| `max` | `number10` Maximum value of the slider. Value must be a finite number.  Inherited from `SliderBaseProps.max` |
| `min` | `number0` Minimum value of the slider. Value must be a finite number.  Inherited from `SliderBaseProps.min` |
| `onChange` | `(value: number) => void` Callback invoked when the value changes. |
| `onRelease` | `(value: number) => void` Callback invoked when the handle is released. |
| `showTrackFill` | `booleantrue` Whether a solid bar should be rendered on the track between current and initial values, or between handles for `RangeSlider`.  Inherited from `SliderBaseProps.showTrackFill` |
| `stepSize` | `number1` Increment between successive values; amount by which the handle moves. Must be greater than zero.  Inherited from `SliderBaseProps.stepSize` |
| `value` | `number0` Value of slider. |
| `vertical` | `booleanfalse` Whether to show the slider in a vertical orientation.  Inherited from `SliderBaseProps.vertical` |

## Range slider

Use `RangeSlider` to choose a range between upper and lower bounds. The
component functions identically to `Slider` with the addition of a second
handle. It exposes its selected value as `[number, number]`: a two-element array
with minimum and maximum range bounds.

`RangeSlider` is a controlled component, so the `value` prop determines its
current appearance. Provide an `onChange` handler to receive updates and an
`onRelease` handler to determine when the user has stopped interacting with the
slider.

0

20

40

60

80

100

3672

##### Props

Vertical

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/rangeSliderExample.tsx)

interface RangeSliderProps extends [SliderBaseProps](#api/SliderBaseProps)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/slider/rangeSlider.tsx#L32)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `children` | `ReactNode`   Inherited from `SliderBaseProps.children` |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `SliderBaseProps.className` |
| `disabled` | `booleanfalse` Whether the slider is non-interactive.  Inherited from `SliderBaseProps.disabled` |
| `handleHtmlProps` | HTML props to apply to the slider Handles |
| `intent` | `Intent` Visual intent color to apply to element.  Inherited from `SliderBaseProps.intent` |
| `labelPrecision` | `numberinferred from stepSize` Number of decimal places to use when rendering label value. Default value is the number of decimals used in the `stepSize` prop. This prop has *no effect* if you supply a custom `labelRenderer` callback.  Inherited from `SliderBaseProps.labelPrecision` |
| `labelRenderer` | `boolean | (value: number, opts?: ) => string | Elementtrue` Callback to render a single label. Useful for formatting numbers as currency or percentages. If `true`, labels will use number value formatted to `labelPrecision` decimal places. If `false`, labels will not be shown.  The callback is provided a numeric value and optional rendering options, which include:   * isHandleTooltip: whether this label is being rendered within a handle tooltip  Inherited from `SliderBaseProps.labelRenderer` |
| `labelStepSize` | `numberinferred (if labelStepSize is undefined)` Increment between successive labels. Must be greater than zero.  Inherited from `SliderBaseProps.labelStepSize` |
| `labelValues` | `readonly number[]` Array of specific values for the label placement. This prop is mutually exclusive with `labelStepSize`.  Inherited from `SliderBaseProps.labelValues` |
| `max` | `number10` Maximum value of the slider. Value must be a finite number.  Inherited from `SliderBaseProps.max` |
| `min` | `number0` Minimum value of the slider. Value must be a finite number.  Inherited from `SliderBaseProps.min` |
| `onChange` | `(value: NumberRange) => void` Callback invoked when the range value changes. |
| `onRelease` | `(value: NumberRange) => void` Callback invoked when a handle is released. |
| `showTrackFill` | `booleantrue` Whether a solid bar should be rendered on the track between current and initial values, or between handles for `RangeSlider`.  Inherited from `SliderBaseProps.showTrackFill` |
| `stepSize` | `number1` Increment between successive values; amount by which the handle moves. Must be greater than zero.  Inherited from `SliderBaseProps.stepSize` |
| `value` | `NumberRange[0, 10]` Range value of slider. Handles will be rendered at each position in the range. |
| `vertical` | `booleanfalse` Whether to show the slider in a vertical orientation.  Inherited from `SliderBaseProps.vertical` |

## Multi slider

`MultiSlider` is a flexible solution for picking arbitrary values on a number
line. It powers both `Slider` and `RangeSlider` internally and can be used for
implementing more advanced use cases than one or two numbers.

0

20

40

60

80

100

12367290

##### Props

VerticalShow track fill

##### Handle interaction

LockPush

##### Example

Outer handlesInner handlesBoth pairs

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/multiSliderExample.tsx)

interface MultiSliderProps extends [SliderBaseProps](#api/SliderBaseProps)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/slider/multiSlider.tsx#L123)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `children` | `ReactNode`   Inherited from `SliderBaseProps.children` |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `SliderBaseProps.className` |
| `defaultTrackIntent` | `Intent` Default intent of a track segment, used only if no handle specifies `intentBefore/After`. |
| `disabled` | `booleanfalse` Whether the slider is non-interactive.  Inherited from `SliderBaseProps.disabled` |
| `intent` | `Intent` Visual intent color to apply to element.  Inherited from `SliderBaseProps.intent` |
| `labelPrecision` | `numberinferred from stepSize` Number of decimal places to use when rendering label value. Default value is the number of decimals used in the `stepSize` prop. This prop has *no effect* if you supply a custom `labelRenderer` callback.  Inherited from `SliderBaseProps.labelPrecision` |
| `labelRenderer` | `boolean | (value: number, opts?: ) => string | Elementtrue` Callback to render a single label. Useful for formatting numbers as currency or percentages. If `true`, labels will use number value formatted to `labelPrecision` decimal places. If `false`, labels will not be shown.  The callback is provided a numeric value and optional rendering options, which include:   * isHandleTooltip: whether this label is being rendered within a handle tooltip  Inherited from `SliderBaseProps.labelRenderer` |
| `labelStepSize` | `numberinferred (if labelStepSize is undefined)` Increment between successive labels. Must be greater than zero.  Inherited from `SliderBaseProps.labelStepSize` |
| `labelValues` | `readonly number[]` Array of specific values for the label placement. This prop is mutually exclusive with `labelStepSize`.  Inherited from `SliderBaseProps.labelValues` |
| `max` | `number10` Maximum value of the slider. Value must be a finite number.  Inherited from `SliderBaseProps.max` |
| `min` | `number0` Minimum value of the slider. Value must be a finite number.  Inherited from `SliderBaseProps.min` |
| `onChange` | `(values: number[]) => void` Callback invoked when a handle value changes. Receives handle values in sorted order. |
| `onRelease` | `(values: number[]) => void` Callback invoked when a handle is released. Receives handle values in sorted order. |
| `showTrackFill` | `booleantrue` Whether a solid bar should be rendered on the track between current and initial values, or between handles for `RangeSlider`.  Inherited from `SliderBaseProps.showTrackFill` |
| `stepSize` | `number1` Increment between successive values; amount by which the handle moves. Must be greater than zero.  Inherited from `SliderBaseProps.stepSize` |
| `vertical` | `booleanfalse` Whether to show the slider in a vertical orientation.  Inherited from `SliderBaseProps.vertical` |

### Handle

Handles for a `MultiSlider` are configured as `MultiSlider.Handle` children
elements, each with their own `value` and other properties.

```
// RangeSlider looks roughly like this:  
<MultiSlider onChange={...}>  
    <MultiSlider.Handle  
        value={startValue}  
        type="start"  
        intentAfter={Intent.PRIMARY}  
        htmlProps={handleHtmlProps.start}  
    />  
    <MultiSlider.Handle  
        value={endValue}  
        type="end"  
        htmlProps={handleHtmlProps.end}  
    />  
</MultiSlider>  

```

interface HandleProps extends [Props](#api/Props)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/slider/handleProps.tsx#L50)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `htmlProps` | `HandleHtmlProps` A limited subset of HTML props to apply to the rendered `<span>` element. |
| `intentAfter` | `Intent` Intent for the track segment immediately after this handle, taking priority over `intentBefore`. |
| `intentBefore` | `Intent` Intent for the track segment immediately before this handle. |
| `interactionKind` | `HandleInteractionKind"lock"` How this handle interacts with other handles. |
| `onChange` | `(newValue: number) => void` Callback invoked when this handle's value is changed due to a drag interaction. Note that "push" interactions can cause multiple handles to update at the same time. |
| `onRelease` | `(newValue: number) => void` Callback invoked when this handle is released (the end of a drag interaction). |
| `trackStyleAfter` | `CSSProperties` Style to use for the track segment immediately after this handle, taking priority over `trackStyleBefore`. |
| `trackStyleBefore` | `CSSProperties` Style to use for the track segment immediately before this handle |
| `type` | `HandleType"full"` Handle appearance type. |
| `value` | `number` Numeric value of this handle.  Required |