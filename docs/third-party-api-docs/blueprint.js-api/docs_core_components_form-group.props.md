# Form group

Form groups support more complex form controls than [simple labels](#core/components/label),
such as [control groups](#core/components/control-group) or [`NumericInput`](#core/components/numeric-input).
They also support additional helper text to aid with user navigation.

Label (required)

Label (required)

Engage the hyperdriveInitiate thrusters

##### Props

DisabledFillInlineShow helper textShow labelShow label infoShow sub label

Intent  

NonePrimarySuccessWarningDangerOpen dropdown

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/formGroupExample.tsx)

## Props

This component is a lightweight wrapper around its children with props for the
label above and helper text below.

```
<FormGroup helperText="Helper text with details..." label="Label A" labelFor="text-input" labelInfo="(required)">  
    <InputGroup id="text-input" placeholder="Placeholder text" />  
</FormGroup>  

```

interface FormGroupProps extends [IntentProps](#api/IntentProps), [Props](#api/Props)<>, [HTMLDivProps](#api/HTMLDivProps)<>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/forms/formGroup.tsx#L23)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `children` | `ReactNode` Group contents. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `contentClassName` | `string` A space-delimited list of class names to pass along to the `Classes.FORM_CONTENT` element that contains `children`. |
| `disabled` | `boolean` Whether form group should appear as non-interactive. Remember that `input` elements must be disabled separately. |
| `fill` | `boolean` Whether the component should take up the full width of its container. |
| `helperText` | `ReactNode` Optional helper text. The given content will be wrapped in `Classes.FORM_HELPER_TEXT` and displayed beneath `children`. Helper text color is determined by the `intent`. |
| `inline` | `boolean` Whether to render the label and children on a single line. |
| `intent` | `Intent` Visual intent to apply to helper text and sub label. Note that child form elements need to have their own intents applied independently. |
| `label` | `ReactNode` Label of this form group. |
| `labelFor` | `string` `id` attribute of the labelable form element that this `FormGroup` controls, used as `<label for>` attribute. |
| `labelInfo` | `ReactNode` Optional secondary text that appears after the label. |
| `style` | `CSSProperties` CSS properties to apply to the root element. |
| `subLabel` | `ReactNode` Optional text for `label`. The given content will be wrapped in `Classes.FORM_GROUP_SUB_LABEL` and displayed beneath `label`. |

## CSS

* Link each label to its respective control element with a `for={#id}` attribute on the `<label>` and `id={#id}` on the control.
* Add `.bp5-intent-*` or `.bp5-disabled` to `.bp5-form-group` to style the label and helper text. Similar to labels, nested controls need to be styled separately.
* Add `.bp5-inline` to `.bp5-form-group` to place the label to the left of the control.
* Add `.bp5-large` to `.bp5-form-group` to align the label when used with large inline Blueprint controls.

Label
(required)

Please enter a value

`:disabled`

Disable the input.

`.bp5-disabled`

Disabled styles. Input must be disabled separately via attribute.

`.bp5-inline`

Label and content appear side by side.

`.bp5-intent-primary`

Apply intent to form group and input separately.

```
<div class="bp5-form-group {{.modifier}}">  
  <label class="bp5-label" for="form-group-input">  
    Label  
    <span class="bp5-text-muted">(required)</span>  
  </label>  
  <div class="bp5-form-content">  
    <div class="bp5-input-group {{.modifier}}">  
      <span class="bp5-icon bp5-icon-calendar"></span>  
      <input id="form-group-input" type="text" {{:modifier}} class="bp5-input"  
             style="width: 200px;" placeholder="Placeholder text" dir="auto" />  
    </div>  
    <div class="bp5-form-helper-text">Please enter a value</div>  
  </div>  
</div>  

```