# Date picker

##### Deprecated: use [**DatePicker3**](#datetime2/date-picker3)

This component is **deprecated since @blueprintjs/datetime v5.2.0** in favor of the new
**DatePicker3** component available in the `@blueprintjs/datetime2` package which uses
react-day-picker v8.x instead of v7.x. You should migrate to the new API which will become the
standard in Blueprint v6.

**DatePicker** renders a UI to choose a single date and (optionally) a time of day. It is built on top of the
[**react-day-picker** library](https://github.com/gpbl/react-day-picker). Time selection is enabled by the
[**TimePicker**](#datetime/timepicker) component.

JanuaryFebruaryMarchAprilMayJuneJulyAugustSeptemberOctoberOpen dropdown

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

no date

##### Props

Show actions barShow shortcutsHighlight current dayReverse month and year menusShow custom footer elementTime precision

NoneMinuteSecondMillisecondOpen dropdown

Show timepicker arrow buttonsUse AM/PM

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/datetime-examples/datePickerExample.tsx)

## Usage

**DatePicker** supports both controlled and uncontrolled usage. You can control the selected day by setting the `value`
prop, or use the component in uncontrolled mode and specify an initial day by setting `defaultValue`. Use the `onChange`
prop to listen for changes to the selected day.

## Props interface

Some props are managed by **DatePicker**, while others are passed to the **react-day-picker** library. These
passed-through props are documented in full in the
[**react-day-picker** documentation](https://react-day-picker-v7.netlify.app/).

interface DatePickerProps extends [DatePickerBaseProps](#api/DatePickerBaseProps), [Props](#api/Props)<>

[@blueprintjs/datetime](https://github.com/palantir/blueprint/blob/d356c8eea/packages/datetime/src/components/date-picker/datePicker.tsx#L38)

| Props | Description |
| --- | --- |
| `canClearSelection` | `booleantrue` Allows the user to clear the selection by clicking the currently selected day. If disabled, the "Clear" Button in the Actions Bar will also be disabled. |
| `clearButtonText` | `string"Clear"` Text for the reset button in the action bar. |
| `dayPickerProps` | `DayPickerProps` Props to pass to ReactDayPicker. See API documentation [here](https://react-day-picker-v7.netlify.app/api/DayPicker).  The following props are managed by the component and cannot be configured: `canChangeMonth`, `captionElement`, `fromMonth` (use `minDate`), `month` (use `initialMonth`), `toMonth` (use `maxDate`).  In case of supplying your owner `renderDay` function, make sure to apply the appropriate CSS wrapper class to obtain default Blueprint styling. eg.  `<div className={Classes.DATEPICKER_DAY_WRAPPER}>{CONTENT_HERE}</div>`  Inherited from `DatePickerBaseProps.dayPickerProps` |
| `defaultValue` | `Date` Initial day the calendar will display as selected. This should not be set if `value` is set. |
| `footerElement` | `Element` An additional element to show below the date picker.  Inherited from `DatePickerBaseProps.footerElement` |
| `highlightCurrentDay` | `booleanfalse` Whether the current day should be highlighted in the calendar.  Inherited from `DatePickerBaseProps.highlightCurrentDay` |
| `initialMonth` | `Date` The initial month the calendar displays.  Inherited from `DatePickerBaseProps.initialMonth` |
| `locale` | `string` The locale name, which is passed to the functions in `localeUtils` (and `formatDate` and `parseDate` if supported).  Inherited from `DatePickerBaseProps.locale` |
| `localeUtils` | Collection of functions that provide internationalization support.  Inherited from `DatePickerBaseProps.localeUtils` |
| `maxDate` | `Date6 months from now.` The latest date the user can select.  Inherited from `DatePickerBaseProps.maxDate` |
| `minDate` | `DateJan. 1st, 20 years in the past.` The earliest date the user can select.  Inherited from `DatePickerBaseProps.minDate` |
| `modifiers` | `DatePickerModifiers` Collection of functions that determine which modifier classes get applied to which days. Each function should accept a `Date` and return a boolean. See the [**react-day-picker** documentation](https://react-day-picker-v7.netlify.app/api/ModifiersUtils) to learn more.  Inherited from `DatePickerBaseProps.modifiers` |
| `onChange` | `(selectedDate: Date, isUserChange: boolean) => void` Called when the user selects a day. If being used in an uncontrolled manner, `selectedDate` will be `null` if the user clicks the currently selected day. If being used in a controlled manner, `selectedDate` will contain the day clicked no matter what. `isUserChange` is true if the user selected a day, and false if the date was automatically changed by the user navigating to a new month or year rather than explicitly clicking on a date in the calendar. |
| `onShortcutChange` | `(shortcut: DatePickerShortcut, index: number) => void` Called when the `shortcuts` props is enabled and the user changes the shortcut. |
| `reverseMonthAndYearMenus` | `booleanfalse` If `true`, the month menu will appear to the left of the year menu. Otherwise, the month menu will apear to the right of the year menu.  Inherited from `DatePickerBaseProps.reverseMonthAndYearMenus` |
| `selectedShortcutIndex` | `number` The currently selected shortcut. If this prop is provided, the component acts in a controlled manner. |
| `shortcuts` | `boolean | DatePickerShortcut[]` Whether shortcuts to quickly select a date are displayed or not. If `true`, preset shortcuts will be displayed. If `false`, no shortcuts will be displayed. If an array is provided, the custom shortcuts will be displayed. |
| `showActionsBar` | `booleanfalse` Whether the bottom bar displaying "Today" and "Clear" buttons should be shown. |
| `timePickerProps` | `TimePickerProps` Further configure the `TimePicker` that appears beneath the calendar. `onChange` and `value` are ignored in favor of the corresponding top-level props on this component.  Passing any non-empty object to this prop will cause the `TimePicker` to appear.  Inherited from `DatePickerBaseProps.timePickerProps` |
| `timePrecision` | `TimePrecision` The precision of time selection that accompanies the calendar. Passing a `TimePrecision` value (or providing `timePickerProps`) shows a `TimePicker` below the calendar. Time is preserved across date changes.  This is shorthand for `timePickerProps.precision` and is a quick way to enable time selection.  Inherited from `DatePickerBaseProps.timePrecision` |
| `todayButtonText` | `string"Today"` Text for the today button in the action bar. |
| `value` | `Date` The currently selected day. If this prop is provided, the component acts in a controlled manner. |

## Shortcuts

The menu on the left of the calendars provides "shortcuts" which allow users to
quickly select common dates. The items in this menu are controlled through
the `shortcuts` prop:

* `false` (default) will hide the shortcuts menu,
* `true` will show the built-in shortcuts, and
* custom shortcuts can be shown by defining an array of `DatePickerShortcut` objects.

The **preset shortcuts** can be seen in the example above. They are as follows:

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

You can use the `modifiers` prop to conditionally apply styles to days. Modifiers are a react-day-picker concept and are
documented in full in the
[**react-day-picker** documentation](https://react-day-picker-v7.netlify.app/docs/matching-days).

The example below renders a DatePicker that prevents the user from selecting any Sundays, by using the component in
controlled mode and with the `modifiers` prop:

```
// in CSS  
.bp5-datepicker .DayPicker-Day--isSunday {  
    // CSS rules to make the day appear disabled  
}  

```
```
// in TypeScript  
import { DatePicker } from "@blueprintjs/datetime";  
  
export class DatePickerExample extends React.Component<{}, { selectedDate: Date }> {  
    public state = { selectedDate: new Date() };  
  
    public render() {  
        // name of modifier function becomes the suffix for the CSS class above  
        const modifiers = { isSunday };  
        return (  
            <DatePicker  
                modifiers={modifiers}  
                onChange={newDate => this.handleChange(newDate)}  
                value={this.state.selectedDate}  
            />  
        );  
    }  
  
    private handleChange(date: Date) {  
        if (!isSunday(date)) {  
            this.setState({ selectedDate: date });  
        }  
    }  
}  
  
function isSunday(date: Date) {  
    return date.getDay() === 0;  
}  

```

## Localization

**DatePicker**, **DateRangePicker**, **DateInput**, and **DateRangeInput** all support calendar localization
using an interface defined by **react-day-picker**:

```
import { LocaleUtils } from "react-day-picker";  

```

By supplying a `locale: string` and `localeUtils: LocaleUtils` prop to these Blueprint components, you can customize how
dates are rendered, which day of the week is the first column, etc.

You will need to define the functions of `LocaleUtil` on your own.
[See the interface definition](https://github.com/gpbl/react-day-picker/blob/v7.3.0/types/utils.d.ts#L5)
for more details.

Since **@blueprintjs/datetime** depends on [**date-fns**](https://date-fns.org/), you may wish to leverage this library
which is already in your bundle to implement localization, for example:

```
import { DatePicker, DatePickerLocaleUtils } from "@blueprintjs/datetime";  
import { format, Locale, parse } from "date-fns";  
  
const DATE_FNS_LOCALE_UTILS: DatePickerLocaleUtils = {  
    // implement locale utils using "date-fns" functions  
};  
  
<DatePicker locale="fr" localeUtils={DATE_FNS_LOCALE_UTILS} />;  

```

More detailed examples can be found in the
[**react-day-picker** documentation](https://react-day-picker-v7.netlify.app/docs/localization).