# DatePicker3

##### Migrating from [DatePicker](#datetime/datepicker)?

**DatePicker3** is a replacement for DatePicker and will replace it in Blueprint v6.
You are encouraged to use this new API now to ease the transition to the next major version of Blueprint.
See the [react-day-picker v8 migration guide](https://github.com/palantir/blueprint/wiki/react-day-picker-8-migration)
on the wiki.

**DatePicker3** has the same functionality as [DatePicker](#datetime/datepicker) but uses
[react-day-picker v8](https://daypicker.dev/v8) instead of [v7](https://react-day-picker-v7.netlify.app/)
to render its calendar. It renders a UI to choose a single date and (optionally) a time of day. Time selection
is enabled by the [TimePicker](#datetime/timepicker) component.

April 2025

JanuaryFebruaryMarchAprilMayJuneJulyAugustSeptemberOctoberNovemberDecemberOpen dropdown

200520062007200820092010201120122013201420152016201720182019202020212022202320242025Open dropdown

| Su | Mo | Tu | We | Th | Fr | Sa |
| --- | --- | --- | --- | --- | --- | --- |
| 30 | 31 | 1 | 2 | 3 | 4 | 5 |
| 6 | 7 | 8 | 9 | 10 | 11 | 12 |
| 13 | 14 | 15 | 16 | 17 | 18 | 19 |
| 20 | 21 | 22 | 23 | 24 | 25 | 26 |
| 27 | 28 | 29 | 30 | 1 | 2 | 3 |

TodayClear

No date

##### Props

Show actions bar

Show shortcuts

Highlight current day

Reverse month and year menus

Show custom footer element

Minimum date 

Open dropdown

Maximum date 

Open dropdown

##### react-day-picker props

Show week numbers

Show outside days

##### Time picker props

Precision

NoneMinuteSecondMillisecondOpen dropdown

Show timepicker arrow buttons

Use AM/PM

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/datetime2-examples/datePicker3Example.tsx)

## Usage

**DatePicker3** supports both controlled and uncontrolled usage. You can control the selected day by setting the `value`
prop, or use the component in uncontrolled mode and specify an initial day by setting `defaultValue`. Use the `onChange`
prop to listen for changes to the selected day.

## Props interface

In addition to top-level **DatePicker3** props, you may forward some props to `<DayPicker mode="single">` to customize
react-day-picker's behavior via `dayPickerProps` (the full list is
[documented here](https://daypicker.dev/v8/api/interfaces/DayPickerSingleProps)).

interface DatePicker3Props extends DatePickerSharedProps, DateFnsLocaleProps<>, ReactDayPickerSingleProps<>

[@blueprintjs/datetime2](https://github.com/palantir/blueprint/blob/d356c8eea/packages/datetime2/src/components/date-picker3/datePicker3Props.ts#L28)

| Props | Description |
| --- | --- |
| `dateFnsLocaleLoader` | `DateFnsLocaleLoader` Optional custom loader function for the date-fns `Locale` which will be used to localize the date picker. This is useful in test environments or in build systems where you wish to customize module loading behavior. If not provided, a default loader will be used which uses dynamic imports to load `date-fns/locale/${localeCode}` modules.  Inherited from `DateFnsLocaleProps.dateFnsLocaleLoader` |
| `dayPickerProps` | `Omit<DayPickerSingleProps, ReactDayPickerOmittedProps>` Props to pass to react-day-picker's single day picker. See API documentation [here](https://daypicker.dev/v8/api/interfaces/DayPickerSingleProps).  Some properties are unavailable since they are set by the component design and cannot be changed:   * "captionLayout" * "disableNavigation" * "mode" * "numberOfMonths": fixed to 1 month   Other properties have alternative names as top-level props:   * "fromDate", "fromMonth", "fromYear", "toDate", "toMonth", "toYear": use "minDate" and "maxDate" instead (legacy names from @blueprintjs/datetime v4) * "locale" * "month": navigation is controlled by the component; use "defaultMonth" to set the initially displayed month * "required": use "canClearSelection" instead (legacy name from @blueprintjs/datetime v4) * "selected": use "value" instead  Inherited from `ReactDayPickerSingleProps.dayPickerProps` |
| `defaultValue` | `Date` Initial day the calendar will display as selected. This should not be set if `value` is set. |
| `locale` | `string | Locale"en-US"` date-fns `Locale` object or locale code string ((ISO 639-1 + optional country code) which will be used to localize the date picker.  If you provide a locale code string and receive a loading error, please make sure it is included in the list of date-fns' [supported locales](https://github.com/date-fns/date-fns/tree/main/src/locale). See date-fns [Locale](https://date-fns.org/v2.28.0/docs/Locale).  Inherited from `DateFnsLocaleProps.locale` |
| `onChange` | `(selectedDate: null | Date, isUserChange: boolean) => void` Called when the user selects a day. If being used in an uncontrolled manner, `selectedDate` will be `null` if the user clicks the currently selected day. If being used in a controlled manner, `selectedDate` will contain the day clicked no matter what. `isUserChange` is true if the user selected a day, and false if the date was automatically changed by the user navigating to a new month or year rather than explicitly clicking on a date in the calendar. |
| `timezone` | `string` The currently selected timezone UTC identifier, e.g. "Pacific/Honolulu".  This prop is only used to determine what date should be selected when clicking the "Today" button in the actions bar. If this value is omitted, the current date will be set using the user's local timezone.  See [IANA Time Zones](https://www.iana.org/time-zones). |
| `value` | `null | Date` The currently selected day. If this prop is provided, the component acts in a controlled manner. |

## Shortcuts

The menu on the left of the calendars provides "shortcuts" which allow users to quickly select common dates.
The items in this menu are controlled through the `shortcuts` prop:

* `false` (default) will hide the shortcuts menu,
* `true` will show the built-in shortcuts, and
* custom shortcuts can be shown by defining an array of `DatePickerShortcut` objects.

The built-in **preset shortcuts** can be seen in the example above. They are as follows:

* Today
* Yesterday
* 1 week ago
* 1 month ago
* 3 months ago
* 1 year ago

**Custom shortcuts** use the following interface:

interface DatePickerShortcut extends DateShortcutBase

[@blueprintjs/datetime](https://github.com/palantir/blueprint/blob/d356c8eea/packages/datetime/src/components/shortcuts/shortcuts.tsx#L47)

| Props | Description |
| --- | --- |
| `date` | `Date` Date represented by this shortcut. Note that time components of a shortcut are ignored by default; set `includeTime: true` to respect them.  Required |
| `includeTime` | `booleanfalse` Set this prop to `true` to allow this shortcut to change the selected times as well as the dates. By default, time components of a shortcut are ignored; clicking a shortcut takes the date components of the `dateRange` and combines them with the currently selected time.  Inherited from `DateShortcutBase.includeTime` |
| `label` | `string` Shortcut label that appears in the list.  RequiredInherited from `DateShortcutBase.label` |

## Modifiers

**DatePicker3** utilizes react-day-picker's built-in [modifiers](https://daypicker.dev/guides/custom-modifiers#built-in-modifiers) for
various functionality (highlighting the current day, showing selected days, etc.).

You may extend and customize the default modifiers by specifying various properties in the `dayPickerProps` prop object.
In the example below, we add a custom class name to every odd-numbered day in the calendar using a simple
[Matcher](https://daypicker.dev/api/type-aliases/Matcher).

April 2025

JanuaryFebruaryMarchAprilMayJuneJulyAugustSeptemberOctoberNovemberDecemberOpen dropdown

200520062007200820092010201120122013201420152016201720182019202020212022202320242025Open dropdown

| Su | Mo | Tu | We | Th | Fr | Sa |
| --- | --- | --- | --- | --- | --- | --- |
| 30 | 31 | 1 | 2 | 3 | 4 | 5 |
| 6 | 7 | 8 | 9 | 10 | 11 | 12 |
| 13 | 14 | 15 | 16 | 17 | 18 | 19 |
| 20 | 21 | 22 | 23 | 24 | 25 | 26 |
| 27 | 28 | 29 | 30 | 1 | 2 | 3 |

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/datetime2-examples/datePicker3ModifierExample.tsx)

See [react-day-picker's "Custom modifiers" documentation](https://daypicker.dev/guides/custom-modifiers)
for more info.

## Localization

**DatePicker3**, **DateInput3**, **DateRangePicker3**, and **DateRangeInput3** support calendar
localization using date-fns's [Locale](https://date-fns.org/v2.28.0/docs/Locale) features. The `locale` prop on each
of these components accepts two types of values, either a `Locale` object or a locale code `string`.

### Using a locale code

Use the `locale: string` type to interpret the prop as a locale code (ISO 639-1 + optional country code).
The component will attempt to dynamically import the corresponding date-fns locale module.

```
import { DatePicker3 } from "@blueprintjs/datetime2";  
  
function Example() {  
    return <DatePicker3 locale="en-US" />;  
}  

```

At runtime, this will trigger a dynamic import like the following statement:

```
await import(/* webpackChunkName: "date-fns-en-US" */ "date-fns/locale/en-US");  

```

#### Loading `date-fns` locales

By default, `date-fns` locales are loaded using an async `import("date-fns/*")` of the corresponding locale submodule.
If you need to customize this loader function, you may do so with the `dateFnsLocaleLoader` prop; this is sometimes
necessary for bundlers like Vite. For example:

```
import { Locale } from "date-fns";  
import React from "react";  
import { DatePicker3 } from "@blueprintjs/datetime2";  
  
const loadDateFnsLocale: (localeCode: string) => Promise<Locale> = async localeCode => {  
    const localeModule = await import(`../node_modules/date-fns/esm/locale/${localeCode}/index.js`);  
    return localeModule.default;  
};  
  
export const Example: React.FC = () => {  
    return <DatePicker3 dateFnsLocaleLoader={loadDateFnsLocale} />;  
};  

```

### Using a `Locale` object

Use the `locale: Locale` type if you wish to statically load date-fns locale modules:

```
import { DatePicker3 } from "@blueprintjs/datetime2";  
import enUS from "date-fns/locale/en-US";  
  
function Example() {  
    return <DatePicker3 locale={enUS} />;  
}  

```

##### Localizing shortcuts

Built-in preset shortcut labels are not automatically localized by setting the `locale` prop. If you need these
strings to appear in different languages, you will need to specify custom shortcuts and update their `label`
properties accordingly.

avril 2025

janvierfévriermarsavrilmaijuinjuilletaoûtseptembreoctobrenovembredécembreOpen dropdown

200520062007200820092010201120122013201420152016201720182019202020212022202320242025Open dropdown

| lu | ma | me | je | ve | sa | di |
| --- | --- | --- | --- | --- | --- | --- |
| 31 | 1 | 2 | 3 | 4 | 5 | 6 |
| 7 | 8 | 9 | 10 | 11 | 12 | 13 |
| 14 | 15 | 16 | 17 | 18 | 19 | 20 |
| 21 | 22 | 23 | 24 | 25 | 26 | 27 |
| 28 | 29 | 30 | 1 | 2 | 3 | 4 |

##### Locale code

fr

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/datetime2-examples/datePicker3LocalizedExample.tsx)