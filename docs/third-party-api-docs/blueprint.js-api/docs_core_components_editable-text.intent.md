# Editable text

**EditableText** is an interactive component that displays as static text but
visually resembles an input field on hover. When clicked or focused,
it transforms into a text input, allowing for inline text editing.

The text input inherits font styling from its parent elements, making for a
seamless transition between reading and editing text. **EditableText** is ideal
for inline renaming, editable descriptions, or simple text updates. You should
not use **EditableText** when a more static, always-editable [**InputGroup**](#core/components/input-group)
or [**TextArea**](#core/components/text-area) component would suffice.

## Import

```
import { EditableText } from "@blueprintjs/core";  

```

## Usage

**EditableText** can be used in both controlled and uncontrolled modes, similar
to a standard React [`<input>` element](https://react.dev/reference/react-dom/components/input).
Use the `value` prop for controlled usage, and `defaultValue` for uncontrolled usage. Use `onChange` to listen to
ongoing updates and use `onConfirm` and `onCancel` to listen only to completed or canceled edits.

The `onConfirm` callback is invoked when a user presses `Enter`
(or `Mod + Enter` when multiline) or when the user blurs the input.
The `onCancel` callback is invoked when user presses `Escape`.
Canceling resets the field to the last confirmed value. Neither callback is
invoked if the value is unchanged.

Click to edit...

```
<EditableText placeholder="Click to edit..." onConfirm={...} onCancel={...} />  

```

##### Centering EditableText

**Do not center this component** using `text-align: center`, as it will cause an infinite loop
in the browser ([more details](https://github.com/JedWatson/react-select/issues/540)). Instead,
you should center the component via flexbox or with `position` and `transform: translateX(-50%)`.

## Multiline mode

By default, **EditableText** supports a single line of text and resizes horizontally as needed.
Enabling the `multiline` prop transforms it into a `<textarea>`, which grows and shrinks vertically
as content changes. Use the `minLines` and `maxLines` props to constrain the height of the component.

Users may confirm text in multiline mode by pressing `Ctrl + Enter` or `Command + Enter` rather than
`Enter`. Pressing the `Enter` key by itself moves the cursor to the next line. This behavior
can be inverted with the `confirmOnEnterKey` prop.

Click to edit multiple lines...

```
<EditableText multiline={true} minLines={3} maxLines={5} placeholder="Click to edit multiple lines..." />  

```

## Intent

The `intent` prop controls the visual appearance of **EditableText**, similar to
[**InputGroup**](#core/components/input-group) and [**TextArea**](#core/components/text-area).
This prop is useful for highlighting states like success, warnings, or errors.

* **Primary** – Indicates primary action or highlight.
* **Success** – Represents a positive outcome or confirmation.
* **Warning** – Warns about potential issues.
* **Danger** – Highlights an error or critical issue.

Primary editable text...

Success editable text...

Warning editable text...

Danger editable text...

```
<EditableText intent="primary" placeholder="Primary editable text..." />  
<EditableText intent="success" placeholder="Success editable text..." />  
<EditableText intent="warning" placeholder="Warning editable text..." />  
<EditableText intent="danger" placeholder="Danger editable text..." />  

```

## Select text on focus

Enable `selectAllOnFocus` to automatically select all text when the input is focused.

Click to select this text.

```
<EditableText selectAllOnFocus={true} value="Click to select this text." />  

```

## Interactive Playground

# Edit title...

Edit report... (controlled, multiline)

##### Props

Intent 

NonePrimarySuccessWarningDangerOpen dropdown

Max length

DisabledSelect all on focusSwap keypress for confirm and newline (multiline only)Always render input

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/editableTextPlaygroundExample.tsx)

## Props interface

interface EditableTextProps extends [IntentProps](#api/IntentProps), [Props](#api/Props)<>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/editable-text/editableText.tsx#L24)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `alwaysRenderInput` | `booleanfalse` EXPERIMENTAL FEATURE.  When true, this forces the component to *always* render an editable input (or textarea) both when the component is focussed and unfocussed, instead of the component's default behavior of switching between a text span and a text input upon interaction.  This behavior can help in certain applications where, for example, a custom right-click context menu is used to supply clipboard copy and paste functionality. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `confirmOnEnterKey` | `booleanfalse` If `true` and in multiline mode, the `enter` key will trigger onConfirm and `mod+enter` will insert a newline. If `false`, the key bindings are inverted such that `enter` adds a newline. |
| `contentId` | `string` ID attribute to pass to the underlying element that contains the text contents. This allows for referencing via aria attributes |
| `defaultValue` | `string` Default text value of uncontrolled input. |
| `disabled` | `booleanfalse` Whether the text can be edited. |
| `elementRef` | `Ref<HTMLDivElement>` Ref to attach to the root element rendered by this component.  N.B. this may be renamed to simply `ref` in a future major version of Blueprint, when this class component is refactored into a function. |
| `intent` | `Intent` Visual intent color to apply to element.  Inherited from `IntentProps.intent` |
| `isEditing` | `boolean` Whether the component is currently being edited. |
| `maxLength` | `number` Maximum number of characters allowed. Unlimited by default. |
| `maxLines` | `number` Maximum number of lines before scrolling begins, when `multiline`. |
| `minLines` | `number1` Minimum number of lines (essentially minimum height), when `multiline`. |
| `minWidth` | `number` Minimum width in pixels of the input, when not `multiline`. |
| `multiline` | `booleanfalse` Whether the component supports multiple lines of text. This prop should not be changed during the component's lifetime. |
| `onCancel` | `(value: string) => void` Callback invoked when user cancels input with the `esc` key. Receives last confirmed value. |
| `onChange` | `(value: string) => void` Callback invoked when user changes input in any way. |
| `onConfirm` | `(value: string) => void` Callback invoked when user confirms value with `enter` key or by blurring input. |
| `onEdit` | `(value: undefined | string) => void` Callback invoked after the user enters edit mode. |
| `placeholder` | `string"Click to Edit"` Placeholder text when there is no value. |
| `selectAllOnFocus` | `booleanfalse` Whether the entire text field should be selected on focus. If `false`, the cursor is placed at the end of the text. This prop is ignored on inputs with type other then text, search, url, tel and password. See <https://html.spec.whatwg.org/multipage/input.html#do-not-apply> for details. |
| `type` | `string` The type of input that should be shown, when not `multiline`. |
| `value` | `string` Text value of controlled input. |