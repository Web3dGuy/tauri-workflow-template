# Drawer

**Drawers** overlay content over existing parts of the UI and are anchored to the edge of the screen.
It is built using the lower-level [**Overlay2**](#core/components/overlay2) component.

Show Drawer

##### Props

Position 

toprightbottomleft

Size 

DefaultSmallStandardLarge72%560pxOpen dropdown

Auto focusEnforce focusHas backdropUse `Portal`Click outside to closeEscape key to close

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/drawerExample.tsx)

## Usage

##### [OverlaysProvider](#core/context/overlays-provider) recommended

This component renders an **Overlay2** which works best inside a React tree which includes an
**OverlaysProvider**. Blueprint v5.x includes a backwards-compatibile shim which allows this context
to be optional, but it will be required in a future major version. See the full
[migration guide](https://github.com/palantir/blueprint/wiki/Overlay2-migration) on the wiki.

`<Drawer>` is a stateless React component controlled by its `isOpen` prop.

Use the `size` prop to set the size of a **Drawer**. This prop sets CSS `width` if `vertical={false}` (default)
and `height` otherwise. Constants are available for common sizes:

* `DrawerSize.SMALL = 360px`
* `DrawerSize.STANDARD = 50%` (default)
* `DrawerSize.LARGE = 90%`

## Props interface

interface DrawerProps extends [OverlayableProps](#api/OverlayableProps), BackdropProps<>, [Props](#api/Props)<>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/drawer/drawer.tsx#L38)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `autoFocus` | `booleantrue` Whether the overlay should acquire application focus when it first opens.  Inherited from `OverlayableProps.autoFocus` |
| `backdropClassName` | `string` CSS class names to apply to backdrop element.  Inherited from `BackdropProps.backdropClassName` |
| `backdropProps` | `HTMLProps<HTMLDivElement>` HTML props for the backdrop element.  Inherited from `BackdropProps.backdropProps` |
| `canEscapeKeyClose` | `booleantrue` Whether pressing the `esc` key should invoke `onClose`.  Inherited from `OverlayableProps.canEscapeKeyClose` |
| `canOutsideClickClose` | `booleantrue` Whether clicking outside the overlay element (either on backdrop when present or on document) should invoke `onClose`.  Inherited from `BackdropProps.canOutsideClickClose` |
| `children` | `ReactNode` Drawer contents. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `enforceFocus` | `booleantrue` Whether the overlay should prevent focus from leaving itself. That is, if the user attempts to focus an element outside the overlay and this prop is enabled, then the overlay will immediately bring focus back to itself. If you are nesting overlay components, either disable this prop on the "outermost" overlays or mark the nested ones `usePortal={false}`.  Inherited from `OverlayableProps.enforceFocus` |
| `hasBackdrop` | `booleantrue` Whether a container-spanning backdrop element should be rendered behind the contents. When `false`, users will be able to scroll through and interact with overlaid content.  Inherited from `BackdropProps.hasBackdrop` |
| `icon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon (or an icon element) to render in the drawer's header. Note that the header will only be rendered if `title` is provided. |
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
| `position` | `Position"right"` Position of a drawer. All angled positions will be casted into pure positions (top, bottom, left, or right). |
| `shouldReturnFocusOnClose` | `booleantrue` Whether the application should return focus to the last active element in the document after this overlay closes.  Inherited from `OverlayableProps.shouldReturnFocusOnClose` |
| `size` | `string | numberDrawerSize.STANDARD = "50%"` CSS size of the drawer. This sets `width` if horizontal position (default) and `height` otherwise. Constants are available for common sizes: - `DrawerSize.SMALL = 360px` - `DrawerSize.STANDARD = 50%` `DrawerSize.LARGE = 90%` |
| `style` | `CSSProperties{}` CSS styles to apply to the dialog. |
| `title` | `ReactNode` Title of the dialog. If provided, an element with `Classes.DIALOG_HEADER` will be rendered inside the dialog before any children elements. |
| `transitionDuration` | `number300` Indicates how long (in milliseconds) the overlay's enter/leave transition takes. This is used by React `CSSTransition` to know when a transition completes and must match the duration of the animation in CSS. Only set this prop if you override Blueprint's default transitions with new transitions of a different length.  Inherited from `OverlayableProps.transitionDuration` |
| `transitionName` | `string` Name of the transition for internal `CSSTransition`. Providing your own name here will require defining new CSS transition properties. |
| `usePortal` | `booleantrue` Whether the overlay should be wrapped in a `Portal`, which renders its contents in a new element attached to `portalContainer` prop.  This prop essentially determines which element is covered by the backdrop: if `false`, then only its parent is covered; otherwise, the entire page is covered (because the parent of the `Portal` is the `<body>` itself).  Set this prop to `false` on nested overlays (such as `Dialog` or `Popover`) to ensure that they are rendered above their parents.  Inherited from `OverlayableProps.usePortal` |