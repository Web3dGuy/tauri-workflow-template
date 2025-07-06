# HotkeysProvider

##### Migrating from [**HotkeysTarget**](#core/legacy/hotkeys-legacy)?

**HotkeysProvider** and `useHotkeys`, used together, are a replacement for **HotkeysTarget**.
You are encouraged to use this new API, as it will become the standard APIs in a future major version of Blueprint.
See the full [migration guide](https://github.com/palantir/blueprint/wiki/HotkeysTarget-&-useHotkeys-migration)
on the wiki.

**HotkeysProvider** generates a React context necessary for the [`useHotkeys` hook](#core/hooks/use-hotkeys)
to maintain state for the globally-accessible hotkeys dialog. As your application runs and components
are mounted/unmounted, global and local hotkeys are registered/unregistered with this context and
the dialog displays/hides the relevant information. You can try it out in the Blueprint docs app
by navigating around and triggering the dialog with the `?` key.

## Usage

##### Consider [**BlueprintProvider**](#core/context/blueprint-provider)

**BlueprintProvider** is a new composite React context provider for Blueprint applications which
enables & configures multiple providers automatically and is simpler to use than individual lower-level providers.

To use **HotkeysProvider**, wrap your application with it at the root level:

```
import { HotkeysProvider } from "@blueprintjs/core";  
import * as React from "react";  
import * as ReactDOM from "react-dom/client";  
  
const root = ReactDOM.createRoot(document.getElementById("root"));  
  
root.render(  
    <HotkeysProvider>  
        <div>My app has hotkeys 😎</div>  
    </HotkeysProvider>,  
);  

```

## Advanced usage

**HotkeysProvider** should not be nested, except in special cases. If you have a rendering boundary within your application
through which React context is not preserved (for example, a plugin system which uses `render()`) and you wish
to use hotkeys in a descendant part of the tree below such a boundary, you may render a descendant provider and initialize
it with the root context instance. This ensures that there will only be one "global" hotkeys dialogs in an application
which has multiple **HotkeysProviders**.

```
import { type HotkeyConfig, HotkeysContext, HotkeysProvider, HotkeysTarget2 } from "@blueprintjs/core";  
import React, { useContext, useEffect, useRef } from "react";  
import { createRoot } from "react-dom/client";  
  
function App() {  
    const appHotkeys: HotkeyConfig[] = [  
        {  
            combo: "o",  
            global: true,  
            label: "Open",  
            onKeyDown: () => console.info("open"),  
        },  
    ];  
  
    return (  
        <HotkeysProvider>  
            <div>  
                <HotkeysTarget2 hotkeys={appHotkeys}>  
                    <div>My app has hotkeys 😎</div>  
                </HotkeysTarget2>  
                <PluginSlot>  
                    <Plugin />  
                </PluginSlot>  
            </div>  
        </HotkeysProvider>  
    );  
}  
  
function Plugin() {  
    const pluginHotkeys: HotkeyConfig[] = [  
        {  
            combo: "f",  
            global: true,  
            label: "Search",  
            onKeyDown: () => console.info("search"),  
        },  
    ];  
  
    return (  
        <HotkeysTarget2 hotkeys={pluginHotkeys}>  
            <div>This plugin also has hotkeys</div>  
        </HotkeysTarget2>  
    );  
}  
  
function PluginSlot({ children }: { children: React.ReactNode }) {  
    const hotkeysContext = useContext(HotkeysContext);  
    const ref = useRef<HTMLDivElement>(null);  
  
    useEffect(() => {  
        if (ref.current == null) {  
            return;  
        }  
        const root = createRoot(ref.current);  
        root.render(<HotkeysProvider value={hotkeysContext}>{children}</HotkeysProvider>);  
        return () => {  
            root.unmount();  
        };  
    }, [ref, hotkeysContext, children]);  
  
    return <div ref={ref} />;  
}  

```

## Props interface

interface HotkeysProviderProps

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/context/hotkeys/hotkeysProvider.tsx#L91)

| Props | Description |
| --- | --- |
| `dialogProps` | `Partial<Omit<HotkeysDialogProps, "hotkeys">>` Optional props to customize the rendered hotkeys dialog. |
| `renderDialog` | `(state: HotkeysContextState, contextActions: ) => Element` If provided, this dialog render function will be used in place of the default implementation. |
| `value` | `HotkeysContextInstance` If provided, we will use this context instance instead of generating our own. |