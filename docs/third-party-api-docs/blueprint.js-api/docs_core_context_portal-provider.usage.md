# PortalProvider

PortalProvider generates a React context necessary for customizing global [Portal](#core/components/portal)
options. It uses the [React context API](https://reactjs.org/docs/context.html).

## Usage

##### Consider [**BlueprintProvider**](#core/context/blueprint-provider)

**BlueprintProvider** is a new composite React context provider for Blueprint applications which
enables & configures multiple providers automatically and is simpler to use than individual lower-level providers.

To use **PortalProvider**, wrap your application with it at the root level:

```
import { PortalProvider, Dialog } from "@blueprintjs/core";  
import * as React from "react";  
import * as ReactDOM from "react-dom/client";  
  
const root = ReactDOM.createRoot(document.getElementById("root"));  
  
root.render(  
    <PortalProvider portalClassName="my-portal">  
        <Dialog isOpen={true}>  
            <span>This dialog will have a custom class on its portal element.</span>  
        </Dialog>  
    </PortalProvider>,  
);  

```

## Props interface

interface PortalContextOptions

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/context/portal/portalProvider.tsx#L19)

| Props | Description |
| --- | --- |
| `portalClassName` | `string` Additional CSS classes to add to all `Portal` elements in this React context. |
| `portalContainer` | `HTMLElement` The HTML element that all `Portal` elements in this React context will be added as children to |