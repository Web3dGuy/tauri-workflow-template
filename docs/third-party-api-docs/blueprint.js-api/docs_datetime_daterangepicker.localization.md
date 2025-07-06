# Date range picker

##### Deprecated: use [**DateRangePicker3**](#datetime2/date-range-picker3)

This component is **deprecated since @blueprintjs/datetime v5.2.0** in favor of the new
**DateRangePicker3** component available in the `@blueprintjs/datetime2` package which uses
react-day-picker v8.x instead of v7.x. You should migrate to the new API which will become the
standard in Blueprint v6.

**DateRangePicker** shows two sequential month calendars and allows the user to select a *range* of days.

* Past week
* Past month
* Past 3 months
* Past 6 months
* Past year
* Past 2 years

JanuaryFebruaryMarchAprilMayJuneJulyAugustSeptemberOpen dropdown

200520062007200820092010201120122013201420152016201720182019202020212022202320242025Open dropdown

Su

Mo

Tu

We

Th

Fr

Sa

30

31

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

21

22

23

24

25

26

27

28

29

30

1

2

3

JanuaryFebruaryMarchAprilMayJuneJulyAugustSeptemberOctoberOpen dropdown

200520062007200820092010201120122013201420152016201720182019202020212022202320242025Open dropdown

Su

Mo

Tu

We

Th

Fr

Sa

27

28

29

30

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

21

22

23

24

25

26

27

28

29

30

31

no dateno date

##### Props

Allow single day rangeSingle month onlyConstrain to contiguous monthsShow shortcutsReverse month and year menus

Minimum date 

Open dropdown

Maximum date 

Open dropdown

Time precision

NoneMinuteSecondMillisecondOpen dropdown

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/datetime-examples/dateRangePickerExample.tsx)

## Usage

**DateRangePicker** supports both controlled and uncontrolled usage. You can control the selected date range by setting
the `value` prop, or use the component in uncontrolled mode and specify an initial date range by setting `defaultValue`.
Use the `onChange` prop to listen for changes to the selected range.

## Date ranges

**DateRangePicker** uses the `DateRange` type across its API. This is an alias for the tuple type `[Date, Date]`.

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

interface DateRangePickerProps extends [DatePickerBaseProps](#api/DatePickerBaseProps), [Props](#api/Props)<>

[@blueprintjs/datetime](https://github.com/palantir/blueprint/blob/d356c8eea/packages/datetime/src/components/date-range-picker/dateRangePicker.tsx#L52)

| Props | Description |
| --- | --- |
| `allowSingleDayRange` | `booleanfalse` Whether the start and end dates of the range can be the same day. If `true`, clicking a selected date will create a one-day range. If `false`, clicking a selected date will clear the selection. |
| `boundaryToModify` | `Boundary` The date-range boundary that the next click should modify. This will be honored unless the next click would overlap the other boundary date. In that case, the two boundary dates will be auto-swapped to keep them in chronological order. If `undefined`, the picker will revert to its default selection behavior. |
| `contiguousCalendarMonths` | `booleantrue` Whether displayed months in the calendar are contiguous. If false, each side of the calendar can move independently to non-contiguous months. |
| `dayPickerProps` | `DayPickerProps` Props to pass to ReactDayPicker. See API documentation [here](https://react-day-picker-v7.netlify.app/api/DayPicker).  The following props are managed by the component and cannot be configured: `canChangeMonth`, `captionElement`, `fromMonth` (use `minDate`), `month` (use `initialMonth`), `toMonth` (use `maxDate`).  In case of supplying your owner `renderDay` function, make sure to apply the appropriate CSS wrapper class to obtain default Blueprint styling. eg.  `<div className={Classes.DATEPICKER_DAY_WRAPPER}>{CONTENT_HERE}</div>`  Inherited from `DatePickerBaseProps.dayPickerProps` |
| `defaultValue` | `DateRange` Initial `DateRange` the calendar will display as selected. This should not be set if `value` is set. |
| `footerElement` | `Element` An additional element to show below the date picker.  Inherited from `DatePickerBaseProps.footerElement` |
| `highlightCurrentDay` | `booleanfalse` Whether the current day should be highlighted in the calendar.  Inherited from `DatePickerBaseProps.highlightCurrentDay` |
| `initialMonth` | `Date` The initial month the calendar displays.  Inherited from `DatePickerBaseProps.initialMonth` |
| `locale` | `string` The locale name, which is passed to the functions in `localeUtils` (and `formatDate` and `parseDate` if supported).  Inherited from `DatePickerBaseProps.locale` |
| `localeUtils` | Collection of functions that provide internationalization support.  Inherited from `DatePickerBaseProps.localeUtils` |
| `maxDate` | `Date6 months from now.` The latest date the user can select.  Inherited from `DatePickerBaseProps.maxDate` |
| `minDate` | `DateJan. 1st, 20 years in the past.` The earliest date the user can select.  Inherited from `DatePickerBaseProps.minDate` |
| `modifiers` | `DatePickerModifiers` Collection of functions that determine which modifier classes get applied to which days. Each function should accept a `Date` and return a boolean. See the [**react-day-picker** documentation](https://react-day-picker-v7.netlify.app/api/ModifiersUtils) to learn more.  Inherited from `DatePickerBaseProps.modifiers` |
| `onChange` | `(selectedDates: DateRange) => void` Called when the user selects a day. If no days are selected, it will pass `[null, null]`. If a start date is selected but not an end date, it will pass `[selectedDate, null]`. If both a start and end date are selected, it will pass `[startDate, endDate]`. |
| `onHoverChange` | `(hoveredDates: DateRange, hoveredDay: Date, hoveredBoundary: Boundary) => void` Called when the user changes the hovered date range, either from mouseenter or mouseleave. When triggered from mouseenter, it will pass the date range that would result from next click. When triggered from mouseleave, it will pass `undefined`. |
| `onShortcutChange` | `(shortcut: DateRangeShortcut, index: number) => void` Called when the `shortcuts` props is enabled and the user changes the shortcut. |
| `reverseMonthAndYearMenus` | `booleanfalse` If `true`, the month menu will appear to the left of the year menu. Otherwise, the month menu will apear to the right of the year menu.  Inherited from `DatePickerBaseProps.reverseMonthAndYearMenus` |
| `selectedShortcutIndex` | `number` The currently selected shortcut. If this prop is provided, the component acts in a controlled manner. |
| `shortcuts` | `boolean | DateRangeShortcut[]true` Whether shortcuts to quickly select a range of dates are displayed or not. If `true`, preset shortcuts will be displayed. If `false`, no shortcuts will be displayed. If an array is provided, the custom shortcuts will be displayed. |
| `singleMonthOnly` | `booleanfalse` Whether to show only a single month calendar. |
| `timePickerProps` | `TimePickerProps` Further configure the `TimePicker` that appears beneath the calendar. `onChange` and `value` are ignored in favor of the corresponding top-level props on this component.  Passing any non-empty object to this prop will cause the `TimePicker` to appear.  Inherited from `DatePickerBaseProps.timePickerProps` |
| `timePrecision` | `TimePrecision` The precision of time selection that accompanies the calendar. Passing a `TimePrecision` value (or providing `timePickerProps`) shows a `TimePicker` below the calendar. Time is preserved across date changes.  This is shorthand for `timePickerProps.precision` and is a quick way to enable time selection.  Inherited from `DatePickerBaseProps.timePrecision` |
| `value` | `DateRange` The currently selected `DateRange`. If this prop is provided, the component acts in a controlled manner. |

## Localization

See the [Date picker localization docs](#datetime/datepicker.localization).