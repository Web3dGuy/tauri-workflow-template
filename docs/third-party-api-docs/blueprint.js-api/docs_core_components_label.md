# Label

**Labels** enhance the usability of your forms.

Wrapping a `<label>` element around a form input effectively increases the area where the user can click to activate
the control. Notice how in the examples below, clicking a label focuses its `<input>`.

##### Prefer form groups over labels

The [**FormGroup** component](#core/components/form-group) provides additional functionality such as helper text and
modifier props as well as full label support. **FormGroup** supports both simple and complex use cases, therefore we
recommend using it exclusively when constructing forms.

## Usage

```
<Label>  
    Label A  
    <input className={Classes.INPUT} placeholder="Placeholder text" />  
</Label>  
  
<Label htmlFor="input-b">Label B</Label>  
<input className={Classes.INPUT} id="input-b" placeholder="Placeholder text" />  

```

## Props

This component supports the full range of `<label>` DOM attributes.

## CSS API

##### Deprecated API: use [`<Label>`](#core/components/forms/label)

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

Simple labels are useful for basic forms for a single `<input>`.

Apply disabled styles with the `bp5-disabled` class. This styles the label text, but does not disable any nested
children like inputs or selects. You must add the `:disabled` attribute directly to any nested elements to disable them.
Similarly the respective `bp5-*` form control will need a `.bp5-disabled` modifier. See the examples below.

Label A
(optional)

Label B

Label C

Choose an item...
One

`:disabled`

Disable the input.

`.bp5-disabled`

Disabled styles. Input must be disabled separately via attribute.

`.bp5-inline`

Label and content appear side by side.

```
<div>  
  <label class="bp5-label {{.modifier}}">  
    Label A  
    <span class="bp5-text-muted">(optional)</span>  
    <input {{:modifier}} class="bp5-input" style="width: 200px;" type="text" placeholder="Text input" dir="auto" />  
  </label>  
  <label class="bp5-label {{.modifier}}">  
    Label B  
    <div class="bp5-input-group {{.modifier}}">  
      <span class="bp5-icon bp5-icon-calendar"></span>  
      <input {{:modifier}} class="bp5-input" style="width: 200px;" type="text" placeholder="Input group" dir="auto" />  
    </div>  
  </label>  
  <label class="bp5-label {{.modifier}}">  
    Label C  
    <div class="bp5-html-select {{.modifier}}">  
      <select {{:modifier}}>  
        <option selected>Choose an item...</option>  
        <option value="1">One</option>  
      </select>  
      <span class="bp5-icon bp5-icon-double-caret-vertical"></span>  
    </div>  
  </label>  
</div>  

```