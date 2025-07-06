# Progress bar

**ProgressBar** indicates progress towards the completion of a task or an indeterminate loading state.

##### Props

Intent 

NonePrimarySuccessWarningDangerOpen dropdown

Known value

0.0

1.0

0.7

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/progressExample.tsx)

## Props interface

**ProgressBar** is a simple stateless component that renders the appropriate HTML markup. It supports a `value` prop
between 0 and 1 that determines the width of the progress meter. Omitting `value` will result in an "indeterminate"
progress meter that fills the entire bar.

interface ProgressBarProps extends [Props](#api/Props), [IntentProps](#api/IntentProps)<>, [HTMLDivProps](#api/HTMLDivProps)<>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/progress-bar/progressBar.tsx#L24)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `animate` | `booleantrue` Whether the background should animate. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `intent` | `Intent` Visual intent color to apply to element.  Inherited from `IntentProps.intent` |
| `stripes` | `booleantrue` Whether the background should be striped. |
| `value` | `number` A value between 0 and 1 (inclusive) representing how far along the operation is. Values below 0 or above 1 will be interpreted as 0 or 1, respectively. Omitting this prop will result in an "indeterminate" progress meter that fills the entire bar. |

## CSS API

##### Deprecated API: use [`<ProgressBar>`](#core/components/progress-bar)

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

Set the current progress of the bar via a `width` style rule on the inner `.bp5-progress-meter` element. This is a very
simple CSS-only component, and input validation for `width` values is limited: values above `100%` appear as 100%
progress and values below `0%` appear as 0%.

Omitting `width` will result in an "indeterminate" progress meter that fills the entire bar.

`.bp5-no-stripes`

No stripes

`.bp5-no-animation`

No animation

```
<div class="bp5-progress-bar {{.modifier}}">  
  <div class="bp5-progress-meter" style="width: 25%"></div>  
</div>  
<div class="bp5-progress-bar bp5-intent-primary {{.modifier}}">  
  <div class="bp5-progress-meter" style="width: 50%"></div>  
</div>  
<div class="bp5-progress-bar bp5-intent-success {{.modifier}}">  
  <div class="bp5-progress-meter" style="width: 75%"></div>  
</div>  
<div class="bp5-progress-bar bp5-intent-danger {{.modifier}}">  
  <div class="bp5-progress-meter" style="width: 100%"></div>  
</div>  

```