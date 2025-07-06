# Popover

Popovers display floating content next to a target element.

The **Popover** component is built on top of the [**Popper.js**](https://popper.js.org) library.
Popper.js is a small library that offers a powerful, customizable, and performant positioning engine.

Popover target

Scroll around this container to experiment  
with `flip` and `preventOverflow` modifiers.

##### Appearance

Position when opened 

toptop-starttop-endbottombottom-startbottom-endrightright-startright-endleftleft-startleft-endautoauto-startauto-endOpen dropdown

May be overridden to prevent overflow

Example content 

TextInputSlidersMenuSelectEmptyOpen dropdown

Use `Portal`Minimal appearance

##### Control

Is controlledOpen

##### Interactions

Interaction kindClickClick (target only)HoverHover (target only)

Can escape key closeOpen on target focusShould return focus on close

##### Modifiers

ArrowFlipPrevent overflow  

scrollParentwindowOpen dropdown

Match target width

[Visit Popper.js docs](https://popper.js.org/docs/v2/)

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/popoverExample.tsx)

## Usage

##### [OverlaysProvider](#core/context/overlays-provider) recommended

This component renders an **Overlay2** which works best inside a React tree which includes an
**OverlaysProvider**. Blueprint v5.x includes a backwards-compatibile shim which allows this context
to be optional, but it will be required in a future major version. See the full
[migration guide](https://github.com/palantir/blueprint/wiki/Overlay2-migration) on the wiki.

**Popover** supports controlled and uncontrolled usage through `isOpen` and `defaultIsOpen`, respectively.
Use `onInteraction` in controlled mode to respond to changes in the `isOpen` state.

Supported user interactions are dictated by the `interactionKind` prop.

This component is quite powerful and has a wide range of features. Explore the
[**Concepts**](#core/components/popover.concepts) section below for more advanced
usage guides.

## Props interface

interface PopoverProps extends [PopoverSharedProps](#api/PopoverSharedProps)<TProps>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/popover/popover.tsx#L64)

Props shared between `Popover` and `Tooltip`.

| Props | Description |
| --- | --- |
| `autoFocus` | `booleantrue for click interactions, false for hover interactions` Whether the popover/tooltip should acquire application focus when it first opens. |
| `backdropProps` | `HTMLProps<HTMLDivElement>` HTML props for the backdrop element. Can be combined with `backdropClassName`. |
| `boundary` | `Boundary` A boundary element supplied to the "flip" and "preventOverflow" modifiers. This is a shorthand for overriding Popper.js modifier options with the `modifiers` prop.  See: [object Object]  Inherited from `PopoverSharedProps.boundary` |
| `canEscapeKeyClose` | `booleantrue` Whether pressing the `esc` key should invoke `onClose`.  Inherited from `PopoverSharedProps.canEscapeKeyClose` |
| `captureDismiss` | `booleanfalse` When enabled, clicks inside a `Classes.POPOVER_DISMISS` element will only close the current popover and not outer popovers. When disabled, the current popover and any ancestor popovers will be closed.  See: [object Object]  Inherited from `PopoverSharedProps.captureDismiss` |
| `children` | `ReactNode` Interactive element which will trigger the popover.  Inherited from `PopoverSharedProps.children` |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `PopoverSharedProps.className` |
| `content` | `string | Element` The content displayed inside the popover.  Inherited from `PopoverSharedProps.content` |
| `defaultIsOpen` | `booleanfalse` Initial opened state when uncontrolled.  Inherited from `PopoverSharedProps.defaultIsOpen` |
| `disabled` | `booleanfalse` Prevents the popover from appearing when `true`.  Inherited from `PopoverSharedProps.disabled` |
| `enforceFocus` | `booleantrue` Whether the overlay should prevent focus from leaving itself. That is, if the user attempts to focus an element outside the overlay and this prop is enabled, then the overlay will immediately bring focus back to itself. If you are nesting overlay components, either disable this prop on the "outermost" overlays or mark the nested ones `usePortal={false}`.  Inherited from `PopoverSharedProps.enforceFocus` |
| `fill` | `boolean` Whether the wrapper and target should take up the full width of their container. Note that supplying `true` for this prop will force `targetTagName="div"`.  Inherited from `PopoverSharedProps.fill` |
| `hasBackdrop` | `booleanfalse` Enables an invisible overlay beneath the popover that captures clicks and prevents interaction with the rest of the document until the popover is closed. This prop is only available when `interactionKind` is `PopoverInteractionKind.CLICK`. When popovers with backdrop are opened, they become focused. |
| `hoverCloseDelay` | `number300` The amount of time in milliseconds the popover should remain open after the user hovers off the trigger. The timer is canceled if the user mouses over the target before it expires.  Inherited from `PopoverSharedProps.hoverCloseDelay` |
| `hoverOpenDelay` | `number150` The amount of time in milliseconds the popover should wait before opening after the user hovers over the trigger. The timer is canceled if the user mouses away from the target before it expires.  Inherited from `PopoverSharedProps.hoverOpenDelay` |
| `inheritDarkTheme` | `booleantrue` Whether a popover that uses a `Portal` should automatically inherit the dark theme from its parent.  Inherited from `PopoverSharedProps.inheritDarkTheme` |
| `interactionKind` | `PopoverInteractionKind"click"` The kind of interaction that triggers the display of the popover. |
| `isOpen` | `booleanundefined` Whether the popover is visible. Passing this prop puts the popover in controlled mode, where the only way to change visibility is by updating this property. If `disabled={true}`, this prop will be ignored, and the popover will remain closed.  Inherited from `PopoverSharedProps.isOpen` |
| `lazy` | `booleantrue` If `true` and `usePortal={true}`, the `Portal` containing the children is created and attached to the DOM when the overlay is opened for the first time; otherwise this happens when the component mounts. Lazy mounting provides noticeable performance improvements if you have lots of overlays at once, such as on each row of a table.  Inherited from `PopoverSharedProps.lazy` |
| `matchTargetWidth` | `booleanfalse` Whether the popover content should be sized to match the width of the target. This is sometimes useful for dropdown menus. This prop is implemented using a Popper.js custom modifier.  Inherited from `PopoverSharedProps.matchTargetWidth` |
| `minimal` | `booleanfalse` Whether to apply minimal styling to this popover or tooltip. Minimal popovers do not have an arrow pointing to their target and use a subtler animation.  Inherited from `PopoverSharedProps.minimal` |
| `modifiers` | `Partial` Overrides for Popper.js built-in modifiers. Each override is is a full modifier object (omitting its name), keyed by its modifier name.  For example, the arrow modifier can be disabled by providing `{ arrow: { enabled: false } }`.  Some of Popover's default modifiers may get disabled under certain circumstances, but you may choose to re-enable and customize them. For example, "offset" is disabled when `minimal={true}`, but you can re-enable it with `{ offset: { enabled: true } }`.  See: [object Object]  Inherited from `PopoverSharedProps.modifiers` |
| `modifiersCustom` | `readonly Partial<Modifier<any, object>>[]` Custom modifiers to add to the popper instance.  See: [object Object]  Inherited from `PopoverSharedProps.modifiersCustom` |
| `onClose` | `(event: SyntheticEvent<HTMLElement, Event<>>) => void` A callback that is invoked when user interaction causes the overlay to close, such as clicking on the overlay or pressing the `esc` key (if enabled).  Receives the event from the user's interaction, if there was an event (generally either a mouse or key event). Note that, since this component is controlled by the `isOpen` prop, it will not actually close itself until that prop becomes `false`.  Inherited from `PopoverSharedProps.onClose` |
| `onClosed` | `(node: HTMLElement) => void` Lifecycle method invoked just after the CSS *close* transition ends but before the child has been removed from the DOM. Receives the DOM element of the child being closed.  Inherited from `PopoverSharedProps.onClosed` |
| `onClosing` | `(node: HTMLElement) => void` Lifecycle method invoked just before the CSS *close* transition begins on a child. Receives the DOM element of the child being closed.  Inherited from `PopoverSharedProps.onClosing` |
| `onInteraction` | `(nextOpenState: boolean, e?: SyntheticEvent<HTMLElement, Event<>>) => void` Callback invoked in controlled mode when the popover open state *would* change due to user interaction.  Inherited from `PopoverSharedProps.onInteraction` |
| `onOpened` | `(node: HTMLElement) => void` Lifecycle method invoked just after the CSS *open* transition ends. Receives the DOM element of the child being opened.  Inherited from `PopoverSharedProps.onOpened` |
| `onOpening` | `(node: HTMLElement) => void` Lifecycle method invoked just after mounting the child in the DOM but just before the CSS *open* transition begins. Receives the DOM element of the child being opened.  Inherited from `PopoverSharedProps.onOpening` |
| `openOnTargetFocus` | `booleantrue` Whether the popover should open when its target is focused. If `true`, target will render with `tabindex="0"` to make it focusable via keyboard navigation.  Note that this functionality is only enabled for hover interaction popovers/tooltips.  Inherited from `PopoverSharedProps.openOnTargetFocus` |
| `placement` | `Placement"auto"` The placement (relative to the target) at which the popover should appear. Mutually exclusive with `position` prop. Prefer using this over `position`, as it more closely aligns with Popper.js semantics.  The default value of `"auto"` will choose the best placement when opened and will allow the popover to reposition itself to remain onscreen as the user scrolls around.  Inherited from `PopoverSharedProps.placement` |
| `popoverClassName` | `string` A space-delimited string of class names applied to the popover element.  Inherited from `PopoverSharedProps.popoverClassName` |
| `popoverRef` | `Ref<HTMLElement>` DOM ref attached to the `Classes.POPOVER` element.  Inherited from `PopoverSharedProps.popoverRef` |
| `popupKind` | `PopupKind"menu" or undefined` The kind of popup displayed by the popover. Gets directly applied to the `aria-haspopup` attribute of the target element. This property is ignored if `interactionKind` is PopoverInteractionKind.HOVER\_TARGET\_ONLY . |
| `portalClassName` | `string` Space-delimited string of class names applied to the `Portal` element if `usePortal={true}`.  Inherited from `PopoverSharedProps.portalClassName` |
| `portalContainer` | `HTMLElementdocument.body` The container element into which the overlay renders its contents, when `usePortal` is `true`. This prop is ignored if `usePortal` is `false`.  Inherited from `PopoverSharedProps.portalContainer` |
| `portalStopPropagationEvents` | `(keyof HTMLElementEventMap)[]` A list of DOM events which should be stopped from propagating through the Portal. This prop is ignored if `usePortal` is `false`.  See: [object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object]  DeprecatedInherited from `PopoverSharedProps.portalStopPropagationEvents` |
| `position` | `PopoverPosition"auto"` The position (relative to the target) at which the popover should appear. Mutually exclusive with `placement` prop.  The default value of `"auto"` will choose the best position when opened and will allow the popover to reposition itself to remain onscreen as the user scrolls around.  Inherited from `PopoverSharedProps.position` |
| `positioningStrategy` | `PositioningStrategy"absolute"` Popper.js positioning strategy.  See: [object Object] |
| `renderTarget` | `(props: PopoverTargetProps & PopoverHoverTargetHandlers<TProps> & PopoverClickTargetHandlers<TProps>) => Element<>` Target renderer which receives props injected by Popover which should be spread onto the rendered element. This function should return a single React node.  Mutually exclusive with `children` and `targetTagName` props.  Inherited from `PopoverSharedProps.renderTarget` |
| `rootBoundary` | `RootBoundary` A root boundary element supplied to the "flip" and "preventOverflow" modifiers. This is a shorthand for overriding Popper.js modifier options with the `modifiers` prop.  See: [object Object]  Inherited from `PopoverSharedProps.rootBoundary` |
| `shouldReturnFocusOnClose` | `booleanfalse` Whether the application should return focus to the last active element in the document after this popover closes.  This is automatically set (overridden) to:   * `false` for hover interaction popovers * `true` when a popover closes due to an ESC keypress   If you are attaching a popover *and* a tooltip to the same target, you must take care to either disable this prop for the popover *or* disable the tooltip's `openOnTargetFocus` prop. |
| `targetProps` | `TProps` HTML props for the target element. This is useful in some cases where you need to render some simple attributes on the generated target element.  For more complex use cases, consider using the `renderTarget` API instead. This prop will be ignored if `renderTarget` is used.  Inherited from `PopoverSharedProps.targetProps` |
| `targetTagName` | `keyof IntrinsicElements"span" ("div" if `fill={true}` )` HTML tag name for the target element. This must be an HTML element to ensure that it supports the necessary DOM event handlers.  By default, a `<span>` tag is used so popovers appear as inline-block elements and can be nested in text. Use `<div>` tag for a block element.  If `fill` is set to `true`, this prop's default value will become `"div"` instead of `"span"`.  Note that *not all HTML tags are supported*; you will need to make sure the tag you choose supports the HTML attributes Popover applies to the target element.  This prop is mutually exclusive with the `renderTarget` API.  Inherited from `PopoverSharedProps.targetTagName` |
| `transitionDuration` | `number300` Indicates how long (in milliseconds) the overlay's enter/leave transition takes. This is used by React `CSSTransition` to know when a transition completes and must match the duration of the animation in CSS. Only set this prop if you override Blueprint's default transitions with new transitions of a different length.  Inherited from `PopoverSharedProps.transitionDuration` |
| `usePortal` | `booleantrue` Whether the popover should be rendered inside a `Portal` attached to `portalContainer` prop.  Rendering content inside a `Portal` allows the popover content to escape the physical bounds of its parent while still being positioned correctly relative to its target. Using a `Portal` is necessary if any ancestor of the target hides overflow or uses very complex positioning.  Not using a `Portal` can result in smoother performance when scrolling and allows the popover content to inherit CSS styles from surrounding elements, but it remains subject to the overflow bounds of its ancestors.  Inherited from `PopoverSharedProps.usePortal` |

## Concepts

### Structure

When creating a popover, you must specify both its **content** (via the `content` prop) and
its **target** (via the `renderTarget` prop or a single child element).

The **target** is rendered at the location of the Popover component in the React component tree. It acts
as the trigger for the popover; user interaction will show the popover based on the `interactionKind` prop.
In Popper.js terms, this is the popper "reference". There are two ways to render a Popover target, resulting
in different DOM layout depending on your application's needs:

* The simplest way to specify a target is via `children`. Provide a single React child to
  `<Popover>` and the component will render that child wrapped in a `bp5-popover-target` HTML element.
  This wrapper is configured with event handling logic necessary for the Popover to function. Its tag name
  (e.g. `div`, `span`) and props can be customized with the `targetTagName` and `targetProps` props, respectively.
* A more advanced API is available through the `renderTarget` prop. Here, Popover provides you with all the
  information necessary to render a functional popover with a [render prop](https://reactjs.org/docs/render-props.html).
  You are responsible for then propogating that information with an
  [object spread](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax#spread_in_object_literals)
  to the `React.JSX.Element` returned from `renderTarget`.

  + If the rendered element is *not* a native HTML element, you must ensure that it supports the
    `className`, `ref`, and `tabIndex` props (i.e. renders them out to the DOM).
  + The benefit to this approach is a simplified DOM structure without an extra wrapper element around
    your popover target.

The **content** will be shown inside the popover itself. When opened, the popover will always be
positioned on the page next to the target; the `placement` prop determines its relative placement (on
which side of the target).

##### Button targets

Buttons make great popover targets, but the `disabled` attribute on a `<button>` blocks all
events, which interferes with the popover functioning. If you need to disable a button which
triggers a popover, you should use [`AnchorButton`](#core/components/button.anchor-button) instead.
See the [callout here](#core/components/button.props) for more details.

```
import { Button, Classes, Popover } from "@blueprintjs/core";  
  
export class PopoverExample extends React.PureComponent {  
    public render() {  
        // popover content gets no padding by default; add the "bp5-popover-content-sizing"  
        // class to the popover to set nice padding between its border and content.  
        return (  
            <Popover  
                interactionKind="click"  
                popoverClassName={Classes.POPOVER_CONTENT_SIZING}  
                placement="bottom"  
                content={  
                    <div>  
                        <h5>Popover title</h5>  
                        <p>...</p>  
                        <Button className={Classes.POPOVER_DISMISS} text="Dismiss" />  
                    </div>  
                }  
                renderTarget={({ isOpen, ...targetProps }) => (  
                    <Button {...targetProps} intent="primary" text="Popover target" />  
                )}  
            />  
        );  
    }  
}  

```

### Placement

The `placement` prop controls the popover's position relative to the target. Popover passes this prop directly
to Popper.js; it uses the same semantics and supported values
[as shown here in the docs](https://popper.js.org/docs/v2/constructors/#options).

`import { PopperPlacements } from "@blueprintjs/core"` defines the full set of supported values.
There are straightforward base placements (`"top"`, `"bottom"`, `"left"`, `"right"`) and their variations, which
each consist of two attributes:

* Which **side** of the target the popover should render on.
* The popover's **alignment** relative to the target.

These two attributes can be expressed with a single value having the following structure:

```
    [SIDE]-[ALIGNMENT]

```

The following example shows all supported `Position` values and how each behaves in practice.
Note that if **`-[ALIGNMENT]`** is ommitted,
the popover will align to the **center** of the target.

bottom-startbottombottom-end

right-startrightright-end

*Button positions are flipped here so that all popovers open inward.*

left-startleftleft-end

top-starttoptop-end

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/popoverPlacementExample.tsx)

#### Automatic placement

Lastly, there is an `"auto"` placement which picks the side with the best available space.
See the [popper.js docs](https://popper.js.org/docs/v2/constructors/#options) for more info.

The Popover's `placement` can also be chosen *automatically* by specifying `"auto"`, `"auto-start"`, or `"auto-end"`.
All of these options choose and continually update the **side**
for you to avoid overflowing the boundary element (when scrolling within it, for instance).
The options differ in how they handle **alignment**:

* In `"auto"` mode (the default value for the `placement` prop), the Popover will align itself to the center of the target as it flips sides.
* In `"auto-start"` mode, the Popover will align itself to the `start` of the target (i.e., the top edge when the popover is on the left or right, or the left edge when the popover is on the top or bottom).
* In `"auto-end"` mode, the Popover will align itself to the `end` of the target (i.e., the bottom edge when the popover is on the left or right, or the right edge when the popover is on the top or bottom).

You can also specify a specific initial placement (e.g. `"left"`, `"bottom-start"`) and still update the Popover's position
automatically by enabling the modifiers `flip` and `preventOverflow`.
[See below](#core/components/popover.modifiers) for information about modifiers.

### Modifiers

Modifiers allow us to customize Popper.js's positioning behavior. **Popover** configures several of Popper.js's built-in
modifiers to handle things such as flipping, preventing overflow from a boundary element, and positioning the arrow.

You may override the default modifiers with the `modifiers` prop, which is an object with key-value pairs representing
the modifier name and its options object, respectively. See the
[Popper.js modifiers docs page](https://popper.js.org/docs/v2/modifiers/) for more info.

##### Auto placement requires flip modifier

Be careful when disabling the "flip" modifier, since the default "auto" placement relies on it. If you *do* decide
to disable this modifier, be sure to also specify a placement which is not "auto".

You may also add custom modifiers using the `modifiersCustom` prop. See the
[Popper.js custom modifiers documentation](https://popper.js.org/docs/v2/modifiers/#custom-modifiers) for more info.

### Controlled mode

If you prefer to have more control over your popover's behavior, you can specify the `isOpen`
property to use the component in **controlled mode**. You are now in charge of the component's
open state.

Providing a non-null value for `isOpen` disables all automatic interaction and instead invokes
the `onInteraction` callback prop any time the opened state *would have changed* in response to
user interaction under the current `interactionKind`.

Note that there are cases where `onInteraction` is invoked with an unchanged open state.
It is important to pay attention to the value of the `nextOpenState` parameter and determine
in your application logic whether you should care about a particular invocation (for instance,
if the `nextOpenState` is not the same as the **Popover**'s current state).

##### Disabling controlled popovers

If `disabled={true}`, a controlled popover will remain closed even if `isOpen={true}`.
The popover will re-open when `disabled` is set to `false`.

#### Example controlled usage

```
import { Button, Classes, Popover } from "@blueprintjs/core";  
  
export class ControlledPopoverExample extends React.Component<{}, { isOpen: boolean }> {  
    public state = { isOpen: false };  
  
    public render() {  
        return (  
            <Popover  
                content={  
                    <div>  
                        <h5>Popover Title</h5>  
                        <p>...</p>  
                        <Button className={Classes.POPOVER_DISMISS} text="Close popover" />  
                    </div>  
                }  
                interactionKind="click"  
                isOpen={this.state.isOpen}  
                onInteraction={state => this.handleInteraction(state)}  
                placement="right"  
            >  
                <Button intent="primary" text="Popover target" />  
            </Popover>  
        );  
    }  
  
    private handleInteraction(nextOpenState: boolean) {  
        this.setState({ isOpen: nextOpenState });  
    }  
}  

```

### Interactions

The `interactionKind` prop governs how the popover should open and close in response to user interactions.
The supported values are:

* `HOVER`
  + **Opens when:** the target is hovered
  + **Closes when:** the cursor is no longer inside the target *or* the popover
* `HOVER_TARGET_ONLY`:
  + **Opens when:** the target is hovered
  + **Closes when:** the cursor is no longer inside the target
* `CLICK`:
  + **Opens when:** the target is clicked, or when Enter or Shift key are pressed while target is focused
  + **Closes when:** the user clicks anywhere outside of the popover (including the target)
* `CLICK_TARGET_ONLY`:
  + **Opens when:** the target is clicked, or when Enter or Shift key are pressed while target is focused
  + **Closes when:** the target is clicked

The following example demonstrates the various interaction kinds (note: these Popovers contain
[MenuItem](#core/components/menu.menu-item)s with `shouldDismissPopover={false}`, for clarity):

hoverhover-targetclickclick-target

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/popoverInteractionKindExample.tsx)

##### Conditionally styling popover targets

When a popover is open, `Classes.POPOVER_OPEN` is applied to the target.
You can use this to style the target differently when the popover is open.

### Closing on click

Sometimes it is desirable for an element inside a Popover's content to close the popover on click. Popover supports a
pair of CSS classes, `Classes.POPOVER_DISMISS` and `Classes.POPOVER_DISMISS_OVERRIDE`, which can be added to elements to
describe whether click events should dismiss the enclosing popover.

To mark an element (and its children) as "dismiss elements", you may add the class `Classes.POPOVER_DISMISS`.
For example, the **Cancel** and **Delete** buttons in the top-level [Popover example](#core/components/popover) have
this class, and all MenuItems receive this class by default (see `shouldDismissPopover` prop). To enable this behavior
on the entire popover body, pass `popoverClassName={Classes.POPOVER_DISMISS}`.

Cancel the dismiss behavior on subtrees by nesting `Classes.POPOVER_DISMISS_OVERRIDE` inside `Classes.POPOVER_DISMISS`.
Clicks originating inside disabled elements (either via the `disabled` attribute or `Classes.DISABLED`) will never
dismiss a popover.

Additionally, the prop `captureDismiss` (disabled by default) will prevent click events from dismissing *ancestor*
popovers (not the Popover immediately containing the dismiss element). MenuItem disables this feature such that clicking
any submenu item will close all submenus, which is desirable behavior for a menu tree.

```
<div className={Classes.POPOVER_DISMISS}>  
    <button>Click me to dismiss</button>  
    <button disabled={true}>I will not dismiss</button>  
    <div className={Classes.POPOVER_DISMISS_OVERRIDE}>  
        <button>I too shall not dismiss</button>  
    </div>  
</div>  

```

Try it out

DefaultDismissNo dismiss

Click callout to dismiss.

Dismiss overrideNope

Capture dismissNested

*Popover will reopen...*

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/popoverDismissExample.tsx)

Dismiss elements won't have any effect in a popover with `interactionKind="hover-target"` because there is no way to
interact with the popover content itself: the popover is dismissed the moment the user mouses away from the target.

### Backdrop

The `hasBackdrop` prop governs whether a backdrop appears while the popover is open. When `true`:

* **A transparent backdrop will render beneath the popover**. This backdrop
  covers the entire viewport and prevents interaction with the document until
  the popover is closed. This is useful for preventing stray clicks or hovers in
  your app when the user tries to close a popover.
* **The popover will receive focus when opened**, allowing for better keyboard accessibility.

Clicking the backdrop will:

* *in uncontrolled mode*, close the popover.
* *in controlled mode*, invoke the `onInteraction` callback with an argument of `false`.

This backdrop behavior is only available for popovers with `interactionKind="click"`.
An error is thrown if used otherwise.

#### Styling the backdrop

By default, the popover backdrop is invisible, but you can easily add your own styles to
`.bp5-popover-backdrop` to customize the appearance of the backdrop (for example, you could give it
a translucent background color, like the backdrop for the [`Dialog`](#core/components/dialog) component).

The backdrop element has the same opacity-fade transition as the `Dialog` backdrop.

##### Dangerous edge case

Rendering a `<Popover isOpen={true} hasBackdrop={true}>` outside the viewport bounds can easily break your application
by covering the UI with an invisible non-interactive backdrop. This edge case must be handled by your application code
or (if possible) avoided entirely.

### Portal rendering

By default, popover contents are rendered in a [**Portal**](#core/components/portal) appended to `document.body`. This
allows the popover contents to "escape" the application DOM tree to avoid incompatible styles on ancestor elements.
(Incompatible styles typically include hidden `overflow` or complex `position` logic.) It also ensures that the popover
will appear above all other content, as its container element appears after the application container in the DOM.

Disable the `usePortal` prop to render popover contents in the normal document flow as a sibling of the target.
This behavior can be desirable to inherit CSS styles from surrounding elements, and can result in smoother performance
when scrolling. Not using a **Portal** works well for most layouts, because popovers style themselves to appear above
everything else on the page without needing to manually adjust z-indices, and Popper.js will keep them nicely positioned.

`usePortal={true}`

`usePortal={false}`

I am an inline popover.

*Scroll either container and notice what happens when the `Popover` tries to leave.*

##### Props

Open

##### Example

Re-center

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/popoverPortalExample.tsx)

## Style

### Dark theme

**Popover** automatically detects whether its trigger is nested inside a `.bp5-dark` container and applies the
same class to itself. You can also explicitly apply the dark theme to the React component by providing the prop
`popoverClassName="bp5-dark"`.

As a result, any component that you place inside a **Popover** (such as a `Menu`) automatically inherits the dark theme
styles. Note that [`Tooltip`](#core/components/tooltip) uses **Popover** internally, so it also benefits from this
behavior.

This behavior can be disabled (if the **Popover** uses a **Portal**) via the `inheritDarkTheme` prop.

### Sizing

Popovers by default have a `max-width` but no `max-height`. To constrain the height of a popover and make its content
scrollable, add a custom class to your popover content element and attach styles to that class:

```
<Popover content={<div className="custom-class">...</div>}>...</Popover>  

```
```
.custom-class {  
    max-height: $pt-grid-size * 15;  
    overflow-y: auto;  
}  

```

Open...

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/popoverSizingExample.tsx)

### Minimal style

You can create a minimal popover by setting `minimal={true}`.
This removes the arrow from the popover and makes the transitions more subtle.

MinimalDefault

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/popoverMinimalExample.tsx)

This minimal style is recommended for popovers that are not triggered by an obvious action like the
user clicking or hovering over something. For example, a minimal popover is useful for making
typeahead menus where the menu appears almost instantly after the user starts typing.

Minimal popovers are also useful for context menus that require quick enter and leave animations to
support fast workflows. You can see an example in the [context menus](#core/components/context-menu)
documentation.

## Testing

Your best resource for strategies in popover testing is
[its own unit test suite.](https://github.com/palantir/blueprint/blob/develop/packages/core/test/popover/popoverTests.tsx)

#### Animation delays

**Popover** can be difficult to test because it uses **Portal** to inject its contents elsewhere in the DOM (outside the
usual flow); this can be simplified by setting `usePortal={false}` in tests. Hover interactions can also be tricky due
to delays and transitions; this can be resolved by zeroing the default hover delays.

```
<Popover {...yourProps} usePortal={false} hoverCloseDelay={0} hoverOpenDelay={0}>  
    {yourTarget}  
</Popover>  

```

#### Rendering delays

**Popover** delays rendering updates triggered on `mouseleave`, because the mouse might have moved from the popover to
the target, which may require special handling depending on the current
[`interactionKind`](#core/components/popover.interactions). Popper.js also throttles rendering updates to improve
performance. If your components are not updating in a synchronous fashion as expected, you may need to introduce a
`setTimeout` to wait for asynchronous Popover rendering to catch up:

```
import { Classes, Overlay2, Popover } from "@blueprintjs/core";  
import { assert } from "chai";  
import { mount } from "enzyme";  
import { Target } from "react-popper";  
  
wrapper = mount(  
    <Popover usePortal={false} interactionKind="hover" content={<div>Content</div>}>  
        <div>Target</div>  
    </Popover>,  
);  
  
wrapper.find(Target).simulate("mouseenter");  
  
// hostNodes() is an Enzyme 3 helper that retains only native-HTML nodes.  
wrapper.find(`.${Classes.POPOVER}`).hostNodes().simulate("mouseenter");  
wrapper.find(`.${Classes.POPOVER}`).hostNodes().simulate("mouseleave");  
  
setTimeout(() => {  
    // Popover delays closing using setTimeout, so need to defer this check too.  
    const isOpen = wrapper.find(Overlay2).prop("isOpen");  
    assert.equal(isOpen, false);  
});  

```

#### Element refs

If `usePortal={false}` rendering is not an option, **Popover** instances expose `popoverElement` and `targetElement`
refs of the actual DOM elements. Importantly, `popoverElement` points to the `.bp5-popover` element inside the
**Portal** so you can use it to easily query popover contents without knowing precisely where they are in the DOM.
These properties exist primarily to simplify testing; do not rely on them for feature work.

```
// using mount() from enzyme  
const wrapper = mount(<Popover content={<div className="test">test</div>} />);  
const { popoverElement } = wrapper.instance();  
// popoverElement is the parent element of .bp5-popover  
popoverElement.querySelector(".test").textContent; // "test"  

```