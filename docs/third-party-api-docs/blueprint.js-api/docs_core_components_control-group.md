# Control group

A **ControlGroup** renders multiple distinct form controls as one unit, with a small margin between elements. It
supports any number of buttons, text inputs, input groups, numeric inputs, and HTML selects as direct children.

##### Control group vs. input group

Both components group multiple elements into a single unit, but their usage patterns are quite different.

Think of **ControlGroup** as a parent with multiple children, with each one a separate control.

Conversely, an [**InputGroup**](#core/components/input-group) is a single control, and should behave like
so. A button inside of an input group should only affect that input; if its reach is further, then it should be
promoted to live in a control group.

FilterName - ascendingName - descendingPrice - ascendingPrice - descendingOpen dropdown

FillVertical

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/controlGroupExample.tsx)

## Flex layout

**ControlGroup** is a CSS inline flex row (or column if vertical) and provides some modifer props for common flexbox
patterns:

* Enable the `fill` prop on a control group to make all controls expand equally to fill the available space.
  + Controls will expand horizontally by default, or vertically if the `vertical` prop is enabled.
  + Add the class `Classes.FIXED` to individual controls to revert them to their initial sizes.
* In addition, you may enable the `fill` prop on specific controls inside the group to expand them fill more space while other controls retain their original sizes.

You can adjust the specific size of a control with the `flex-basis` or `width` CSS properties.

## Usage

This component is a lightweight wrapper around its children. It supports all HTML `<div>` attributes in addition to
those listed in the props interface below.

```
<ControlGroup fill={true} vertical={false}>  
    <Button icon="filter">Filter</Button>  
    <InputGroup placeholder="Find filters..." />  
</ControlGroup>  

```

## Props interface

interface ControlGroupProps extends [Props](#api/Props), [HTMLDivProps](#api/HTMLDivProps)<>, RefAttributes<HTMLDivElement>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/forms/controlGroup.tsx#L23)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `children` | `ReactNode` Group contents. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `fill` | `booleanfalse` Whether the control group should take up the full width of its container. |
| `vertical` | `booleanfalse` Whether the control group should appear with vertical styling. |

## CSS

##### Deprecated API: use [`<ControlGroup>`](#core/components/control-group)

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

Note that `.bp5-control-group` does not cascade any modifiers to its children. For example, each
child must be marked individually as `.bp5-large` for uniform large appearance.

Filter

Filter...
Issues
Requests
Projects

can view

Add

$
€

chevron-up

chevron-down

```
<div class="bp5-control-group">  
  <button class="bp5-button bp5-icon-filter">Filter</button>  
  <input type="text" class="bp5-input" placeholder="Find filters..." />  
</div>  
<div class="bp5-control-group">  
  <div class="bp5-html-select">  
    <select>  
      <option selected>Filter...</option>  
      <option value="1">Issues</option>  
      <option value="2">Requests</option>  
      <option value="3">Projects</option>  
    </select>  
    <span class="bp5-icon bp5-icon-double-caret-vertical"></span>  
  </div>  
  <div class="bp5-input-group">  
    <span class="bp5-icon bp5-icon-search"></span>  
    <input type="text" class="bp5-input" value="from:ggray to:allorca" />  
  </div>  
</div>  
<div class="bp5-control-group">  
  <div class="bp5-input-group">  
    <span class="bp5-icon bp5-icon-people"></span>  
    <input type="text" class="bp5-input" placeholder="Find collaborators..." style="padding-right:94px" />  
    <div class="bp5-input-action">  
      <button class="bp5-button bp5-minimal bp5-intent-primary">  
        can view<span class="bp5-icon-standard bp5-icon-caret-down bp5-align-right"></span>  
      </button>  
    </div>  
  </div>  
  <button class="bp5-button bp5-intent-primary">Add</button>  
</div>  
<div class="bp5-control-group">  
  <div class="bp5-html-select">  
    <select>  
      <option selected value="dollar">$</option>  
      <option value="euro">€</option>  
    </select>  
    <span class="bp5-icon bp5-icon-double-caret-vertical"></span>  
  </div>  
  <div class="bp5-control-group bp5-numeric-input">  
    <div class="bp5-input-group">  
      <input type="text" autocomplete="off" class="bp5-input" style="padding-right: 10px;" value="1">  
    </div>  
    <div class="bp5-button-group bp5-vertical bp5-fixed">  
      <button type="button" class="bp5-button">  
        <span icon="chevron-up" class="bp5-icon bp5-icon-chevron-up">  
          <svg data-icon="chevron-up" width="16" height="16" viewBox="0 0 16 16"><desc>chevron-up</desc><path d="M12.71 9.29l-4-4C8.53 5.11 8.28 5 8 5s-.53.11-.71.29l-4 4a1.003 1.003 0 001.42 1.42L8 7.41l3.29 3.29c.18.19.43.3.71.3a1.003 1.003 0 00.71-1.71z" fill-rule="evenodd"></path></svg>  
        </span>  
      </button>  
      <button type="button" class="bp5-button">  
        <span icon="chevron-down" class="bp5-icon bp5-icon-chevron-down">  
          <svg data-icon="chevron-down" width="16" height="16" viewBox="0 0 16 16"><desc>chevron-down</desc><path d="M12 5c-.28 0-.53.11-.71.29L8 8.59l-3.29-3.3a1.003 1.003 0 00-1.42 1.42l4 4c.18.18.43.29.71.29s.53-.11.71-.29l4-4A1.003 1.003 0 0012 5z" fill-rule="evenodd"></path></svg>  
        </span>  
      </button>  
    </div>  
  </div>  
</div>  

```