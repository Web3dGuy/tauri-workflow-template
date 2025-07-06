# Date range input

##### Deprecated: use [**DateRangeInput3**](#datetime2/date-range-input3)

This component is **deprecated since @blueprintjs/datetime v5.2.0** in favor of the new
**DateRangeInput3** component available in the `@blueprintjs/datetime2` package which uses
react-day-picker v8.x instead of v7.x. You should migrate to the new API which will become the
standard in Blueprint v6.

The **DateRangeInput** component is [**ControlGroup**](#core/components/control-group) composed
of two [**InputGroups**](#core/components/input-group). It shows a
[**DateRangePicker**](#datetime/daterangepicker) in a [**Popover**](#core/components/popover)
on focus.

Unlike [**DateInput**](#datetime/date-input), this component does *not* yet have support for
a built-in [**TimezoneSelect**](#datetime/timezone-select).

no dateno date

##### Behavior props

Close on selection

Select all text on input focus

##### Date range picker props

Show shortcuts

Allow single day range

Single month only

Constrain calendar to contiguous months

Reverse month and year menusShow custom footer element

##### Input appearance props

Disabled

Fill container width

[date-fns](https://date-fns.org/) formatMM/dd/yyyyyyyy-MM-ddyyyy-MM-dd HH:mm:ssLLL do, yyyy 'at' K:mm a

##### Time picker props

Enable time pickerTime precision

MinuteSecondMillisecondOpen dropdown

Show timepicker arrow buttons

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/datetime-examples/dateRangeInputExample.tsx)

## Usage

**DateRangeInput** supports both controlled and uncontrolled usage. You can control
the selected date by setting the `value` prop, or use the component in
uncontrolled mode and specify an initial date by setting `defaultValue`.
Use the `onChange` prop callback to listen for changes to the selected day and
the `onError` prop to react to invalid dates entered in the text inputs.

## Date formatting

Customize the date format with the required `formatDate` and `parseDate` props.
See [DateInput's date formatting docs](#datetime/date-input.date-formatting) for more details.

## Props interface

interface DateRangeInputProps extends [DatePickerBaseProps](#api/DatePickerBaseProps), [DateFormatProps](#api/DateFormatProps)<>, DatetimePopoverProps<>, [Props](#api/Props)<>

[@blueprintjs/datetime](https://github.com/palantir/blueprint/blob/d356c8eea/packages/datetime/src/components/date-range-input/dateRangeInput.tsx#L69)

| Props | Description |
| --- | --- |
| `allowSingleDayRange` | `booleanfalse` Whether the start and end dates of the range can be the same day. If `true`, clicking a selected date will create a one-day range. If `false`, clicking a selected date will clear the selection. |
| `closeOnSelection` | `booleantrue` Whether the calendar popover should close when a date range is fully selected. |
| `contiguousCalendarMonths` | `booleantrue` Whether displayed months in the calendar are contiguous. If false, each side of the calendar can move independently to non-contiguous months. |
| `dayPickerProps` | `DayPickerProps` Props to pass to ReactDayPicker. See API documentation [here](https://react-day-picker-v7.netlify.app/api/DayPicker).  The following props are managed by the component and cannot be configured: `canChangeMonth`, `captionElement`, `fromMonth` (use `minDate`), `month` (use `initialMonth`), `toMonth` (use `maxDate`).  In case of supplying your owner `renderDay` function, make sure to apply the appropriate CSS wrapper class to obtain default Blueprint styling. eg.  `<div className={Classes.DATEPICKER_DAY_WRAPPER}>{CONTENT_HERE}</div>`  Inherited from `DatePickerBaseProps.dayPickerProps` |
| `defaultValue` | `DateRange` The default date range to be used in the component when uncontrolled. This will be ignored if `value` is set. |
| `disabled` | `booleanfalse` Whether the text inputs are non-interactive. |
| `endInputProps` | `InputGroupProps` Props to pass to the end-date [input group](#core/components/input-group). `disabled` and `value` will be ignored in favor of the top-level props on this component. `ref` is not supported; use `inputRef` instead. |
| `fill` | `boolean` Whether the component should take up the full width of its container. |
| `footerElement` | `Element` An additional element to show below the date picker.  Inherited from `DatePickerBaseProps.footerElement` |
| `formatDate` | `(date: Date, localeCode?: string) => string` Function to render a JavaScript `Date` to a string. Optional `localeCode` argument comes directly from the prop on this component: if the prop is defined, then the argument will be too.  RequiredInherited from `DateFormatProps.formatDate` |
| `highlightCurrentDay` | `booleanfalse` Whether the current day should be highlighted in the calendar.  Inherited from `DatePickerBaseProps.highlightCurrentDay` |
| `initialMonth` | `Date` The initial month the calendar displays.  Inherited from `DatePickerBaseProps.initialMonth` |
| `invalidDateMessage` | `string"Invalid date"` The error message to display when the date selected is invalid.  Inherited from `DateFormatProps.invalidDateMessage` |
| `locale` | `string` The locale name, which is passed to the functions in `localeUtils` (and `formatDate` and `parseDate` if supported).  Inherited from `DateFormatProps.locale` |
| `localeUtils` | Collection of functions that provide internationalization support.  Inherited from `DatePickerBaseProps.localeUtils` |
| `maxDate` | `Date6 months from now.` The latest date the user can select.  Inherited from `DatePickerBaseProps.maxDate` |
| `minDate` | `DateJan. 1st, 20 years in the past.` The earliest date the user can select.  Inherited from `DatePickerBaseProps.minDate` |
| `modifiers` | `DatePickerModifiers` Collection of functions that determine which modifier classes get applied to which days. Each function should accept a `Date` and return a boolean. See the [**react-day-picker** documentation](https://react-day-picker-v7.netlify.app/api/ModifiersUtils) to learn more.  Inherited from `DatePickerBaseProps.modifiers` |
| `onChange` | `(selectedRange: DateRange) => void` Called when the user selects a day. If no days are selected, it will pass `[null, null]`. If a start date is selected but not an end date, it will pass `[selectedDate, null]`. If both a start and end date are selected, it will pass `[startDate, endDate]`. |
| `onError` | `(errorRange: DateRange) => void` Called when the user finishes typing in a new date and the date causes an error state. If the date is invalid, `new Date(undefined)` will be returned for the corresponding boundary of the date range. If the date is out of range, the out-of-range date will be returned for the corresponding boundary of the date range (`onChange` is not called in this case). |
| `outOfRangeMessage` | `string"Out of range"` The error message to display when the date selected is out of range.  Inherited from `DateFormatProps.outOfRangeMessage` |
| `overlappingDatesMessage` | `string"Overlapping dates"` The error message to display when the selected dates overlap. This can only happen when typing dates in the input field. |
| `parseDate` | `(str: string, localeCode?: string) => false | Date` Function to deserialize user input text to a JavaScript `Date` object. Return `false` if the string is an invalid date. Return `null` to represent the absence of a date. Optional `localeCode` argument comes directly from the prop on this component.  RequiredInherited from `DateFormatProps.parseDate` |
| `placeholder` | `string` Placeholder text to display in empty input fields. Recommended practice is to indicate the expected date format.  Inherited from `DateFormatProps.placeholder` |
| `popoverProps` | `Partial<Omit<PopoverProps<DefaultPopoverTargetHTMLProps>, "fill" | "content" | "disabled" | "autoFocus" | "enforceFocus" | "defaultIsOpen" | "renderTarget">>` Props to spread to `Popover`.  Inherited from `DatetimePopoverProps.popoverProps` |
| `popoverRef` | `RefObject<Popover<DefaultPopoverTargetHTMLProps>>` Optional ref for the popover component instance. This is sometimes useful to reposition the popover.  Note that this is defined as a specific kind of Popover which should be compatible with most use cases, since it uses the default target props interface.  Inherited from `DatetimePopoverProps.popoverRef` |
| `reverseMonthAndYearMenus` | `booleanfalse` If `true`, the month menu will appear to the left of the year menu. Otherwise, the month menu will apear to the right of the year menu.  Inherited from `DatePickerBaseProps.reverseMonthAndYearMenus` |
| `selectAllOnFocus` | `booleanfalse` Whether the entire text field should be selected on focus. |
| `shortcuts` | `boolean | DateRangeShortcut[]true` Whether shortcuts to quickly select a range of dates are displayed or not. If `true`, preset shortcuts will be displayed. If `false`, no shortcuts will be displayed. If an array is provided, the custom shortcuts will be displayed. |
| `singleMonthOnly` | `booleanfalse` Whether to show only a single month calendar. |
| `startInputProps` | `InputGroupProps` Props to pass to the start-date [input group](#core/components/input-group). `disabled` and `value` will be ignored in favor of the top-level props on this component. `ref` is not supported; use `inputRef` instead. |
| `timePickerProps` | `TimePickerProps` Further configure the `TimePicker` that appears beneath the calendar. `onChange` and `value` are ignored in favor of the corresponding top-level props on this component.  Passing any non-empty object to this prop will cause the `TimePicker` to appear.  Inherited from `DatePickerBaseProps.timePickerProps` |
| `timePrecision` | `TimePrecision` The precision of time selection that accompanies the calendar. Passing a `TimePrecision` value (or providing `timePickerProps`) shows a `TimePicker` below the calendar. Time is preserved across date changes.  This is shorthand for `timePickerProps.precision` and is a quick way to enable time selection.  Inherited from `DatePickerBaseProps.timePrecision` |
| `value` | `DateRange` The currently selected date range. If the prop is strictly `undefined`, the component acts in an uncontrolled manner. If this prop is anything else, the component acts in a controlled manner. To display an empty value in the input fields in a controlled manner, pass `[null, null]`. To display an invalid date error in either input field, pass `new Date(undefined)` for the appropriate date in the value prop. |

## Localization

See the [DatePicker localization docs](#datetime/datepicker.localization).