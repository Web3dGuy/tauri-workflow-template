# webviewWindow

## [References](#references)

### [Color](#color)

Re-exports [Color](namespacewebview.md)

### [DragDropEvent](#dragdropevent)

Re-exports [DragDropEvent](namespacewebview.md)

## [Classes](#classes)

### [WebviewWindow](#webviewwindow)

Create new webview or get a handle to an existing one.

Webviews are identified by a *label* a unique identifier that can be used to reference it later.
It may only contain alphanumeric characters `a-zA-Z` plus the following special characters `-`, `/`, `:` and `_`.

#### [Example](#example)

```

import { Window } from "@tauri-apps/api/window"

import { Webview } from "@tauri-apps/api/webview"

const appWindow = new Window('uniqueLabel');

// loading embedded asset:

const webview = new Webview(appWindow, 'theUniqueLabel', {

url: 'path/to/page.html'

});

// alternatively, load a remote URL:

const webview = new Webview(appWindow, 'theUniqueLabel', {

url: 'https://github.com/tauri-apps/tauri'

});

webview.once('tauri://created', function () {

// webview successfully created

});

webview.once('tauri://error', function (e) {

// an error happened creating the webview

});

// emit an event to the backend

await webview.emit("some-event", "data");

// listen to an event from the backend

const unlisten = await webview.listen("event-name", e => {});

unlisten();

```

#### [Since](#since)

2.0.0

#### [Extends](#extends)

#### [Constructors](#constructors)

##### [new WebviewWindow()](#new-webviewwindow)

```

new WebviewWindow(label, options): WebviewWindow

```

Creates a new [Window](namespacewindow.md) hosting a [Webview](namespacewebview.md).

###### [Parameters](#parameters)

