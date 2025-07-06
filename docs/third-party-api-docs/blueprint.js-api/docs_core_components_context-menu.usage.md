# Context Menu

**Context menus** present the user with a list of actions when right-clicking on a target element.
They essentially generate an opinionated [**Popover**](#core/components/popover) instance configured
with the appropriate interaction handlers.

Right-click on node or background.

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/contextMenuExample.tsx)

## Usage

Create a context menu using the simple function component:

```
import { ContextMenu, Menu, MenuItem } from "@blueprintjs/core";  
  
export default function ContextMenuExample() {  
    return (  
        <ContextMenu  
            content={  
                <Menu>  
                    <MenuItem text="Save" />  
                    <MenuItem text="Save as..." />  
                    <MenuItem text="Delete..." intent="danger" />  
                </Menu>  
            }  
        >  
            <div className="my-context-menu-target">Right click me!</div>  
        </ContextMenu>  
    );  
}  

```

`<ContextMenu>` will render a `<div>` wrapper element around its children. You can treat this
component as a `<div>`, since extra props will be forwarded down to the DOM element. For example,
you can add an `onClick` handler. You may also customize the tag name of the generated wrapper
element using the `tagName` prop. Note that the generated popover will be rendered as a *sibling*
of this wrapper element.

### Advanced usage

By default, `<ContextMenu>` will render a wrapper element around its children to attach an event handler
and get a DOM ref for theme detection. If this wrapper element breaks your HTML and/or CSS layout in
some way and you wish to omit it, you may do so by utilizing ContextMenu's advanced rendering API
which uses a `children` render function. If you use this approach, you must take care to properly use
all the render props supplied to the `children()` function:

```
import classNames from "classnames";  
import { ContextMenu, ContextMenuChildrenProps, Menu, MenuItem } from "@blueprintjs/core";  
  
export default function AdvancedContextMenuExample() {  
    return (  
        <ContextMenu  
            content={  
                <Menu>  
                    <MenuItem text="Save" />  
                    <MenuItem text="Save as..." />  
                    <MenuItem text="Delete..." intent="danger" />  
                </Menu>  
            }  
        >  
            {(ctxMenuProps: ContextMenuChildrenProps) => (  
                <div  
                    className={classNames("my-context-menu-target", ctxMenuProps.className)}  
                    onContextMenu={ctxMenuProps.onContextMenu}  
                    ref={ctxMenuProps.ref}  
                >  
                    {ctxMenuProps.popover}  
                    Right click me!  
                </div>  
            )}  
        </ContextMenu>  
    );  
}  

```

Both `content` and `children` props support the [render prop](https://reactjs.org/docs/render-props.html)
pattern, so you may use information about the context menu's state (such as `isOpen: boolean`) in your
render code.

## Props interface

To enable/disable the context menu popover, use the `disabled` prop. Note that it is inadvisable to change
the value of this prop inside the `onContextMenu` callback for this component; doing so can lead to unpredictable
behavior.

interface ContextMenuProps extends Omit<React.HTMLAttributes<HTMLElement>, "children" | "className" | "content" | "onContextMenu">, RefAttributes<any>, [Props](#api/Props)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/context-menu/contextMenu.tsx#L63)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `children` | `ReactNode | (props: ContextMenuChildrenProps) => ReactElement<any, string | JSXElementConstructor<any>>` The context menu target. This may optionally be a render function so you can use component state to render the target.  Required |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `content` | `undefined | Element | (props: ContextMenuContentProps) => undefined | Element<>` Menu content. This will usually be a Blueprint `<Menu>` component. This optionally functions as a render prop so you can use component state to render content.  Required |
| `disabled` | `booleanfalse` Whether the context menu is disabled. |
| `onClose` | `() => void` Callback invoked when the popover overlay closes. |
| `onContextMenu` | `MouseEventHandler<HTMLElement>` An optional context menu event handler. This can be useful if you want to do something with the mouse event unrelated to rendering the context menu itself, especially if that involves setting React state (which is an error to do in the render code path of this component). |
| `popoverProps` | `ContextMenuPopoverOptions` A limited subset of props to forward along to the popover overlay generated by this component. |
| `tagName` | `keyof IntrinsicElements"div"` HTML tag to use for container element. Only used if this component's children are specified as React node(s), not when it is a render function (in that case, you get to render whatever tag you wish). |