# Timezone select

**TimezoneSelect** allows the user to select from a list of timezones. The list is built into the library itself, so it
does not depend on any external packages for the list of timezones. It uses
[date-fns-tz](https://github.com/marnusw/date-fns-tz) for display formatting.

Select timezone...

##### Props

Show local timezoneDisabledFill container width

Display formatCompositeAbbreviationLong NameIANA CodeOffset

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/datetime-examples/timezoneSelectExample.tsx)

## Usage

This component only supports **controlled** usage.

Control the selected timezone with the `value` prop and use the `onChange` prop callback to listen for changes to the
selected timezone.

```
import { TimezoneSelect } from "@blueprintjs/datetime";  
import React, { useState } from "react";  
  
function TimezoneExample() {  
    const [timezone, setTimezone] = useState("");  
    return <TimezoneSelect value={timezone} onChange={setTimezone} />;  
}  

```

The optional `date` prop is used to determine the timezone offsets. This is useful to disambiguate timezones which have
more than one offset from UTC due to [Daylight saving time](https://en.wikipedia.org/wiki/Daylight_saving_time).

By default, the component will show a clickable button target which displays the selected timezone formatted according
to the `valueDisplayFormat` prop. The button can be customized via `disabled`, `placeholder`, and more generally via
`buttonProps`.

You can show a custom element instead of the default button by passing a single-element child to `<TimezoneSelect>`;
in this case, all button-specific props will be ignored:

```
<TimezoneSelect value={...} onChange={...}>  
    <Icon icon="globe" />  
</TimezonePicker>  

```

##### Local timezone detection

**TimezoneSelect** detects the local timezone using the
[i18n API](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/DateTimeFormat/resolvedOptions)
when the `showLocalTimezone` prop is enabled and cannot guarantee correctness in all browsers.

## Props interface

interface TimezoneSelectProps extends [Props](#api/Props)

[@blueprintjs/datetime](https://github.com/palantir/blueprint/blob/d356c8eea/packages/datetime/src/components/timezone-select/timezoneSelect.tsx#L37)

| Props | Description |
| --- | --- |
| `buttonProps` | `Partial<ButtonProps>` Props to spread to the target `Button`. This prop will be ignored if `children` is provided. |
| `children` | `ReactNode` Element which triggers the timezone select popover. If this is undefined, by default the component will render a `<Button>` which shows the currently selected timezone. |
| `date` | `Datenow` The date to use when formatting timezone offsets. An offset date is necessary to account for DST, but typically the default value of `now` will be sufficient. |
| `disabled` | `booleanfalse` Whether this component is non-interactive. This prop will be ignored if `children` is provided. |
| `fill` | `booleanfalse` Whether the component should take up the full width of its container. This overrides `popoverProps.fill` and `buttonProps.fill`. |
| `inputProps` | `InputGroupProps` Props to spread to the filter `InputGroup`. All props are supported except `ref` (use `inputRef` instead). If you want to control the filter input, you can pass `value` and `onChange` here to override `Select`'s own behavior. |
| `onChange` | `(timezone: string) => void` Callback invoked when the user selects a timezone.  Required |
| `placeholder` | `string"Select timezone..."` Text to show when no timezone has been selected (`value === undefined`). This prop will be ignored if `children` is provided. |
| `popoverProps` | `Partial<Omit<PopoverProps<DefaultPopoverTargetHTMLProps>, "fill" | "content" | "defaultIsOpen" | "renderTarget">>` Props to spread to the popover. Note that `content` cannot be changed. |
| `showLocalTimezone` | `booleanfalse` Whether to show the local timezone at the top of the list of initial timezone suggestions. |
| `value` | `string` The currently selected timezone UTC identifier, e.g. "Pacific/Honolulu".  See: [object Object]  Required |
| `valueDisplayFormat` | `TimezoneDisplayFormatTimezoneDisplayFormat.COMPOSITE` Format to use when displaying the selected (or default) timezone within the target element. This prop will be ignored if `children` is provided. |