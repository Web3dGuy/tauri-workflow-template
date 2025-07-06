# File input

**FileInput** is a lightweight wrapper around a `<label>` container element which contains an `<input type="file">`.

Choose file...

##### Props

Text

Button text

Size 

SmallMediumLarge

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/fileInputExample.tsx)

## Usage

```
<FileInput disabled={true} text="Choose file..." onInputChange={...} />  

```

##### Static file name

File name does not automatically update after a user selects a file.
To get this behavior, you must update the `text` prop.

## Props interface

**FileInput** supports the full range of HTML `<label>` DOM attributes.
Use `inputProps` to forward props to the `<input>` element.

interface FileInputProps extends LabelHTMLAttributes<HTMLLabelElement>, [Props](#api/Props)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/forms/fileInput.tsx#L24)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `buttonText` | `string"Browse"` The button text to display on the right side of the input. |
| `disabled` | `boolean` Whether the file input is non-interactive. Setting this to `true` will automatically disable the child input too. |
| `fill` | `boolean` Whether the file input should take up the full width of its container. |
| `hasSelection` | `booleanfalse` Whether the user has made a selection in the input. This will affect the component's text styling. Make sure to set a non-empty value for the text prop as well. |
| `inputProps` | `HTMLProps<HTMLInputElement>` The props to pass to the child input. `disabled` will be ignored in favor of the top-level prop. `type` will be ignored, because the input *must* be `type="file"`. Pass `onChange` here to be notified when the user selects a file. |
| `large` | `booleanfalse` Whether the file input should appear with large styling.  Deprecated |
| `onInputChange` | `FormEventHandler<HTMLInputElement>` Callback invoked on `<input>` `change` events.  This callback is offered as a convenience; it is equivalent to `inputProps.onChange`.  **Note:** The top-level `onChange` prop is passed to the `<label>` element rather than the `<input>`, which may not be what you expect. |
| `size` | `Size` The size of the file input. |
| `small` | `booleanfalse` Whether the file input should appear with small styling.  Deprecated |
| `text` | `ReactNode"Choose file..."` The text to display inside the input. |

## CSS API

##### Deprecated API: use [`<FileInput>`](#core/components/forms/file-input)

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

Use the standard `input type="file"` along with a `span` with class `bp5-file-upload-input`.
Wrap that all in a `label` with class `bp5-file-input`.

Choose file...

`:disabled`

Disabled

`.bp5-large`

Larger size

`.bp5-small`

Smaller size

`.bp5-fill`

Take up full width of parent element

`.bp5-file-input-has-selection`

User has made a selection

```
<label class="bp5-file-input {{.modifier}}">  
  <input type="file" {{:modifier}}/>  
  <span class="bp5-file-upload-input">Choose file...</span>  
</label>  

```