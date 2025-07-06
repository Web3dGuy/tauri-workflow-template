# Time picker

**TimePicker** renders a UI to select a time.

This component has no direct localization support. You should handle localization in your application if needed.

:

##### Props

Select all on focusShow arrow buttonsDisabledUse AM/PMAuto focusPrecision

MinuteSecondMillisecondOpen dropdown

Minimum time

None6pm (18:00)Open dropdown

Maximum time

None6pm (18:00)9pm (21:00)2am (02:00)Open dropdown

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/datetime-examples/timePickerExample.tsx)

## Props interface

Use the `onChange` prop to listen for changes to the set time. You can control the selected time by setting the
`value` prop, or use the component in uncontrolled mode and specify an initial time by setting `defaultValue`.

**TimePicker** uses `Date` objects across its API but ignores their year, month, and day fields.

interface TimePickerProps extends [Props](#api/Props)

[@blueprintjs/datetime](https://github.com/palantir/blueprint/blob/d356c8eea/packages/datetime/src/common/timePickerProps.ts#L22)

| Props | Description |
| --- | --- |
| `autoFocus` | `booleanfalse` Whether to focus the first input when it opens initially. |
| `defaultValue` | `Date` Initial time the `TimePicker` will display. This should not be set if `value` is set. |
| `disabled` | `booleanfalse` Whether the time picker is non-interactive. |
| `maxTime` | `Date` The latest time the user can select. The year, month, and day parts of the `Date` object are ignored. While the `maxTime` will be later than the `minTime` in the basic case, it is also allowed to be earlier than the `minTime`. This is useful, for example, to express a time range that extends before and after midnight. If the `maxTime` and `minTime` are equal, then the valid time range is constrained to only that one value. |
| `minTime` | `Date` The earliest time the user can select. The year, month, and day parts of the `Date` object are ignored. While the `minTime` will be earlier than the `maxTime` in the basic case, it is also allowed to be later than the `maxTime`. This is useful, for example, to express a time range that extends before and after midnight. If the `maxTime` and `minTime` are equal, then the valid time range is constrained to only that one value. |
| `onBlur` | `(event: FocusEvent<HTMLInputElement, Element<>>, unit: TimeUnit) => void` Callback invoked on blur event emitted by specific time unit input |
| `onChange` | `(newTime: Date) => void` Callback invoked when the user changes the time. |
| `onFocus` | `(event: FocusEvent<HTMLInputElement, Element<>>, unit: TimeUnit) => void` Callback invoked on focus event emitted by specific time unit input |
| `onKeyDown` | `(event: KeyboardEvent<HTMLInputElement>, unit: TimeUnit) => void` Callback invoked on keydown event emitted by specific time unit input |
| `onKeyUp` | `(event: KeyboardEvent<HTMLInputElement>, unit: TimeUnit) => void` Callback invoked on keyup event emitted by specific time unit input |
| `precision` | `TimePrecisionTimePrecision.MINUTE` The precision of time the user can set. |
| `selectAllOnFocus` | `booleanfalse` Whether all the text in each input should be selected on focus. |
| `showArrowButtons` | `booleanfalse` Whether to show arrows buttons for changing the time. |
| `useAmPm` | `booleanfalse` Whether to use a 12 hour format with an AM/PM dropdown. |
| `value` | `Date` The currently set time. If this prop is provided, the component acts in a controlled manner. |