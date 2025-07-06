# BlueprintProvider

**BlueprintProvider** is a compound [React context](https://react.dev/learn/passing-data-deeply-with-context)
provider which enables & manages various global behaviors of Blueprint applications. It must be rendered
at the root of your application and may only be used once as a singleton provider.

Concretely, this provider renders the following provider components *in the correct nesting order*
and allows customization of their options via props:

## Usage

To use **BlueprintProvider**, wrap your application with it at the root level:

```
import { BlueprintProvider } from "@blueprintjs/core";  
import * as React from "react";  
import * as ReactDOM from "react-dom/client";  
  
const root = ReactDOM.createRoot(document.getElementById("root"));  
  
root.render(  
    <BlueprintProvider>  
        <div>My app has overlays, hotkeys, and portal customization 😎</div>  
    </BlueprintProvider>,  
);  

```

## Props interface

interface BlueprintProviderProps extends [OverlaysProviderProps](#api/OverlaysProviderProps), [PortalContextOptions](#api/PortalContextOptions)<>, HotkeysProviderPrefix<[HotkeysProviderProps](#api/HotkeysProviderProps)>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/context/blueprintProvider.tsx#L29)

| Props | Description |
| --- | --- |
| `children` | `ReactNode` The component subtree which will have access to this overlay stack context.  RequiredInherited from `OverlaysProviderProps.children` |
| `hotkeysProviderDialogProps` | `undefined | Partial<Omit<HotkeysDialogProps, "hotkeys">>`   RequiredInherited from `HotkeysProviderPrefix.hotkeysProviderDialogProps` |
| `hotkeysProviderRenderDialog` | `undefined | (state: HotkeysContextState, contextActions: ) => Element`   RequiredInherited from `HotkeysProviderPrefix.hotkeysProviderRenderDialog` |
| `hotkeysProviderValue` | `undefined | HotkeysContextInstance`   RequiredInherited from `HotkeysProviderPrefix.hotkeysProviderValue` |
| `portalClassName` | `string` Additional CSS classes to add to all `Portal` elements in this React context.  Inherited from `PortalContextOptions.portalClassName` |
| `portalContainer` | `HTMLElement` The HTML element that all `Portal` elements in this React context will be added as children to  Inherited from `PortalContextOptions.portalContainer` |