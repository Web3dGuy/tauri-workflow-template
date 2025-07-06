# Toast

A toast is a lightweight, ephemeral notice from an application in direct response to a user's action.

**Toasts** can be configured to appear at either the top or the bottom of an application window.
It is possible to show more than one toast on-screen at a time.

Procure toastMove filesDelete rootLog outStart loadingUpload file

##### Props

Position 

top-lefttoptop-rightbottom-leftbottombottom-rightOpen dropdown

Maximum active toasts

Auto focusCan escape key clearUse portal

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/toastExample.tsx)

## Usage

### Toast

**Toasts** have a built-in timeout of five seconds. Users can also dismiss them manually by clicking
the × button. overing the cursor over a toast prevents it from disappearing. When the cursor
leaves the toast, the toast's timeout restarts. Similarly, focussing the toast DOM element (for
example, by hitting the `tab` key) halts the timeout, and blurring restarts the timeout.

You may add one additional action button to a toast. You might use this to provide an undo button,
for example.

You may also apply the same visual intents to **Toasts** as other core components like
[**Buttons**](#core/components/button.css).

interface ToastProps extends [Props](#api/Props), [IntentProps](#api/IntentProps)<>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/toast/toastProps.ts#L20)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `action` | `ActionProps<HTMLElement> & LinkProps` Action rendered as a minimal `AnchorButton`. The toast is dismissed automatically when the user clicks the action button. Note that the `intent` prop is ignored (the action button cannot have its own intent color that might conflict with the toast's intent). Omit this prop to omit the action button. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `icon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon (or an icon element) to render before the message. |
| `intent` | `Intent` Visual intent color to apply to element.  Inherited from `IntentProps.intent` |
| `isCloseButtonShown` | `booleantrue` Whether to show the close button in the toast. |
| `message` | `ReactNode` Message to display in the body of the toast.  Required |
| `onDismiss` | `(didTimeoutExpire: boolean) => void` Callback invoked when the toast is dismissed, either by the user or by the timeout. The value of the argument indicates whether the toast was closed because the timeout expired. |
| `timeout` | `number5000` Milliseconds to wait before automatically dismissing toast. Providing a value less than or equal to 0 will disable the timeout (this is discouraged). |

### OverlayToaster

The **OverlayToaster** component (previously named **Toaster**) is a stateful container for a single
list of toasts. Internally, it uses [**Overlay2**](#core/components/overlay2) to manage children and
transitions. It can be vertically aligned along the top or bottom edge of its container (new toasts
will slide in from that edge) and horizontally aligned along the left edge, center, or right edge
of its container.

There are three ways to use **OverlayToaster**:

1. **Recommended**: use the `OverlayToaster.createAsync()` static method to create a new `Toaster` instance:

   ```
   const myToaster: Toaster = await OverlayToaster.createAsync({ position: "bottom" });  
   myToaster.show({ ...toastOptions });  

   ```

   We recommend calling `OverlayToaster.createAsync` once in your application and
   [sharing the generated instance](#core/components/toast.example) throughout your application.

   A synchronous `OverlayToaster.create()` static method is also available, but will be phased out
   since React 18+ no longer synchronously renders components to the DOM.

   ```
   const myToaster: Toaster = OverlayToaster.create({ position: "bottom" });  
   myToaster.show({ ...toastOptions });  

   ```
2. Render an `<OverlayToaster>` with `<Toast2>` children:

   ```
   render(  
       <OverlayToaster>  
           <Toast2 {...toastOptions} />  
       </OverlayToaster>,  
       targetElement,  
   );  

   ```
3. Use a ref callback or object to access toaster instance methods.

   * Example with ref callback:

   ```
   render(<OverlayToaster ref={(ref: Toaster | null) => ref?.show({ ...toastOptions })} />, targetElement);  

   ```

   * Example with ref object (note that React type constraints require us to use the more specific `OverlayToaster` type):

   ```
   const myToaster = React.createRef<OverlayToaster>();  
   render(<OverlayToaster ref={myToaster} />, targetElement);  
   myToaster.current?.show({ ...toastOptions });  

   ```

##### Working with multiple toasters

You can have multiple toasters in a single application, but you must ensure that each has a unique
`position` to prevent overlap.

##### Toaster focus

**OverlayToaster** always disables Overlay2's `enforceFocus` behavior (meaning that you're not blocked
from accessing other parts of the application while a toast is active), and by default also
disables `autoFocus` (meaning that focus will not switch to a toast when it appears). You can
enable `autoFocus` for an individual `OverlayToaster` via a prop, if desired.

interface OverlayToasterProps extends [Props](#api/Props)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/toast/overlayToasterProps.ts#L31)

Props supported by the `<OverlayToaster>` component.
These props can be passed as an argument to the static `Toaster.create(props?, container?)` method.

| Props | Description |
| --- | --- |
| `autoFocus` | `booleanfalse` Whether a toast should acquire application focus when it first opens. This is disabled by default so that toasts do not interrupt the user's flow. Note that `enforceFocus` is always disabled for `Toaster`s. |
| `canEscapeKeyClear` | `booleantrue` Whether pressing the `esc` key should clear all active toasts. |
| `children` | `ReactNode` Toasts to display inside the Overlay2. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `maxToasts` | `numberundefined` The maximum number of active toasts that can be displayed at once.  When the limit is about to be exceeded, the oldest active toast is removed. |
| `position` | `ToasterPositionPosition.TOP` Position of `Toaster` within its container. |
| `usePortal` | `booleantrue` Whether the toaster should be rendered into a new element attached to `document.body`. If `false`, then positioning will be relative to the parent element.  This prop is ignored by `Toaster.create()` as that method always appends a new element to the container. |

## Static usage

**OverlayToaster** provides the static `createAsync` method that returns a new `Toaster`, rendered
into an element attached to `<body>`. A toaster instance has a collection of methods to show and
hide toasts in its given container.

```
OverlayToaster.createAsync(props?: OverlayToasterProps, options?: OverlayToasterCreateOptions): Promise<Toaster>;  

```

type alias OverlayToasterCreateOptions

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/toast/overlayToaster.tsx#L44)

= DOMMountOptions<[OverlayToasterProps](#api/OverlayToasterProps)>

The toaster will be rendered into a new element appended to the given `container`.
The `container` determines which element toasts are positioned relative to; the default value of
`<body>` allows them to use the entire viewport.

The return type is `Promise<Toaster>`, which is a minimal interface that exposes only the instance
methods detailed below. It can be thought of as `OverlayToaster` minus the `React.Component` methods,
because the `OverlayToaster` should not be treated as a normal React component.

A promise is returned as React components cannot be rendered synchronously after React version 18.
If this makes `Toaster` usage difficult outside of a function that's not `async`, it's still
possible to attach `.then()` handlers to the returned toaster.

```
function synchronousFn() {  
    const toasterPromise = OverlayToaster.createAsync({});  
    toasterPromise.then(toaster => toaster.show({ message: "Toast!" }));  
}  

```

Note that `OverlayToaster.createAsync()` will throw an error if invoked inside a component lifecycle
method, as `ReactDOM.render()` will return `null` resulting in an inaccessible toaster instance.

##### Beware of memory leaks

The static `createAsync` and `create` methods create a new `OverlayToaster` instance for the full lifetime of your
application. Since there's no React parent component, these methods create a new DOM node as a container for the
rendered `<OverlayToaster>` component. Every `createAsync` call will add a new DOM node. We do not recommend creating a
new `Toaster` every time a toast needs to be shown. To minimize leaking:

1. Call `OverlayToaster.createAsync` once in an application and [share the instance](#core/components/toast.example).
2. Consider one of the alternative APIs that mount the `<OverlayToaster>` somewhere in the application's React component tree. This provides component lifecycle management out of the box. See [*React component usage*](#core/components/toast.react-component-usage) for an example.

interface Toaster

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/toast/toaster.ts#L23)

Instance methods available on a toaster component instance.

| Props | Description |
| --- | --- |
| `clear` | `() => void` Dismiss all toasts instantly.  Required |
| `dismiss` | `(key: string) => void` Dismiss the given toast instantly.  Required |
| `getToasts` | `() => ToastOptions[]` Returns the props for all current toasts.  Required |
| `show` | `(props: ToastProps, key?: string) => string` Shows a new toast to the user, or updates an existing toast corresponding to the provided key (optional).  Returns the unique key of the toast.  Required |

### Example

Your application can contain several `ToasterInstance`s and easily share them across the codebase as modules.

The following code samples demonstrate our preferred pattern for intergrating a toaster into a React application:

#### `toaster.ts`

```
import { OverlayToaster, Position } from "@blueprintjs/core";  
  
/** Singleton toaster instance. Create separate instances for different options. */  
export const AppToaster = OverlayToaster.createAsync({  
    className: "recipe-toaster",  
    position: Position.TOP,  
});  

```

#### `application.tsx`

```
import { Button } from "@blueprintjs/core";  
import * as React from "react";  
import { AppToaster } from "./toaster";  
  
export class App extends React.PureComponent {  
    render() {  
        return <Button onClick={this.showToast} text="Toast please" />;  
    }  
  
    showToast = async () => {  
        // create toasts in response to interactions.  
        // in most cases, it's enough to simply create and forget (thanks to timeout).  
        (await AppToaster).show({ message: "Toasted." });  
    };  
}  

```

The example below uses the `OverlayToaster.createAsync()` static method. Clicking the button will create a new toaster mounted to `<body>`, show a message, and unmount the toaster from the DOM once the message is dismissed.

Toast please

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/toastCreateAsyncExample.tsx)

#### React 18

To maintain backwards compatibility with React 16 and 17, `OverlayToaster.createAsync` uses `ReactDOM.render` out of the box. This triggers a [console warning on React 18](https://react.dev/blog/2022/03/08/react-18-upgrade-guide#updates-to-client-rendering-apis).
A future major version of Blueprint will drop support for React versions before 18 and switch the
default rendering function from `ReactDOM.render` to `createRoot`.

If you're using React 18, we recommend passing in a custom `domRenderer` function.

```
import { OverlayToaster } from "@blueprintjs/core";  
import { createRoot } from "react-dom/client";  
  
const toaster = await OverlayToaster.createAsync(toasterProps, {  
    // Use createRoot() instead of ReactDOM.render(). This can be deleted after  
    // a future Blueprint version uses createRoot() for Toasters by default.  
    domRenderer: (toaster, containerElement) => createRoot(containerElement).render(toaster),  
});  
  
toaster.show({ message: "Hello React 18!" });  

```

## React component usage

Render the `<OverlayToaster>` component like any other element and supply `<Toast2>` elements as
`children`. You can optionally attach a `ref` handler to access the instance methods, but we
strongly recommend using the [`OverlayToaster.create` static method](#core/components/toast.static-usage)
documented above instead. Note that `children` and `ref` can be used together, but `children` will
always appear *after* toasts created with `ref.show()`.

```
import { Button, OverlayToaster, Position, Toast2, ToastOptions } from "@blueprintjs/core";  
import * as React from "react";  
  
function MyComponent() {  
    const [toasts, setToasts] = React.useState<ToastOptions[]>([]);  
    const toaster = React.useRef<OverlayToaster>(null);  
  
    const addToastViaRef = React.useCallback(() => {  
        toaster.current?.show({ message: "Toasted!" });  
    }, []);  
  
    const addToastLocally = React.useCallback(() => {  
        setToasts(t => [...t, { key: "toasted", message: "Toasted!" }]);  
    }, []);  
  
    return (  
        <div>  
            <Button onClick={addToastViaRef} text="Procure toast remotely" />  
            <Button onClick={addToastLocally} text="Procure toast locally" />  
            <OverlayToaster position={Position.TOP_RIGHT} ref={toaster}>  
                {/* "Toasted!" will appear here after clicking button. */}  
                {toasts.map(toast => (  
                    <Toast2 key={toast.key} {...toast} />  
                ))}  
            </OverlayToaster>  
        </div>  
    );  
}  

```