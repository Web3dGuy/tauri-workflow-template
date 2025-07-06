# Tooltip

**Tooltip** is a lightweight popover for showing additional information during hover interactions.

Inline text can have a tooltip.

Or, hover anywhere over this whole line.

This line's tooltip is disabled.

This line's tooltip is minimal.

This line's tooltip is controlled by external state.Open

Available in the full range of visual intents!

  
Hover and click me  

Groupofbuttons

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/tooltipExample.tsx)

## Usage

**Tooltip** passes most of its props to [**Popover**](#core/components/popover), with some exceptions.
Notably, it only supports hover interactions.

When creating a tooltip, you must specify both its **content** (via the `content` prop) and
its **target** (either as children, or via the `renderTarget` prop). See the
[Popover "Structure" docs](#core/components/popover.structure) for more info on rendering a tooltip target.

The **content** will be shown inside the tooltip itself. When opened, the tooltip will always be
positioned on the page next to the target; the `placement` prop determines its relative placement (on
which side of the target).

##### Button targets

Buttons make great tooltip targets, but the `disabled` attribute will prevent all
events so the enclosing **Tooltip** will not know when to respond.
Use [**AnchorButton**](#core/components/button.anchor-button) instead;
see the [callout here](#core/components/button.props) for more details.

## Props interface

interface TooltipProps extends Omit<[PopoverSharedProps](#api/PopoverSharedProps)<TProps>, "shouldReturnFocusOnClose">, [IntentProps](#api/IntentProps)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/tooltip/tooltip.tsx#L28)

| Props | Description |
| --- | --- |
| `autoFocus` | `booleantrue` Whether the overlay should acquire application focus when it first opens.  Inherited from `Omit.autoFocus` |
| `boundary` | `Boundary` A boundary element supplied to the "flip" and "preventOverflow" modifiers. This is a shorthand for overriding Popper.js modifier options with the `modifiers` prop.  See: [object Object]  Inherited from `Omit.boundary` |
| `canEscapeKeyClose` | `booleantrue` Whether pressing the `esc` key should invoke `onClose`.  Inherited from `Omit.canEscapeKeyClose` |
| `captureDismiss` | `booleanfalse` When enabled, clicks inside a `Classes.POPOVER_DISMISS` element will only close the current popover and not outer popovers. When disabled, the current popover and any ancestor popovers will be closed.  See: [object Object]  Inherited from `Omit.captureDismiss` |
| `children` | `ReactNode` Interactive element which will trigger the popover.  Inherited from `Omit.children` |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Omit.className` |
| `compact` | `booleanfalse` Whether to use a compact appearance, which reduces the visual padding around tooltip content. |
| `content` | `string | Element` The content that will be displayed inside of the tooltip.  Required |
| `defaultIsOpen` | `booleanfalse` Initial opened state when uncontrolled.  Inherited from `Omit.defaultIsOpen` |
| `disabled` | `booleanfalse` Prevents the popover from appearing when `true`.  Inherited from `Omit.disabled` |
| `enforceFocus` | `booleantrue` Whether the overlay should prevent focus from leaving itself. That is, if the user attempts to focus an element outside the overlay and this prop is enabled, then the overlay will immediately bring focus back to itself. If you are nesting overlay components, either disable this prop on the "outermost" overlays or mark the nested ones `usePortal={false}`.  Inherited from `Omit.enforceFocus` |
| `fill` | `boolean` Whether the wrapper and target should take up the full width of their container. Note that supplying `true` for this prop will force `targetTagName="div"`.  Inherited from `Omit.fill` |
| `hoverCloseDelay` | `number0` The amount of time in milliseconds the tooltip should remain open after the user hovers off the trigger. The timer is canceled if the user mouses over the target before it expires. |
| `hoverOpenDelay` | `number100` The amount of time in milliseconds the tooltip should wait before opening after the user hovers over the trigger. The timer is canceled if the user mouses away from the target before it expires. |
| `inheritDarkTheme` | `booleantrue` Whether a popover that uses a `Portal` should automatically inherit the dark theme from its parent.  Inherited from `Omit.inheritDarkTheme` |
| `intent` | `Intent` Visual intent color to apply to element.  Inherited from `IntentProps.intent` |
| `interactionKind` | `"hover" | "hover-target"PopoverInteractionKind.HOVER_TARGET_ONLY` The kind of hover interaction that triggers the display of the tooltip. Tooltips do not support click interactions. |
| `isOpen` | `booleanundefined` Whether the popover is visible. Passing this prop puts the popover in controlled mode, where the only way to change visibility is by updating this property. If `disabled={true}`, this prop will be ignored, and the popover will remain closed.  Inherited from `Omit.isOpen` |
| `lazy` | `booleantrue` If `true` and `usePortal={true}`, the `Portal` containing the children is created and attached to the DOM when the overlay is opened for the first time; otherwise this happens when the component mounts. Lazy mounting provides noticeable performance improvements if you have lots of overlays at once, such as on each row of a table.  Inherited from `Omit.lazy` |
| `matchTargetWidth` | `booleanfalse` Whether the popover content should be sized to match the width of the target. This is sometimes useful for dropdown menus. This prop is implemented using a Popper.js custom modifier.  Inherited from `Omit.matchTargetWidth` |
| `minimal` | `booleanfalse` Whether to apply minimal styling to this popover or tooltip. Minimal popovers do not have an arrow pointing to their target and use a subtler animation.  Inherited from `Omit.minimal` |
| `modifiers` | `Partial` Overrides for Popper.js built-in modifiers. Each override is is a full modifier object (omitting its name), keyed by its modifier name.  For example, the arrow modifier can be disabled by providing `{ arrow: { enabled: false } }`.  Some of Popover's default modifiers may get disabled under certain circumstances, but you may choose to re-enable and customize them. For example, "offset" is disabled when `minimal={true}`, but you can re-enable it with `{ offset: { enabled: true } }`.  See: [object Object]  Inherited from `Omit.modifiers` |
| `modifiersCustom` | `readonly Partial<Modifier<any, object>>[]` Custom modifiers to add to the popper instance.  See: [object Object]  Inherited from `Omit.modifiersCustom` |
| `onClose` | `(event: SyntheticEvent<HTMLElement, Event<>>) => void` A callback that is invoked when user interaction causes the overlay to close, such as clicking on the overlay or pressing the `esc` key (if enabled).  Receives the event from the user's interaction, if there was an event (generally either a mouse or key event). Note that, since this component is controlled by the `isOpen` prop, it will not actually close itself until that prop becomes `false`.  Inherited from `Omit.onClose` |
| `onClosed` | `(node: HTMLElement) => void` Lifecycle method invoked just after the CSS *close* transition ends but before the child has been removed from the DOM. Receives the DOM element of the child being closed.  Inherited from `Omit.onClosed` |
| `onClosing` | `(node: HTMLElement) => void` Lifecycle method invoked just before the CSS *close* transition begins on a child. Receives the DOM element of the child being closed.  Inherited from `Omit.onClosing` |
| `onInteraction` | `(nextOpenState: boolean, e?: SyntheticEvent<HTMLElement, Event<>>) => void` Callback invoked in controlled mode when the popover open state *would* change due to user interaction.  Inherited from `Omit.onInteraction` |
| `onOpened` | `(node: HTMLElement) => void` Lifecycle method invoked just after the CSS *open* transition ends. Receives the DOM element of the child being opened.  Inherited from `Omit.onOpened` |
| `onOpening` | `(node: HTMLElement) => void` Lifecycle method invoked just after mounting the child in the DOM but just before the CSS *open* transition begins. Receives the DOM element of the child being opened.  Inherited from `Omit.onOpening` |
| `openOnTargetFocus` | `booleantrue` Whether the popover should open when its target is focused. If `true`, target will render with `tabindex="0"` to make it focusable via keyboard navigation.  Note that this functionality is only enabled for hover interaction popovers/tooltips.  Inherited from `Omit.openOnTargetFocus` |
| `placement` | `Placement"auto"` The placement (relative to the target) at which the popover should appear. Mutually exclusive with `position` prop. Prefer using this over `position`, as it more closely aligns with Popper.js semantics.  The default value of `"auto"` will choose the best placement when opened and will allow the popover to reposition itself to remain onscreen as the user scrolls around.  Inherited from `Omit.placement` |
| `popoverClassName` | `string` A space-delimited string of class names applied to the popover element.  Inherited from `Omit.popoverClassName` |
| `popoverRef` | `Ref<HTMLElement>` DOM ref attached to the `Classes.POPOVER` element.  Inherited from `Omit.popoverRef` |
| `portalClassName` | `string` Space-delimited string of class names applied to the `Portal` element if `usePortal={true}`.  Inherited from `Omit.portalClassName` |
| `portalContainer` | `HTMLElementdocument.body` The container element into which the overlay renders its contents, when `usePortal` is `true`. This prop is ignored if `usePortal` is `false`.  Inherited from `Omit.portalContainer` |
| `portalStopPropagationEvents` | `(keyof HTMLElementEventMap)[]` A list of DOM events which should be stopped from propagating through the Portal. This prop is ignored if `usePortal` is `false`.  See: [object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object]  DeprecatedInherited from `Omit.portalStopPropagationEvents` |
| `position` | `PopoverPosition"auto"` The position (relative to the target) at which the popover should appear. Mutually exclusive with `placement` prop.  The default value of `"auto"` will choose the best position when opened and will allow the popover to reposition itself to remain onscreen as the user scrolls around.  Inherited from `Omit.position` |
| `renderTarget` | `(props: PopoverTargetProps & PopoverHoverTargetHandlers<TProps> & PopoverClickTargetHandlers<TProps>) => Element<>` Target renderer which receives props injected by Popover which should be spread onto the rendered element. This function should return a single React node.  Mutually exclusive with `children` and `targetTagName` props.  Inherited from `Omit.renderTarget` |
| `rootBoundary` | `RootBoundary` A root boundary element supplied to the "flip" and "preventOverflow" modifiers. This is a shorthand for overriding Popper.js modifier options with the `modifiers` prop.  See: [object Object]  Inherited from `Omit.rootBoundary` |
| `targetProps` | `TProps` HTML props for the target element. This is useful in some cases where you need to render some simple attributes on the generated target element.  For more complex use cases, consider using the `renderTarget` API instead. This prop will be ignored if `renderTarget` is used.  Inherited from `Omit.targetProps` |
| `targetTagName` | `keyof IntrinsicElements"span" ("div" if `fill={true}` )` HTML tag name for the target element. This must be an HTML element to ensure that it supports the necessary DOM event handlers.  By default, a `<span>` tag is used so popovers appear as inline-block elements and can be nested in text. Use `<div>` tag for a block element.  If `fill` is set to `true`, this prop's default value will become `"div"` instead of `"span"`.  Note that *not all HTML tags are supported*; you will need to make sure the tag you choose supports the HTML attributes Popover applies to the target element.  This prop is mutually exclusive with the `renderTarget` API.  Inherited from `Omit.targetTagName` |
| `transitionDuration` | `number100` Indicates how long (in milliseconds) the tooltip's appear/disappear transition takes. This is used by React `CSSTransition` to know when a transition completes and must match the duration of the animation in CSS. Only set this prop if you override Blueprint's default transitions with new transitions of a different length. |
| `usePortal` | `booleantrue` Whether the popover should be rendered inside a `Portal` attached to `portalContainer` prop.  Rendering content inside a `Portal` allows the popover content to escape the physical bounds of its parent while still being positioned correctly relative to its target. Using a `Portal` is necessary if any ancestor of the target hides overflow or uses very complex positioning.  Not using a `Portal` can result in smoother performance when scrolling and allows the popover content to inherit CSS styles from surrounding elements, but it remains subject to the overflow bounds of its ancestors.  Inherited from `Omit.usePortal` |

## Combining with Popover

A single target can be wrapped in both a popover and a tooltip.

You must put the `<Tooltip>` *inside* the `<Popover>` (and the target inside the `<Tooltip>`, so the hierarchy
is `Popover > Tooltip > target`). This order is required because the tooltip needs information from the popover to
disable itself when the popover is open, thus preventing both elements from appearing at the same time.

Also, you must take care to either set `<Popover shouldReturnFocusOnClose={false}>` or
`<Tooltip openOnTargetFocus={false}>` in this scenario in order to avoid undesirable UX where the tooltip could open
automatically when a user doesn't want it to.

```
import { Button, mergeRefs, Popover, Tooltip } from "@blueprintjs/core";  
  
<Popover  
    content={<h1>Popover!</h1>}  
    renderTarget={({ isOpen: isPopoverOpen, ref: ref1, ...popoverProps }) => (  
        <Tooltip  
            content="I have a popover!"  
            disabled={isPopoverOpen}  
            openOnTargetFocus={false}  
            renderTarget={({ isOpen: isTooltipOpen, ref: ref2, ...tooltipProps }) => (  
                <Button  
                    {...popoverProps}  
                    {...tooltipProps}  
                    active={isPopoverOpen}  
                    ref={mergeRefs(ref1, ref2)}  
                    text="Hover and click me"  
                />  
            )}  
        />  
    )}  
/>;  

```