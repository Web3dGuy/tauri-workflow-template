# Button group

The **ButtonGroup** component arranges related buttons in a horizontal row or
vertical stack, providing alignment and consistent spacing for a layout of related actions.

Most of **ButtonGroup**'s props are also supported by [**Button**](#core/components/buttons) directly. Setting these props on **ButtonGroup** will apply the same value to all buttons in the group. Note that most modifiers, once enabled on the group, cannot be overridden on child buttons (due to the cascading nature of CSS).

## Import

```
import { ButtonGroup } from "@blueprintjs/core";  

```

## Usage

Wrap buttons in a **ButtonGroup** to arrange them together horizontally.

OneTwoThree

```
<ButtonGroup>  
    <Button text="One" />  
    <Button text="Two" />  
    <Button text="Three" />  
</ButtonGroup>  

```

## Intent

Use the `intent` prop on individual buttons to convey purpose. For a consistent
visual style, it’s recommended to apply the same `intent` to all buttons within the same group.

OneTwoThree

```
<ButtonGroup>  
    <Button intent="primary" text="One" />  
    <Button intent="primary" text="Two" />  
    <Button intent="primary" text="Three" />  
</ButtonGroup>  

```

## Variant

Use the `variant` prop to change the visual style of button child elements within the group.

OneTwoThree

OneTwoThree

```
<ButtonGroup variant="outlined">  
    <Button text="One" />  
    <Button text="Two" />  
    <Button text="Three" />  
</ButtonGroup>  
<ButtonGroup variant="minimal">  
    <Button text="One" />  
    <Button text="Two" />  
    <Button text="Three" />  
</ButtonGroup>  

```

## Outlined and minimal

##### Deprecated: use [`variant`](#core/components/buttons.variant) instead

Use the `outlined` and `minimal` props to change the visual style of button child elements within the group.

OneTwoThree

OneTwoThree

```
<ButtonGroup outlined={true}>  
    <Button text="One" />  
    <Button text="Two" />  
    <Button text="Three" />  
</ButtonGroup>  
<ButtonGroup minimal={true}>  
    <Button text="One" />  
    <Button text="Two" />  
    <Button text="Three" />  
</ButtonGroup>  

```

## Size

The `size` prop can be used to control the size of all child buttons within the button group.

OneTwoThree

OneTwoThree

OneTwoThree

```
<ButtonGroup size="small">  
    <Button text="One" />  
    <Button text="Two" />  
    <Button text="Three" />  
</ButtonGroup>  
<ButtonGroup size="medium">  
    <Button text="One" />  
    <Button text="Two" />  
    <Button text="Three" />  
</ButtonGroup>  
<ButtonGroup size="large">  
    <Button text="One" />  
    <Button text="Two" />  
    <Button text="Three" />  
</ButtonGroup>  

```

## Flex layout

**ButtonGroup** renders a CSS flex row (or column if `vertical` is enabled) and
includes modifier props for common flexbox patterns:

* Use the `fill` prop to make all buttons expand equally to fill the available space.
  + Buttons will expand horizontally by default or vertically if `vertical` is enabled.
  + Add the `Classes.FIXED` class to specific buttons to maintain their initial sizes.
* Alternatively, enable `fill` on specific buttons to selectively expand them while others retain their original size.

For precise size adjustments, use the `flex-basis` or `width` CSS properties on individual buttons.

OneTwoThree

Select one

```
<ButtonGroup fill={true}>  
    <Button text="One" />  
    <Button text="Two" />  
    <Button text="Three" />  
</ButtonGroup>  
<ButtonGroup fill={true}>  
    <Button fill={true} intent="primary" text="Select one" />  
    <Button icon="caret-down" intent="primary" aria-label="More" />  
</ButtonGroup>  

```

## Vertical layout

Enable the `vertical` prop to stack buttons vertically. Buttons in a vertical
group automatically adjust to the width of the widest button in the group.

Use the `alignText` prop to control text and icon alignment within the buttons.
Set it at the group level for uniform alignment or on individual buttons for specific adjustments.

OneTwoThree

StartCenterEnd

