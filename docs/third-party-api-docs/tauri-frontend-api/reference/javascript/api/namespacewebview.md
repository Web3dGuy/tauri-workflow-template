# webview

Provides APIs to create webviews, communicate with other webviews and manipulate the current webview.

#### [Webview events](#webview-events)

Events can be listened to using [Webview.listen](namespacewebview.md):

```

import { getCurrentWebview } from "@tauri-apps/api/webview";

getCurrentWebview().listen("my-webview-event", ({ event, payload }) => { });

```

## [Classes](#classes)

### [Webview](#webview)

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

#### [Extended by](#extended-by)

#### [Constructors](#constructors)

##### [new Webview()](#new-webview)

```

new Webview(

window,

label,

options): Webview

```

Creates a new Webview.

###### [Parameters](#parameters)

| Parameter | Type | Description |
| --- | --- | --- |
| `window` | [`Window`](namespacewindow.md) | the window to add this webview to. |
| `label` | `string` | The unique webview label. Must be alphanumeric: `a-zA-Z-/:_`. |
| `options` | [`WebviewOptions`](namespacewebview.md) | - |

###### [Returns](#returns)

[`Webview`](namespacewebview.md)

The [Webview](namespacewebview.md) instance to communicate with the webview.

###### [Example](#example-1)

```

import { Window } from '@tauri-apps/api/window'

import { Webview } from '@tauri-apps/api/webview'

const appWindow = new Window('my-label')

const webview = new Webview(appWindow, 'my-label', {

url: 'https://github.com/tauri-apps/tauri'

});

webview.once('tauri://created', function () {

// webview successfully created

});

webview.once('tauri://error', function (e) {

// an error happened creating the webview

});

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L165>

#### [Properties](#properties)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `label` | `string` | The webview label. It is a unique identifier for the webview, can be used to reference it later. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L136> |
| `listeners` | [`Record`](https://www.typescriptlang.org/docs/handbook/utility-types.html#recordkeys-type)<`string`, [`EventCallback`](namespaceevent.md)<`any`>[]> | Local event listeners. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L141> |
| `window` | [`Window`](namespacewindow.md) | The window hosting this webview. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L138> |

#### [Methods](#methods)

##### [clearAllBrowsingData()](#clearallbrowsingdata)

```

clearAllBrowsingData(): Promise<void>

```

Clears all browsing data for this webview.

###### [Returns](#returns-1)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-2)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

await getCurrentWebview().clearAllBrowsingData();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L541>

##### [close()](#close)

```

close(): Promise<void>

```

Closes the webview.

###### [Returns](#returns-2)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-3)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

await getCurrentWebview().close();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L405>

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

###### [Returns](#returns-3)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Example](#example-4)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

await getCurrentWebview().emit('webview-loaded', { loggedIn: true, token: 'authToken' });

```

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

###### [Returns](#returns-4)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Example](#example-5)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

await getCurrentWebview().emitTo('main', 'webview-loaded', { loggedIn: true, token: 'authToken' });

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L322>

##### [hide()](#hide)

```

hide(): Promise<void>

```

Hide the webview.

###### [Returns](#returns-5)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-6)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

await getCurrentWebview().hide();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L475>

##### [listen()](#listen)

```

listen<T>(event, handler): Promise<UnlistenFn>

```

Listen to an emitted event on this webview.

###### [Type Parameters](#type-parameters)

| Type Parameter |
| --- |
| `T` |

###### [Parameters](#parameters-3)

| Parameter | Type | Description |
| --- | --- | --- |
| `event` | [`EventName`](namespaceevent.md) | Event name. Must include only alphanumeric characters, `-`, `/`, `:` and `_`. |
| `handler` | [`EventCallback`](namespaceevent.md)<`T`> | Event handler. |

###### [Returns](#returns-6)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

###### [Example](#example-7)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

const unlisten = await getCurrentWebview().listen<string>('state-changed', (event) => {

console.log(`Got error: ${payload}`);

});

// you need to call unlisten if your handler goes out of scope e.g. the component is unmounted

unlisten();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L231>

##### [once()](#once)

```

once<T>(event, handler): Promise<UnlistenFn>

```

