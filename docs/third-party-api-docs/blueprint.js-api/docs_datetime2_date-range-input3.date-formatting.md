# DateRangeInput3

##### Migrating from [DateRangeInput](#datetime/date-range-input)?

**DateRangeInput3** is a replacement for DateRangeInput and will replace it in Blueprint v6.
You are encouraged to use this new API now to ease the transition to the next major version of Blueprint.
See the [react-day-picker v8 migration guide](https://github.com/palantir/blueprint/wiki/react-day-picker-8-migration)
on the wiki.

**DateRangeInput3** has the same functionality as [DateRangeInput](#datetime/date-range-input) but uses
[react-day-picker v8](https://daypicker.dev/v8) instead of [v7](https://react-day-picker-v7.netlify.app/)
to render its calendar(s). It renders a [**ControlGroup**](#core/components/control-group) composed
of two [**InputGroups**](#core/components/input-group) and shows a [**DateRangePicker3**](#datetime2/date-range-picker3)
inside a [**Popover**](#core/components/popover) upon focus.

Unlike [**DateInput3**](#datetime2/date-input3), this component does *not* yet have support for
a built-in [**TimezoneSelect**](#datetime/timezone-select).

No dateNo date

##### Behavior props

Close on selection

Select all text on input focus

  

##### Date range picker props

Show shortcuts

Allow single day range

Single month only

Constrain calendar to contiguous months

Reverse month and year menusShow custom footer element

Locale 

en-US

##### Input appearance props

Disabled

Fill container width

[date-fns](https://date-fns.org/) format

MM/dd/yyyyyyyy-MM-ddyyyy-MM-dd HH:mm:ssLLL do, yyyy 'at' K:mm a

  

##### Time picker props

Enable time pickerTime precision

MinuteSecondMillisecondOpen dropdown

Show timepicker arrow buttons

Use AM/PM

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/datetime2-examples/dateRangeInput3Example.tsx)

## Usage

**DateRangeInput3** supports both controlled and uncontrolled usage. You can control the selected date by setting the
`value` prop, or use the component in uncontrolled mode and specify an initial date by setting `defaultValue`.
Use the `onChange` prop callback to listen for changes to the selected day and the `onError` prop to react to invalid
dates entered in the text inputs.

## Date formatting

You may customize the date display format with the required `formatDate` and `parseDate` props.
See [DateInput3's date formatting docs](#datetime3/date-input3.date-formatting) for more details.

## Props interface

interface DateRangeInput3Props extends DateRangeInputSharedProps, ReactDayPickerRangeProps<>, DateFnsLocaleProps<>, Partial<Omit<[DateFormatProps](#api/DateFormatProps), "locale">>

[@blueprintjs/datetime2](https://github.com/palantir/blueprint/blob/d356c8eea/packages/datetime2/src/components/date-range-input3/dateRangeInput3Props.ts#L33)

| Props | Description |
| --- | --- |
| `dateFnsFormat` | `string` [date-fns format](https://date-fns.org/docs/format) string used to format & parse date strings.  Mutually exclusive with the `formatDate` and `parseDate` props.  See date-fns [format](https://date-fns.org/docs/format). |
| `dateFnsLocaleLoader` | `DateFnsLocaleLoader` Optional custom loader function for the date-fns `Locale` which will be used to localize the date picker. This is useful in test environments or in build systems where you wish to customize module loading behavior. If not provided, a default loader will be used which uses dynamic imports to load `date-fns/locale/${localeCode}` modules.  Inherited from `DateFnsLocaleProps.dateFnsLocaleLoader` |
| `dayPickerProps` | `Omit<DayPickerRangeProps, ReactDayPickerOmittedProps>` Props to pass to react-day-picker's day range picker. See API documentation [here](https://daypicker.dev/v8/api/interfaces/DayPickerRangeProps).  Some properties are unavailable since they are set by the component design and cannot be changed:   * "captionLayout" * "disableNavigation" * "mode"   Other properties have alternative names as top-level props:   * "fromDate", "fromMonth", "fromYear", "toDate", "toMonth", "toYear": use "minDate" and "maxDate" instead (legacy names from @blueprintjs/datetime v4) * "locale" * "month": navigation is controlled by the component; use "defaultMonth" to set the initially displayed month * "numberOfMonths": use "singleMonthOnly" prop instead * "required": use "canClearSelection" instead (legacy name from @blueprintjs/datetime v4) * "selected": use "value" instead  Inherited from `ReactDayPickerRangeProps.dayPickerProps` |
| `locale` | `string | Locale"en-US"` date-fns `Locale` object or locale code string ((ISO 639-1 + optional country code) which will be used to localize the date picker.  If you provide a locale code string and receive a loading error, please make sure it is included in the list of date-fns' [supported locales](https://github.com/date-fns/date-fns/tree/main/src/locale). See date-fns [Locale](https://date-fns.org/v2.28.0/docs/Locale).  Inherited from `DateFnsLocaleProps.locale` |

## Localization

See the [**DatePicker3** localization docs](#datetime2/date-picker3.localization).