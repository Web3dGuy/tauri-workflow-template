# Overlay

##### Deprecated: use [**Overlay2**](#core/components/overlay2)

This component is **deprecated since @blueprintjs/core v5.9.0** in favor of the new
**Overlay2** component which is compatible with React 18 strict mode. You should migrate to the
new API which will become the standard in a future major version of Blueprint.

**Overlay** is a generic low-level component for rendering content *on top of* its siblings or above the entire
application.

It combines the functionality of the [**Portal**](#core/components/portal) component (which allows React elements to
escape their current DOM hierarchy) with a [**CSSTransitionGroup**](https://reactcommunity.org/react-transition-group/)
(to show elegant enter and leave transitions).

An optional "backdrop" element can be rendered behind the overlaid children to provide modal behavior, whereby the
overlay prevents interaction with anything behind it.

**Overlay** is the backbone of all the components listed in the **Overlays** group in the sidebar. Using **Overlay**
directly should be rare in your application; it should only be necessary if no existing component meets your needs.

Show overlay

##### Props

Auto focusEnforce focusUse `Portal`Click outside to closeEscape key to closeHas backdrop

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/overlayExample.tsx)

## Usage

**Overlay** is a controlled component that renders its children only when `isOpen={true}`. The optional backdrop element
will be inserted before the children if `hasBackdrop={true}`.

The `onClose` callback prop is invoked when user interaction causes the overlay to close, but your application is
responsible for updating the state that actually closes the overlay.

##### A note about overlay content positioning

When rendered inline, content will automatically be set to `position: absolute` to respect
document flow. Otherwise, content will be set to `position: fixed` to cover the entire viewport.

```
<div>  
    <Button text="Show overlay" onClick={this.toggleOverlay} />  
    <Overlay isOpen={this.state.isOpen} onClose={this.toggleOverlay}>  
        Overlaid contents...  
    </Overlay>  
</div>  

```

## Scrolling interactions

Overlays rely on fixed and absolute CSS positioning. By default, an overlay larger than the viewport will not be
scrollable, so any overflowing content will be hidden. Fortunately, making an overlay scrollable is very easy: pass
`Classes.OVERLAY_SCROLL_CONTAINER` in the Overlay `className` prop, and the component will take care of the rest.

```
<Overlay className={Classes.OVERLAY_SCROLL_CONTAINER} />  

```

Note that the [**Dialog**](docs_core_components_dialog.md) component applies this CSS class
automatically.

## Props interface

interface OverlayProps extends [OverlayableProps](#api/OverlayableProps), BackdropProps<>, [Props](#api/Props)<>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/overlay/overlayProps.ts#L175)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `autoFocus` | `booleantrue` Whether the overlay should acquire application focus when it first opens.  Inherited from `OverlayableProps.autoFocus` |
| `backdropClassName` | `string` CSS class names to apply to backdrop element.  Inherited from `BackdropProps.backdropClassName` |
| `backdropProps` | `HTMLProps<HTMLDivElement>` HTML props for the backdrop element.  Inherited from `BackdropProps.backdropProps` |
| `canEscapeKeyClose` | `booleantrue` Whether pressing the `esc` key should invoke `onClose`.  Inherited from `OverlayableProps.canEscapeKeyClose` |
| `canOutsideClickClose` | `booleantrue` Whether clicking outside the overlay element (either on backdrop when present or on document) should invoke `onClose`.  Inherited from `BackdropProps.canOutsideClickClose` |
| `children` | `ReactNode` Element to overlay. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `enforceFocus` | `booleantrue` Whether the overlay should prevent focus from leaving itself. That is, if the user attempts to focus an element outside the overlay and this prop is enabled, then the overlay will immediately bring focus back to itself. If you are nesting overlay components, either disable this prop on the "outermost" overlays or mark the nested ones `usePortal={false}`.  Inherited from `OverlayableProps.enforceFocus` |
| `hasBackdrop` | `booleantrue` Whether a container-spanning backdrop element should be rendered behind the contents. When `false`, users will be able to scroll through and interact with overlaid content.  Inherited from `BackdropProps.hasBackdrop` |
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
| `shouldReturnFocusOnClose` | `booleantrue` Whether the application should return focus to the last active element in the document after this overlay closes.  Inherited from `OverlayableProps.shouldReturnFocusOnClose` |
| `transitionDuration` | `number300` Indicates how long (in milliseconds) the overlay's enter/leave transition takes. This is used by React `CSSTransition` to know when a transition completes and must match the duration of the animation in CSS. Only set this prop if you override Blueprint's default transitions with new transitions of a different length.  Inherited from `OverlayableProps.transitionDuration` |
| `transitionName` | `stringClasses.OVERLAY` Name of the transition for internal `CSSTransition`. Providing your own name here will require defining new CSS transition properties. |
| `usePortal` | `booleantrue` Whether the overlay should be wrapped in a `Portal`, which renders its contents in a new element attached to `portalContainer` prop.  This prop essentially determines which element is covered by the backdrop: if `false`, then only its parent is covered; otherwise, the entire page is covered (because the parent of the `Portal` is the `<body>` itself).  Set this prop to `false` on nested overlays (such as `Dialog` or `Popover`) to ensure that they are rendered above their parents.  Inherited from `OverlayableProps.usePortal` |