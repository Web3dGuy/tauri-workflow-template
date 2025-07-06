# Panel stack (v2)

##### Migrating from [PanelStack](#core/components/panel-stack)?

**PanelStack2** is a replacement for **PanelStack**. It will become the standard API in a future major version of
Blueprint. You are encouraged to use this new API now for forwards-compatibility. See the full
[migration guide](https://github.com/palantir/blueprint/wiki/PanelStack2-migration) on the wiki.

**PanelStack2** manages a stack of panels and displays only the topmost panel.

Each panel appears with a header containing a "back" button to return to the previous panel. The bottom-most
`initialPanel` cannot be closed or removed from the stack. Panels use
[**CSSTransition**](http://reactcommunity.org/react-transition-group/css-transition) for seamless transitions.

By default, only the currently active panel is rendered to the DOM. This means that other panels are unmounted and can
lose their component state as a user transitions between the panels. You can notice this in the example below as the
numeric counter is reset. To render all panels to the DOM and keep their React trees mounted, change the
`renderActivePanelOnly` prop.

Panel 1

Open panel type 2

Render active panel onlyShow panel header

##### Current stack

* Panel 1

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/panelStack2Example.tsx)

## Panels

Panels are supplied as `Panel<T>` objects, where `renderPanel` and `props` are
used to render the panel element and `title` will appear in the header and back button.
This breakdown allows the component to avoid cloning elements.
Note that each panel is only mounted when it is atop the stack and is unmounted when
it is closed or when a panel opens above it.

`PanelStack2` injects panel action callbacks into each panel renderer in addition to
the `props` defined by `Panel<T>`. These allow you to close the current panel or open a
new one on top of it during the panel's lifecycle. For example:

```
import { Button, PanelProps } from "@blueprintjs/core";  
  
type SettingsPanelInfo = {  
    /* ...  */  
};  
type AccountSettingsPanelInfo = {  
    /* ...  */  
};  
type NotificationSettingsPanelInfo = {  
    /* ...  */  
};  
  
const AccountSettingsPanel: React.FC<PanelProps<AccountSettingsPanelInfo>> = props => {  
    // implementation  
};  
  
const NotificationSettingsPanel: React.FC<PanelProps<NotificationSettingsPanelInfo>> = props => {  
    // implementation  
};  
  
const SettingsPanel: React.FC<PanelProps<SettingsPanelInfo>> = props => {  
    const { openPanel, closePanel, ...info } = props;  
  
    const openAccountSettings = () =>  
        openPanel({  
            props: {  
                /* ... */  
            },  
            renderPanel: AccountSettingsPanel,  
            title: "Account settings",  
        });  
    const openNotificationSettings = () =>  
        openPanel({  
            props: {  
                /* ... */  
            },  
            renderPanel: NotificationSettingsPanel,  
            title: "Notification settings",  
        });  
  
    return (  
        <>  
            <Button onClick={openAccountSettings} text="Account settings" />  
            <Button onClick={openNotificationSettings} text="Notification settings" />  
        </>  
    );  
};  

```

interface Panel

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/panel-stack2/panelTypes.ts#L20)

An object describing a panel in a `PanelStack2`.

| Props | Description |
| --- | --- |
| `htmlTitle` | `string` HTML title to be passed to the  component |
| `props` | `P` The props passed to the component type when it is rendered. The methods in `PanelActions` will be injected by `PanelStack2`. |
| `renderPanel` | `FC<PanelProps<P>>` The renderer for this panel.  Required |
| `title` | `ReactNode` The title to be displayed above this panel. It is also used as the text of the back button for any panel opened by this panel. |

## Props interface

**PanelStack2** can be operated as a controlled or uncontrolled component.

If controlled, panels should be added to and removed from the *end* of the `stack` array.

interface PanelStack2Props extends [Props](#api/Props)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/panel-stack2/panelStack2.tsx#L30)

| Props | Description |
| --- | --- |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `initialPanel` | `T` The initial panel to show on mount. This panel cannot be removed from the stack and will appear when the stack is empty. This prop is only used in uncontrolled mode and is thus mutually exclusive with the `stack` prop. |
| `onClose` | `(removedPanel: T) => void` Callback invoked when the user presses the back button or a panel closes itself with a `closePanel()` action. |
| `onOpen` | `(addedPanel: T) => void` Callback invoked when a panel opens a new panel with an `openPanel(panel)` action. |
| `renderActivePanelOnly` | `booleantrue` If false, PanelStack will render all panels in the stack to the DOM, allowing their React component trees to maintain state as a user navigates through the stack. Panels other than the currently active one will be invisible. |
| `showPanelHeader` | `booleantrue` Whether to show the header with the "back" button in each panel. |
| `stack` | `readonly T[]` The full stack of panels in controlled mode. The last panel in the stack will be displayed. |