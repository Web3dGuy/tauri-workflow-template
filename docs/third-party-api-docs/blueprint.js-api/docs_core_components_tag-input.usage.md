# Tag input

**TagInput** displays [**Tag**](#core/components/tag) elements inside an input, followed by an interactive text input.
The container is styled to look like a Blueprint input; the actual editable element appears after the last tag.
Clicking anywhere on the container will focus the text input.

**Albert**Bar*thol*omewCasper

##### Appearance props

LargeDisabledLeft iconFill container width

Intent 

NonePrimarySuccessWarningDangerOpen dropdown

##### Behavior props

Add on blurAdd on pasteAuto resize

##### Tag props

Use minimal tagsCycle through intents

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/tagInputExample.tsx)

##### Looking for a dropdown menu?

[The **MultiSelect** component in the **@blueprintjs/select** package](#select/multi-select)
composes this component with a dropdown menu.

## Usage

**TagInput** must be controlled, which means the `values` prop is required and event handlers are strongly suggested.
Typing in the input and pressing `Enter` will **add new items** by invoking callbacks. If `addOnBlur` is
set to `true`, clicking outside of the component will also trigger the callback to add new items. A `separator` prop is
supported to allow multiple items to be added at once; the default splits on commas and newlines.

**Tags** may be removed by clicking their  buttons or by pressing
either `backspace` or `delete` repeatedly. Pressing `delete` mimics the behavior of deleting
in a text editor, where trying to delete at the end of the line will do nothing. Arrow keys can also be used to focus
on a particular tag before removing it. The cursor must be at the beginning of the text input for these interactions.

**Tag** appearance can be customized with `tagProps`: supply an object to apply the same props to every tag, or supply
a callback to apply dynamic props per tag. Tag `values` must be an array of strings so you may need a transformation
step between your state and these props.

**TagInput** provides granular `onAdd` and `onRemove` **event props** which are passed the added or removed items in
response to the user interactions above. It also provides `onChange`, which combines both events and is passed the
updated `values` array, with new items appended to the end and removed items filtered away.

The `<input>` element can be controlled directly via the `inputValue` and `onInputChange` props. Additional properties
(such as custom event handlers) can be forwarded to the input via `inputProps`.

##### Handling long words

Set an explicit `width` on the container element to cause long tags to wrap onto multiple lines.
Either supply a specific pixel value, or use `<TagInput className={Classes.FILL}>`
to fill its container's width (try this in the example above).

##### Disabling a tag input

Disabling this component requires setting the `disabled` prop to `true`
and separately disabling the component's `rightElement` as appropriate
(because `TagInput` accepts any `React.JSX.Element` as its `rightElement`).

## Props interface

interface TagInputProps extends [IntentProps](#api/IntentProps), [Props](#api/Props)<>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/tag-input/tagInput.tsx#L46)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `addOnBlur` | `booleanfalse` If true, `onAdd` will be invoked when the input loses focus. Otherwise, `onAdd` is only invoked when `enter` is pressed. |
| `addOnPaste` | `booleantrue` If true, `onAdd` will be invoked when the user pastes text containing the `separator` into the input. Otherwise, pasted text will remain in the input.  **Note:** For example, if `addOnPaste=true` and `separator="\n"` (new line), then:   * Pasting `"hello"` will *not* invoke `onAdd` * Pasting `"hello\n"` will invoke `onAdd` with `["hello"]` * Pasting `"hello\nworld"` will invoke `onAdd` with   `["hello", "world"]` |
| `autoResize` | `booleanfalse` Whether the component should automatically resize as a user types in the text input. This will have no effect when `fill={true}`. |
| `children` | `ReactNodeundefined` Optional child elements which will be rendered between the selected tags and the text input. Rendering children is usually unnecessary. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `disabled` | `booleanfalse` Whether the component is non-interactive. Note that you'll also need to disable the component's `rightElement`, if appropriate. |
| `fill` | `boolean` Whether the tag input should take up the full width of its container. |
| `inputProps` | `HTMLInputProps` React props to pass to the `<input>` element. Note that `ref` and `key` are not supported here; use `inputRef` below. Also note that `inputProps.style.width` will be overriden if `autoResize={true}`. |
| `inputRef` | `Ref<HTMLInputElement>` Ref handler for the `<input>` element. |
| `inputValue` | `string` Controlled value of the `<input>` element. This is shorthand for `inputProps={{ value }}`. |
| `intent` | `Intent` Visual intent color to apply to element.  Inherited from `IntentProps.intent` |
| `large` | `booleanfalse` Whether the tag input should use a large size.  Deprecated |
| `leftIcon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon (or an icon element) to render on the left side of the input. |
| `onAdd` | `(values: string[], method: TagInputAddMethod) => boolean | void` Callback invoked when new tags are added by the user pressing `enter` on the input. Receives the current value of the input field split by `separator` into an array. New tags are expected to be appended to the list.  The input will be cleared after `onAdd` is invoked *unless* the callback explicitly returns `false`. This is useful if the provided `value` is somehow invalid and should not be added as a tag. |
| `onChange` | `(values: ReactNode[]) => boolean | void` Callback invoked when new tags are added or removed. Receives the updated list of `values`: new tags are appended to the end of the list, removed tags are removed at their index.  Like `onAdd`, the input will be cleared after this handler is invoked *unless* the callback explicitly returns `false`.  This callback essentially implements basic `onAdd` and `onRemove` functionality and merges the two handlers into one to simplify controlled usage. ``` |
| `onInputChange` | `FormEventHandler<HTMLInputElement>` Callback invoked when the value of `<input>` element is changed. This is shorthand for `inputProps={{ onChange }}`. |
| `onKeyDown` | `(event: KeyboardEvent<HTMLElement>, index?: number) => void` Callback invoked when the user depresses a keyboard key. Receives the event and the index of the active tag (or `undefined` if focused in the input). |
| `onKeyUp` | `(event: KeyboardEvent<HTMLElement>, index?: number) => void` Callback invoked when the user releases a keyboard key. Receives the event and the index of the active tag (or `undefined` if focused in the input). |
| `onRemove` | `(value: ReactNode, index: number) => void` Callback invoked when the user clicks the X button on a tag. Receives value and index of removed tag. |
| `placeholder` | `string` Input placeholder text which will not appear if `values` contains any items (consistent with default HTML input behavior). Use `inputProps.placeholder` if you want the placeholder text to *always* appear.  If you define both `placeholder` and `inputProps.placeholder`, then the former will appear when `values` is empty and the latter at all other times. |
| `rightElement` | `Element` Element to render on right side of input. For best results, use a small spinner or minimal button (button height will adjust if `TagInput` uses large styles). Other elements will likely require custom styles for correct positioning. |
| `separator` | `string | false | RegExp/[,\n\r]/` Separator pattern used to split input text into multiple values. Default value splits on commas and newlines. Explicit `false` value disables splitting (note that `onAdd` will still receive an array of length 1). |
| `size` | `NonSmallSize"medium"` The size of the tag input. |
| `tagProps` | `TagProps | (value: ReactNode, index: number) => TagProps<>` React props to pass to each `Tag`. Provide an object to pass the same props to every tag, or a function to customize props per tag.  If you define `onRemove` here then you will have to implement your own tag removal handling as `TagInput`'s own `onRemove` handler will never be invoked. |
| `values` | `readonly ReactNode[]` Controlled tag values. Each value will be rendered inside a `Tag`, which can be customized using `tagProps`. Therefore, any valid React node can be used as a `TagInput` value; falsy values will not be rendered.  Required |