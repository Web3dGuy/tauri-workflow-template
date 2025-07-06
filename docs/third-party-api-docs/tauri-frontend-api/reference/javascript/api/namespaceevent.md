# event

The event system allows you to emit events to the backend and listen to events from it.

This package is also accessible with `window.__TAURI__.event` when [`app.withGlobalTauri`](https://v2.tauri.app/reference/config/#withglobaltauri) in `tauri.conf.json` is set to `true`.

## [Enumerations](#enumerations)

### [TauriEvent](#taurievent)

#### [Since](#since)

1.1.0

#### [Enumeration Members](#enumeration-members)

##### [DRAG\_DROP](#drag_drop)

```

DRAG_DROP: "tauri://drag-drop";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L62>

##### [DRAG\_ENTER](#drag_enter)

```

DRAG_ENTER: "tauri://drag-enter";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L60>

##### [DRAG\_LEAVE](#drag_leave)

```

DRAG_LEAVE: "tauri://drag-leave";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L63>

##### [DRAG\_OVER](#drag_over)

```

DRAG_OVER: "tauri://drag-over";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L61>

##### [WEBVIEW\_CREATED](#webview_created)

```

WEBVIEW_CREATED: "tauri://webview-created";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L59>

##### [WINDOW\_BLUR](#window_blur)

```

WINDOW_BLUR: "tauri://blur";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L55>

##### [WINDOW\_CLOSE\_REQUESTED](#window_close_requested)

```

WINDOW_CLOSE_REQUESTED: "tauri://close-requested";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L52>

##### [WINDOW\_CREATED](#window_created)

```

WINDOW_CREATED: "tauri://window-created";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L58>

##### [WINDOW\_DESTROYED](#window_destroyed)

```

WINDOW_DESTROYED: "tauri://destroyed";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L53>

##### [WINDOW\_FOCUS](#window_focus)

```

WINDOW_FOCUS: "tauri://focus";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L54>

##### [WINDOW\_MOVED](#window_moved)

```

WINDOW_MOVED: "tauri://move";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L51>

##### [WINDOW\_RESIZED](#window_resized)

```

WINDOW_RESIZED: "tauri://resize";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L50>

##### [WINDOW\_SCALE\_FACTOR\_CHANGED](#window_scale_factor_changed)

```

WINDOW_SCALE_FACTOR_CHANGED: "tauri://scale-change";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L56>

##### [WINDOW\_THEME\_CHANGED](#window_theme_changed)

```

WINDOW_THEME_CHANGED: "tauri://theme-changed";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L57>

## [Interfaces](#interfaces)

### [Event<T>](#eventt)

#### [Type Parameters](#type-parameters)

| Type Parameter |
| --- |
| `T` |

#### [Properties](#properties)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `event` | [`EventName`](namespaceevent.md) | Event name | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L24> |
| `id` | `number` | Event identifier used to unlisten | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L26> |
| `payload` | `T` | Event payload | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L28> |

---

### [Options](#options)

#### [Properties](#properties-1)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `target?` | `string` | [`EventTarget`](namespaceevent.md) | The event target to listen to, defaults to `{ kind: 'Any' }`, see [EventTarget](namespaceevent.md). If a string is provided, EventTarget.AnyLabel is used. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L43> |

## [Type Aliases](#type-aliases)

### [EventCallback()<T>](#eventcallbackt)

```

type EventCallback<T>: (event) => void;

```

#### [Type Parameters](#type-parameters-1)

| Type Parameter |
| --- |
| `T` |

#### [Parameters](#parameters)

| Parameter | Type |
| --- | --- |
| `event` | [`Event`](namespaceevent.md)<`T`> |

#### [Returns](#returns)

`void`

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L31>

---

### [EventName](#eventname)

```

type EventName: `${TauriEvent}` | string & Record<never, never>;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L35>

---

### [EventTarget](#eventtarget)

```

type EventTarget:

| object

| object

| object

| object

| object

| object;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L14>

---

### [UnlistenFn()](#unlistenfn)

```

type UnlistenFn: () => void;

```

#### [Returns](#returns-1)

`void`

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L33>

## [Functions](#functions)

### [emit()](#emit)

```

function emit(event, payload?): Promise<void>

```

Emits an event to all [targets](namespaceevent.md).

#### [Parameters](#parameters-1)

| Parameter | Type | Description |
| --- | --- | --- |
| `event` | `string` | Event name. Must include only alphanumeric characters, `-`, `/`, `:` and `_`. |
| `payload`? | `unknown` | Event payload. |

#### [Returns](#returns-2)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

#### [Example](#example)

```

import { emit } from '@tauri-apps/api/event';

await emit('frontend-loaded', { loggedIn: true, token: 'authToken' });

```

#### [Since](#since-1)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L177>

---

### [emitTo()](#emitto)

```

function emitTo(

target,

event,

payload?): Promise<void>

```

Emits an event to all [targets](namespaceevent.md) matching the given target.

#### [Parameters](#parameters-2)

| Parameter | Type | Description |
| --- | --- | --- |
| `target` | `string` | [`EventTarget`](namespaceevent.md) | Label of the target Window/Webview/WebviewWindow or raw [EventTarget](namespaceevent.md) object. |
| `event` | `string` | Event name. Must include only alphanumeric characters, `-`, `/`, `:` and `_`. |
| `payload`? | `unknown` | Event payload. |

#### [Returns](#returns-3)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

#### [Example](#example-1)

```

import { emitTo } from '@tauri-apps/api/event';

await emitTo('main', 'frontend-loaded', { loggedIn: true, token: 'authToken' });

```

#### [Since](#since-2)

2.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L199>

---

### [listen()](#listen)

```

function listen<T>(

event,

handler,

options?): Promise<UnlistenFn>

```

Listen to an emitted event to any [target](namespaceevent.md).

#### [Type Parameters](#type-parameters-2)

| Type Parameter |
| --- |
| `T` |

#### [Parameters](#parameters-3)

| Parameter | Type | Description |
| --- | --- | --- |
| `event` | [`EventName`](namespaceevent.md) | Event name. Must include only alphanumeric characters, `-`, `/`, `:` and `_`. |
| `handler` | [`EventCallback`](namespaceevent.md)<`T`> | Event handler callback. |
| `options`? | [`Options`](namespaceevent.md) | Event listening options. |

#### [Returns](#returns-4)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

#### [Example](#example-2)

```

import { listen } from '@tauri-apps/api/event';

const unlisten = await listen<string>('error', (event) => {

console.log(`Got error, payload: ${event.payload}`);

});

// you need to call unlisten if your handler goes out of scope e.g. the component is unmounted

unlisten();

```

#### [Since](#since-3)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L103>

---

### [once()](#once)

```

function once<T>(

event,

handler,

options?): Promise<UnlistenFn>

```

Listens once to an emitted event to any [target](namespaceevent.md).

#### [Type Parameters](#type-parameters-3)

| Type Parameter |
| --- |
| `T` |

#### [Parameters](#parameters-4)

| Parameter | Type | Description |
| --- | --- | --- |
| `event` | [`EventName`](namespaceevent.md) | Event name. Must include only alphanumeric characters, `-`, `/`, `:` and `_`. |
| `handler` | [`EventCallback`](namespaceevent.md)<`T`> | Event handler callback. |
| `options`? | [`Options`](namespaceevent.md) | Event listening options. |

#### [Returns](#returns-5)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

#### [Example](#example-3)

```

import { once } from '@tauri-apps/api/event';

interface LoadedPayload {

loggedIn: boolean,

token: string

}

const unlisten = await once<LoadedPayload>('loaded', (event) => {

console.log(`App is loaded, loggedIn: ${event.payload.loggedIn}, token: ${event.payload.token}`);

});

// you need to call unlisten if your handler goes out of scope e.g. the component is unmounted

unlisten();

```

#### [Since](#since-4)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/event.ts#L147>

[Previous   
 dpi](namespacedpi.md)   [Next   
 image](namespaceimage.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT