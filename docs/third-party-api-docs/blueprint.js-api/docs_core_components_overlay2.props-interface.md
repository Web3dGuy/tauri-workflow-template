# Overlay2

##### Migrating from [Overlay](#core/components/overlay)?

[**OverlaysProvider**](#core/context/overlays-provider) and **Overlay2**, when used
together, are a replacement for **Overlay**. You are encouraged to use these new APIs, as they will
become the standard in a future major version of Blueprint. See the full
[migration guide](https://github.com/palantir/blueprint/wiki/Overlay2-migration) on the wiki.

**Overlay2** is a generic low-level component for rendering content *on top of* its siblings or
above the entire application.

It combines the functionality of the [**Portal**](#core/components/portal) component (which allows
React elements to escape their current DOM hierarchy) with a
[**CSSTransitionGroup**](https://reactcommunity.org/react-transition-group/)
(to show elegant enter and leave transitions).

An optional "backdrop" element can be rendered behind the overlaid children to provide modal
behavior, whereby the overlay prevents interaction with anything behind it.

**Overlay2** is the backbone of all the components listed in the "Overlays" group in the sidebar.
Using **Overlay2** directly should be rare in your application; it should only be necessary if no
existing component meets your needs.

Show overlay

##### Props

Auto focusEnforce focusUse `Portal`Click outside to closeEscape key to closeHas backdrop

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/overlay2Example.tsx)

## Usage

**Overlay2** is a controlled component that renders its children only when `isOpen={true}`.
The optional backdrop element will be inserted before the children if `hasBackdrop={true}`.

The `onClose` callback prop is invoked when user interaction causes the overlay to close, but your
application is responsible for updating the state that actually closes the overlay.

**Overlay2** *strongly recommends* usage only within a React subtree which has an
[**OverlaysProvider**](#core/context/overlays-provider). In Blueprint v5.x, the component
implements backwards-compatibilty (via the [`useOverlayStack()` hook](#core/hooks/use-overlay-stack))
such that it will work without one, but this functionality will be removed in a future major version.

```
import { Button, Overlay2, OverlaysProvider } from "@blueprintjs/core";  
import { useCallback, useState } from "react";  
  
function Example() {  
    const [isOpen, setIsOpen] = useState(false);  
    const toggleOverlay = useCallback(() => setIsOpen(open => !open), [setIsOpen]);  
  
    return (  
        <OverlaysProvider>  
            <div>  
                <Button text="Show overlay" onClick={toggleOverlay} />  
                <Overlay2 isOpen={isOpen} onClose={toggleOverlay}>  
                    Overlaid contents...  
                </Overlay2>  
            </div>  
        </OverlaysProvider>  
    );  
}  

```

## DOM layout

##### A note about overlay content positioning

When rendered inline, content will automatically be set to `position: absolute` to respect
document flow. Otherwise, content will be set to `position: fixed` to cover the entire viewport.

Overlays rely on fixed and absolute CSS positioning. By default, an overlay larger than the viewport
will not be scrollable, so any overflowing content will be hidden. Fortunately, making an overlay
scrollable is very easy: pass `Classes.OVERLAY_SCROLL_CONTAINER` in the Overlay2 `className` prop,
and the component will take care of the rest.

```
<Overlay2 className={Classes.OVERLAY_SCROLL_CONTAINER} />  

```

Note that the [**Dialog**](docs_core_components_dialog.md) component applies
this modifier class automatically.

## Child refs

##### DOM ref(s) required

Overlay2 needs to be able to attach DOM refs to its child elements, so the children of this
component *must be a native DOM element* or utilize
[`React.forwardRef()`](https://reactjs.org/docs/forwarding-refs.html) to forward any
injected ref to the underlying DOM element.

**Overlay2** utilizes the react-transition-group library to declaratively configure "enter" and
"exit" transitions for its contents; it does so by individually wrapping its child nodes with
[**CSSTransition**](https://reactcommunity.org/react-transition-group/css-transition). This
third-party component requires a DOM ref to its child node in order to work correctly in React 18
strict mode (where `ReactDOM.findDOMNode()` is not available). **Overlay2** can manage this ref for
you automatically in some cases, but it requires some user help to handle more advanced use cases:

### Single child with automatic ref

If you provide a *single* child element to `<Overlay2>` and *do not* set its `ref` prop, you
don't need to do anything. The component will generate a child ref and happily pass it along
to the underlying `<CSSTransition>`.

```
function Example() {  
    const [isOpen, setIsOpen] = React.useState<boolean>(true);  
    return (  
        <Overlay2 isOpen={isOpen}>  
            <div>Contents</div>  
        </Overlay2>  
    );  
}  

```

### Single child with manual ref

If you provide a *single* child element to `<Overlay2>` and *do* set its `ref` prop, you must
pass the same ref to `<Overlay2 childRef={..}>`.

```
function Example() {  
    const [isOpen, setIsOpen] = React.useState<boolean>(true);  
    const myRef = React.useRef<HTMLElement>();  
  
    return (  
        <Overlay2 isOpen={isOpen} childRef={myRef}>  
            <div ref={myRef}>Contents</div>  
        </Overlay2>  
    );  
}  

```

### Multiple children

If you provide *multiple* child elements to `<Overlay2>`, you must enumerate a collection of
refs for each of those elements and pass those along as a record (keyed by the elements'
corresponding React `key` values) to `<Overlay2 childRefs={...}>`.

```
import { uniqueId } from "../utils";  
  
function Example() {  
    const [isOpen, setIsOpen] = React.useState<boolean>(true);  
    const [childRefs, setChildRefs] = React.useState<Record<string, React.RefObject<HTMLDivElement>>>({});  
    const [children, setChildren] = React.useState<Array<{ key: string }>>([]);  
    const addChild = React.useCallback(() => {  
        const newRef = React.createRef<HTMLDivElement>();  
        const newKey = uniqueId();  
        setChildren(oldChildren => [...oldChildren, { key: newKey }]);  
        setChildRefs(oldRefs => ({ ...oldRefs, [newKey]: newRef }));  
    }, []);  
  
    return (  
        <div>  
            <Button onClick={addChild}>Add child</Button>  
            <Overlay2 isOpen={isOpen} childRefs={childRefs}>  
                {children.map(child => (  
                    <div key={child.key} ref={childRefs[child.key]} />  
                ))}  
            </Overlay2>  
        </div>  
    );  
}  

```

## Props interface

interface Overlay2Props extends [OverlayProps](#api/OverlayProps), RefAttributes<[OverlayInstance](#api/OverlayInstance)>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/overlay2/overlay2.tsx#L47)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `autoFocus` | `booleantrue` Whether the overlay should acquire application focus when it first opens.  Inherited from `OverlayProps.autoFocus` |
| `backdropClassName` | `string` CSS class names to apply to backdrop element.  Inherited from `OverlayProps.backdropClassName` |
| `backdropProps` | `HTMLProps<HTMLDivElement>` HTML props for the backdrop element.  Inherited from `OverlayProps.backdropProps` |
| `canEscapeKeyClose` | `booleantrue` Whether pressing the `esc` key should invoke `onClose`.  Inherited from `OverlayProps.canEscapeKeyClose` |
| `canOutsideClickClose` | `booleantrue` Whether clicking outside the overlay element (either on backdrop when present or on document) should invoke `onClose`.  Inherited from `OverlayProps.canOutsideClickClose` |
| `childRef` | `RefObject<HTMLElement>` If you provide a single child element to Overlay2 and attach your own `ref` to the node, you must pass the same value here (otherwise, Overlay2 won't be able to render CSSTransition correctly).  Mutually exclusive with the `childRefs` prop. This prop is a shorthand for `childRefs={{ [key: string]: ref }}`. |
| `childRefs` | `Record<string, RefObject<HTMLElement>>` If you provide a *multiple child elements* to Overlay2, you must enumerate and generate a collection of DOM refs to those elements and provide it here. The object's keys must correspond to the child React element `key` values.  Mutually exclusive with the `childRef` prop. If you only provide a single child element, consider using `childRef` instead. |
| `children` | `ReactNode` Element to overlay.  Inherited from `OverlayProps.children` |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `OverlayProps.className` |
| `enforceFocus` | `booleantrue` Whether the overlay should prevent focus from leaving itself. That is, if the user attempts to focus an element outside the overlay and this prop is enabled, then the overlay will immediately bring focus back to itself. If you are nesting overlay components, either disable this prop on the "outermost" overlays or mark the nested ones `usePortal={false}`.  Inherited from `OverlayProps.enforceFocus` |
| `hasBackdrop` | `booleantrue` Whether a container-spanning backdrop element should be rendered behind the contents. When `false`, users will be able to scroll through and interact with overlaid content.  Inherited from `OverlayProps.hasBackdrop` |
| `isOpen` | `boolean` Toggles the visibility of the overlay and its children. This prop is required because the component is controlled.  RequiredInherited from `OverlayProps.isOpen` |
| `lazy` | `booleantrue` If `true` and `usePortal={true}`, the `Portal` containing the children is created and attached to the DOM when the overlay is opened for the first time; otherwise this happens when the component mounts. Lazy mounting provides noticeable performance improvements if you have lots of overlays at once, such as on each row of a table.  Inherited from `OverlayProps.lazy` |
| `onClose` | `(event: SyntheticEvent<HTMLElement, Event<>>) => void` A callback that is invoked when user interaction causes the overlay to close, such as clicking on the overlay or pressing the `esc` key (if enabled).  Receives the event from the user's interaction, if there was an event (generally either a mouse or key event). Note that, since this component is controlled by the `isOpen` prop, it will not actually close itself until that prop becomes `false`.  Inherited from `OverlayProps.onClose` |
| `onClosed` | `(node: HTMLElement) => void` Lifecycle method invoked just after the CSS *close* transition ends but before the child has been removed from the DOM. Receives the DOM element of the child being closed.  Inherited from `OverlayProps.onClosed` |
| `onClosing` | `(node: HTMLElement) => void` Lifecycle method invoked just before the CSS *close* transition begins on a child. Receives the DOM element of the child being closed.  Inherited from `OverlayProps.onClosing` |
| `onOpened` | `(node: HTMLElement) => void` Lifecycle method invoked just after the CSS *open* transition ends. Receives the DOM element of the child being opened.  Inherited from `OverlayProps.onOpened` |
| `onOpening` | `(node: HTMLElement) => void` Lifecycle method invoked just after mounting the child in the DOM but just before the CSS *open* transition begins. Receives the DOM element of the child being opened.  Inherited from `OverlayProps.onOpening` |
| `portalClassName` | `string` Space-delimited string of class names applied to the `Portal` element if `usePortal={true}`.  Inherited from `OverlayProps.portalClassName` |
| `portalContainer` | `HTMLElementdocument.body` The container element into which the overlay renders its contents, when `usePortal` is `true`. This prop is ignored if `usePortal` is `false`.  Inherited from `OverlayProps.portalContainer` |
| `portalStopPropagationEvents` | `(keyof HTMLElementEventMap)[]` A list of DOM events which should be stopped from propagating through the Portal. This prop is ignored if `usePortal` is `false`.  See: [object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object]  DeprecatedInherited from `OverlayProps.portalStopPropagationEvents` |
| `shouldReturnFocusOnClose` | `booleantrue` Whether the application should return focus to the last active element in the document after this overlay closes.  Inherited from `OverlayProps.shouldReturnFocusOnClose` |
| `transitionDuration` | `number300` Indicates how long (in milliseconds) the overlay's enter/leave transition takes. This is used by React `CSSTransition` to know when a transition completes and must match the duration of the animation in CSS. Only set this prop if you override Blueprint's default transitions with new transitions of a different length.  Inherited from `OverlayProps.transitionDuration` |
| `transitionName` | `stringClasses.OVERLAY` Name of the transition for internal `CSSTransition`. Providing your own name here will require defining new CSS transition properties.  Inherited from `OverlayProps.transitionName` |
| `usePortal` | `booleantrue` Whether the overlay should be wrapped in a `Portal`, which renders its contents in a new element attached to `portalContainer` prop.  This prop essentially determines which element is covered by the backdrop: if `false`, then only its parent is covered; otherwise, the entire page is covered (because the parent of the `Portal` is the `<body>` itself).  Set this prop to `false` on nested overlays (such as `Dialog` or `Popover`) to ensure that they are rendered above their parents.  Inherited from `OverlayProps.usePortal` |