```
<ButtonGroup vertical={true}>  
    <Button text="One" />  
    <Button text="Two" />  
    <Button text="Three" />  
</ButtonGroup>  
<ButtonGroup outlined={true} vertical={true}>  
    <Button alignText="start" icon="align-left" text="Start" />  
    <Button alignText="center" icon="align-center" text="Center" />  
    <Button alignText="end" endIcon="align-right" text="End" />  
</ButtonGroup>  

```

## Usage with popovers

**Button** elements inside a **ButtonGroup** can be wrapped with a
[**Popover**](#core/components/popover) to create complex toolbars.

FileEditView

##### Props

FillLarge

Variant 

SolidMinimalOutlinedOpen dropdown

Vertical

Align text 

StartCenterEnd

Size 

SmallMediumLarge

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/buttonGroupPopoverExample.tsx)

## Interactive Playground

QueriesFunctionsOptions

##### Props

FillLargeVertical

Variant 

SolidMinimalOutlinedOpen dropdown

Align text 

StartCenterEnd

Size 

SmallMediumLarge

Intent  

NonePrimarySuccessWarningDangerOpen dropdown

##### Example

Icons only

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/buttonGroupPlaygroundExample.tsx)

## Props interface

interface ButtonGroupProps extends [Props](#api/Props), [HTMLDivProps](#api/HTMLDivProps)<>, RefAttributes<HTMLDivElement>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/button/buttonGroup.tsx#L23)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `alignText` | `Alignment` Text alignment within button. By default, icons and text will be centered within the button. Passing `"start"` or `"end"` will align the button text to that side and push `icon` and `endIcon` to either edge. Passing `"center"` will center the text and icons together. |
| `children` | `ReactNode` Buttons in this group.  Required |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `fill` | `booleanfalse` Whether the button group should take up the full width of its container. |
| `large` | `booleanfalse` Whether the child buttons should appear with large styling.  Deprecated |
| `minimal` | `booleanfalse` Whether the child buttons should appear with minimal styling.  Deprecated |
| `outlined` | `booleanfalse` Whether the child buttons should use outlined styles.  Deprecated |
| `size` | `Size"medium"` The size of the child buttons. |
| `variant` | `ButtonVariant"solid"` Visual style variant for the child buttons. |
| `vertical` | `booleanfalse` Whether the button group should appear with vertical styling. |

## CSS API

##### Deprecated API: use [`<ButtonGroup>`](#core/components/button-group)

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

Arrange multiple buttons in a group by wrapping them in `.bp5-button-group`.
You can apply sizing directly on the button group container element.

You should implement interactive segmented controls as button groups.

Save

Queries
Functions
Options

`.bp5-fill`

Buttons expand equally to fill container

`.bp5-large`

Use large buttons

`.bp5-minimal`

Use minimal buttons

`.bp5-outlined`

Use outlined buttons

`.bp5-vertical`

Vertical layout

```
<div class="bp5-button-group {{.modifier}}">  
  <button type="button" class="bp5-button bp5-intent-success">Save</button>  
  <button type="button" class="bp5-button bp5-intent-success bp5-icon-caret-down"></button>  
</div>  
<div class="bp5-button-group {{.modifier}}">  
  <a class="bp5-button bp5-icon-database" tabindex="0" role="button">Queries</a>  
  <a class="bp5-button bp5-icon-function" tabindex="0" role="button">Functions</a>  
  <a class="bp5-button" tabindex="0" role="button">  
    Options <span class="bp5-icon-standard bp5-icon-caret-down bp5-align-right"></span>  
  </a>  
</div>  
<div class="bp5-button-group {{.modifier}}">  
  <a class="bp5-button bp5-icon-chart" tabindex="0" role="button"></a>  
  <a class="bp5-button bp5-icon-control" tabindex="0" role="button"></a>  
  <a class="bp5-button bp5-icon-graph" tabindex="0" role="button"></a>  
  <a class="bp5-button bp5-icon-camera" tabindex="0" role="button"></a>  
  <a class="bp5-button bp5-icon-map" tabindex="0" role="button"></a>  
  <a class="bp5-button bp5-icon-code" tabindex="0" role="button"></a>  
  <a class="bp5-button bp5-icon-th" tabindex="0" role="button"></a>  
  <a class="bp5-button bp5-icon-time" tabindex="0" role="button"></a>  
  <a class="bp5-button bp5-icon-compressed" tabindex="0" role="button"></a>  
</div>  

```