# DateRangePicker3

##### Migrating from [DateRangePicker](#datetime/daterangepicker)?

**DateRangePicker3** is a replacement for DateRangePicker and will replace it in Blueprint v6.
You are encouraged to use this new API now to ease the transition to the next major version of Blueprint.
See the [react-day-picker v8 migration guide](https://github.com/palantir/blueprint/wiki/react-day-picker-8-migration)
on the wiki.

**DateRangePicker3** shows two sequential month calendars and allows the user to select a *range* of days.

* Past week
* Past month
* Past 3 months
* Past 6 months
* Past year
* Past 2 years

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

May 2025

JanuaryFebruaryMarchAprilMayJuneJulyAugustSeptemberOctoberNovemberDecemberOpen dropdown

200520062007200820092010201120122013201420152016201720182019202020212022202320242025Open dropdown

| Su | Mo | Tu | We | Th | Fr | Sa |
| --- | --- | --- | --- | --- | --- | --- |
| 27 | 28 | 29 | 30 | 1 | 2 | 3 |
| 4 | 5 | 6 | 7 | 8 | 9 | 10 |
| 11 | 12 | 13 | 14 | 15 | 16 | 17 |
| 18 | 19 | 20 | 21 | 22 | 23 | 24 |
| 25 | 26 | 27 | 28 | 29 | 30 | 31 |

No dateNo date

Allow single day rangeSingle month onlyConstrain to contiguous monthsShow shortcutsReverse month and year menus

Minimum date 

Open dropdown

Maximum date 

Open dropdown

Locale 

en-US

Time precision

NoneMinuteSecondMillisecondOpen dropdown

Time picker arrows

Use AM/PM

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/datetime2-examples/dateRangePicker3Example.tsx)

## Usage

**DateRangePicker3** supports both controlled and uncontrolled usage. You can control the selected date range by setting
the `value` prop, or use the component in uncontrolled mode and specify an initial date range by setting `defaultValue`.
Use the `onChange` prop to listen for changes to the selected range.

## Date ranges

**DateRangePicker3** uses the `DateRange` type across its API. This is an alias for the tuple type `[Date, Date]`.

Semantically:

* `[null, null]` represents an empty selection.
* `[someDate, null]` represents a date range where a single endpoint is known.
* `[someDate, someOtherDate]` represents a full date range where both endpoints are known.

## Shortcuts

The menu on the left of the calendars provides "shortcuts" which allow users to quickly select common date ranges. The
items in this menu are controlled through the `shortcuts` prop:

* `true` (default) will show the built-in shortcuts,
* `false` will hide the shortcuts menu, and
* custom shortcuts can be shown by defining an array of `DateRangeShortcut` objects.

The **preset shortcuts** can be seen in the example above. They are as follows:

* Today (only appears if `allowSingleDayRange={true}`)
* Yesterday (only appears if `allowSingleDayRange={true}`)
* Past week
* Past month
* Past 3 months
* Past 6 months
* Past year
* Past 2 years

**Custom shortcuts** use the following interface:

interface DateRangeShortcut extends DateShortcutBase

[@blueprintjs/datetime](https://github.com/palantir/blueprint/blob/d356c8eea/packages/datetime/src/components/shortcuts/shortcuts.tsx#L39)

| Props | Description |
| --- | --- |
| `dateRange` | `DateRange` Date range represented by this shortcut. Note that time components of a shortcut are ignored by default; set `includeTime: true` to respect them.  Required |
| `includeTime` | `booleanfalse` Set this prop to `true` to allow this shortcut to change the selected times as well as the dates. By default, time components of a shortcut are ignored; clicking a shortcut takes the date components of the `dateRange` and combines them with the currently selected time.  Inherited from `DateShortcutBase.includeTime` |
| `label` | `string` Shortcut label that appears in the list.  RequiredInherited from `DateShortcutBase.label` |

## Props interface

type alias DateRangePicker3Props

[@blueprintjs/datetime2](https://github.com/palantir/blueprint/blob/d356c8eea/packages/datetime2/src/components/date-range-picker3/dateRangePicker3Props.ts#L25)

= DateRangePickerSharedProps & DateFnsLocaleProps & ReactDayPickerRangeProps

## Localization

See the [**DatePicker3** localization docs](#datetime2/date-picker3.localization).