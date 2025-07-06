# Alert

**Alerts** notify users of important information and force them to acknowledge the alert content before continuing.

Although similar to [**Dialog**](#core/components/dialog), an alert is more restrictive and should only be used for
important information. By default, the user can only exit the alert by clicking one of the confirmation buttons;
clicking the overlay or pressing the `esc` key will not close the alert. These interactions can be enabled via props.

Open file error alertOpen file deletion alert

##### Props

Can escape key cancelCan outside click cancelDoes alert use loading state

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/alertExample.tsx)

## Props interface

**Alert** only supports controlled usage through the `isOpen` prop. Use the `onConfirm` and `onCancel` props to respond
to those interactions separately, or use `onClose` to handle both at the same time.

interface AlertProps extends [OverlayLifecycleProps](#api/OverlayLifecycleProps), [Props](#api/Props)<>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/alert/alert.tsx#L32)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `cancelButtonText` | `string` The text for the cancel button. If this prop is defined, then either `onCancel` or `onClose` must also be defined. |
| `canEscapeKeyCancel` | `booleanfalse` Whether pressing `escape` when focused on the Alert should cancel the alert. If this prop is enabled, then either `onCancel` or `onClose` must also be defined. |
| `canOutsideClickCancel` | `booleanfalse` Whether clicking outside the Alert should cancel the alert. If this prop is enabled, then either `onCancel` or `onClose` must also be defined. |
| `children` | `ReactNode` Dialog contents. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `confirmButtonText` | `string"OK"` The text for the confirm (right-most) button. This button will always appear, and uses the value of the `intent` prop below. |
| `icon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon (or an icon element) to display on the left side. |
| `intent` | `Intent` The intent to be applied to the confirm (right-most) button and the icon (if provided). |
| `isOpen` | `boolean` Toggles the visibility of the alert. This prop is required because the component is controlled.  Required |
| `loading` | `booleanfalse` If set to `true`, the confirm button will be set to its loading state. The cancel button, if visible, will be disabled. |
| `onCancel` | `(event?: SyntheticEvent<HTMLElement, Event<>>) => void` Handler invoked when the alert is canceled. Alerts can be **canceled** in the following ways:   * clicking the cancel button (if `cancelButtonText` is defined) * pressing the escape key (if `canEscapeKeyCancel` is enabled) * clicking on the overlay backdrop (if `canOutsideClickCancel` is enabled)   If any of the `cancel` props are defined, then either `onCancel` or `onClose` must be defined. |
| `onClose` | `(confirmed: boolean, event?: SyntheticEvent<HTMLElement, Event<>>) => void` Handler invoked when the Alert is confirmed or canceled; see `onConfirm` and `onCancel` for more details. First argument is `true` if confirmed, `false` otherwise. This is an alternative to defining separate `onConfirm` and `onCancel` handlers. |
| `onClosed` | `(node: HTMLElement) => void` Lifecycle method invoked just after the CSS *close* transition ends but before the child has been removed from the DOM. Receives the DOM element of the child being closed.  Inherited from `OverlayLifecycleProps.onClosed` |
| `onClosing` | `(node: HTMLElement) => void` Lifecycle method invoked just before the CSS *close* transition begins on a child. Receives the DOM element of the child being closed.  Inherited from `OverlayLifecycleProps.onClosing` |
| `onConfirm` | `(event?: SyntheticEvent<HTMLElement, Event<>>) => void` Handler invoked when the confirm button is clicked. Alerts can be **confirmed** in the following ways:   * clicking the confirm button * focusing on the confirm button and pressing `enter` or   `space` |
| `onOpened` | `(node: HTMLElement) => void` Lifecycle method invoked just after the CSS *open* transition ends. Receives the DOM element of the child being opened.  Inherited from `OverlayLifecycleProps.onOpened` |
| `onOpening` | `(node: HTMLElement) => void` Lifecycle method invoked just after mounting the child in the DOM but just before the CSS *open* transition begins. Receives the DOM element of the child being opened.  Inherited from `OverlayLifecycleProps.onOpening` |
| `portalContainer` | `HTMLElementdocument.body` The container element into which the overlay renders its contents, when `usePortal` is `true`. This prop is ignored if `usePortal` is `false`. |
| `style` | `CSSProperties` CSS styles to apply to the alert. |
| `transitionDuration` | `number300` Indicates how long (in milliseconds) the overlay's enter/leave transition takes. This is used by React `CSSTransition` to know when a transition completes and must match the duration of the animation in CSS. Only set this prop if you override Blueprint's default transitions with new transitions of a different length. |