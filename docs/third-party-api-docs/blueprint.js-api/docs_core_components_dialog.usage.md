# Dialog

The **Dialog** component presents content overlaid over other parts of the UI via
[**Overlay2**](#core/components/overlay2).

##### Terminology note

The term "modal" is sometimes used to mean "dialog," but this is a misnomer.
*Modal* is an adjective that describes parts of a UI. An element is considered to be "modal" if it
[blocks interaction with the rest of the application](https://en.wikipedia.org/wiki/Modal_window).
We use the term "dialog" in Blueprint to avoid confusion with the adjective.

Blueprint provides two types of dialogs:

1. Standard dialog: show single view using the `<Dialog>` component
2. Multi-step dialog: show multiple sequential views using the `<MultistepDialog>` component.

## Dialog

Show dialogShow dialog with titleShow dialog with title and footerShow dialog with title and minimal footer

##### Props

Auto focusEnforce focusUse `Portal`Click outside to closeEscape key to closeReturn focus to previously active element upon closing

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/dialogExample.tsx)

## Usage

##### [OverlaysProvider](#core/context/overlays-provider) recommended

This component renders an **Overlay2** which works best inside a React tree which includes an
**OverlaysProvider**. Blueprint v5.x includes a backwards-compatibile shim which allows this context
to be optional, but it will be required in a future major version. See the full
[migration guide](https://github.com/palantir/blueprint/wiki/Overlay2-migration) on the wiki.

A standard **Dialog** renders its contents in an [**Overlay2**](#core/components/overlay2) with a
`Classes.DIALOG` element. You can use some simple dialog markup sub-components or CSS classes
to structure its contents:

```
<Dialog title="Informational dialog" icon="info-sign">  
    <DialogBody>{/* body contents here */}</DialogBody>  
    <DialogFooter actions={<Button intent="primary" text="Close" onClick={/* ... */} />} />  
</Dialog>  

```

### Dialog props

`<Dialog>` is a stateless React component controlled by the `isOpen` prop.

The children you provide to this component are rendered as contents inside the
`Classes.DIALOG` element.

interface DialogProps extends [OverlayableProps](#api/OverlayableProps), BackdropProps<>, [Props](#api/Props)<>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/dialog/dialog.tsx#L38)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `aria-describedby` | `string` ID of an element that contains description text inside this dialog. |
| `aria-labelledby` | `string` ID of the element that contains title or label text for this dialog.  By default, if the `title` prop is supplied, this component will generate a unique ID for the `<H5>` title element and use that ID here. |
| `autoFocus` | `booleantrue` Whether the overlay should acquire application focus when it first opens.  Inherited from `OverlayableProps.autoFocus` |
| `backdropClassName` | `string` CSS class names to apply to backdrop element.  Inherited from `BackdropProps.backdropClassName` |
| `backdropProps` | `HTMLProps<HTMLDivElement>` HTML props for the backdrop element.  Inherited from `BackdropProps.backdropProps` |
| `canEscapeKeyClose` | `booleantrue` Whether pressing the `esc` key should invoke `onClose`.  Inherited from `OverlayableProps.canEscapeKeyClose` |
| `canOutsideClickClose` | `booleantrue` Whether clicking outside the overlay element (either on backdrop when present or on document) should invoke `onClose`.  Inherited from `BackdropProps.canOutsideClickClose` |
| `children` | `ReactNode` Dialog contents. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `containerRef` | `Ref<HTMLDivElement>` Ref attached to the `Classes.DIALOG_CONTAINER` element. |
| `enforceFocus` | `booleantrue` Whether the overlay should prevent focus from leaving itself. That is, if the user attempts to focus an element outside the overlay and this prop is enabled, then the overlay will immediately bring focus back to itself. If you are nesting overlay components, either disable this prop on the "outermost" overlays or mark the nested ones `usePortal={false}`.  Inherited from `OverlayableProps.enforceFocus` |
| `hasBackdrop` | `undefined` Dialog always has a backdrop so this prop cannot be overriden. |
| `icon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon (or an icon element) to render in the dialog's header. Note that the header will only be rendered if `title` is provided. |
| `isCloseButtonShown` | `booleantrue` Whether to show the close button in the dialog's header. Note that the header will only be rendered if `title` is provided. |
| `isOpen` | `boolean` Toggles the visibility of the overlay and its children. This prop is required because the component is controlled.  Required |
| `lazy` | `booleantrue` If `true` and `usePortal={true}`, the `Portal` containing the children is created and attached to the DOM when the overlay is opened for the first time; otherwise this happens when the component mounts. Lazy mounting provides noticeable performance improvements if you have lots of overlays at once, such as on each row of a table.  Inherited from `OverlayableProps.lazy` |
| `onClose` | `(event: SyntheticEvent<HTMLElement, Event<>>) => void` A callback that is invoked when user interaction causes the overlay to close, such as clicking on the overlay or pressing the `esc` key (if enabled).  Receives the event from the user's interaction, if there was an event (generally either a mouse or key event). Note that, since this component is controlled by the `isOpen` prop, it will not actually close itself until that prop becomes `false`.  Inherited from `OverlayableProps.onClose` |
| `onClosed` | `(node: HTMLElement) => void` Lifecycle method invoked just after the CSS *close* transition ends but before the child has been removed from the DOM. Receives the DOM element of the child being closed.  Inherited from `OverlayableProps.onClosed` |
| `onClosing` | `(node: HTMLElement) => void` Lifecycle method invoked just before the CSS *close* transition begins on a child. Receives the DOM element of the child being closed.  Inherited from `OverlayableProps.onClosing` |
| `onOpened` | `(node: HTMLElement) => void` Lifecycle method invoked just after the CSS *open* transition ends. Receives the DOM element of the child being opened.  Inherited from `OverlayableProps.onOpened` |
| `onOpening` | `(node: HTMLElement) => void` Lifecycle method invoked just after mounting the child in the DOM but just before the CSS *open* transition begins. Receives the DOM element of the child being opened.  Inherited from `OverlayableProps.onOpening` |
| `portalClassName` | `string` Space-delimited string of class names applied to the `Portal` element if `usePortal={true}`.  Inherited from `OverlayableProps.portalClassName` |
| `portalContainer` | `HTMLElementdocument.body` The container element into which the overlay renders its contents, when `usePortal` is `true`. This prop is ignored if `usePortal` is `false`.  Inherited from `OverlayableProps.portalContainer` |
| `portalStopPropagationEvents` | `(keyof HTMLElementEventMap)[]` A list of DOM events which should be stopped from propagating through the Portal. This prop is ignored if `usePortal` is `false`.  See: [object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object]  DeprecatedInherited from `OverlayableProps.portalStopPropagationEvents` |
| `role` | `"dialog" | "alertdialog""dialog"` |
| `shouldReturnFocusOnClose` | `booleantrue` Whether the application should return focus to the last active element in the document after this overlay closes.  Inherited from `OverlayableProps.shouldReturnFocusOnClose` |
| `style` | `CSSProperties{}` CSS styles to apply to the dialog. |
| `title` | `ReactNode` Title of the dialog. If provided, an element with `Classes.DIALOG_HEADER` will be rendered inside the dialog before any children elements. |
| `transitionDuration` | `number300` Indicates how long (in milliseconds) the overlay's enter/leave transition takes. This is used by React `CSSTransition` to know when a transition completes and must match the duration of the animation in CSS. Only set this prop if you override Blueprint's default transitions with new transitions of a different length.  Inherited from `OverlayableProps.transitionDuration` |
| `transitionName` | `string` Name of the transition for internal `CSSTransition`. Providing your own name here will require defining new CSS transition properties. |
| `usePortal` | `booleantrue` Whether the overlay should be wrapped in a `Portal`, which renders its contents in a new element attached to `portalContainer` prop.  This prop essentially determines which element is covered by the backdrop: if `false`, then only its parent is covered; otherwise, the entire page is covered (because the parent of the `Portal` is the `<body>` itself).  Set this prop to `false` on nested overlays (such as `Dialog` or `Popover`) to ensure that they are rendered above their parents.  Inherited from `OverlayableProps.usePortal` |

### Dialog body props

`<DialogBody>` renders a `Classes.DIALOG_BODY` element, optionally with a constrained container
height which allows vertical scrolling of its content.

interface DialogBodyProps extends [Props](#api/Props), [HTMLDivProps](#api/HTMLDivProps)<>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/dialog/dialogBody.tsx#L23)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `children` | `ReactNode` Dialog body contents. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `useOverflowScrollContainer` | `booleantrue` Enable scrolling for the container |

### Dialog footer props

`<DialogFooter>` renders a `Classes.DIALOG_FOOTER` element. Footer "actions" are rendered
towards the right side of the footer container element.

interface DialogFooterProps extends [Props](#api/Props), [HTMLDivProps](#api/HTMLDivProps)<>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/dialog/dialogFooter.tsx#L23)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `actions` | `ReactNode` Dialog actions (typically buttons) are rendered on the right side of the footer. |
| `children` | `ReactNode` Child contents are rendered on the left side of the footer. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `minimal` | `booleanfalse;` Use a "minimal" appearance for the footer, simply applying an HTML role and some visual padding. This is useful for small dialogs, and should not be used with `<DialogBody useOverflowScrollContainer>`.  Note that this is the default behavior when using the CSS API, since that's how the `-dialog-footer` class was first introduced, so these styles are applied without a "modifier" class.  When using the JS component API, `minimal` is false by default.  Show the footer close from the content. Do not use with scroll body Use for small dialogs (confirm) |

### CSS API

##### Deprecated API: use `<Dialog>`

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

##### Dialog header

This dialog hasn't been wired up with any open or close interactions.
It's just an example of markup and styles.

Secondary button
Primary button

```
<!-- this container element fills its parent and centers the .bp5-dialog within it -->  
<div class="bp5-dialog-container">  
  <div class="bp5-dialog">  
    <div class="bp5-dialog-header">  
      <span class="bp5-icon-large bp5-icon-inbox"></span>  
      <h5 class="bp5-heading">Dialog header</h5>  
      <button aria-label="Close" class="bp5-dialog-close-button bp5-button bp5-minimal bp5-icon-cross"></button>  
    </div>  
    <div class="bp5-dialog-body">  
      This dialog hasn't been wired up with any open or close interactions.  
      It's just an example of markup and styles.  
    </div>  
    <div class="bp5-dialog-footer">  
      <div class="bp5-dialog-footer-actions">  
        <button type="button" class="bp5-button">Secondary button</button>  
        <button type="submit" class="bp5-button bp5-intent-primary">Primary button</button>  
      </div>  
    </div>  
  </div>  
</div>  

```

## Multistep dialog

Show dialog

##### Props

Auto focusEnforce focusUse `Portal`Click outside to closeHas titleShow close buttonShow footer close buttonEscape key to close

Navigation Position 

lefttopright

Initial step index (0-indexed)

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/multistepDialogExample.tsx)

### Multistep dialog props

**MultistepDialog** is a wrapper around **Dialog** that displays a dialog with multiple steps. Each step has a
corresponding panel.

This component expects `<DialogStep>` child elements: each "step" is rendered in order and its panel is shown as the
dialog body content when the corresponding step is selected in the navigation panel.

interface MultistepDialogProps extends [DialogProps](#api/DialogProps)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/dialog/multistepDialog.tsx#L33)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `aria-describedby` | `string` ID of an element that contains description text inside this dialog.  Inherited from `DialogProps.aria-describedby` |
| `aria-labelledby` | `string` ID of the element that contains title or label text for this dialog.  By default, if the `title` prop is supplied, this component will generate a unique ID for the `<H5>` title element and use that ID here.  Inherited from `DialogProps.aria-labelledby` |
| `autoFocus` | `booleantrue` Whether the overlay should acquire application focus when it first opens.  Inherited from `DialogProps.autoFocus` |
| `backButtonProps` | `DialogStepButtonProps` Props for the back button. |
| `backdropClassName` | `string` CSS class names to apply to backdrop element.  Inherited from `DialogProps.backdropClassName` |
| `backdropProps` | `HTMLProps<HTMLDivElement>` HTML props for the backdrop element.  Inherited from `DialogProps.backdropProps` |
| `canEscapeKeyClose` | `booleantrue` Whether pressing the `esc` key should invoke `onClose`.  Inherited from `DialogProps.canEscapeKeyClose` |
| `canOutsideClickClose` | `booleantrue` Whether clicking outside the overlay element (either on backdrop when present or on document) should invoke `onClose`.  Inherited from `DialogProps.canOutsideClickClose` |
| `children` | `ReactNode` Dialog steps. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `DialogProps.className` |
| `closeButtonProps` | `DialogStepButtonProps` Props for the close button that appears in the footer. |
| `containerRef` | `Ref<HTMLDivElement>` Ref attached to the `Classes.DIALOG_CONTAINER` element.  Inherited from `DialogProps.containerRef` |
| `enforceFocus` | `booleantrue` Whether the overlay should prevent focus from leaving itself. That is, if the user attempts to focus an element outside the overlay and this prop is enabled, then the overlay will immediately bring focus back to itself. If you are nesting overlay components, either disable this prop on the "outermost" overlays or mark the nested ones `usePortal={false}`.  Inherited from `DialogProps.enforceFocus` |
| `finalButtonProps` | `DialogStepButtonProps` Props for the button to display on the final step. |
| `hasBackdrop` | `undefined` Dialog always has a backdrop so this prop cannot be overriden.  Inherited from `DialogProps.hasBackdrop` |
| `icon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon (or an icon element) to render in the dialog's header. Note that the header will only be rendered if `title` is provided.  Inherited from `DialogProps.icon` |
| `initialStepIndex` | `number` A 0 indexed initial step to start off on, to start in the middle of the dialog, for example. If the provided index exceeds the number of steps, it defaults to the last step. If a negative index is provided, it defaults to the first step. |
| `isCloseButtonShown` | `booleantrue` Whether to show the close button in the dialog's header. Note that the header will only be rendered if `title` is provided.  Inherited from `DialogProps.isCloseButtonShown` |
| `isOpen` | `boolean` Toggles the visibility of the overlay and its children. This prop is required because the component is controlled.  RequiredInherited from `DialogProps.isOpen` |
| `lazy` | `booleantrue` If `true` and `usePortal={true}`, the `Portal` containing the children is created and attached to the DOM when the overlay is opened for the first time; otherwise this happens when the component mounts. Lazy mounting provides noticeable performance improvements if you have lots of overlays at once, such as on each row of a table.  Inherited from `DialogProps.lazy` |
| `navigationPosition` | `MultistepDialogNavPosition"left"` Position of the step navigation within the dialog. |
| `nextButtonProps` | `DialogStepButtonProps` Props for the next button. |
| `onChange` | `(newDialogStepId: DialogStepId, prevDialogStepId: undefined | DialogStepId, event: MouseEvent<HTMLElement, MouseEvent<>>) => void` A callback that is invoked when the user selects a different step by clicking on back, next, or a step itself. |
| `onClose` | `(event: SyntheticEvent<HTMLElement, Event<>>) => void` A callback that is invoked when user interaction causes the overlay to close, such as clicking on the overlay or pressing the `esc` key (if enabled).  Receives the event from the user's interaction, if there was an event (generally either a mouse or key event). Note that, since this component is controlled by the `isOpen` prop, it will not actually close itself until that prop becomes `false`.  Inherited from `DialogProps.onClose` |
| `onClosed` | `(node: HTMLElement) => void` Lifecycle method invoked just after the CSS *close* transition ends but before the child has been removed from the DOM. Receives the DOM element of the child being closed.  Inherited from `DialogProps.onClosed` |
| `onClosing` | `(node: HTMLElement) => void` Lifecycle method invoked just before the CSS *close* transition begins on a child. Receives the DOM element of the child being closed.  Inherited from `DialogProps.onClosing` |
| `onOpened` | `(node: HTMLElement) => void` Lifecycle method invoked just after the CSS *open* transition ends. Receives the DOM element of the child being opened.  Inherited from `DialogProps.onOpened` |
| `onOpening` | `(node: HTMLElement) => void` Lifecycle method invoked just after mounting the child in the DOM but just before the CSS *open* transition begins. Receives the DOM element of the child being opened.  Inherited from `DialogProps.onOpening` |
| `portalClassName` | `string` Space-delimited string of class names applied to the `Portal` element if `usePortal={true}`.  Inherited from `DialogProps.portalClassName` |
| `portalContainer` | `HTMLElementdocument.body` The container element into which the overlay renders its contents, when `usePortal` is `true`. This prop is ignored if `usePortal` is `false`.  Inherited from `DialogProps.portalContainer` |
| `portalStopPropagationEvents` | `(keyof HTMLElementEventMap)[]` A list of DOM events which should be stopped from propagating through the Portal. This prop is ignored if `usePortal` is `false`.  See: [object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object]  DeprecatedInherited from `DialogProps.portalStopPropagationEvents` |
| `resetOnClose` | `booleantrue` Whether to reset the dialog state to its initial state on close. By default, closing the dialog will reset its state. |
| `role` | `"dialog" | "alertdialog""dialog"`   Inherited from `DialogProps.role` |
| `shouldReturnFocusOnClose` | `booleantrue` Whether the application should return focus to the last active element in the document after this overlay closes.  Inherited from `DialogProps.shouldReturnFocusOnClose` |
| `showCloseButtonInFooter` | `booleanfalse` Whether the footer close button is shown. When this value is true, the button will appear regardless of the value of `isCloseButtonShown`. |
| `style` | `CSSProperties{}` CSS styles to apply to the dialog.  Inherited from `DialogProps.style` |
| `title` | `ReactNode` Title of the dialog. If provided, an element with `Classes.DIALOG_HEADER` will be rendered inside the dialog before any children elements.  Inherited from `DialogProps.title` |
| `transitionDuration` | `number300` Indicates how long (in milliseconds) the overlay's enter/leave transition takes. This is used by React `CSSTransition` to know when a transition completes and must match the duration of the animation in CSS. Only set this prop if you override Blueprint's default transitions with new transitions of a different length.  Inherited from `DialogProps.transitionDuration` |
| `transitionName` | `string` Name of the transition for internal `CSSTransition`. Providing your own name here will require defining new CSS transition properties.  Inherited from `DialogProps.transitionName` |
| `usePortal` | `booleantrue` Whether the overlay should be wrapped in a `Portal`, which renders its contents in a new element attached to `portalContainer` prop.  This prop essentially determines which element is covered by the backdrop: if `false`, then only its parent is covered; otherwise, the entire page is covered (because the parent of the `Portal` is the `<body>` itself).  Set this prop to `false` on nested overlays (such as `Dialog` or `Popover`) to ensure that they are rendered above their parents.  Inherited from `DialogProps.usePortal` |

### DialogStep

**DialogStep** is a minimal wrapper with no functionality of its own—it is managed entirely by its parent
**MultistepDialog** container. Typically, you should render a `<DialogBody>` element as the `panel` element. A step's
title text can be set via the `title` prop.

interface DialogStepProps extends [Props](#api/Props), Omit<[HTMLDivProps](#api/HTMLDivProps), "id" | "title" | "onClick">

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/dialog/dialogStep.tsx#L27)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `backButtonProps` | `DialogStepButtonProps` Props for the back button. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `id` | `DialogStepId` Unique identifier used to identify which step is selected.  Required |
| `nextButtonProps` | `DialogStepButtonProps` Props for the next button. |
| `panel` | `Element` Panel content, rendered by the parent `MultistepDialog` when this step is active.  Required |
| `panelClassName` | `string` Space-delimited string of class names applied to multistep dialog panel container. |
| `title` | `ReactNode` Content of step title element, rendered in a list left of the active panel. |