| Parameter | Type | Description |
| --- | --- | --- |
| `label` | `string` | The unique webview label. Must be alphanumeric: `a-zA-Z-/:_`. |
| `options` | [`Omit`](https://www.typescriptlang.org/docs/handbook/utility-types.html#omittype-keys)<[`WebviewOptions`](namespacewebview.md), `"width"` | `"height"` | `"x"` | `"y"`> & [`WindowOptions`](namespacewindow.md) | - |

###### [Returns](#returns)

[`WebviewWindow`](namespacewebviewwindow.md)

The [WebviewWindow](namespacewebviewwindow.md) instance to communicate with the window and webview.

###### [Example](#example-1)

```

import { WebviewWindow } from '@tauri-apps/api/webviewWindow'

const webview = new WebviewWindow('my-label', {

url: 'https://github.com/tauri-apps/tauri'

});

webview.once('tauri://created', function () {

// webview successfully created

});

webview.once('tauri://error', function (e) {

// an error happened creating the webview

});

```

###### [Inherited from](#inherited-from)

[`Window`](namespacewindow.md).[`constructor`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webviewWindow.ts#L75>

#### [Properties](#properties)

| Property | Type | Description | Inherited from | Defined in |
| --- | --- | --- | --- | --- |
| `label` | `string` | The webview label. It is a unique identifier for the webview, can be used to reference it later. | [`Window`](namespacewindow.md).[`label`](namespacewindow.md) | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webviewWindow.ts#L51> |
| `listeners` | [`Record`](https://www.typescriptlang.org/docs/handbook/utility-types.html#recordkeys-type)<`string`, [`EventCallback`](namespaceevent.md)<`any`>[]> | Local event listeners. | [`Window`](namespacewindow.md).[`listeners`](namespacewindow.md) | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webviewWindow.ts#L54> |
| `window` | [`Window`](namespacewindow.md) | The window hosting this webview. | [`Webview`](namespacewebview.md).[`window`](namespacewebview.md) | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L138> |

#### [Methods](#methods)

##### [center()](#center)

```

center(): Promise<void>

```

Centers the window.

###### [Returns](#returns-1)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-2)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().center();

```

###### [Inherited from](#inherited-from-1)

[`Window`](namespacewindow.md).[`center`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L814>

##### [clearAllBrowsingData()](#clearallbrowsingdata)

```

clearAllBrowsingData(): Promise<void>

```

Clears all browsing data for this webview.

###### [Returns](#returns-2)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-3)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

await getCurrentWebview().clearAllBrowsingData();

```

###### [Inherited from](#inherited-from-2)

[`Webview`](namespacewebview.md).[`clearAllBrowsingData`](namespacewebview.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L541>

##### [clearEffects()](#cleareffects)

```

clearEffects(): Promise<void>

```

Clear any applied effects if possible.

###### [Returns](#returns-3)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Inherited from](#inherited-from-3)

[`Window`](namespacewindow.md).[`clearEffects`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1202>

##### [close()](#close)

```

close(): Promise<void>

```

Closes the webview.

###### [Returns](#returns-4)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-4)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

await getCurrentWebview().close();

```

###### [Inherited from](#inherited-from-4)

[`Window`](namespacewindow.md).[`close`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L405>

##### [destroy()](#destroy)

```

destroy(): Promise<void>

```

Destroys the window. Behaves like [Window.close](namespacewindow.md) but forces the window close instead of emitting a closeRequested event.

###### [Returns](#returns-5)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-5)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().destroy();

```

###### [Inherited from](#inherited-from-5)

[`Window`](namespacewindow.md).[`destroy`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1139>

##### [emit()](#emit)

```

emit(event, payload?): Promise<void>

```

Emits an event to all [targets](namespaceevent.md).

###### [Parameters](#parameters-1)

| Parameter | Type | Description |
| --- | --- | --- |
| `event` | `string` | Event name. Must include only alphanumeric characters, `-`, `/`, `:` and `_`. |
| `payload`? | `unknown` | Event payload. |

###### [Returns](#returns-6)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Example](#example-6)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

await getCurrentWebview().emit('webview-loaded', { loggedIn: true, token: 'authToken' });

```

###### [Inherited from](#inherited-from-6)

[`Window`](namespacewindow.md).[`emit`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L294>

##### [emitTo()](#emitto)

```

emitTo(

target,

event,

payload?): Promise<void>

```

Emits an event to all [targets](namespaceevent.md) matching the given target.

###### [Parameters](#parameters-2)

| Parameter | Type | Description |
| --- | --- | --- |
| `target` | `string` | [`EventTarget`](namespaceevent.md) | Label of the target Window/Webview/WebviewWindow or raw [EventTarget](namespaceevent.md) object. |
| `event` | `string` | Event name. Must include only alphanumeric characters, `-`, `/`, `:` and `_`. |
| `payload`? | `unknown` | Event payload. |

###### [Returns](#returns-7)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Example](#example-7)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

await getCurrentWebview().emitTo('main', 'webview-loaded', { loggedIn: true, token: 'authToken' });

```

###### [Inherited from](#inherited-from-7)

[`Window`](namespacewindow.md).[`emitTo`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L322>

##### [hide()](#hide)

```

hide(): Promise<void>

```

Hide the webview.

###### [Returns](#returns-8)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-8)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

await getCurrentWebview().hide();

```

###### [Inherited from](#inherited-from-8)

[`Window`](namespacewindow.md).[`hide`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L475>

##### [innerPosition()](#innerposition)

```

innerPosition(): Promise<PhysicalPosition>

```

The position of the top-left hand corner of the window’s client area relative to the top-left hand corner of the desktop.

###### [Returns](#returns-9)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`PhysicalPosition`](namespacedpi.md)>

The window’s inner position.

###### [Example](#example-9)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const position = await getCurrentWindow().innerPosition();

```

###### [Inherited from](#inherited-from-9)

[`Window`](namespacewindow.md).[`innerPosition`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L532>

##### [innerSize()](#innersize)

```

innerSize(): Promise<PhysicalSize>

```

The physical size of the window’s client area.
The client area is the content of the window, excluding the title bar and borders.

###### [Returns](#returns-10)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`PhysicalSize`](namespacedpi.md)>

The window’s inner size.

###### [Example](#example-10)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const size = await getCurrentWindow().innerSize();

```

###### [Inherited from](#inherited-from-10)

[`Window`](namespacewindow.md).[`innerSize`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L565>

##### [isClosable()](#isclosable)

```

isClosable(): Promise<boolean>

```

Gets the window’s native close button state.

#### [Platform-specific](#platform-specific)

* **iOS / Android:** Unsupported.

###### [Returns](#returns-11)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

Whether the window’s native close button is enabled or not.

###### [Example](#example-11)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const closable = await getCurrentWindow().isClosable();

```

###### [Inherited from](#inherited-from-11)

[`Window`](namespacewindow.md).[`isClosable`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L745>

##### [isDecorated()](#isdecorated)

```

isDecorated(): Promise<boolean>

```

Gets the window’s current decorated state.

###### [Returns](#returns-12)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

Whether the window is decorated or not.

###### [Example](#example-12)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const decorated = await getCurrentWindow().isDecorated();

```

###### [Inherited from](#inherited-from-12)

[`Window`](namespacewindow.md).[`isDecorated`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L666>

##### [isEnabled()](#isenabled)

```

isEnabled(): Promise<boolean>

```

Whether the window is enabled or disabled.

###### [Returns](#returns-13)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

A promise indicating the success or failure of the operation.

###### [Example](#example-13)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setEnabled(false);

```

###### [Since](#since-1)

2.0.0

###### [Inherited from](#inherited-from-13)

[`Window`](namespacewindow.md).[`isEnabled`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L906>

##### [isFocused()](#isfocused)

```

isFocused(): Promise<boolean>

```

Gets the window’s current focus state.

###### [Returns](#returns-14)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

Whether the window is focused or not.

###### [Example](#example-14)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const focused = await getCurrentWindow().isFocused();

```

###### [Inherited from](#inherited-from-14)

[`Window`](namespacewindow.md).[`isFocused`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L650>

##### [isFullscreen()](#isfullscreen)

```

isFullscreen(): Promise<boolean>

```

Gets the window’s current fullscreen state.

###### [Returns](#returns-15)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

Whether the window is in fullscreen mode or not.

###### [Example](#example-15)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const fullscreen = await getCurrentWindow().isFullscreen();

```

###### [Inherited from](#inherited-from-15)

[`Window`](namespacewindow.md).[`isFullscreen`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L604>

##### [isMaximizable()](#ismaximizable)

```

isMaximizable(): Promise<boolean>

```

Gets the window’s native maximize button state.

#### [Platform-specific](#platform-specific-1)

* **Linux / iOS / Android:** Unsupported.

###### [Returns](#returns-16)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

Whether the window’s native maximize button is enabled or not.

###### [Example](#example-16)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const maximizable = await getCurrentWindow().isMaximizable();

```

###### [Inherited from](#inherited-from-16)

[`Window`](namespacewindow.md).[`isMaximizable`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L703>

##### [isMaximized()](#ismaximized)

```

isMaximized(): Promise<boolean>

```

Gets the window’s current maximized state.

###### [Returns](#returns-17)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

Whether the window is maximized or not.

###### [Example](#example-17)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const maximized = await getCurrentWindow().isMaximized();

```

###### [Inherited from](#inherited-from-17)

[`Window`](namespacewindow.md).[`isMaximized`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L634>

##### [isMinimizable()](#isminimizable)

```

isMinimizable(): Promise<boolean>

```

Gets the window’s native minimize button state.

#### [Platform-specific](#platform-specific-2)

* **Linux / iOS / Android:** Unsupported.

###### [Returns](#returns-18)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

Whether the window’s native minimize button is enabled or not.

###### [Example](#example-18)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const minimizable = await getCurrentWindow().isMinimizable();

```

###### [Inherited from](#inherited-from-18)

[`Window`](namespacewindow.md).[`isMinimizable`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L724>

##### [isMinimized()](#isminimized)

```

isMinimized(): Promise<boolean>

```

Gets the window’s current minimized state.

###### [Returns](#returns-19)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

###### [Example](#example-19)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const minimized = await getCurrentWindow().isMinimized();

```

###### [Inherited from](#inherited-from-19)

[`Window`](namespacewindow.md).[`isMinimized`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L618>

##### [isResizable()](#isresizable)

```

isResizable(): Promise<boolean>

```

Gets the window’s current resizable state.

###### [Returns](#returns-20)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

Whether the window is resizable or not.

###### [Example](#example-20)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const resizable = await getCurrentWindow().isResizable();

```

###### [Inherited from](#inherited-from-20)

[`Window`](namespacewindow.md).[`isResizable`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L682>

##### [isVisible()](#isvisible)

```

isVisible(): Promise<boolean>

```

Gets the window’s current visible state.

###### [Returns](#returns-21)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

Whether the window is visible or not.

###### [Example](#example-21)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const visible = await getCurrentWindow().isVisible();

```

###### [Inherited from](#inherited-from-21)

[`Window`](namespacewindow.md).[`isVisible`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L761>

##### [listen()](#listen)

```

listen<T>(event, handler): Promise<UnlistenFn>

```

Listen to an emitted event on this webivew window.

###### [Type Parameters](#type-parameters)

| Type Parameter |
| --- |
| `T` |

###### [Parameters](#parameters-3)

| Parameter | Type | Description |
| --- | --- | --- |
| `event` | [`EventName`](namespaceevent.md) | Event name. Must include only alphanumeric characters, `-`, `/`, `:` and `_`. |
| `handler` | [`EventCallback`](namespaceevent.md)<`T`> | Event handler. |

###### [Returns](#returns-22)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

###### [Example](#example-22)

```

import { WebviewWindow } from '@tauri-apps/api/webviewWindow';

const unlisten = await WebviewWindow.getCurrent().listen<string>('state-changed', (event) => {

console.log(`Got error: ${payload}`);

});

// you need to call unlisten if your handler goes out of scope e.g. the component is unmounted

unlisten();

```

###### [Inherited from](#inherited-from-22)

[`Window`](namespacewindow.md).[`listen`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webviewWindow.ts#L155>

##### [maximize()](#maximize)

```

maximize(): Promise<void>

```

Maximizes the window.

###### [Returns](#returns-23)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-23)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().maximize();

```

###### [Inherited from](#inherited-from-23)

[`Window`](namespacewindow.md).[`maximize`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1009>

##### [minimize()](#minimize)

```

minimize(): Promise<void>

```

Minimizes the window.

###### [Returns](#returns-24)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-24)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().minimize();

```

###### [Inherited from](#inherited-from-24)

[`Window`](namespacewindow.md).[`minimize`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1057>

##### [once()](#once)

```

once<T>(event, handler): Promise<UnlistenFn>

```

Listen to an emitted event on this webview window only once.

###### [Type Parameters](#type-parameters-1)

| Type Parameter |
| --- |
| `T` |

###### [Parameters](#parameters-4)

| Parameter | Type | Description |
| --- | --- | --- |
| `event` | [`EventName`](namespaceevent.md) | Event name. Must include only alphanumeric characters, `-`, `/`, `:` and `_`. |
| `handler` | [`EventCallback`](namespaceevent.md)<`T`> | Event handler. |

###### [Returns](#returns-25)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

###### [Example](#example-25)

```

import { WebviewWindow } from '@tauri-apps/api/webviewWindow';

const unlisten = await WebviewWindow.getCurrent().once<null>('initialized', (event) => {

console.log(`Webview initialized!`);

});

// you need to call unlisten if your handler goes out of scope e.g. the component is unmounted

unlisten();

```

###### [Inherited from](#inherited-from-25)

[`Window`](namespacewindow.md).[`once`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webviewWindow.ts#L190>

##### [onCloseRequested()](#oncloserequested)

```

onCloseRequested(handler): Promise<UnlistenFn>

```

Listen to window close requested. Emitted when the user requests to closes the window.

###### [Parameters](#parameters-5)

| Parameter | Type |
| --- | --- |
| `handler` | (`event`) => `void` | [`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`> |

###### [Returns](#returns-26)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

###### [Example](#example-26)

```

import { getCurrentWindow } from "@tauri-apps/api/window";

import { confirm } from '@tauri-apps/api/dialog';

const unlisten = await getCurrentWindow().onCloseRequested(async (event) => {

const confirmed = await confirm('Are you sure?');

if (!confirmed) {

// user did not confirm closing the window; let's prevent it

event.preventDefault();

}

});

// you need to call unlisten if your handler goes out of scope e.g. the component is unmounted

unlisten();

```

###### [Inherited from](#inherited-from-26)

[`Window`](namespacewindow.md).[`onCloseRequested`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1824>

##### [onDragDropEvent()](#ondragdropevent)

```

onDragDropEvent(handler): Promise<UnlistenFn>

```

Listen to a file drop event.
The listener is triggered when the user hovers the selected files on the webview,
drops the files or cancels the operation.

###### [Parameters](#parameters-6)

| Parameter | Type |
| --- | --- |
| `handler` | [`EventCallback`](namespaceevent.md)<[`DragDropEvent`](namespacewebview.md)> |

###### [Returns](#returns-27)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

###### [Example](#example-27)

```

import { getCurrentWebview } from "@tauri-apps/api/webview";

const unlisten = await getCurrentWebview().onDragDropEvent((event) => {

if (event.payload.type === 'over') {

console.log('User hovering', event.payload.position);

} else if (event.payload.type === 'drop') {

console.log('User dropped', event.payload.paths);

} else {

console.log('File drop cancelled');

}

});

// you need to call unlisten if your handler goes out of scope e.g. the component is unmounted

unlisten();

```

When the debugger panel is open, the drop position of this event may be inaccurate due to a known limitation.
To retrieve the correct drop position, please detach the debugger.

###### [Inherited from](#inherited-from-27)

[`Window`](namespacewindow.md).[`onDragDropEvent`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L593>

##### [onFocusChanged()](#onfocuschanged)

```

onFocusChanged(handler): Promise<UnlistenFn>

```

Listen to window focus change.

###### [Parameters](#parameters-7)

| Parameter | Type |
| --- | --- |
| `handler` | [`EventCallback`](namespaceevent.md)<`boolean`> |

###### [Returns](#returns-28)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

###### [Example](#example-28)

```

import { getCurrentWindow } from "@tauri-apps/api/window";

const unlisten = await getCurrentWindow().onFocusChanged(({ payload: focused }) => {

console.log('Focus changed, window is focused? ' + focused);

});

// you need to call unlisten if your handler goes out of scope e.g. the component is unmounted

unlisten();

```

###### [Inherited from](#inherited-from-28)

[`Window`](namespacewindow.md).[`onFocusChanged`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1940>

##### [onMoved()](#onmoved)

```

onMoved(handler): Promise<UnlistenFn>

```

Listen to window move.

###### [Parameters](#parameters-8)

| Parameter | Type |
| --- | --- |
| `handler` | [`EventCallback`](namespaceevent.md)<[`PhysicalPosition`](namespacedpi.md)> |

###### [Returns](#returns-29)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

###### [Example](#example-29)

```

import { getCurrentWindow } from "@tauri-apps/api/window";

const unlisten = await getCurrentWindow().onMoved(({ payload: position }) => {

console.log('Window moved', position);

});

// you need to call unlisten if your handler goes out of scope e.g. the component is unmounted

unlisten();

```

###### [Inherited from](#inherited-from-29)

[`Window`](namespacewindow.md).[`onMoved`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1795>

##### [onResized()](#onresized)

```

onResized(handler): Promise<UnlistenFn>

```

Listen to window resize.

###### [Parameters](#parameters-9)

| Parameter | Type |
| --- | --- |
| `handler` | [`EventCallback`](namespaceevent.md)<[`PhysicalSize`](namespacedpi.md)> |

###### [Returns](#returns-30)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

###### [Example](#example-30)

```

import { getCurrentWindow } from "@tauri-apps/api/window";

const unlisten = await getCurrentWindow().onResized(({ payload: size }) => {

console.log('Window resized', size);

});

// you need to call unlisten if your handler goes out of scope e.g. the component is unmounted

unlisten();

```

###### [Inherited from](#inherited-from-30)

[`Window`](namespacewindow.md).[`onResized`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1771>

##### [onScaleChanged()](#onscalechanged)

```

onScaleChanged(handler): Promise<UnlistenFn>

```

Listen to window scale change. Emitted when the window’s scale factor has changed.
The following user actions can cause DPI changes:

* Changing the display’s resolution.
* Changing the display’s scale factor (e.g. in Control Panel on Windows).
* Moving the window to a display with a different scale factor.

###### [Parameters](#parameters-10)

| Parameter | Type |
| --- | --- |
| `handler` | [`EventCallback`](namespaceevent.md)<[`ScaleFactorChanged`](namespacewindow.md)> |

###### [Returns](#returns-31)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

###### [Example](#example-31)

```

import { getCurrentWindow } from "@tauri-apps/api/window";

const unlisten = await getCurrentWindow().onScaleChanged(({ payload }) => {

console.log('Scale changed', payload.scaleFactor, payload.size);

});

// you need to call unlisten if your handler goes out of scope e.g. the component is unmounted

unlisten();

```

###### [Inherited from](#inherited-from-31)

[`Window`](namespacewindow.md).[`onScaleChanged`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1980>

##### [onThemeChanged()](#onthemechanged)

```

onThemeChanged(handler): Promise<UnlistenFn>

```

Listen to the system theme change.

###### [Parameters](#parameters-11)

| Parameter | Type |
| --- | --- |
| `handler` | [`EventCallback`](namespaceevent.md)<[`Theme`](namespacewindow.md)> |

###### [Returns](#returns-32)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

###### [Example](#example-32)

```

import { getCurrentWindow } from "@tauri-apps/api/window";

const unlisten = await getCurrentWindow().onThemeChanged(({ payload: theme }) => {

console.log('New theme: ' + theme);

});

// you need to call unlisten if your handler goes out of scope e.g. the component is unmounted

unlisten();

```

###### [Inherited from](#inherited-from-32)

[`Window`](namespacewindow.md).[`onThemeChanged`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2006>

##### [outerPosition()](#outerposition)

```

outerPosition(): Promise<PhysicalPosition>

```

The position of the top-left hand corner of the window relative to the top-left hand corner of the desktop.

###### [Returns](#returns-33)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`PhysicalPosition`](namespacedpi.md)>

The window’s outer position.

###### [Example](#example-33)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const position = await getCurrentWindow().outerPosition();

```

###### [Inherited from](#inherited-from-33)

[`Window`](namespacewindow.md).[`outerPosition`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L548>

##### [outerSize()](#outersize)

```

outerSize(): Promise<PhysicalSize>

```

The physical size of the entire window.
These dimensions include the title bar and borders. If you don’t want that (and you usually don’t), use inner\_size instead.

###### [Returns](#returns-34)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`PhysicalSize`](namespacedpi.md)>

The window’s outer size.

###### [Example](#example-34)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const size = await getCurrentWindow().outerSize();

```

###### [Inherited from](#inherited-from-34)

[`Window`](namespacewindow.md).[`outerSize`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L585>

##### [position()](#position)

```

position(): Promise<PhysicalPosition>

```

The position of the top-left hand corner of the webview’s client area relative to the top-left hand corner of the desktop.

###### [Returns](#returns-35)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`PhysicalPosition`](namespacedpi.md)>

The webview’s position.

###### [Example](#example-35)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

const position = await getCurrentWebview().position();

```

###### [Inherited from](#inherited-from-35)

[`Webview`](namespacewebview.md).[`position`](namespacewebview.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L367>

##### [reparent()](#reparent)

```

reparent(window): Promise<void>

```

Moves this webview to the given label.

###### [Parameters](#parameters-12)

| Parameter | Type |
| --- | --- |
| `window` | `string` | [`Window`](namespacewindow.md) | [`WebviewWindow`](namespacewebviewwindow.md) |

###### [Returns](#returns-36)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-36)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

await getCurrentWebview().reparent('other-window');

```

###### [Inherited from](#inherited-from-36)

[`Webview`](namespacewebview.md).[`reparent`](namespacewebview.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L524>

##### [requestUserAttention()](#requestuserattention)

```

requestUserAttention(requestType): Promise<void>

```

Requests user attention to the window, this has no effect if the application
is already focused. How requesting for user attention manifests is platform dependent,
see `UserAttentionType` for details.

Providing `null` will unset the request for user attention. Unsetting the request for
user attention might not be done automatically by the WM when the window receives input.

#### [Platform-specific](#platform-specific-3)

* **macOS:** `null` has no effect.
* **Linux:** Urgency levels have the same effect.

###### [Parameters](#parameters-13)

| Parameter | Type |
| --- | --- |
| `requestType` | `null` | [`UserAttentionType`](namespacewindow.md) |

###### [Returns](#returns-37)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-37)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().requestUserAttention();

```

###### [Inherited from](#inherited-from-37)

[`Window`](namespacewindow.md).[`requestUserAttention`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L840>

##### [scaleFactor()](#scalefactor)

```

scaleFactor(): Promise<number>

```

The scale factor that can be used to map physical pixels to logical pixels.

###### [Returns](#returns-38)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`number`>

The window’s monitor scale factor.

###### [Example](#example-38)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const factor = await getCurrentWindow().scaleFactor();

```

###### [Inherited from](#inherited-from-38)

[`Window`](namespacewindow.md).[`scaleFactor`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L516>

##### [setAlwaysOnBottom()](#setalwaysonbottom)

```

setAlwaysOnBottom(alwaysOnBottom): Promise<void>

```

Whether the window should always be below other windows.

###### [Parameters](#parameters-14)

| Parameter | Type | Description |
| --- | --- | --- |
| `alwaysOnBottom` | `boolean` | Whether the window should always be below other windows or not. |

###### [Returns](#returns-39)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-39)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setAlwaysOnBottom(true);

```

###### [Inherited from](#inherited-from-39)

[`Window`](namespacewindow.md).[`setAlwaysOnBottom`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1238>

##### [setAlwaysOnTop()](#setalwaysontop)

```

setAlwaysOnTop(alwaysOnTop): Promise<void>

```

Whether the window should always be on top of other windows.

###### [Parameters](#parameters-15)

| Parameter | Type | Description |
| --- | --- | --- |
| `alwaysOnTop` | `boolean` | Whether the window should always be on top of other windows or not. |

###### [Returns](#returns-40)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-40)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setAlwaysOnTop(true);

```

###### [Inherited from](#inherited-from-40)

[`Window`](namespacewindow.md).[`setAlwaysOnTop`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1220>

##### [setBackgroundColor()](#setbackgroundcolor)

```

setBackgroundColor(color): Promise<void>

```

Set the window and webview background color.

#### [Platform-specific:](#platform-specific-4)

* **Android / iOS:** Unsupported for the window layer.
* **macOS / iOS**: Not implemented for the webview layer.
* **Windows**:
  + alpha channel is ignored for the window layer.
  + On Windows 7, alpha channel is ignored for the webview layer.
  + On Windows 8 and newer, if alpha channel is not `0`, it will be ignored.

###### [Parameters](#parameters-16)

| Parameter | Type |
| --- | --- |
| `color` | [`Color`](namespacewebview.md) |

###### [Returns](#returns-41)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Since](#since-2)

2.1.0

###### [Inherited from](#inherited-from-41)

[`Window`](namespacewindow.md).[`setBackgroundColor`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webviewWindow.ts#L222>

##### [setBadgeCount()](#setbadgecount)

```

setBadgeCount(count?): Promise<void>

```

Sets the badge count. It is app wide and not specific to this window.

#### [Platform-specific](#platform-specific-5)

* **Windows**: Unsupported. Use @{linkcode Window.setOverlayIcon} instead.

###### [Parameters](#parameters-17)

| Parameter | Type | Description |
| --- | --- | --- |
| `count`? | `number` | The badge count. Use `undefined` to remove the badge. |

###### [Returns](#returns-42)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-41)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setBadgeCount(5);

```

###### [Inherited from](#inherited-from-42)

[`Window`](namespacewindow.md).[`setBadgeCount`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1624>

##### [setBadgeLabel()](#setbadgelabel)

```

setBadgeLabel(label?): Promise<void>

```

Sets the badge cont **macOS only**.

###### [Parameters](#parameters-18)

| Parameter | Type | Description |
| --- | --- | --- |
| `label`? | `string` | The badge label. Use `undefined` to remove the badge. |

###### [Returns](#returns-43)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-42)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setBadgeLabel("Hello");

```

###### [Inherited from](#inherited-from-43)

[`Window`](namespacewindow.md).[`setBadgeLabel`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1643>

##### [setClosable()](#setclosable)

```

setClosable(closable): Promise<void>

```

Sets whether the window’s native close button is enabled or not.

#### [Platform-specific](#platform-specific-6)

* **Linux:** GTK+ will do its best to convince the window manager not to show a close button. Depending on the system, this function may not have any effect when called on a window that is already visible
* **iOS / Android:** Unsupported.

###### [Parameters](#parameters-19)

| Parameter | Type |
| --- | --- |
| `closable` | `boolean` |

###### [Returns](#returns-44)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-43)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setClosable(false);

```

###### [Inherited from](#inherited-from-44)

[`Window`](namespacewindow.md).[`setClosable`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L974>

##### [setContentProtected()](#setcontentprotected)

```

setContentProtected(protected_): Promise<void>

```

Prevents the window contents from being captured by other apps.

###### [Parameters](#parameters-20)

| Parameter | Type |
| --- | --- |
| `protected_` | `boolean` |

###### [Returns](#returns-45)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-44)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setContentProtected(true);

```

###### [Inherited from](#inherited-from-45)

[`Window`](namespacewindow.md).[`setContentProtected`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1255>

##### [setCursorGrab()](#setcursorgrab)

```

setCursorGrab(grab): Promise<void>

```

Grabs the cursor, preventing it from leaving the window.

There’s no guarantee that the cursor will be hidden. You should
hide it by yourself if you want so.

#### [Platform-specific](#platform-specific-7)

* **Linux:** Unsupported.
* **macOS:** This locks the cursor in a fixed location, which looks visually awkward.

###### [Parameters](#parameters-21)

| Parameter | Type | Description |
| --- | --- | --- |
| `grab` | `boolean` | `true` to grab the cursor icon, `false` to release it. |

###### [Returns](#returns-46)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-45)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setCursorGrab(true);

```

###### [Inherited from](#inherited-from-46)

[`Window`](namespacewindow.md).[`setCursorGrab`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1471>

##### [setCursorIcon()](#setcursoricon)

```

setCursorIcon(icon): Promise<void>

```

Modifies the cursor icon of the window.

###### [Parameters](#parameters-22)

| Parameter | Type | Description |
| --- | --- | --- |
| `icon` | [`CursorIcon`](namespacewindow.md) | The new cursor icon. |

###### [Returns](#returns-47)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-46)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setCursorIcon('help');

```

###### [Inherited from](#inherited-from-47)

[`Window`](namespacewindow.md).[`setCursorIcon`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1513>

##### [setCursorPosition()](#setcursorposition)

```

setCursorPosition(position): Promise<void>

```

Changes the position of the cursor in window coordinates.

###### [Parameters](#parameters-23)

| Parameter | Type | Description |
| --- | --- | --- |
| `position` | [`LogicalPosition`](namespacedpi.md) | [`PhysicalPosition`](namespacedpi.md) | [`Position`](namespacedpi.md) | The new cursor position. |

###### [Returns](#returns-48)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-47)

```

import { getCurrentWindow, LogicalPosition } from '@tauri-apps/api/window';

await getCurrentWindow().setCursorPosition(new LogicalPosition(600, 300));

```

###### [Inherited from](#inherited-from-48)

[`Window`](namespacewindow.md).[`setCursorPosition`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1547>

##### [setCursorVisible()](#setcursorvisible)

```

setCursorVisible(visible): Promise<void>

```

Modifies the cursor’s visibility.

#### [Platform-specific](#platform-specific-8)

* **Windows:** The cursor is only hidden within the confines of the window.
* **macOS:** The cursor is hidden as long as the window has input focus, even if the cursor is
  outside of the window.

###### [Parameters](#parameters-24)

| Parameter | Type | Description |
| --- | --- | --- |
| `visible` | `boolean` | If `false`, this will hide the cursor. If `true`, this will show the cursor. |

###### [Returns](#returns-49)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-48)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setCursorVisible(false);

```

###### [Inherited from](#inherited-from-49)

[`Window`](namespacewindow.md).[`setCursorVisible`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1495>

##### [setDecorations()](#setdecorations)

```

setDecorations(decorations): Promise<void>

```

Whether the window should have borders and bars.

###### [Parameters](#parameters-25)

| Parameter | Type | Description |
| --- | --- | --- |
| `decorations` | `boolean` | Whether the window should have borders and bars. |

###### [Returns](#returns-50)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-49)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setDecorations(false);

```

###### [Inherited from](#inherited-from-50)

[`Window`](namespacewindow.md).[`setDecorations`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1156>

##### [setEffects()](#seteffects)

```

setEffects(effects): Promise<void>

```

Set window effects.

###### [Parameters](#parameters-26)

| Parameter | Type |
| --- | --- |
| `effects` | [`Effects`](namespacewindow.md) |

###### [Returns](#returns-51)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Inherited from](#inherited-from-51)

[`Window`](namespacewindow.md).[`setEffects`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1192>

##### [setEnabled()](#setenabled)

```

setEnabled(enabled): Promise<void>

```

Enable or disable the window.

###### [Parameters](#parameters-27)

| Parameter | Type |
| --- | --- |
| `enabled` | `boolean` |

###### [Returns](#returns-52)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-50)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setEnabled(false);

```

###### [Since](#since-3)

2.0.0

###### [Inherited from](#inherited-from-52)

[`Window`](namespacewindow.md).[`setEnabled`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L887>

##### [setFocus()](#setfocus)

```

setFocus(): Promise<void>

```

Bring the webview to front and focus.

###### [Returns](#returns-53)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-51)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

await getCurrentWebview().setFocus();

```

###### [Inherited from](#inherited-from-53)

[`Window`](namespacewindow.md).[`setFocus`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L459>

##### [setFullscreen()](#setfullscreen)

```

setFullscreen(fullscreen): Promise<void>

```

Sets the window fullscreen state.

###### [Parameters](#parameters-28)

| Parameter | Type | Description |
| --- | --- | --- |
| `fullscreen` | `boolean` | Whether the window should go to fullscreen or not. |

###### [Returns](#returns-54)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-52)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setFullscreen(true);

```

###### [Inherited from](#inherited-from-54)

[`Window`](namespacewindow.md).[`setFullscreen`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1380>

##### [setIcon()](#seticon)

```

setIcon(icon): Promise<void>

```

Sets the window icon.

###### [Parameters](#parameters-29)

| Parameter | Type | Description |
| --- | --- | --- |
| `icon` | | `string` | `number`[] | [`ArrayBuffer`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer) | [`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`> | [`Image`](namespaceimage.md) | Icon bytes or path to the icon file. |

###### [Returns](#returns-55)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-53)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setIcon('/tauri/awesome.png');

```

Note that you may need the `image-ico` or `image-png` Cargo features to use this API.
To enable it, change your Cargo.toml file:

```

[dependencies]

tauri = { version = "...", features = ["...", "image-png"] }

```

###### [Inherited from](#inherited-from-55)

[`Window`](namespacewindow.md).[`setIcon`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1421>

##### [setIgnoreCursorEvents()](#setignorecursorevents)

```

setIgnoreCursorEvents(ignore): Promise<void>

```

Changes the cursor events behavior.

###### [Parameters](#parameters-30)

| Parameter | Type | Description |
| --- | --- | --- |
| `ignore` | `boolean` | `true` to ignore the cursor events; `false` to process them as usual. |

###### [Returns](#returns-56)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-54)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setIgnoreCursorEvents(true);

```

###### [Inherited from](#inherited-from-56)

[`Window`](namespacewindow.md).[`setIgnoreCursorEvents`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1568>

##### [setMaximizable()](#setmaximizable)

```

setMaximizable(maximizable): Promise<void>

```

Sets whether the window’s native maximize button is enabled or not.
If resizable is set to false, this setting is ignored.

#### [Platform-specific](#platform-specific-9)

* **macOS:** Disables the “zoom” button in the window titlebar, which is also used to enter fullscreen mode.
* **Linux / iOS / Android:** Unsupported.

###### [Parameters](#parameters-31)

| Parameter | Type |
| --- | --- |
| `maximizable` | `boolean` |

###### [Returns](#returns-57)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-55)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setMaximizable(false);

```

###### [Inherited from](#inherited-from-57)

[`Window`](namespacewindow.md).[`setMaximizable`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L929>

##### [setMaxSize()](#setmaxsize)

```

setMaxSize(size): Promise<void>

```

Sets the window maximum inner size. If the `size` argument is undefined, the constraint is unset.

###### [Parameters](#parameters-32)

| Parameter | Type | Description |
| --- | --- | --- |
| `size` | | `undefined` | `null` | [`LogicalSize`](namespacedpi.md) | [`PhysicalSize`](namespacedpi.md) | [`Size`](namespacedpi.md) | The logical or physical inner size, or `null` to unset the constraint. |

###### [Returns](#returns-58)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-56)

```

import { getCurrentWindow, LogicalSize } from '@tauri-apps/api/window';

await getCurrentWindow().setMaxSize(new LogicalSize(600, 500));

```

###### [Inherited from](#inherited-from-58)

[`Window`](namespacewindow.md).[`setMaxSize`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1311>

##### [setMinimizable()](#setminimizable)

```

setMinimizable(minimizable): Promise<void>

```

Sets whether the window’s native minimize button is enabled or not.

#### [Platform-specific](#platform-specific-10)

* **Linux / iOS / Android:** Unsupported.

###### [Parameters](#parameters-33)

| Parameter | Type |
| --- | --- |
| `minimizable` | `boolean` |

###### [Returns](#returns-59)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-57)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setMinimizable(false);

```

###### [Inherited from](#inherited-from-59)

[`Window`](namespacewindow.md).[`setMinimizable`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L951>

##### [setMinSize()](#setminsize)

```

setMinSize(size): Promise<void>

```

Sets the window minimum inner size. If the `size` argument is not provided, the constraint is unset.

###### [Parameters](#parameters-34)

| Parameter | Type | Description |
| --- | --- | --- |
| `size` | | `undefined` | `null` | [`LogicalSize`](namespacedpi.md) | [`PhysicalSize`](namespacedpi.md) | [`Size`](namespacedpi.md) | The logical or physical inner size, or `null` to unset the constraint. |

###### [Returns](#returns-60)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-58)

```

import { getCurrentWindow, PhysicalSize } from '@tauri-apps/api/window';

await getCurrentWindow().setMinSize(new PhysicalSize(600, 500));

```

###### [Inherited from](#inherited-from-60)

[`Window`](namespacewindow.md).[`setMinSize`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1291>

##### [setOverlayIcon()](#setoverlayicon)

```

setOverlayIcon(icon?): Promise<void>

```

Sets the overlay icon. **Windows only**
The overlay icon can be set for every window.

Note that you may need the `image-ico` or `image-png` Cargo features to use this API.
To enable it, change your Cargo.toml file:

```

[dependencies]

tauri = { version = "...", features = ["...", "image-png"] }

```

###### [Parameters](#parameters-35)

| Parameter | Type | Description |
| --- | --- | --- |
| `icon`? | | `string` | `number`[] | [`ArrayBuffer`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer) | [`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`> | [`Image`](namespaceimage.md) | Icon bytes or path to the icon file. Use `undefined` to remove the overlay icon. |

###### [Returns](#returns-61)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-59)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setOverlayIcon("/tauri/awesome.png");

```

###### [Inherited from](#inherited-from-61)

[`Window`](namespacewindow.md).[`setOverlayIcon`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1672>

##### [setPosition()](#setposition)

```

setPosition(position): Promise<void>

```

Sets the webview position.

###### [Parameters](#parameters-36)

| Parameter | Type | Description |
| --- | --- | --- |
| `position` | [`LogicalPosition`](namespacedpi.md) | [`PhysicalPosition`](namespacedpi.md) | [`Position`](namespacedpi.md) | The new position, in logical or physical pixels. |

###### [Returns](#returns-62)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-60)

```

import { getCurrent, LogicalPosition } from '@tauri-apps/api/webview';

await getCurrentWebview().setPosition(new LogicalPosition(600, 500));

```

###### [Inherited from](#inherited-from-62)

[`Window`](namespacewindow.md).[`setPosition`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L440>

##### [setProgressBar()](#setprogressbar)

```

setProgressBar(state): Promise<void>

```

Sets the taskbar progress state.

#### [Platform-specific](#platform-specific-11)

* **Linux / macOS**: Progress bar is app-wide and not specific to this window.
* **Linux**: Only supported desktop environments with `libunity` (e.g. GNOME).

###### [Parameters](#parameters-37)

| Parameter | Type |
| --- | --- |
| `state` | [`ProgressBarState`](namespacewindow.md) |

###### [Returns](#returns-63)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-61)

```

import { getCurrentWindow, ProgressBarStatus } from '@tauri-apps/api/window';

await getCurrentWindow().setProgressBar({

status: ProgressBarStatus.Normal,

progress: 50,

});

```

###### [Inherited from](#inherited-from-63)

[`Window`](namespacewindow.md).[`setProgressBar`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1700>

##### [setResizable()](#setresizable)

```

setResizable(resizable): Promise<void>

```

Updates the window resizable flag.

###### [Parameters](#parameters-38)

| Parameter | Type |
| --- | --- |
| `resizable` | `boolean` |

###### [Returns](#returns-64)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-62)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setResizable(false);

```

###### [Inherited from](#inherited-from-64)

[`Window`](namespacewindow.md).[`setResizable`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L868>

##### [setShadow()](#setshadow)

```

setShadow(enable): Promise<void>

```

Whether or not the window should have shadow.

#### [Platform-specific](#platform-specific-12)

* **Windows:**
  + `false` has no effect on decorated window, shadows are always ON.
  + `true` will make undecorated window have a 1px white border,
    and on Windows 11, it will have a rounded corners.
* **Linux:** Unsupported.

###### [Parameters](#parameters-39)

| Parameter | Type |
| --- | --- |
| `enable` | `boolean` |

###### [Returns](#returns-65)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-63)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setShadow(false);

```

###### [Inherited from](#inherited-from-65)

[`Window`](namespacewindow.md).[`setShadow`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1182>

##### [setSize()](#setsize)

```

setSize(size): Promise<void>

```

Resizes the webview.

###### [Parameters](#parameters-40)

| Parameter | Type | Description |
| --- | --- | --- |
| `size` | [`LogicalSize`](namespacedpi.md) | [`PhysicalSize`](namespacedpi.md) | [`Size`](namespacedpi.md) | The logical or physical size. |

###### [Returns](#returns-66)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-64)

```

import { getCurrent, LogicalSize } from '@tauri-apps/api/webview';

await getCurrentWebview().setSize(new LogicalSize(600, 500));

```

###### [Inherited from](#inherited-from-66)

[`Window`](namespacewindow.md).[`setSize`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L422>

##### [setSizeConstraints()](#setsizeconstraints)

```

setSizeConstraints(constraints): Promise<void>

```

Sets the window inner size constraints.

###### [Parameters](#parameters-41)

| Parameter | Type | Description |
| --- | --- | --- |
| `constraints` | `undefined` | `null` | [`WindowSizeConstraints`](namespacewindow.md) | The logical or physical inner size, or `null` to unset the constraint. |

###### [Returns](#returns-67)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-65)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setSizeConstraints({ minWidth: 300 });

```

###### [Inherited from](#inherited-from-67)

[`Window`](namespacewindow.md).[`setSizeConstraints`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1331>

##### [setSkipTaskbar()](#setskiptaskbar)

```

setSkipTaskbar(skip): Promise<void>

```

Whether the window icon should be hidden from the taskbar or not.

#### [Platform-specific](#platform-specific-13)

* **macOS:** Unsupported.

###### [Parameters](#parameters-42)

| Parameter | Type | Description |
| --- | --- | --- |
| `skip` | `boolean` | true to hide window icon, false to show it. |

###### [Returns](#returns-68)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-66)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setSkipTaskbar(true);

```

###### [Inherited from](#inherited-from-68)

[`Window`](namespacewindow.md).[`setSkipTaskbar`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1445>

##### [setTheme()](#settheme)

```

setTheme(theme?): Promise<void>

```

Set window theme, pass in `null` or `undefined` to follow system theme

#### [Platform-specific](#platform-specific-14)

* **Linux / macOS**: Theme is app-wide and not specific to this window.
* **iOS / Android:** Unsupported.

###### [Parameters](#parameters-43)

| Parameter | Type |
| --- | --- |
| `theme`? | `null` | [`Theme`](namespacewindow.md) |

###### [Returns](#returns-69)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Since](#since-4)

2.0.0

###### [Inherited from](#inherited-from-69)

[`Window`](namespacewindow.md).[`setTheme`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1745>

##### [setTitle()](#settitle)

```

setTitle(title): Promise<void>

```

Sets the window title.

###### [Parameters](#parameters-44)

| Parameter | Type | Description |
| --- | --- | --- |
| `title` | `string` | The new title |

###### [Returns](#returns-70)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-67)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setTitle('Tauri');

```

###### [Inherited from](#inherited-from-70)

[`Window`](namespacewindow.md).[`setTitle`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L992>

##### [setTitleBarStyle()](#settitlebarstyle)

```

setTitleBarStyle(style): Promise<void>

```

Sets the title bar style. **macOS only**.

###### [Parameters](#parameters-45)

| Parameter | Type |
| --- | --- |
| `style` | [`TitleBarStyle`](namespacewindow.md) |

###### [Returns](#returns-71)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Since](#since-5)

2.0.0

###### [Inherited from](#inherited-from-71)

[`Window`](namespacewindow.md).[`setTitleBarStyle`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1728>

##### [setVisibleOnAllWorkspaces()](#setvisibleonallworkspaces)

```

setVisibleOnAllWorkspaces(visible): Promise<void>

```

Sets whether the window should be visible on all workspaces or virtual desktops.

#### [Platform-specific](#platform-specific-15)

* **Windows / iOS / Android:** Unsupported.

###### [Parameters](#parameters-46)

| Parameter | Type |
| --- | --- |
| `visible` | `boolean` |

###### [Returns](#returns-72)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Since](#since-6)

2.0.0

###### [Inherited from](#inherited-from-72)

[`Window`](namespacewindow.md).[`setVisibleOnAllWorkspaces`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1716>

##### [setZoom()](#setzoom)

```

setZoom(scaleFactor): Promise<void>

```

Set webview zoom level.

###### [Parameters](#parameters-47)

| Parameter | Type |
| --- | --- |
| `scaleFactor` | `number` |

###### [Returns](#returns-73)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-68)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

await getCurrentWebview().setZoom(1.5);

```

###### [Inherited from](#inherited-from-73)

[`Webview`](namespacewebview.md).[`setZoom`](namespacewebview.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L507>

##### [show()](#show)

```

show(): Promise<void>

```

Show the webview.

###### [Returns](#returns-74)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-69)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

await getCurrentWebview().show();

```

###### [Inherited from](#inherited-from-74)

[`Window`](namespacewindow.md).[`show`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L491>

##### [size()](#size)

```

size(): Promise<PhysicalSize>

```

The physical size of the webview’s client area.
The client area is the content of the webview, excluding the title bar and borders.

###### [Returns](#returns-75)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`PhysicalSize`](namespacedpi.md)>

The webview’s size.

###### [Example](#example-70)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

const size = await getCurrentWebview().size();

```

###### [Inherited from](#inherited-from-75)

[`Webview`](namespacewebview.md).[`size`](namespacewebview.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L384>

##### [startDragging()](#startdragging)

```

startDragging(): Promise<void>

```

Starts dragging the window.

###### [Returns](#returns-76)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-71)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().startDragging();

```

###### [Inherited from](#inherited-from-76)

[`Window`](namespacewindow.md).[`startDragging`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1585>

##### [startResizeDragging()](#startresizedragging)

```

startResizeDragging(direction): Promise<void>

```

Starts resize-dragging the window.

###### [Parameters](#parameters-48)

| Parameter | Type |
| --- | --- |
| `direction` | `ResizeDirection` |

###### [Returns](#returns-77)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-72)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().startResizeDragging();

```

###### [Inherited from](#inherited-from-77)

[`Window`](namespacewindow.md).[`startResizeDragging`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1601>

##### [theme()](#theme)

```

theme(): Promise<null | Theme>

```

Gets the window’s current theme.

#### [Platform-specific](#platform-specific-16)

* **macOS:** Theme was introduced on macOS 10.14. Returns `light` on macOS 10.13 and below.

###### [Returns](#returns-78)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`null` | [`Theme`](namespacewindow.md)>

The window theme.

###### [Example](#example-73)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const theme = await getCurrentWindow().theme();

```

###### [Inherited from](#inherited-from-78)

[`Window`](namespacewindow.md).[`theme`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L796>

##### [title()](#title)

```

title(): Promise<string>

```

Gets the window’s current title.

###### [Returns](#returns-79)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

###### [Example](#example-74)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const title = await getCurrentWindow().title();

```

###### [Inherited from](#inherited-from-79)

[`Window`](namespacewindow.md).[`title`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L775>

##### [toggleMaximize()](#togglemaximize)

```

toggleMaximize(): Promise<void>

```

Toggles the window maximized state.

###### [Returns](#returns-80)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-75)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().toggleMaximize();

```

###### [Inherited from](#inherited-from-80)

[`Window`](namespacewindow.md).[`toggleMaximize`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1041>

##### [unmaximize()](#unmaximize)

```

unmaximize(): Promise<void>

```

Unmaximizes the window.

###### [Returns](#returns-81)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-76)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().unmaximize();

```

###### [Inherited from](#inherited-from-81)

[`Window`](namespacewindow.md).[`unmaximize`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1025>

##### [unminimize()](#unminimize)

```

unminimize(): Promise<void>

```

Unminimizes the window.

###### [Returns](#returns-82)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-77)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().unminimize();

```

###### [Inherited from](#inherited-from-82)

[`Window`](namespacewindow.md).[`unminimize`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1073>

##### [getAll()](#getall)

```

static getAll(): Promise<WebviewWindow[]>

```

Gets a list of instances of `Webview` for all available webviews.

###### [Returns](#returns-83)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`WebviewWindow`](namespacewebviewwindow.md)[]>

###### [Inherited from](#inherited-from-83)

[`Window`](namespacewindow.md).[`getAll`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webviewWindow.ts#L132>

##### [getByLabel()](#getbylabel)

```

static getByLabel(label): Promise<null | WebviewWindow>

```

Gets the Webview for the webview associated with the given label.

###### [Parameters](#parameters-49)

| Parameter | Type | Description |
| --- | --- | --- |
| `label` | `string` | The webview label. |

###### [Returns](#returns-84)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`null` | [`WebviewWindow`](namespacewebviewwindow.md)>

The Webview instance to communicate with the webview or null if the webview doesn’t exist.

###### [Example](#example-78)

```

import { Webview } from '@tauri-apps/api/webviewWindow';

const mainWebview = Webview.getByLabel('main');

```

###### [Inherited from](#inherited-from-84)

[`Window`](namespacewindow.md).[`getByLabel`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webviewWindow.ts#L112>

##### [getCurrent()](#getcurrent)

```

static getCurrent(): WebviewWindow

```

Get an instance of `Webview` for the current webview.

###### [Returns](#returns-85)

[`WebviewWindow`](namespacewebviewwindow.md)

###### [Inherited from](#inherited-from-85)

[`Window`](namespacewindow.md).[`getCurrent`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webviewWindow.ts#L125>

## [Functions](#functions)

### [getAllWebviewWindows()](#getallwebviewwindows)

```

function getAllWebviewWindows(): Promise<WebviewWindow[]>

```

Gets a list of instances of `Webview` for all available webview windows.

#### [Returns](#returns-86)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`WebviewWindow`](namespacewebviewwindow.md)[]>

#### [Since](#since-7)

2.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webviewWindow.ts#L34>

---

### [getCurrentWebviewWindow()](#getcurrentwebviewwindow)

```

function getCurrentWebviewWindow(): WebviewWindow

```

Get an instance of `Webview` for the current webview window.

#### [Returns](#returns-87)

[`WebviewWindow`](namespacewebviewwindow.md)

#### [Since](#since-8)

2.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webviewWindow.ts#L23>

[Previous   
 webview](namespacewebview.md)   [Next   
 window](namespacewindow.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT