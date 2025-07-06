# DateInput3

##### Migrating from [DateInput](#datetime/date-input)?

**DateInput3** is a replacement for DateInput and will replace it in Blueprint v6.
You are encouraged to use this new API now to ease the transition to the next major version of Blueprint.
See the [react-day-picker v8 migration guide](https://github.com/palantir/blueprint/wiki/react-day-picker-8-migration)
on the wiki.

**DateInput3** has the same functionality as [DateInput](#datetime/date-input) but uses
[react-day-picker v8](https://daypicker.dev/v8) instead of [v7](https://react-day-picker-v7.netlify.app/)
to render its calendar. It renders an interactive [**InputGroup**](#core/components/input-group)
which, when focussed, displays a [**DatePicker3**](#datetime2/date-picker3) inside a
[**Popover**](#core/components/popover). It optionally renders a [**TimezoneSelect**](#datetime/timezone-select)
on the right side of the InputGroup which allows users to change the timezone of the selected date.

GMT-7

No date

##### Behavior props

Close on selection

##### Date picker props

Show shortcuts

Show actions bar

Reverse month and year menus

Locale 

en-US

##### Input appearance props

Disabled

Fill container width

Show right element

[date-fns](https://date-fns.org/) format

MM/dd/yyyyyyyy-MM-ddyyyy-MM-dd HH:mm:ssLLL do, yyyy 'at' K:mm a

##### Time picker props

Time precision

NoneMinuteSecondMillisecondOpen dropdown

Show time picker arrows

Use AM/PM time

##### Timezone select props

Show timezone select

Disable timezone select

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/datetime2-examples/dateInput3Example.tsx)

## Usage

**DateInput3** supports both controlled and uncontrolled usage. You can control
the selected date by setting the `value` prop, or use the component in
uncontrolled mode and specify an initial date by setting `defaultValue`.
Use the `onChange` prop callback to listen for changes to the selected day and
the `onError` prop to react to invalid dates entered in the text input.

This component uses ISO strings to represent timestamp values in the `value` & `defaultValue` props
and the `onChange` callback.

## Props interface

In addition to top-level **DateInput3** props, you may forward some props to `<DayPicker mode="single">` to customize
react-day-picker's behavior via `dayPickerProps` (the full list is
[documented here](https://daypicker.dev/v8/api/interfaces/DayPickerSingleProps)).

Shortcuts and modifiers are also configurable via the same API as [**DatePicker3**](#datetime2/date-picker3); see those
docs for more info.

interface DateInput3Props extends DateInputSharedProps, ReactDayPickerSingleProps<>, DateFnsLocaleProps<>, Partial<Omit<[DateFormatProps](#api/DateFormatProps), "locale">>

[@blueprintjs/datetime2](https://github.com/palantir/blueprint/blob/d356c8eea/packages/datetime2/src/components/date-input3/dateInput3Props.ts#L33)

| Props | Description |
| --- | --- |
| `dateFnsFormat` | `string` [date-fns format](https://date-fns.org/docs/format) string used to format & parse date strings.  Mutually exclusive with the `formatDate` and `parseDate` props.  See date-fns [format](https://date-fns.org/docs/format). |
| `dateFnsLocaleLoader` | `DateFnsLocaleLoader` Optional custom loader function for the date-fns `Locale` which will be used to localize the date picker. This is useful in test environments or in build systems where you wish to customize module loading behavior. If not provided, a default loader will be used which uses dynamic imports to load `date-fns/locale/${localeCode}` modules.  Inherited from `DateFnsLocaleProps.dateFnsLocaleLoader` |
| `dayPickerProps` | `Omit<DayPickerSingleProps, ReactDayPickerOmittedProps>` Props to pass to react-day-picker's single day picker. See API documentation [here](https://daypicker.dev/v8/api/interfaces/DayPickerSingleProps).  Some properties are unavailable since they are set by the component design and cannot be changed:   * "captionLayout" * "disableNavigation" * "mode" * "numberOfMonths": fixed to 1 month   Other properties have alternative names as top-level props:   * "fromDate", "fromMonth", "fromYear", "toDate", "toMonth", "toYear": use "minDate" and "maxDate" instead (legacy names from @blueprintjs/datetime v4) * "locale" * "month": navigation is controlled by the component; use "defaultMonth" to set the initially displayed month * "required": use "canClearSelection" instead (legacy name from @blueprintjs/datetime v4) * "selected": use "value" instead  Inherited from `ReactDayPickerSingleProps.dayPickerProps` |
| `locale` | `string | Locale"en-US"` date-fns `Locale` object or locale code string ((ISO 639-1 + optional country code) which will be used to localize the date picker.  If you provide a locale code string and receive a loading error, please make sure it is included in the list of date-fns' [supported locales](https://github.com/date-fns/date-fns/tree/main/src/locale). See date-fns [Locale](https://date-fns.org/v2.28.0/docs/Locale).  Inherited from `DateFnsLocaleProps.locale` |

## Date formatting

By default, **DateInput3** utilizes [date-fns](https://date-fns.org/docs/) to format & parse date strings. You may
specify which [date-fns format](https://date-fns.org/docs/format) to use with the `dateFnsFormat` prop.

If you do not specify this prop, the component will use one of its default formats corresponding to the time precision
specified by the `timePrecision` and `timePickerProps` props.

Finally, you have the option to specify a custom formatter & parser with the `formatDate` and `parseDate` props:

* `formatDate(date: Date, localeCode?: string)` receives the current `Date` and returns a string representation of it.
  The result of this function becomes the input value when it is not being edited.
* `parseDate(str: string, localeCode?: string)` receives text inputted by the user and converts it to a `Date` object.
  The returned `Date` becomes the next value of the component.

The optional `localeCode` argument to these functions is the value of the `locale` prop set on the component.

A simple implementation of a custom formatter & parser using built-in browser methods could look like this:

```
import { DateInput3 } from "@blueprintjs/datetime2";  
import { useCallback, useState } from "react";  
  
function Example() {  
    const [dateValue, setDateValue] = useState<string>(null);  
    const handleChange = useCallback(setDateValue, []);  
    const formatDate = useCallback((date: Date) => date.toLocaleString(), []);  
    const parseDate = useCallback((str: string) => new Date(str), []);  
  
    return (  
        <DateInput3  
            formatDate={formatDate}  
            onChange={handleChange}  
            parseDate={parseDate}  
            placeholder="M/D/YYYY"  
            value={dateValue}  
        />  
    );  
}  

```

## Localization

See the [**DatePicker3** localization docs](#datetime2/date-picker3.localization).