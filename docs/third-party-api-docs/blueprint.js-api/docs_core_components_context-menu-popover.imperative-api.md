# Context Menu Popover

##### Consider [Context Menu](#core/components/context-menu) first

The APIs described on this page are lower-level and have some limitations compared to
[Context Menu](#core/components/context-menu), so you should try that API *first* to see if it addresses your use case.

**Context Menu Popover** is a lower-level API for [**Context Menu**](#core/components/context-menu) which does
not hook up any interaction handlers for you and simply renders an opinionated
[**Popover**](#core/components/popover) at a particular target offset on the page through a
[**Portal**](#core/components/portal).

Right-click on node to open.

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/contextMenuPopoverExample.tsx)

## Declarative API

Use the `<ContextMenuPopover>` component like any other React component in your tree. Note that this is a controlled
component which requires its `isOpen` and `targetOffset` props to be defined.

interface ContextMenuPopoverProps extends ContextMenuPopoverOptions

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/context-menu/contextMenuPopover.tsx#L27)

| Props | Description |
| --- | --- |
| `content` | `Element`   Required |
| `isDarkTheme` | `boolean` |
| `isOpen` | `boolean`   Required |
| `onClose` | `() => void` |
| `onClosed` | `(node: HTMLElement) => void` Lifecycle method invoked just after the CSS *close* transition ends but before the child has been removed from the DOM. Receives the DOM element of the child being closed.  Inherited from `ContextMenuPopoverOptions.onClosed` |
| `onClosing` | `(node: HTMLElement) => void` Lifecycle method invoked just before the CSS *close* transition begins on a child. Receives the DOM element of the child being closed.  Inherited from `ContextMenuPopoverOptions.onClosing` |
| `onOpened` | `(node: HTMLElement) => void` Lifecycle method invoked just after the CSS *open* transition ends. Receives the DOM element of the child being opened.  Inherited from `ContextMenuPopoverOptions.onOpened` |
| `onOpening` | `(node: HTMLElement) => void` Lifecycle method invoked just after mounting the child in the DOM but just before the CSS *open* transition begins. Receives the DOM element of the child being opened.  Inherited from `ContextMenuPopoverOptions.onOpening` |
| `placement` | `Placement"auto"` The placement (relative to the target) at which the popover should appear. Mutually exclusive with `position` prop. Prefer using this over `position`, as it more closely aligns with Popper.js semantics.  The default value of `"auto"` will choose the best placement when opened and will allow the popover to reposition itself to remain onscreen as the user scrolls around.  Inherited from `ContextMenuPopoverOptions.placement` |
| `popoverClassName` | `string` A space-delimited string of class names applied to the popover element.  Inherited from `ContextMenuPopoverOptions.popoverClassName` |
| `popoverRef` | `Ref<HTMLElement>` DOM ref attached to the `Classes.POPOVER` element.  Inherited from `ContextMenuPopoverOptions.popoverRef` |
| `rootBoundary` | `RootBoundary` A root boundary element supplied to the "flip" and "preventOverflow" modifiers. This is a shorthand for overriding Popper.js modifier options with the `modifiers` prop.  See: [object Object]  Inherited from `ContextMenuPopoverOptions.rootBoundary` |
| `targetOffset` | `undefined | Offset`   Required |
| `transitionDuration` | `number300` Indicates how long (in milliseconds) the overlay's enter/leave transition takes. This is used by React `CSSTransition` to know when a transition completes and must match the duration of the animation in CSS. Only set this prop if you override Blueprint's default transitions with new transitions of a different length.  Inherited from `ContextMenuPopoverOptions.transitionDuration` |

## Imperative API

Two functions are provided as an imperative API for showing and hiding a singleton **Context Menu Popover** on
the page:

```
export function showContextMenu(  
    props: ContextMenuPopoverProps,  
    options?: DOMMountOptions<ContextMenuPopoverProps>,  
): void;  
export function hideContextMenu(options?: DOMMountOptions<ContextMenuPopoverProps>): void;  

```

These are useful in some cases when working with imperative code that does not follow typical React paradigms.
Note that these functions come with come caveats, and thus they should be used with caution:

* they rely on global state stored in Blueprint library code.
* they create a new React DOM tree via `ReactDOM.render()` (or `ReactDOM.createRoot()` if you override the
  default renderer via `options`), which means they do not preserve any existing React context from the calling code.
* they do *not* automatically detect dark theme, so you must manualy set the `{ isDarkTheme: true }` property