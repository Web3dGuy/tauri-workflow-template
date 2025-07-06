# Text area

**TextArea** is a multiline text input component which can be controlled similar to an
[**InputGroup**](#core/components/input-group) component or `<input>` element.

In a galaxy far, far away...

##### Appearance props

Intent 

NonePrimarySuccessWarningDangerOpen dropdown

Size 

SmallMediumLarge

##### Behavior props

DisabledRead-only

Auto resize

Controlled usage

Insert more text

##### Deprecated props

Grow vertically

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/textAreaExample.tsx)

## Props interface

interface TextAreaProps extends [IntentProps](#api/IntentProps), [Props](#api/Props)<>, TextareaHTMLAttributes<HTMLTextAreaElement>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/forms/textArea.tsx#L26)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `asyncControl` | `booleanfalse` Set this to `true` if you will be controlling the `value` of this input with asynchronous updates. These may occur if you do not immediately call setState in a parent component with the value from the `onChange` handler, or if working with certain libraries like **redux-form**. |
| `autoResize` | `booleanfalse` Whether the component should automatically resize vertically as a user types in the text input. This will disable manual resizing in the vertical dimension. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `fill` | `booleanfalse` Whether the text area should take up the full width of its container. |
| `growVertically` | `boolean` Whether the text area should automatically grow vertically to accomodate content.  Deprecated |
| `inputRef` | `Ref<HTMLTextAreaElement>` Ref handler that receives HTML `<textarea>` element backing this component. |
| `intent` | `Intent` Visual intent color to apply to element.  Inherited from `IntentProps.intent` |
| `large` | `booleanfalse` Whether the text area should appear with large styling.  Deprecated |
| `size` | `Size"medium"` The size styling of the text area. |
| `small` | `booleanfalse` Whether the text area should appear with small styling.  Deprecated |

## CSS API

##### Deprecated API: use [`<TextArea>`](#core/components/text-area)

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

Apply `Classes.INPUT` to a `<textarea>` element.

`:disabled`

Disabled

`:readonly`

Readonly

`.bp5-large`

Larger font size

`.bp5-small`

Small font size

`.bp5-intent-primary`

Primary intent

`.bp5-intent-danger`

Danger intent

`.bp5-fill`

Take up full width of parent element

```
<textarea class="bp5-input {{.modifier}}" {{:modifier}} dir="auto"></textarea>  

```