Listen to an emitted event on this webview only once.

###### [Type Parameters](#type-parameters-1)

| Type Parameter |
| --- |
| `T` |

###### [Parameters](#parameters-4)

| Parameter | Type | Description |
| --- | --- | --- |
| `event` | [`EventName`](namespaceevent.md) | Event name. Must include only alphanumeric characters, `-`, `/`, `:` and `_`. |
| `handler` | [`EventCallback`](namespaceevent.md)<`T`> | Event handler. |

###### [Returns](#returns-7)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

###### [Example](#example-8)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

const unlisten = await getCurrent().once<null>('initialized', (event) => {

console.log(`Webview initialized!`);

});

// you need to call unlisten if your handler goes out of scope e.g. the component is unmounted

unlisten();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L266>

##### [onDragDropEvent()](#ondragdropevent)

```

onDragDropEvent(handler): Promise<UnlistenFn>

```

Listen to a file drop event.
The listener is triggered when the user hovers the selected files on the webview,
drops the files or cancels the operation.

###### [Parameters](#parameters-5)

| Parameter | Type |
| --- | --- |
| `handler` | [`EventCallback`](namespaceevent.md)<[`DragDropEvent`](namespacewebview.md)> |

###### [Returns](#returns-8)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

###### [Example](#example-9)

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

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L593>

##### [position()](#position)

```

position(): Promise<PhysicalPosition>

```

The position of the top-left hand corner of the webview’s client area relative to the top-left hand corner of the desktop.

###### [Returns](#returns-9)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`PhysicalPosition`](namespacedpi.md)>

The webview’s position.

###### [Example](#example-10)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

const position = await getCurrentWebview().position();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L367>

##### [reparent()](#reparent)

```

reparent(window): Promise<void>

```

Moves this webview to the given label.

###### [Parameters](#parameters-6)

| Parameter | Type |
| --- | --- |
| `window` | `string` | [`Window`](namespacewindow.md) | [`WebviewWindow`](namespacewebviewwindow.md) |

###### [Returns](#returns-10)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-11)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

await getCurrentWebview().reparent('other-window');

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L524>

##### [setBackgroundColor()](#setbackgroundcolor)

```

setBackgroundColor(color): Promise<void>

```

Specify the webview background color.

#### [Platfrom-specific:](#platfrom-specific)

* **macOS / iOS**: Not implemented.
* **Windows**:
  + On Windows 7, transparency is not supported and the alpha value will be ignored.
  + On Windows higher than 7: translucent colors are not supported so any alpha value other than `0` will be replaced by `255`

###### [Parameters](#parameters-7)

| Parameter | Type |
| --- | --- |
| `color` | `null` | [`Color`](namespacewebview.md) |

###### [Returns](#returns-11)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Since](#since-1)

2.1.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L559>

##### [setFocus()](#setfocus)

```

setFocus(): Promise<void>

```

Bring the webview to front and focus.

###### [Returns](#returns-12)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-12)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

await getCurrentWebview().setFocus();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L459>

##### [setPosition()](#setposition)

```

setPosition(position): Promise<void>

```

Sets the webview position.

###### [Parameters](#parameters-8)

| Parameter | Type | Description |
| --- | --- | --- |
| `position` | [`LogicalPosition`](namespacedpi.md) | [`PhysicalPosition`](namespacedpi.md) | [`Position`](namespacedpi.md) | The new position, in logical or physical pixels. |

###### [Returns](#returns-13)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-13)

```

import { getCurrent, LogicalPosition } from '@tauri-apps/api/webview';

await getCurrentWebview().setPosition(new LogicalPosition(600, 500));

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L440>

##### [setSize()](#setsize)

```

setSize(size): Promise<void>

```

Resizes the webview.

###### [Parameters](#parameters-9)

| Parameter | Type | Description |
| --- | --- | --- |
| `size` | [`LogicalSize`](namespacedpi.md) | [`PhysicalSize`](namespacedpi.md) | [`Size`](namespacedpi.md) | The logical or physical size. |

###### [Returns](#returns-14)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-14)

```

