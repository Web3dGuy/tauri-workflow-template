# Input group

**InputGroup** is basic building block used to render text inputs across many Blueprint components.
This component allows you to optionally add icons and buttons *within* a text input to expand its appearance and
functionality. For example, you might use an input group to build a visibility toggle for a password field.

10000

can edit

##### Props

DisabledRead-only

Size 

SmallMediumLarge

Intent 

NonePrimarySuccessWarningDangerOpen dropdown

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/inputGroupExample.tsx)

## Usage

**InputGroup** supports one non-interactive icon on the left side and one arbitrary element on the right side.
It measures the width of its child elements to create the appropriate right padding inside the input to accommodate
content of any length.

**InputGroup** should be used like a standard React `<input>` element, either in a controlled or uncontrolled fashion.
In addition to its own props, it supports all valid `<input>` HTML attributes and forwards them to the DOM
(the most common ones are detailed below).

If controlled with the `value` prop, **InputGroup** has support for *asynchronous updates*, which may occur with some
form handling libraries like `redux-form`. This is not broadly encouraged (a value returned from `onChange` should be
sent back to the component as a controlled `value` synchronously), but there is basic support for it using the
`asyncControl` prop. Note that the input cursor may jump to the end of the input if the speed of text entry
(time between change events) is faster than the speed of the async update.

For *multiline text*: use [**TextArea**](#core/components/text-area) instead.

## Props interface

interface InputGroupProps extends Omit<[HTMLInputProps](#api/HTMLInputProps), keyof ControlledInputValueProps | "size">, ControlledInputValueProps, InputSharedProps<>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/forms/inputGroup.tsx#L36)

| Props | Description |
| --- | --- |
| `asyncControl` | `booleanfalse` Set this to `true` if you will be controlling the `value` of this input with asynchronous updates. These may occur if you do not immediately call setState in a parent component with the value from the `onChange` handler, or if working with certain libraries like **redux-form**. |
| `defaultValue` | `string` Initial value for uncontrolled usage. Mutually exclusive with `value` prop.  Inherited from `ControlledInputValueProps.defaultValue` |
| `fill` | `boolean` Whether the component should take up the full width of its container.  Inherited from `InputSharedProps.fill` |
| `inputClassName` | `string` Class name to apply to the `<input>` element (not the InputGroup container).  Inherited from `InputSharedProps.inputClassName` |
| `inputRef` | `Ref<HTMLInputElement>` Ref attached to the HTML `<input>` element backing this component.  Inherited from `InputSharedProps.inputRef` |
| `inputSize` | `number` Alias for the native HTML input `size` attribute. see: <https://developer.mozilla.org/en-US/docs/Web/API/HTMLInputElement/size> |
| `intent` | `Intent` Visual intent color to apply to element.  Inherited from `InputSharedProps.intent` |
| `large` | `booleanfalse` Whether this input should use large styles.  Deprecated |
| `leftElement` | `Element` Element to render on the left side of input. This prop is mutually exclusive with `leftIcon`.  Inherited from `InputSharedProps.leftElement` |
| `leftIcon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon to render on the left side of the input group, before the user's cursor.  This prop is mutually exclusive with `leftElement`.  Note: setting a React.JSX.Element here is deprecated; use the `leftElement` prop instead.  Inherited from `InputSharedProps.leftIcon` |
| `onValueChange` | `(value: string, targetElement: null | HTMLInputElement) => void` Callback invoked when the component value changes, typically via user interaction, in both controlled and uncontrolled mode.  Using this prop instead of `onChange` can help avoid common bugs in React 16 related to Event Pooling where developers forget to save the text value from a change event or call `event.persist()`.  See: [object Object]  Inherited from `ControlledInputValueProps.onValueChange` |
| `rightElement` | `Element` Element to render on right side of input. For best results, use a minimal button, tag, or small spinner.  Inherited from `InputSharedProps.rightElement` |
| `round` | `boolean` Whether the input (and any buttons) should appear with rounded caps. |
| `size` | `number | Size"medium"` Size of the input. If given a numeric value, and `inputSize` is not defined, then this will be provided as the `size` attribute for the underyling native HTML input element. Passing a numeric value this way is deprecated, use the `inputSize` prop instead. |
| `small` | `booleanfalse` Whether this input should use small styles.  Deprecated |
| `tagName` | `keyof IntrinsicElements"div"` Name of the HTML tag that contains the input group. |
| `type` | `string"text"` HTML `input` type attribute. |
| `value` | `string` Controlled value. Mutually exclusive with `defaultValue` prop.  Inherited from `ControlledInputValueProps.value` |

## Search input

Apply the attribute `type="search"` to style a text input as a search field. This styling is equivalent
to what is applied using the `Classes.ROUND` modifier class—it is automatically applied for `[type="search"]`
inputs.

Note that some browsers also implement a handler for the `esc` key to clear the text in a search field.

##### Props

DisabledRead-only

Size 

SmallMediumLarge

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/searchInputExample.tsx)

## CSS API

##### Deprecated API: use [`<InputGroup>`](#core/components/input-group)

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

Note that you cannot use buttons with text in the CSS API for input groups. The padding for text inputs
in CSS cannot accommodate buttons whose width varies due to text content.

#### `.bp5-input-group`

You can place a single `.bp5-icon` or `.bp5-button.bp5-icon-*` on either end of the input. The order is
dictated by the HTML markup: an element specified before the `input` appears on the left edge, and
vice versa. You do not need to apply sizing classes to the children—they inherit the size of
the parent input.

`:disabled`

Disabled input. Must be added separately to the `<input>` and `<button>`. Also add `.bp5-disabled` to `.bp5-input-group` for icon coloring (not shown below).

`.bp5-round`

Rounded caps. Button will also be rounded.

`.bp5-large`

Large group. Children will adjust size accordingly.

`.bp5-small`

Small group. Children will adjust size accordingly.

`.bp5-intent-primary`

Primary intent. (All 4 intents are supported.)

`.bp5-fill`

Take up full width of parent element.

```
<div class="bp5-input-group {{.modifier}}">  
  <span class="bp5-icon bp5-icon-filter"></span>  
  <input type="text" class="bp5-input" {{:modifier}} placeholder="Filter histogram..." />  
</div>  
<div class="bp5-input-group {{.modifier}}">  
  <input type="password" class="bp5-input" {{:modifier}} placeholder="Enter your password..." />  
  <button class="bp5-button bp5-minimal bp5-intent-warning bp5-icon-lock" {{:modifier}}></button>  
</div>  
<div class="bp5-input-group {{.modifier}}">  
  <span class="bp5-icon bp5-icon-search"></span>  
  <input type="text" class="bp5-input" {{:modifier}} placeholder="Search" />  
  <button class="bp5-button bp5-minimal bp5-intent-primary bp5-icon-arrow-right" {{:modifier}}></button>  
</div>  

```

#### `.bp5-input`

Apply `Classes.INPUT` on an `input[type="text"]`. You should also specify `dir="auto"`
[to better support RTL languages](http://www.w3.org/International/questions/qa-html-dir#dirauto)
(in all browsers except Internet Explorer).

`:disabled`

Disabled

`:readonly`

Readonly

`.bp5-round`

Rounded ends

`.bp5-large`

Larger size

`.bp5-small`

Small size

`.bp5-intent-primary`

Primary intent

`.bp5-intent-success`

Success intent

`.bp5-intent-warning`

Warning intent

`.bp5-intent-danger`

Danger intent

`.bp5-fill`

Take up full width of parent element

```
<input class="bp5-input {{.modifier}}" {{:modifier}} type="text" placeholder="Text input" dir="auto" />  

```