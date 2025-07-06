# Panel stack

##### Deprecated: use [PanelStack2](#core/components/panel-stack2)

This API is **deprecated since @blueprintjs/core v3.40.0** in favor of the new
**PanelStack2** component. You should migrate to the new API which will become the
standard in a future major version of Blueprint.

`PanelStack` manages a stack of panels and displays only the topmost panel.

Each panel appears with a header containing a "back" button to return to the
previous panel. The bottom-most `initialPanel` cannot be closed or removed from
the stack. Panels use
[`CSSTransition`](http://reactcommunity.org/react-transition-group/css-transition)
for seamless transitions.

By default, only the currently active panel is rendered to the DOM. This means
that other panels are unmounted and can lose their component state as a user
transitions between the panels. You can notice this in the example below as
the numeric counter is reset. To render all panels to the DOM and keep their
React trees mounted, change the `renderActivePanelOnly` prop.

Panel 1

Open new panel

Render active panel onlyShow panel header

##### Current stack

* Panel 1

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/panelStackExample.tsx)

## Panels

Panels are supplied as `IPanel` objects like `{ component, props, title }`,
where `component` and `props` are used to render the panel element and `title`
will appear in the header and back button. This breakdown allows the component
to avoid cloning elements. Note that each panel is only mounted when it is atop
the stack and is unmounted when it is closed or when a panel opens above it.

`PanelStack` injects its own `IPanelProps` into each panel (in addition to the
`props` defined alongside the `component`), providing methods to imperatively
close the current panel or open a new one on top of it.

```
import { Button, IPanelProps, PanelStack } from "@blueprintjs/core";  
  
class MyPanel extends React.Component<IPanelProps> {  
    public render() {  
        return <Button onClick={this.openSettingsPanel} text="Settings" />;  
    }  
  
    private openSettingsPanel() {  
        // openPanel (and closePanel) are injected by PanelStack  
        this.props.openPanel({  
            component: SettingsPanel, // <- class or stateless function type  
            props: { enabled: true }, // <- SettingsPanel props without IPanelProps  
            title: "Settings", // <- appears in header and back button  
        });  
    }  
}  
  
class SettingsPanel extends React.Component<IPanelProps & { enabled: boolean }> {  
    // ...  
}  
  
<PanelStack initialPanel={{ component: MyPanel, title: "Home" }} />;  

```

interface IPanel

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/panel-stack/panelProps.ts#L32)

An object describing a panel in a `PanelStack`.

| Props | Description |
| --- | --- |
| `component` | `ComponentType<P & IPanelProps>` The component type to render for this panel. This must be a reference to the component class or SFC, *not* a JSX element, so it can be re-created dynamically when needed.  Required |
| `htmlTitle` | `string` HTML title to be passed to the  component |
| `props` | `P` The props passed to the component type when it is rendered. The methods in `IPanelProps` will be injected by `PanelStack`. |
| `title` | `ReactNode` The title to be displayed above this panel. It is also used as the text of the back button for any panel opened by this panel. |

interface IPanelProps

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/panel-stack/panelProps.ts#L69)

Include this interface in your panel component's props type to access these
two functions which are injected by `PanelStack`.

```
import { IPanelProps } from "@blueprintjs/core";  
export class SettingsPanel extends React.Component<IPanelProps & ISettingsPanelProps> {...}  

```

| Props | Description |
| --- | --- |
| `closePanel` | `() => void` Call this method to programatically close this panel. If this is the only panel on the stack then this method will do nothing.  Remember that the panel header always contains a "back" button that closes this panel on click (unless there is only one panel on the stack).  Required |
| `openPanel` | `(panel: IPanel<P>) => void` Call this method to open a new panel on the top of the stack.  Required |

## Props interface

PanelStack can be operated as a controlled or uncontrolled component.