import { getCurrent, LogicalSize } from '@tauri-apps/api/webview';

await getCurrentWebview().setSize(new LogicalSize(600, 500));

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L422>

##### [setZoom()](#setzoom)

```

setZoom(scaleFactor): Promise<void>

```

Set webview zoom level.

###### [Parameters](#parameters-10)

| Parameter | Type |
| --- | --- |
| `scaleFactor` | `number` |

###### [Returns](#returns-15)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-15)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

await getCurrentWebview().setZoom(1.5);

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L507>

##### [show()](#show)

```

show(): Promise<void>

```

Show the webview.

###### [Returns](#returns-16)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-16)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

await getCurrentWebview().show();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L491>

##### [size()](#size)

```

size(): Promise<PhysicalSize>

```

The physical size of the webview’s client area.
The client area is the content of the webview, excluding the title bar and borders.

###### [Returns](#returns-17)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`PhysicalSize`](namespacedpi.md)>

The webview’s size.

###### [Example](#example-17)

```

import { getCurrentWebview } from '@tauri-apps/api/webview';

const size = await getCurrentWebview().size();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L384>

##### [getAll()](#getall)

```

static getAll(): Promise<Webview[]>

```

Gets a list of instances of `Webview` for all available webviews.

###### [Returns](#returns-18)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Webview`](namespacewebview.md)[]>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L208>

##### [getByLabel()](#getbylabel)

```

static getByLabel(label): Promise<null | Webview>

```

Gets the Webview for the webview associated with the given label.

###### [Parameters](#parameters-11)

| Parameter | Type | Description |
| --- | --- | --- |
| `label` | `string` | The webview label. |

###### [Returns](#returns-19)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`null` | [`Webview`](namespacewebview.md)>

The Webview instance to communicate with the webview or null if the webview doesn’t exist.

###### [Example](#example-18)

```

import { Webview } from '@tauri-apps/api/webview';

const mainWebview = Webview.getByLabel('main');

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L194>

##### [getCurrent()](#getcurrent)

```

static getCurrent(): Webview

```

Get an instance of `Webview` for the current webview.

###### [Returns](#returns-20)

[`Webview`](namespacewebview.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L201>

## [Interfaces](#interfaces)

### [WebviewOptions](#webviewoptions)

Configuration for the webview to create.

#### [Since](#since-2)

2.0.0

#### [Properties](#properties-1)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `acceptFirstMouse?` | `boolean` | Whether clicking an inactive webview also clicks through to the webview on macOS. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L698> |
| `backgroundColor?` | [`Color`](namespacewebview.md) | Set the window and webview background color. #### Platform-specific: - **macOS / iOS**: Not implemented. - **Windows**: - On Windows 7, alpha channel is ignored. - On Windows 8 and newer, if alpha channel is not `0`, it will be ignored. **Since** 2.1.0 | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L774> |

| `backgroundThrottling?` | [`BackgroundThrottlingPolicy`](namespacewindow.md) | Change the default background throttling behaviour. By default, browsers use a suspend policy that will throttle timers and even unload the whole tab (view) to free resources after roughly 5 minutes when a view became minimized or hidden. This will pause all tasks until the documents visibility state changes back from hidden to visible by bringing the view back to the foreground. ## Platform-specific - **Linux / Windows / Android**: Unsupported. Workarounds like a pending WebLock transaction might suffice. - **iOS**: Supported since version 17.0+. - **macOS**: Supported since version 14.0+. see <https://github.com/tauri-apps/tauri/issues/5250#issuecomment-2569380578> **Since** 2.3.0 | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L793> |

| `devtools?` | `boolean` | Whether web inspector, which is usually called browser devtools, is enabled or not. Enabled by default. This API works in **debug** builds, but requires `devtools` feature flag to enable it in **release** builds. #### Platform-specific - macOS: This will call private functions on **macOS**. - Android: Open `chrome://inspect/#devices` in Chrome to get the devtools window. Wry’s `WebView` devtools API isn’t supported on Android. - iOS: Open Safari > Develop > [Your Device Name] > [Your WebView] to get the devtools window. **Since** 2.1.0 | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L761> |

