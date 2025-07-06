# Date input

##### Deprecated: use [**DateInput3**](#datetime2/date-input3)

This component is **deprecated since @blueprintjs/datetime v5.2.0** in favor of the new
**DateInput3** component available in the `@blueprintjs/datetime2` package which uses
react-day-picker v8.x instead of v7.x. You should migrate to the new API which will become the
standard in Blueprint v6.

The **DateInput** component is an [**InputGroup**](#core/components/input-group)
that shows a [**DatePicker**](#datetime/datepicker) inside a [**Popover**](#core/components/popover)
on focus. It optionally shows a [**TimezoneSelect**](#datetime/timezone-select) on the right side of
the InputGroup, allowing the user to change the timezone of the selected date.

GMT-7

no date

##### Behavior props

Close on selection

##### Date picker props

Show shortcuts

Show actions bar

Reverse month and year menus

##### Input appearance props

Disabled

Fill container width

Show right element

[date-fns](https://date-fns.org/) formatMM/dd/yyyyyyyy-MM-ddyyyy-MM-dd HH:mm:ssLLL do, yyyy 'at' K:mm a

##### Time picker props

Time precision

NoneMinuteSecondMillisecondOpen dropdown

Show time picker arrows

Use AM/PM time

##### Timezone select props

Show timezone select

Disable timezone select

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/datetime-examples/dateInputExample.tsx)

## Usage

**DateInput** supports both controlled and uncontrolled usage. You can control
the selected date by setting the `value` prop, or use the component in
uncontrolled mode and specify an initial date by setting `defaultValue`.
Use the `onChange` prop callback to listen for changes to the selected day and
the `onError` prop to react to invalid dates entered in the text input.

This component uses ISO strings to represent timestamp values in the `value` & `defaultValue` props
and the `onChange` callback.

## Date formatting

**DateInput** requires two props for parsing and formatting dates. These are essentially the plumbing
between the text input and the DatePicker.

* `formatDate(date, locale?)` receives the current `Date` and returns a string representation of it.
  The result of this function becomes the input value when it is not being edited.
* `parseDate(str, locale?)` receives text inputted by the user and converts it to a `Date` object.
  The returned `Date` becomes the next value of the component.

The optional `locale` argument to these functions is the value of the `locale` prop set on the component.

Note that we still use JS `Date` here instead of ISO strings — this makes it easy to delegate to
third party libraries like **date-fns**.

A simple implementation using built-in browser methods could look like this:

```
import { DateInput } from "@blueprintjs/datetime";  
import { useCallback, useState } from "react";  
  
function Example() {  
    const [dateValue, setDateValue] = useState<string>(null);  
    const handleChange = useCallback(setDateValue, []);  
    const formatDate = useCallback((date: Date) => date.toLocaleString(), []);  
    const parseDate = useCallback((str: string) => new Date(str), []);  
  
    return (  
        <DateInput  
            formatDate={formatDate}  
            onChange={handleChange}  
            parseDate={parseDate}  
            placeholder="M/D/YYYY"  
            value={dateValue}  
        />  
    );  
}  

```

An implementation using **date-fns** could look like this:

```
import { DateInput } from "@blueprintjs/datetime";  
import { format, parse } from "date-fns";  
import { useCallback, useState } from "react";  
  
function Example() {  
    const [dateValue, setDateValue] = useState<string>(null);  
    const handleChange = useCallback(setDateValue, []);  
    const dateFnsFormat = "yyyy-MM-dd HH:mm:ss";  
    const formatDate = useCallback((date: Date) => format(date, dateFnsFormat), []);  
    const parseDate = useCallback((str: string) => parse(date, dateFnsFormat), []);  
  
    return (  
        <DateInput  
            formatDate={formatDate}  
            onChange={handleChange}  
            parseDate={parseDate}  
            placeholder={dateFnsFormat}  
            value={dateValue}  
        />  
    );  
}  

```

## Props interface

interface DateInputProps extends [DatePickerBaseProps](#api/DatePickerBaseProps), [DateFormatProps](#api/DateFormatProps)<>, DatetimePopoverProps<>, [Props](#api/Props)<>

[@blueprintjs/datetime](https://github.com/palantir/blueprint/blob/d356c8eea/packages/datetime/src/components/date-input/dateInput.tsx#L62)

| Props | Description |
| --- | --- |
| `canClearSelection` | `booleantrue` Allows the user to clear the selection by clicking the currently selected day. Passed to `DatePicker` component. |
| `clearButtonText` | `string"Clear"` Text for the reset button in the date picker action bar. Passed to `DatePicker` component. |
| `closeOnSelection` | `booleantrue` Whether the calendar popover should close when a date is selected. |
| `dayPickerProps` | `DayPickerProps` Props to pass to ReactDayPicker. See API documentation [here](https://react-day-picker-v7.netlify.app/api/DayPicker).  The following props are managed by the component and cannot be configured: `canChangeMonth`, `captionElement`, `fromMonth` (use `minDate`), `month` (use `initialMonth`), `toMonth` (use `maxDate`).  In case of supplying your owner `renderDay` function, make sure to apply the appropriate CSS wrapper class to obtain default Blueprint styling. eg.  `<div className={Classes.DATEPICKER_DAY_WRAPPER}>{CONTENT_HERE}</div>`  Inherited from `DatePickerBaseProps.dayPickerProps` |
| `defaultTimezone` | `string` The default timezone selected. Defaults to the user's local timezone.  Mutually exclusive with `timezone` prop.  See: [object Object] |
| `defaultValue` | `string` The default date to be used in the component when uncontrolled, represented as an ISO string. |
| `disabled` | `booleanfalse` Whether the date input is non-interactive. |
| `disableTimezoneSelect` | `booleanfalse` Whether to disable the timezone select. |
| `fill` | `boolean` Whether the component should take up the full width of its container. |
| `footerElement` | `Element` An additional element to show below the date picker.  Inherited from `DatePickerBaseProps.footerElement` |
| `formatDate` | `(date: Date, localeCode?: string) => string` Function to render a JavaScript `Date` to a string. Optional `localeCode` argument comes directly from the prop on this component: if the prop is defined, then the argument will be too.  RequiredInherited from `DateFormatProps.formatDate` |
| `highlightCurrentDay` | `booleanfalse` Whether the current day should be highlighted in the calendar.  Inherited from `DatePickerBaseProps.highlightCurrentDay` |
| `initialMonth` | `Date` The initial month the calendar displays.  Inherited from `DatePickerBaseProps.initialMonth` |
| `inputProps` | `Partial<Omit<InputGroupProps, "type" | "value" | "disabled">>` Props to pass to the [InputGroup component](#core/components/input-group).  Some properties are unavailable:   * `inputProps.value`: use `value` instead * `inputProps.disabled`: use `disabled` instead * `inputProps.type`: cannot be customized, always set to "text"   Note that `inputProps.tagName` will override `popoverProps.targetTagName`. |
| `invalidDateMessage` | `string"Invalid date"` The error message to display when the date selected is invalid.  Inherited from `DateFormatProps.invalidDateMessage` |
| `locale` | `string` The locale name, which is passed to the functions in `localeUtils` (and `formatDate` and `parseDate` if supported).  Inherited from `DateFormatProps.locale` |
| `localeUtils` | Collection of functions that provide internationalization support.  Inherited from `DatePickerBaseProps.localeUtils` |
| `maxDate` | `Date6 months from now.` The latest date the user can select.  Inherited from `DatePickerBaseProps.maxDate` |
| `minDate` | `DateJan. 1st, 20 years in the past.` The earliest date the user can select.  Inherited from `DatePickerBaseProps.minDate` |
| `modifiers` | `DatePickerModifiers` Collection of functions that determine which modifier classes get applied to which days. Each function should accept a `Date` and return a boolean. See the [**react-day-picker** documentation](https://react-day-picker-v7.netlify.app/api/ModifiersUtils) to learn more.  Inherited from `DatePickerBaseProps.modifiers` |
| `onChange` | `(newDate: string, isUserChange: boolean) => void` Callback invoked whenever the date or timezone has changed. |
| `onError` | `(errorDate: Date) => void` Called when the user finishes typing in a new date and the date causes an error state. If the date is invalid, `new Date(undefined)` will be returned. If the date is out of range, the out of range date will be returned (`onChange` is not called in this case). |
| `onTimezoneChange` | `(timezone: string) => void` Callback invoked when the user selects a timezone. |
| `outOfRangeMessage` | `string"Out of range"` The error message to display when the date selected is out of range.  Inherited from `DateFormatProps.outOfRangeMessage` |
| `parseDate` | `(str: string, localeCode?: string) => false | Date` Function to deserialize user input text to a JavaScript `Date` object. Return `false` if the string is an invalid date. Return `null` to represent the absence of a date. Optional `localeCode` argument comes directly from the prop on this component.  RequiredInherited from `DateFormatProps.parseDate` |
| `placeholder` | `string` Placeholder text to display in empty input fields. Recommended practice is to indicate the expected date format.  Inherited from `DateFormatProps.placeholder` |
| `popoverProps` | `Partial<Omit<PopoverProps<DefaultPopoverTargetHTMLProps>, "fill" | "content" | "disabled" | "autoFocus" | "enforceFocus" | "defaultIsOpen" | "renderTarget">>` Props to spread to `Popover`.  Inherited from `DatetimePopoverProps.popoverProps` |
| `popoverRef` | `RefObject<Popover<DefaultPopoverTargetHTMLProps>>` Optional ref for the popover component instance. This is sometimes useful to reposition the popover.  Note that this is defined as a specific kind of Popover which should be compatible with most use cases, since it uses the default target props interface.  Inherited from `DatetimePopoverProps.popoverRef` |
| `reverseMonthAndYearMenus` | `booleanfalse` If `true`, the month menu will appear to the left of the year menu. Otherwise, the month menu will apear to the right of the year menu.  Inherited from `DatePickerBaseProps.reverseMonthAndYearMenus` |
| `rightElement` | `Element` Element to render on right side of input. |
| `shortcuts` | `boolean | DatePickerShortcut[]false` Whether shortcuts to quickly select a date are displayed or not. If `true`, preset shortcuts will be displayed. If `false`, no shortcuts will be displayed. If an array is provided, the custom shortcuts will be displayed. |
| `showActionsBar` | `booleanfalse` Whether the bottom bar displaying "Today" and "Clear" buttons should be shown below the calendar. |
| `showTimezoneSelect` | `booleanfalse` Whether to show the timezone select dropdown on the right side of the input. If `timePrecision` is undefined, this will always be false. |
| `timePickerProps` | `TimePickerProps` Further configure the `TimePicker` that appears beneath the calendar. `onChange` and `value` are ignored in favor of the corresponding top-level props on this component.  Passing any non-empty object to this prop will cause the `TimePicker` to appear.  Inherited from `DatePickerBaseProps.timePickerProps` |
| `timePrecision` | `TimePrecision` The precision of time selection that accompanies the calendar. Passing a `TimePrecision` value (or providing `timePickerProps`) shows a `TimePicker` below the calendar. Time is preserved across date changes.  This is shorthand for `timePickerProps.precision` and is a quick way to enable time selection.  Inherited from `DatePickerBaseProps.timePrecision` |
| `timezone` | `string` The currently selected timezone UTC identifier, e.g. "Pacific/Honolulu".  If you set this prop, the TimezoneSelect will behave in a controlled manner and you are responsible for updating this value using the `onTimezoneChange` callback.  Mutually exclusive with `defaultTimezone` prop.  See [IANA Time Zones](https://www.iana.org/time-zones). |
| `todayButtonText` | `string"Today"` Text for the today button in the date picker action bar. Passed to `DatePicker` component. |
| `value` | `string` An ISO string representing the selected time. |

## Localization

See the [DatePicker localization docs](#datetime/datepicker.localization).