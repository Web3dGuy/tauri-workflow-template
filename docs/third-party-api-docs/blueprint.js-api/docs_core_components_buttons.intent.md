# Buttons

A **Button** is a clickable element used to trigger actions or events. Buttons allow users to perform an action or navigate to another page with a single click. They are typically found in forms, toolbars, dialogs, and other areas where users need to make choices or initiate actions.

## Import

```
import { Button } from "@blueprintjs/core";  

```

## Usage

The `text` prop defines the label displayed on the button. Alternatively, content can be provided as children, allowing for more flexibility, such as including multiple elements or custom markup.

Click Me

```
<Button text="Click Me" />  

```

## Intent

The `intent` prop is used to visually communicate the purpose or importance of the action associated with a button. Blueprint provides several intent options to convey meaning through color:

* **Primary**: Indicates the main action and is usually styled more prominently.
* **Success**: Represents a positive outcome or confirmation.
* **Warning**: Used to alert users to potentially dangerous actions.
* **Danger**: Signifies a destructive or critical action.

PrimarySuccessWarningDanger

```
<Button text="Primary" intent="primary" />  
<Button text="Success" intent="success" />  
<Button text="Warning" intent="warning" />  
<Button text="Danger" intent="danger" />  

```

## Variant

Buttons come in three different variants that support different use cases:

* `solid` (the default) is useful for the primary action in a set of buttons.
* `minimal` is useful for subtle actions or secondary options that shouldn't draw too much attention.
* `outlined` provides a button with an outline, creating a middle ground between a prominent solid button and a subtle minimal button.

DefaultMinimalOutlined

```
<Button text="Default" />  
<Button text="Minimal" variant="minimal" />  
<Button text="Outlined" variant="outlined" />  

```

## Minimal

##### Deprecated: use [`variant`](#core/components/buttons.variant) instead

The `minimal` prop offers a button without borders or background, ideal for subtle actions or secondary options that shouldn't draw too much attention.

MinimalPrimaryDisabled

```
<Button text="Minimal" minimal={true} />  
<Button text="Primary" minimal={true} intent="primary" />  
<Button text="Disabled" minimal={true} disabled={true} />  

```

## Outlined

##### Deprecated: use [`variant`](#core/components/buttons.variant) instead

The `outlined` prop provides a button with an outline, creating a middle ground between a prominent default button and a subtle minimal button.

OutlinedPrimaryDisabled

```
<Button text="Outlined" outlined={true} />  
<Button text="Primary" outlined={true} intent="primary" />  
<Button text="Disabled" outlined={true} disabled={true} />  

```

## Size

The `size` prop allows for adjusting the size of a button to fit different use cases.

SmallMediumLarge

```
<Button text="Small" size="small"/>  
<Button text="Medium" size="medium" />  
<Button text="Large" size="large" />  

```

## Fill

The `fill` prop allows a button to expand and fill the available space in its container.

Full Width Button

```
<Button text="Full Width Button" fill={true} />  

```

## Aligned text

The `alignText` prop controls the horizontal alignment of a button's text and icons.

StartCenterEnd

```
<Button text="Start" alignText="start" icon="align-left" endIcon="caret-down" />  
<Button text="Center" alignText="center" icon="align-center" endIcon="caret-down" />  
<Button text="End" alignText="end" icon="align-right" endIcon="caret-down" />  

```

## Ellipsized text

The `ellipsizeText` prop allows text within a button to be truncated with an ellipsis if it exceeds the available space. This is useful for cases where the button needs to remain compact without overflowing, especially when the text content is dynamic or potentially lengthy.

This is a very long button label that will be truncated

```
<Button text="This is a very long button label that will be truncated" ellipsizeText={true} />  

```

## Icons with text

Buttons can include icons alongside text for extra context or visual cues. Icons can be added to either the before or after the text/children with the `icon` and `endIcon` props respectively. These icons can either be specified as string identifiers (e.g. `"arrow-right"`), dynamically-loaded [`<Icon>` components](#core/components/icon), [static icon components](#core/components/icon.static-components) (e.g. `<ArrowRight />`), or any custom JSX element.

ResetProfile settingsNext step Upload...

```
<Button icon="refresh" intent="danger" text="Reset" />  
<Button icon="user" endIcon="caret-down" text="Profile settings" />  
<Button endIcon="arrow-right" intent="success" text="Next step" />  
<Button>  
    <Icon icon="document" /> Upload... <Icon icon="small-cross" />  
</Button>  

```

## Icon buttons

Icon buttons display only an icon without any accompanying text. Icon buttons are used when an action can be clearly conveyed through a visual symbol, making the interface more compact and visually appealing. They are ideal for toolbars or areas with limited space.

```
<Button icon="edit" aria-label="edit" />  
<Button icon="share" variant="outlined" aria-label="share" />  
<Button icon="filter" intent="primary" variant="minimal" aria-label="filter" />  
<Button icon="add" intent="success" aria-label="add" />  
<Button icon="trash" disabled={true} intent="danger" aria-label="delete" />  

```

## Button states

Buttons have different states to show their interaction status. The `active`, `disabled`, and `loading` props provide visual feedback to help users understand available actions and when to wait.

* **Active**: Indicates that the button is currently being pressed or interacted with.
* **Disabled**: Shows that the button is non-interactive.
* **Loading**: Displays a loading spinner to indicate that an action is in progress.

DefaultActiveDisabledLoading...

```
<Button text="Default" />  
<Button text="Active" active={true} />  
<Button text="Disabled" disabled={true} />  
<Button text="Loading..." loading={true} />  

```

## AnchorButton

The **AnchorButton** component behaves like an anchor (`<a>` tag) and is useful for navigation actions. AnchorButton accepts all props of both a standard button and an anchor tag, making it flexible for use as a styled link.

[Link](https://blueprintjs.com)

```
<AnchorButton href="https://blueprintjs.com" endIcon="share" text="Link" />  

```

##### Disabled Button elements prevent all interaction

Use **AnchorButton** if you need mouse interaction events (such as hovering) on a disabled button.

**Button** uses the native `disabled` attribute on the `<button>` tag so the browser disables all interactions.
**AnchorButton** uses the class `.bp5-disabled` because `<a>` tags do not support the `disabled` attribute. As a result,
the **AnchorButton** component will prevent *only* the `onClick` handler when disabled but permit other events.

Disabled

```
<Tooltip content="This button is disabled">  
    <AnchorButton text="Disabled" disabled={true} />  
</Tooltip>  

```

## Interactive Playground

`Button`

Click to wiggle

`AnchorButton`

[Duplicate this page](#core/components/buttons)

##### Props

ActiveDisabledLoadingFill

Ellipsize long text

Variant 

SolidMinimalOutlinedOpen dropdown

Intent 

NonePrimarySuccessWarningDangerOpen dropdown

Align text 

StartCenterEnd

Size 

SmallMediumLarge

##### Example

Icons onlyLong text

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/buttonPlaygroundExample.tsx)

## Props interface

The two button components each support arbitrary HTML attributes for their underlying DOM element
(`<button>` and `<a>` respectively). These attributes may override the components' default values, such as
`role` on `<AnchorButton>`.

interface ButtonSharedProps extends [ActionProps](#api/ActionProps)<HTMLElement>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/button/buttonProps.ts#L23)

Interface for a clickable action, such as a button or menu item.
These props can be spready directly to a `<Button>` or `<MenuItem>` element.

| Props | Description |
| --- | --- |
| `active` | `booleanfalse` If set to `true`, the button will display in an active state. This is equivalent to setting `className={Classes.ACTIVE}`. |
| `alignText` | `AlignmentAlignment.CENTER` Text alignment within button. By default, icons and text will be centered within the button. Passing `"start"` or `"end"` will align the button text to that side and push `icon` and `endIcon` to either edge. Passing `"center"` will center the text and icons together. |
| `children` | `ReactNode` Button contents. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `ActionProps.className` |
| `disabled` | `boolean` Whether this action is non-interactive.  Inherited from `ActionProps.disabled` |
| `ellipsizeText` | `booleanfalse` If set to `true`, the button text element will hide overflow text that does not fit into a single line and show a trailing ellipsis, similar to the `Text` component. |
| `endIcon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon (or an icon element) to render after the text. |
| `fill` | `boolean` Whether this button should expand to fill its container. |
| `icon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon (or an icon element) to render before the text.  Inherited from `ActionProps.icon` |
| `intent` | `Intent` Visual intent color to apply to element.  Inherited from `ActionProps.intent` |
| `large` | `booleanfalse` Whether this button should use large styles.  Deprecated |
| `loading` | `booleanfalse` If set to `true`, the button will display a centered loading spinner instead of its contents and the button will be disabled (*even if* `disabled={false}`). The width of the button is not affected by the value of this prop. |
| `minimal` | `booleanfalse` Whether this button should use minimal styles.  Deprecated |
| `onClick` | `(event: MouseEvent<HTMLElement, MouseEvent<>>) => void` Click event handler.  Inherited from `ActionProps.onClick` |
| `onFocus` | `(event: FocusEvent<HTMLElement, Element<>>) => void` Focus event handler.  Inherited from `ActionProps.onFocus` |
| `outlined` | `booleanfalse` Whether this button should use outlined styles.  Deprecated |
| `rightIcon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon (or an icon element) to render after the text.  Deprecated |
| `size` | `Size"medium"` The size of the button. |
| `small` | `booleanfalse` Whether this button should use small styles.  Deprecated |
| `text` | `ReactNode` Action text. Can be any single React renderable.  Inherited from `ActionProps.text` |
| `textClassName` | `string` Class name(s) to apply to the text span element. |
| `type` | `"button" | "reset" | "submit""button"` HTML `type` attribute of button. Accepted values are `"button"`, `"submit"`, and `"reset"`. Note that this prop has no effect on `AnchorButton`; it only affects `Button`. |
| `variant` | `ButtonVariant"solid"` Visual style variant for the button. "minimal" renders a button without background styling, "outlined" adds a border without a fill, and "solid" (default) renders a button with background fill styling. |

## CSS API

##### Deprecated API: use `<Button>` or `<AnchorButton>`

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

Use the `bp5-button` class to access button styles. You should implement buttons using the
`<button>` or `<a>` tags rather than `<div>` for accessibility.

* Make sure to include `type="button"` on `<button>` tags (use `type="submit"` to submit a
  `<form>`) and `role="button"` on `<a>` tags for accessibility.
* Add the attribute `tabindex="0"` to make `<a>` tags focusable. `<button>` elements are
  focusable by default.
* For buttons implemented with `<a>` tags, add `tabindex="-1"` to disabled buttons to prevent the
  user from focusing them by pressing `tab` on the keyboard. (This does not happen in the example below.)
* Note that `<a>` tags do not respond to the `:disabled` attribute; use `.bp5-disabled` instead.

Anchor
Button

`:disabled`

Disabled state

`.bp5-active`

Active appearance

`.bp5-disabled`

Disabled appearance

`.bp5-intent-primary`

Primary intent

`.bp5-intent-success`

Success intent

`.bp5-intent-warning`

Warning intent

`.bp5-intent-danger`

Danger intent

`.bp5-minimal`

More subtle appearance

`.bp5-outlined`

Subtle yet structured appearance

`.bp5-large`

Larger size

`.bp5-small`

Smaller size

`.bp5-fill`

Fill parent container

```
<a role="button" class="bp5-button {{.modifier}}" {{:modifier}} tabindex="0">Anchor</a>  
<button type="button" class="bp5-button bp5-icon-add {{.modifier}}" {{:modifier}}>Button</button>  

```