| `dragDropEnabled?` | `boolean` | Whether the drag and drop is enabled or not on the webview. By default it is enabled. Disabling it is required to use HTML5 drag and drop on the frontend on Windows. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L694> |
| `focus?` | `boolean` | Whether the webview should have focus or not **Since** 2.1.0 | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L688> |
| `height` | `number` | The initial height. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L676> |
| `incognito?` | `boolean` | Whether or not the webview should be launched in incognito mode. #### Platform-specific - **Android:** Unsupported. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L710> |

| `proxyUrl?` | `string` | The proxy URL for the WebView for all network requests. Must be either a `http://` or a `socks5://` URL. #### Platform-specific - **macOS**: Requires the `macos-proxy` feature flag and only compiles for macOS 14+. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L720> |

| `transparent?` | `boolean` | Whether the webview is transparent or not. Note that on `macOS` this requires the `macos-private-api` feature flag, enabled under `tauri.conf.json > app > macOSPrivateApi`. WARNING: Using private APIs on `macOS` prevents your application from being accepted to the `App Store`. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L682> |
| `url?` | `string` | Remote URL or local file path to open. - URL such as `https://github.com/tauri-apps` is opened directly on a Tauri webview. - data: URL such as `data:text/html,<html>...` is only supported with the `webview-data-url` Cargo feature for the `tauri` dependency. - local file path or route such as `/path/to/page.html` or `/users` is appended to the application URL (the devServer URL on development, or `tauri://localhost/` and `https://tauri.localhost/` on production). | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L668> |
| `useHttpsScheme?` | `boolean` | Sets whether the custom protocols should use `https://<scheme>.localhost` instead of the default `http://<scheme>.localhost` on Windows and Android. Defaults to `false`. #### Note Using a `https` scheme will NOT allow mixed content when trying to fetch `http` endpoints and therefore will not match the behavior of the `<scheme>://localhost` protocols used on macOS and Linux. #### Warning Changing this value between releases will change the IndexedDB, cookies and localstorage location and your app will not be able to access them. **Since** 2.1.0 | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L747> |

| `userAgent?` | `string` | The user agent for the webview. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L702> |
| `width` | `number` | The initial width. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L674> |
| `x` | `number` | The initial vertical position. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L670> |
| `y` | `number` | The initial horizontal position. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L672> |
| `zoomHotkeysEnabled?` | `boolean` | Whether page zooming by hotkeys is enabled #### Platform-specific: - **Windows**: Controls WebView2’s [`IsZoomControlEnabled`](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/winrt/microsoft_web_webview2_core/corewebview2settings?view=webview2-winrt-1.0.2420.47#iszoomcontrolenabled) setting. - **MacOS / Linux**: Injects a polyfill that zooms in and out with `ctrl/command` + `-/=`, 20% in each step, ranging from 20% to 1000%. Requires `webview:allow-set-webview-zoom` permission - **Android / iOS**: Unsupported. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L732> |

## [Type Aliases](#type-aliases)

### [Color](#color)

```

type Color: [number, number, number] | [number, number, number, number] | object | string;

```

An RGBA color. Each value has minimum of 0 and maximum of 255.

It can be either a string `#ffffff`, an array of 3 or 4 elements or an object.

#### [Since](#since-3)

2.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2018>

---

### [DragDropEvent](#dragdropevent)

```

type DragDropEvent: object | object | object | object;

```

The drag and drop event types.

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L42>

## [Functions](#functions)

### [getAllWebviews()](#getallwebviews)

```

function getAllWebviews(): Promise<Webview[]>

```

Gets a list of instances of `Webview` for all available webviews.

#### [Returns](#returns-21)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Webview`](namespacewebview.md)[]>

#### [Since](#since-4)

2.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L69>

---

### [getCurrentWebview()](#getcurrentwebview)

```

function getCurrentWebview(): Webview

```

Get an instance of `Webview` for the current webview.

#### [Returns](#returns-22)

[`Webview`](namespacewebview.md)

#### [Since](#since-5)

2.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/webview.ts#L53>

[Previous   
 tray](namespacetray.md)   [Next   
 webviewWindow](namespacewebviewwindow.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT