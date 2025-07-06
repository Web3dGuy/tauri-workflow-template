# Portal

The **Portal** component renders its children into a new DOM "subtree" outside of the current component
hierarchy. It is an essential piece of the [Overlay2](#core/components/overlay2) component, responsible for
ensuring that the overlay contents appear above the rest of the application. In most cases, you do not
need to use a Portal directly; this documentation is provided only for reference.

## DOM Behavior

**Portal** component functions like a declarative `appendChild()`. The children of a **Portal** are inserted into a *new child* of the target element. This target element is determined in the following order:

1. The `container` prop, if specified
2. The `portalContainer` from the closest [**PortalProvider**](#core/context/portal-provider), if specified
3. Otherwise `document.body`

**Portal** is used inside [Overlay2](#core/components/overlay2) to actually overlay the content on the
application.

##### A note about responsive layouts

For a single-page app, if the `<body>` is styled with `width: 100%` and `height: 100%`, a `Portal`
may take up extra whitespace and cause the window to undesirably scroll. To fix this, instead
apply `position: absolute` to the `<body>` tag.

## Props interface

interface PortalProps extends [Props](#api/Props)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/portal/portal.tsx#L26)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `children` | `ReactNode` Contents to send through the portal.  Required |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `container` | `HTMLElementPortalProvider#portalContainer ?? document.body` The HTML element that children will be mounted to. |
| `onChildrenMount` | `() => void` Callback invoked when the children of this `Portal` have been added to the DOM. |
| `stopPropagationEvents` | `(keyof HTMLElementEventMap)[]` A list of DOM events which should be stopped from propagating through this portal element.  See: [object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object]  Deprecated |

## React context options

**Portal** supports some customization through [React context](https://react.dev/learn/passing-data-deeply-with-context).
Using this API can be helpful if you need to apply some custom styling or logic to *all* Blueprint
components which use portals (popovers, tooltips, dialogs, etc.). You can do so by rendering a
[**PortalProvider**](#core/context/portal-provider) in your React tree
(usually, this should be done near the root of your application).

```
import { Button, Popover, PortalProvider } from "@blueprintjs/core";  
import * as React from "react";  
import * as ReactDOM from "react-dom/client";  
  
const root = ReactDOM.createRoot(document.getElementById("root"));  
  
root.render(  
    <PortalProvider portalClassName="my-custom-class">  
        <Popover content="My portal has a custom class">  
            <Button text="Example" />  
        </Popover>  
    </PortalProvider>,  
);  

```

interface PortalContextOptions

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/context/portal/portalProvider.tsx#L19)

| Props | Description |
| --- | --- |
| `portalClassName` | `string` Additional CSS classes to add to all `Portal` elements in this React context. |
| `portalContainer` | `HTMLElement` The HTML element that all `Portal` elements in this React context will be added as children to |

## Legacy context options

##### Legacy React API

This feature uses React's legacy context API. Support for this API will be removed in Blueprint v6.0.

**Portal** supports the following options via the [React legacy context API](https://reactjs.org/docs/legacy-context.html).
To use them, supply a child context to a subtree that contains the Portals you want to customize.

interface PortalLegacyContext

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/portal/portal.tsx#L53)

| Props | Description |
| --- | --- |
| `blueprintPortalClassName` | `string` Additional CSS classes to add to all `Portal` elements in this React context. |