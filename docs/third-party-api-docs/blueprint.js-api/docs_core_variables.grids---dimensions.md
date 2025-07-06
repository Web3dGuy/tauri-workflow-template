# Variables

Available for use with Sass and Less.

```
// Sass  
@import "path/to/@blueprintjs/core/lib/scss/variables";  

```
```
// Less  
@import "path/to/@blueprintjs/core/lib/less/variables";  

```

The Sass `$` convention is used in this documentation for consistency with the original source code.
Every variable mentioned below is also available in `variables.less` with an `@` prefix instead of `$`.

## Font variables

Typically, correct typography styles should be achieved by using the proper HTML tag (`<p>` for
text, `<h*>` for headings, `<code>` for code, etc.). The following variables are provided for the
rare cases where custom styling is necessary and should be used sparingly:

* `$pt-font-family`
* `$pt-font-family-monospace`
* `$pt-font-size`
* `$pt-font-size-small`
* `$pt-font-size-large`
* `$pt-line-height`

## Icon variables

Most icons should be displayed using the `<Icon>` component from `@blueprintjs/icons` or the
`icon` and `iconName` prop APIs available on many Blueprint components. These APIs have the advantage
of rendering SVGs directly onto the page.

In some cases you may use the icon fonts instead with the CSS API targeting selectors of the kind
`span.bp5-icon-*` (be sure to include `.bp5-icon-standard` or `.bp5-icon-large` as well).

In rare cases, you may need direct access to the code points the icon font. Blueprint provides these
variables in Sass as a map and in TypeScript as an object (see the [Icons section](#icons) for the
full list of identifiers):

```
@import "@blueprintjs/icons/lib/scss/variables";  
  
.my-custom-icon {  
    content: map-get($blueprint-icon-codepoints, "tick");  
}  

```
```
import { getIconContentString } from "@blueprintjs/icons";  
  
document.querySelector(".my-custom-icon").style.content = getIconContentString("tick");  

```

Sass variables are also provided for the two icon font families and their pixel sizes:

* `$blueprint-icons-16`
* `$blueprint-icons-20`
* `$pt-icon-size-standard`
* `$pt-icon-size-large`

## Grids & dimensions

Sizes of common components. Most sizing variables are based on `$pt-grid-size`, which has
a value of `10px`. Custom components should adhere to the relevant `height` variable.

* `$pt-grid-size`
* `$pt-border-radius`
* `$pt-button-height`
* `$pt-button-height-large`
* `$pt-input-height`
* `$pt-input-height-large`
* `$pt-navbar-height`

### Grid system

Blueprint doesn't provide a grid system. In general, you should try to use the `$pt-grid-size`
variable to generate layout & sizing style rules in your CSS codebase.

In lieu of a full grid system, you should try to use the **CSS flexible box layout model** (a.k.a.
"flexbox"). It's quite powerful on its own and allows you to build robust, responsive layouts
without writing much CSS. Here are some resources for learning flexbox:

## Layering

Blueprint provides variables for three z-index layers. This should be enough for most use cases,
especially if you make correct use of [stacking context](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Positioning/Understanding_z_index/The_stacking_context). [Overlay2](#core/components/overlay2)
components such as dialogs and popovers use these z-index values to configure their stacking
contexts.

* `$pt-z-index-base`
* `$pt-z-index-content`
* `$pt-z-index-overlay`

## Light theme styles

Use these when you need to build custom UI components that look similar to Blueprint's
light theme components.

* `$pt-dialog-box-shadow`
* `$pt-input-box-shadow`
* `$pt-popover-box-shadow`
* `$pt-tooltip-box-shadow`

## Dark theme styles

Use these when you need to build custom UI components that look similar to Blueprint's
dark theme components.

* `$pt-dark-dialog-box-shadow`
* `$pt-dark-input-box-shadow`
* `$pt-dark-popover-box-shadow`
* `$pt-dark-tooltip-box-shadow`

## Elevation drop shadows

Use these when you need to apply a drop shadow to custom UI components to simulate height.
These elevations correspond to those of the [Card](#core/components/card.elevation) component.

* `$pt-elevation-shadow-0`
* `$pt-elevation-shadow-1`
* `$pt-elevation-shadow-2`
* `$pt-elevation-shadow-3`
* `$pt-elevation-shadow-4`

Use these for drop shadows in dark theme.

* `$pt-dark-elevation-shadow-0`
* `$pt-dark-elevation-shadow-1`
* `$pt-dark-elevation-shadow-2`
* `$pt-dark-elevation-shadow-3`
* `$pt-dark-elevation-shadow-4`

## Color aliases

These variables are semantic aliases of our [colors](#core/colors).
They are used throughout Blueprint itself to ensure consistent color usage across components
and are available in the Sass or Less variables files.

|  | Variable | Description |
| --- | --- | --- |
|  | `$pt-intent-primary` | Primary intent color |
|  | `$pt-intent-success` | Success intent color |
|  | `$pt-intent-warning` | Warning intent color |
|  | `$pt-intent-danger` | Danger intent color |
|  | `$pt-app-background-color` | Application background color |
|  | `$pt-dark-app-background-color` | Dark theme application background color |
|  | `$pt-text-color` | Default text color |
|  | `$pt-text-color-muted` | Muted text color |
|  | `$pt-text-color-disabled` | Disabled text color |
|  | `$pt-heading-color` | Text color for headers |
|  | `$pt-link-color` | Text color for links |
|  | `$pt-dark-text-color` | Dark theme default text color |
|  | `$pt-dark-text-color-muted` | Dark theme muted text color |
|  | `$pt-dark-text-color-disabled` | Dark theme disabled text color |
|  | `$pt-dark-heading-color` | Dark theme text color for headers |
|  | `$pt-dark-link-color` | Dark theme text color for links |
|  | `$pt-text-selection-color` | Text selection color |
|  | `$pt-icon-color` | Default icon color |
|  | `$pt-icon-color-hover` | Hovered icon color |
|  | `$pt-icon-color-disabled` | Disabled icon color |
|  | `$pt-icon-color-selected` | Selected icon color |
|  | `$pt-dark-icon-color` | Dark theme default icon color |
|  | `$pt-dark-icon-color-hover` | Dark theme hovered icon color |
|  | `$pt-dark-icon-color-disabled` | Dark theme disabled icon color |
|  | `$pt-dark-icon-color-selected` | Dark theme selected icon color |
|  | `$pt-divider-black` | Black divider color |
|  | `$pt-dark-divider-black` | Dark theme black divider color |
|  | `$pt-dark-divider-white` | Dark theme white divider color |
|  | `$pt-code-text-color` | Code text color |
|  | `$pt-code-background-color` | Code background color |
|  | `$pt-dark-code-text-color` | Dark theme code text color |
|  | `$pt-dark-code-background-color` | Dark theme code background color |