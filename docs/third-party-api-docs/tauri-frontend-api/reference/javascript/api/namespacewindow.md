# window

Provides APIs to create windows, communicate with other windows and manipulate the current window.

#### [Window events](#window-events)

Events can be listened to using [Window.listen](namespacewindow.md):

```

import { getCurrentWindow } from "@tauri-apps/api/window";

getCurrentWindow().listen("my-window-event", ({ event, payload }) => { });

```

## [References](#references)

### [Color](#color)

Re-exports [Color](namespacewebview.md)

### [DragDropEvent](#dragdropevent)

Re-exports [DragDropEvent](namespacewebview.md)

### [LogicalPosition](#logicalposition)

Re-exports [LogicalPosition](namespacedpi.md)

### [LogicalSize](#logicalsize)

Re-exports [LogicalSize](namespacedpi.md)

### [PhysicalPosition](#physicalposition)

Re-exports [PhysicalPosition](namespacedpi.md)

### [PhysicalSize](#physicalsize)

Re-exports [PhysicalSize](namespacedpi.md)

## [Enumerations](#enumerations)

### [BackgroundThrottlingPolicy](#backgroundthrottlingpolicy)

Background throttling policy

#### [Since](#since)

2.0.0

#### [Enumeration Members](#enumeration-members)

##### [Disabled](#disabled)

```

Disabled: "disabled";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2030>

##### [Suspend](#suspend)

```

Suspend: "suspend";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2032>

##### [Throttle](#throttle)

```

Throttle: "throttle";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2031>

---

### [Effect](#effect)

Platform-specific window effects

#### [Since](#since-1)

2.0.0

#### [Enumeration Members](#enumeration-members-1)

##### [Acrylic](#acrylic)

```

Acrylic: "acrylic";

```

**Windows 10/11**

#### [Notes](#notes)

This effect has bad performance when resizing/dragging the window on Windows 10 v1903+ and Windows 11 build 22000.

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2146>

##### [~~AppearanceBased~~](#appearancebased)

```

AppearanceBased: "appearanceBased";

```

A default material appropriate for the view’s effectiveAppearance. **macOS 10.14-**

###### [Deprecated](#deprecated)

since macOS 10.14. You should instead choose an appropriate semantic material.

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2046>

##### [Blur](#blur)

```

Blur: "blur";

```

**Windows 7/10/11(22H1) Only**

#### [Notes](#notes-1)

This effect has bad performance when resizing/dragging the window on Windows 11 build 22621.

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2138>

##### [ContentBackground](#contentbackground)

```

ContentBackground: "contentBackground";

```

**macOS 10.14+**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2118>

##### [~~Dark~~](#dark)

```

Dark: "dark";

```

**macOS 10.14-**

###### [Deprecated](#deprecated-1)

since macOS 10.14. Use a semantic material instead.

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2058>

##### [FullScreenUI](#fullscreenui)

```

FullScreenUI: "fullScreenUI";

```

**macOS 10.14+**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2110>

##### [HeaderView](#headerview)

```

HeaderView: "headerView";

```

**macOS 10.14+**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2094>

##### [HudWindow](#hudwindow)

```

HudWindow: "hudWindow";

```

**macOS 10.14+**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2106>

##### [~~Light~~](#light)

```

Light: "light";

```

**macOS 10.14-**

###### [Deprecated](#deprecated-2)

since macOS 10.14. Use a semantic material instead.

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2052>

##### [~~MediumLight~~](#mediumlight)

```

MediumLight: "mediumLight";

```

**macOS 10.14-**

###### [Deprecated](#deprecated-3)

since macOS 10.14. Use a semantic material instead.

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2064>

##### [Menu](#menu)

```

Menu: "menu";

```

**macOS 10.11+**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2082>

##### [Mica](#mica)

```

Mica: "mica";

```

**Windows 11 Only**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2130>

##### [Popover](#popover)

```

Popover: "popover";

```

**macOS 10.11+**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2086>

##### [Selection](#selection)

```

Selection: "selection";

```

**macOS 10.10+**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2078>

##### [Sheet](#sheet)

```

Sheet: "sheet";

```

**macOS 10.14+**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2098>

##### [Sidebar](#sidebar)

```

Sidebar: "sidebar";

```

**macOS 10.11+**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2090>

##### [Tabbed](#tabbed)

```

Tabbed: "tabbed";

```

Tabbed effect that matches the system dark perefence **Windows 11 Only**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2150>

##### [TabbedDark](#tabbeddark)

```

TabbedDark: "tabbedDark";

```

Tabbed effect with dark mode but only if dark mode is enabled on the system **Windows 11 Only**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2154>

##### [TabbedLight](#tabbedlight)

```

TabbedLight: "tabbedLight";

```

Tabbed effect with light mode **Windows 11 Only**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2158>

##### [Titlebar](#titlebar)

```

Titlebar: "titlebar";

```

**macOS 10.10+**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2074>

##### [Tooltip](#tooltip)

```

Tooltip: "tooltip";

```

**macOS 10.14+**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2114>

##### [~~UltraDark~~](#ultradark)

```

UltraDark: "ultraDark";

```

**macOS 10.14-**

###### [Deprecated](#deprecated-4)

since macOS 10.14. Use a semantic material instead.

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2070>

##### [UnderPageBackground](#underpagebackground)

```

UnderPageBackground: "underPageBackground";

```

**macOS 10.14+**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2126>

##### [UnderWindowBackground](#underwindowbackground)

```

UnderWindowBackground: "underWindowBackground";

```

**macOS 10.14+**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2122>

##### [WindowBackground](#windowbackground)

```

WindowBackground: "windowBackground";

```

**macOS 10.14+**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2102>

---

### [EffectState](#effectstate)

Window effect state **macOS only**

#### [See](#see)

<https://developer.apple.com/documentation/appkit/nsvisualeffectview/state>

#### [Since](#since-2)

2.0.0

#### [Enumeration Members](#enumeration-members-2)

##### [Active](#active)

```

Active: "active";

```

Make window effect state always active **macOS only**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2176>

##### [FollowsWindowActiveState](#followswindowactivestate)

```

FollowsWindowActiveState: "followsWindowActiveState";

```

Make window effect state follow the window’s active state **macOS only**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2172>

##### [Inactive](#inactive)

```

Inactive: "inactive";

```

Make window effect state always inactive **macOS only**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2180>

---

### [ProgressBarStatus](#progressbarstatus)

#### [Enumeration Members](#enumeration-members-3)

##### [Error](#error)

```

Error: "error";

```

Error state. **Treated as Normal on linux**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L185>

##### [Indeterminate](#indeterminate)

```

Indeterminate: "indeterminate";

```

Indeterminate state. **Treated as Normal on Linux and macOS**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L177>

##### [None](#none)

```

None: "none";

```

Hide progress bar.

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L169>

##### [Normal](#normal)

```

Normal: "normal";

```

Normal state.

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L173>

##### [Paused](#paused)

```

Paused: "paused";

```

Paused state. **Treated as Normal on Linux**

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L181>

---

### [UserAttentionType](#userattentiontype)

Attention type to request on a window.

#### [Since](#since-3)

1.0.0

#### [Enumeration Members](#enumeration-members-4)

##### [Critical](#critical)

```

Critical: 1;

```

#### [Platform-specific](#platform-specific)

* **macOS:** Bounces the dock icon until the application is in focus.
* **Windows:** Flashes both the window and the taskbar button until the application is in focus.

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L94>

##### [Informational](#informational)

```

Informational: 2;

```

#### [Platform-specific](#platform-specific-1)

* **macOS:** Bounces the dock icon once.
* **Windows:** Flashes the taskbar button until the application is in focus.

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L100>

## [Classes](#classes)

### [CloseRequestedEvent](#closerequestedevent)

#### [Constructors](#constructors)

##### [new CloseRequestedEvent()](#new-closerequestedevent)

```

new CloseRequestedEvent(event): CloseRequestedEvent

```

###### [Parameters](#parameters)

| Parameter | Type |
| --- | --- |
| `event` | [`Event`](namespaceevent.md)<`unknown`> |

###### [Returns](#returns)

[`CloseRequestedEvent`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L110>

#### [Properties](#properties)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `event` | [`EventName`](namespaceevent.md) | Event name | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L105> |
| `id` | `number` | Event identifier used to unlisten | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L107> |

#### [Methods](#methods)

##### [isPreventDefault()](#ispreventdefault)

```

isPreventDefault(): boolean

```

###### [Returns](#returns-1)

`boolean`

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L119>

##### [preventDefault()](#preventdefault)

```

preventDefault(): void

```

###### [Returns](#returns-2)

`void`

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L115>

---

### [Window](#window)

Create new window or get a handle to an existing one.

Windows are identified by a *label* a unique identifier that can be used to reference it later.
It may only contain alphanumeric characters `a-zA-Z` plus the following special characters `-`, `/`, `:` and `_`.

#### [Example](#example)

```

import { Window } from "@tauri-apps/api/window"

const appWindow = new Window('theUniqueLabel');

appWindow.once('tauri://created', function () {

// window successfully created

});

appWindow.once('tauri://error', function (e) {

// an error happened creating the window

});

// emit an event to the backend

await appWindow.emit("some-event", "data");

// listen to an event from the backend

const unlisten = await appWindow.listen("event-name", e => {});

unlisten();

```

#### [Since](#since-4)

2.0.0

#### [Extended by](#extended-by)

#### [Constructors](#constructors-1)

##### [new Window()](#new-window)

```

new Window(label, options): Window

```

Creates a new Window.

###### [Parameters](#parameters-1)

| Parameter | Type | Description |
| --- | --- | --- |
| `label` | `string` | The unique window label. Must be alphanumeric: `a-zA-Z-/:_`. |
| `options` | [`WindowOptions`](namespacewindow.md) | - |

###### [Returns](#returns-3)

[`Window`](namespacewindow.md)

The [Window](namespacewindow.md) instance to communicate with the window.

###### [Example](#example-1)

```

import { Window } from '@tauri-apps/api/window';

const appWindow = new Window('my-label');

appWindow.once('tauri://created', function () {

// window successfully created

});

appWindow.once('tauri://error', function (e) {

// an error happened creating the window

});

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L293>

#### [Properties](#properties-1)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `label` | `string` | The window label. It is a unique identifier for the window, can be used to reference it later. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L271> |
| `listeners` | [`Record`](https://www.typescriptlang.org/docs/handbook/utility-types.html#recordkeys-type)<`string`, [`EventCallback`](namespaceevent.md)<`any`>[]> | Local event listeners. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L274> |

#### [Methods](#methods-1)

##### [center()](#center)

```

center(): Promise<void>

```

Centers the window.

###### [Returns](#returns-4)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-2)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().center();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L814>

##### [clearEffects()](#cleareffects)

```

clearEffects(): Promise<void>

```

Clear any applied effects if possible.

###### [Returns](#returns-5)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1202>

##### [close()](#close)

```

close(): Promise<void>

```

Closes the window.

Note this emits a closeRequested event so you can intercept it. To force window close, use [Window.destroy](namespacewindow.md).

###### [Returns](#returns-6)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-3)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().close();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1123>

##### [destroy()](#destroy)

```

destroy(): Promise<void>

```

Destroys the window. Behaves like [Window.close](namespacewindow.md) but forces the window close instead of emitting a closeRequested event.

###### [Returns](#returns-7)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-4)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().destroy();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1139>

##### [emit()](#emit)

```

emit(event, payload?): Promise<void>

```

Emits an event to all [targets](namespaceevent.md).

###### [Parameters](#parameters-2)

| Parameter | Type | Description |
| --- | --- | --- |
| `event` | `string` | Event name. Must include only alphanumeric characters, `-`, `/`, `:` and `_`. |
| `payload`? | `unknown` | Event payload. |

###### [Returns](#returns-8)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Example](#example-5)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().emit('window-loaded', { loggedIn: true, token: 'authToken' });

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L444>

##### [emitTo()](#emitto)

```

emitTo(

target,

event,

payload?): Promise<void>

```

Emits an event to all [targets](namespaceevent.md) matching the given target.

###### [Parameters](#parameters-3)

| Parameter | Type | Description |
| --- | --- | --- |
| `target` | `string` | [`EventTarget`](namespaceevent.md) | Label of the target Window/Webview/WebviewWindow or raw [EventTarget](namespaceevent.md) object. |
| `event` | `string` | Event name. Must include only alphanumeric characters, `-`, `/`, `:` and `_`. |
| `payload`? | `unknown` | Event payload. |

###### [Returns](#returns-9)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Example](#example-6)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().emit('main', 'window-loaded', { loggedIn: true, token: 'authToken' });

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L471>

##### [hide()](#hide)

```

hide(): Promise<void>

```

Sets the window visibility to false.

###### [Returns](#returns-10)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-7)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().hide();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1105>

##### [innerPosition()](#innerposition)

```

innerPosition(): Promise<PhysicalPosition>

```

The position of the top-left hand corner of the window’s client area relative to the top-left hand corner of the desktop.

###### [Returns](#returns-11)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`PhysicalPosition`](namespacedpi.md)>

The window’s inner position.

###### [Example](#example-8)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const position = await getCurrentWindow().innerPosition();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L532>

##### [innerSize()](#innersize)

```

innerSize(): Promise<PhysicalSize>

```

The physical size of the window’s client area.
The client area is the content of the window, excluding the title bar and borders.

###### [Returns](#returns-12)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`PhysicalSize`](namespacedpi.md)>

The window’s inner size.

###### [Example](#example-9)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const size = await getCurrentWindow().innerSize();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L565>

##### [isClosable()](#isclosable)

```

isClosable(): Promise<boolean>

```

Gets the window’s native close button state.

#### [Platform-specific](#platform-specific-2)

* **iOS / Android:** Unsupported.

###### [Returns](#returns-13)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

Whether the window’s native close button is enabled or not.

###### [Example](#example-10)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const closable = await getCurrentWindow().isClosable();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L745>

##### [isDecorated()](#isdecorated)

```

isDecorated(): Promise<boolean>

```

Gets the window’s current decorated state.

###### [Returns](#returns-14)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

Whether the window is decorated or not.

###### [Example](#example-11)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const decorated = await getCurrentWindow().isDecorated();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L666>

##### [isEnabled()](#isenabled)

```

isEnabled(): Promise<boolean>

```

Whether the window is enabled or disabled.

###### [Returns](#returns-15)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

A promise indicating the success or failure of the operation.

###### [Example](#example-12)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setEnabled(false);

```

###### [Since](#since-5)

2.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L906>

##### [isFocused()](#isfocused)

```

isFocused(): Promise<boolean>

```

Gets the window’s current focus state.

###### [Returns](#returns-16)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

Whether the window is focused or not.

###### [Example](#example-13)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const focused = await getCurrentWindow().isFocused();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L650>

##### [isFullscreen()](#isfullscreen)

```

isFullscreen(): Promise<boolean>

```

Gets the window’s current fullscreen state.

###### [Returns](#returns-17)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

Whether the window is in fullscreen mode or not.

###### [Example](#example-14)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const fullscreen = await getCurrentWindow().isFullscreen();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L604>

##### [isMaximizable()](#ismaximizable)

```

isMaximizable(): Promise<boolean>

```

Gets the window’s native maximize button state.

#### [Platform-specific](#platform-specific-3)

* **Linux / iOS / Android:** Unsupported.

###### [Returns](#returns-18)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

Whether the window’s native maximize button is enabled or not.

###### [Example](#example-15)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const maximizable = await getCurrentWindow().isMaximizable();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L703>

##### [isMaximized()](#ismaximized)

```

isMaximized(): Promise<boolean>

```

Gets the window’s current maximized state.

###### [Returns](#returns-19)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

Whether the window is maximized or not.

###### [Example](#example-16)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const maximized = await getCurrentWindow().isMaximized();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L634>

##### [isMinimizable()](#isminimizable)

```

isMinimizable(): Promise<boolean>

```

Gets the window’s native minimize button state.

#### [Platform-specific](#platform-specific-4)

* **Linux / iOS / Android:** Unsupported.

###### [Returns](#returns-20)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

Whether the window’s native minimize button is enabled or not.

###### [Example](#example-17)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const minimizable = await getCurrentWindow().isMinimizable();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L724>

##### [isMinimized()](#isminimized)

```

isMinimized(): Promise<boolean>

```

Gets the window’s current minimized state.

###### [Returns](#returns-21)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

###### [Example](#example-18)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const minimized = await getCurrentWindow().isMinimized();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L618>

##### [isResizable()](#isresizable)

```

isResizable(): Promise<boolean>

```

Gets the window’s current resizable state.

###### [Returns](#returns-22)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

Whether the window is resizable or not.

###### [Example](#example-19)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const resizable = await getCurrentWindow().isResizable();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L682>

##### [isVisible()](#isvisible)

```

isVisible(): Promise<boolean>

```

Gets the window’s current visible state.

###### [Returns](#returns-23)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

Whether the window is visible or not.

###### [Example](#example-20)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const visible = await getCurrentWindow().isVisible();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L761>

##### [listen()](#listen)

```

listen<T>(event, handler): Promise<UnlistenFn>

```

Listen to an emitted event on this window.

###### [Type Parameters](#type-parameters)

| Type Parameter |
| --- |
| `T` |

###### [Parameters](#parameters-4)

| Parameter | Type | Description |
| --- | --- | --- |
| `event` | [`EventName`](namespaceevent.md) | Event name. Must include only alphanumeric characters, `-`, `/`, `:` and `_`. |
| `handler` | [`EventCallback`](namespaceevent.md)<`T`> | Event handler. |

###### [Returns](#returns-24)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

###### [Example](#example-21)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const unlisten = await getCurrentWindow().listen<string>('state-changed', (event) => {

console.log(`Got error: ${payload}`);

});

// you need to call unlisten if your handler goes out of scope e.g. the component is unmounted

unlisten();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L382>

##### [maximize()](#maximize)

```

maximize(): Promise<void>

```

Maximizes the window.

###### [Returns](#returns-25)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-22)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().maximize();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1009>

##### [minimize()](#minimize)

```

minimize(): Promise<void>

```

Minimizes the window.

###### [Returns](#returns-26)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-23)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().minimize();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1057>

##### [once()](#once)

```

once<T>(event, handler): Promise<UnlistenFn>

```

Listen to an emitted event on this window only once.

###### [Type Parameters](#type-parameters-1)

| Type Parameter |
| --- |
| `T` |

###### [Parameters](#parameters-5)

| Parameter | Type | Description |
| --- | --- | --- |
| `event` | [`EventName`](namespaceevent.md) | Event name. Must include only alphanumeric characters, `-`, `/`, `:` and `_`. |
| `handler` | [`EventCallback`](namespaceevent.md)<`T`> | Event handler. |

###### [Returns](#returns-27)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

###### [Example](#example-24)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const unlisten = await getCurrentWindow().once<null>('initialized', (event) => {

console.log(`Window initialized!`);

});

// you need to call unlisten if your handler goes out of scope e.g. the component is unmounted

unlisten();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L417>

##### [onCloseRequested()](#oncloserequested)

```

onCloseRequested(handler): Promise<UnlistenFn>

```

Listen to window close requested. Emitted when the user requests to closes the window.

###### [Parameters](#parameters-6)

| Parameter | Type |
| --- | --- |
| `handler` | (`event`) => `void` | [`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`> |

###### [Returns](#returns-28)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

###### [Example](#example-25)

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

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1824>

##### [onDragDropEvent()](#ondragdropevent)

```

onDragDropEvent(handler): Promise<UnlistenFn>

```

Listen to a file drop event.
The listener is triggered when the user hovers the selected files on the webview,
drops the files or cancels the operation.

###### [Parameters](#parameters-7)

| Parameter | Type |
| --- | --- |
| `handler` | [`EventCallback`](namespaceevent.md)<[`DragDropEvent`](namespacewebview.md)> |

###### [Returns](#returns-29)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

###### [Example](#example-26)

```

import { getCurrentWindow } from "@tauri-apps/api/webview";

const unlisten = await getCurrentWindow().onDragDropEvent((event) => {

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

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1862>

##### [onFocusChanged()](#onfocuschanged)

```

onFocusChanged(handler): Promise<UnlistenFn>

```

Listen to window focus change.

###### [Parameters](#parameters-8)

| Parameter | Type |
| --- | --- |
| `handler` | [`EventCallback`](namespaceevent.md)<`boolean`> |

###### [Returns](#returns-30)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

###### [Example](#example-27)

```

import { getCurrentWindow } from "@tauri-apps/api/window";

const unlisten = await getCurrentWindow().onFocusChanged(({ payload: focused }) => {

console.log('Focus changed, window is focused? ' + focused);

});

// you need to call unlisten if your handler goes out of scope e.g. the component is unmounted

unlisten();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1940>

##### [onMoved()](#onmoved)

```

onMoved(handler): Promise<UnlistenFn>

```

Listen to window move.

###### [Parameters](#parameters-9)

| Parameter | Type |
| --- | --- |
| `handler` | [`EventCallback`](namespaceevent.md)<[`PhysicalPosition`](namespacedpi.md)> |

###### [Returns](#returns-31)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

###### [Example](#example-28)

```

import { getCurrentWindow } from "@tauri-apps/api/window";

const unlisten = await getCurrentWindow().onMoved(({ payload: position }) => {

console.log('Window moved', position);

});

// you need to call unlisten if your handler goes out of scope e.g. the component is unmounted

unlisten();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1795>

##### [onResized()](#onresized)

```

onResized(handler): Promise<UnlistenFn>

```

Listen to window resize.

###### [Parameters](#parameters-10)

| Parameter | Type |
| --- | --- |
| `handler` | [`EventCallback`](namespaceevent.md)<[`PhysicalSize`](namespacedpi.md)> |

###### [Returns](#returns-32)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

###### [Example](#example-29)

```

import { getCurrentWindow } from "@tauri-apps/api/window";

const unlisten = await getCurrentWindow().onResized(({ payload: size }) => {

console.log('Window resized', size);

});

// you need to call unlisten if your handler goes out of scope e.g. the component is unmounted

unlisten();

```

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

###### [Parameters](#parameters-11)

| Parameter | Type |
| --- | --- |
| `handler` | [`EventCallback`](namespaceevent.md)<[`ScaleFactorChanged`](namespacewindow.md)> |

###### [Returns](#returns-33)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

###### [Example](#example-30)

```

import { getCurrentWindow } from "@tauri-apps/api/window";

const unlisten = await getCurrentWindow().onScaleChanged(({ payload }) => {

console.log('Scale changed', payload.scaleFactor, payload.size);

});

// you need to call unlisten if your handler goes out of scope e.g. the component is unmounted

unlisten();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1980>

##### [onThemeChanged()](#onthemechanged)

```

onThemeChanged(handler): Promise<UnlistenFn>

```

Listen to the system theme change.

###### [Parameters](#parameters-12)

| Parameter | Type |
| --- | --- |
| `handler` | [`EventCallback`](namespaceevent.md)<[`Theme`](namespacewindow.md)> |

###### [Returns](#returns-34)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnlistenFn`](namespaceevent.md)>

A promise resolving to a function to unlisten to the event.
Note that removing the listener is required if your listener goes out of scope e.g. the component is unmounted.

###### [Example](#example-31)

```

import { getCurrentWindow } from "@tauri-apps/api/window";

const unlisten = await getCurrentWindow().onThemeChanged(({ payload: theme }) => {

console.log('New theme: ' + theme);

});

// you need to call unlisten if your handler goes out of scope e.g. the component is unmounted

unlisten();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2006>

##### [outerPosition()](#outerposition)

```

outerPosition(): Promise<PhysicalPosition>

```

The position of the top-left hand corner of the window relative to the top-left hand corner of the desktop.

###### [Returns](#returns-35)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`PhysicalPosition`](namespacedpi.md)>

The window’s outer position.

###### [Example](#example-32)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const position = await getCurrentWindow().outerPosition();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L548>

##### [outerSize()](#outersize)

```

outerSize(): Promise<PhysicalSize>

```

The physical size of the entire window.
These dimensions include the title bar and borders. If you don’t want that (and you usually don’t), use inner\_size instead.

###### [Returns](#returns-36)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`PhysicalSize`](namespacedpi.md)>

The window’s outer size.

###### [Example](#example-33)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const size = await getCurrentWindow().outerSize();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L585>

##### [requestUserAttention()](#requestuserattention)

```

requestUserAttention(requestType): Promise<void>

```

Requests user attention to the window, this has no effect if the application
is already focused. How requesting for user attention manifests is platform dependent,
see `UserAttentionType` for details.

Providing `null` will unset the request for user attention. Unsetting the request for
user attention might not be done automatically by the WM when the window receives input.

#### [Platform-specific](#platform-specific-5)

* **macOS:** `null` has no effect.
* **Linux:** Urgency levels have the same effect.

###### [Parameters](#parameters-13)

| Parameter | Type |
| --- | --- |
| `requestType` | `null` | [`UserAttentionType`](namespacewindow.md) |

###### [Returns](#returns-37)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-34)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().requestUserAttention();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L840>

##### [scaleFactor()](#scalefactor)

```

scaleFactor(): Promise<number>

```

The scale factor that can be used to map physical pixels to logical pixels.

###### [Returns](#returns-38)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`number`>

The window’s monitor scale factor.

###### [Example](#example-35)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const factor = await getCurrentWindow().scaleFactor();

```

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

###### [Example](#example-36)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setAlwaysOnBottom(true);

```

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

###### [Example](#example-37)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setAlwaysOnTop(true);

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1220>

##### [setBackgroundColor()](#setbackgroundcolor)

```

setBackgroundColor(color): Promise<void>

```

Sets the window background color.

#### [Platform-specific:](#platform-specific-6)

* **Windows:** alpha channel is ignored.
* **iOS / Android:** Unsupported.

###### [Parameters](#parameters-16)

| Parameter | Type |
| --- | --- |
| `color` | [`Color`](namespacewebview.md) |

###### [Returns](#returns-41)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Since](#since-6)

2.1.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1532>

##### [setBadgeCount()](#setbadgecount)

```

setBadgeCount(count?): Promise<void>

```

Sets the badge count. It is app wide and not specific to this window.

#### [Platform-specific](#platform-specific-7)

* **Windows**: Unsupported. Use @{linkcode Window.setOverlayIcon} instead.

###### [Parameters](#parameters-17)

| Parameter | Type | Description |
| --- | --- | --- |
| `count`? | `number` | The badge count. Use `undefined` to remove the badge. |

###### [Returns](#returns-42)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-38)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setBadgeCount(5);

```

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

###### [Example](#example-39)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setBadgeLabel("Hello");

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1643>

##### [setClosable()](#setclosable)

```

setClosable(closable): Promise<void>

```

Sets whether the window’s native close button is enabled or not.

#### [Platform-specific](#platform-specific-8)

* **Linux:** GTK+ will do its best to convince the window manager not to show a close button. Depending on the system, this function may not have any effect when called on a window that is already visible
* **iOS / Android:** Unsupported.

###### [Parameters](#parameters-19)

| Parameter | Type |
| --- | --- |
| `closable` | `boolean` |

###### [Returns](#returns-44)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-40)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setClosable(false);

```

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

###### [Example](#example-41)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setContentProtected(true);

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1255>

##### [setCursorGrab()](#setcursorgrab)

```

setCursorGrab(grab): Promise<void>

```

Grabs the cursor, preventing it from leaving the window.

There’s no guarantee that the cursor will be hidden. You should
hide it by yourself if you want so.

#### [Platform-specific](#platform-specific-9)

* **Linux:** Unsupported.
* **macOS:** This locks the cursor in a fixed location, which looks visually awkward.

###### [Parameters](#parameters-21)

| Parameter | Type | Description |
| --- | --- | --- |
| `grab` | `boolean` | `true` to grab the cursor icon, `false` to release it. |

###### [Returns](#returns-46)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-42)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setCursorGrab(true);

```

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

###### [Example](#example-43)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setCursorIcon('help');

```

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

###### [Example](#example-44)

```

import { getCurrentWindow, LogicalPosition } from '@tauri-apps/api/window';

await getCurrentWindow().setCursorPosition(new LogicalPosition(600, 300));

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1547>

##### [setCursorVisible()](#setcursorvisible)

```

setCursorVisible(visible): Promise<void>

```

Modifies the cursor’s visibility.

#### [Platform-specific](#platform-specific-10)

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

###### [Example](#example-45)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setCursorVisible(false);

```

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

###### [Example](#example-46)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setDecorations(false);

```

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

###### [Example](#example-47)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setEnabled(false);

```

###### [Since](#since-7)

2.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L887>

##### [setFocus()](#setfocus)

```

setFocus(): Promise<void>

```

Bring the window to front and focus.

###### [Returns](#returns-53)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-48)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setFocus();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1397>

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

###### [Example](#example-49)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setFullscreen(true);

```

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

###### [Example](#example-50)

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

###### [Example](#example-51)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setIgnoreCursorEvents(true);

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1568>

##### [setMaximizable()](#setmaximizable)

```

setMaximizable(maximizable): Promise<void>

```

Sets whether the window’s native maximize button is enabled or not.
If resizable is set to false, this setting is ignored.

#### [Platform-specific](#platform-specific-11)

* **macOS:** Disables the “zoom” button in the window titlebar, which is also used to enter fullscreen mode.
* **Linux / iOS / Android:** Unsupported.

###### [Parameters](#parameters-31)

| Parameter | Type |
| --- | --- |
| `maximizable` | `boolean` |

###### [Returns](#returns-57)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-52)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setMaximizable(false);

```

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

###### [Example](#example-53)

```

import { getCurrentWindow, LogicalSize } from '@tauri-apps/api/window';

await getCurrentWindow().setMaxSize(new LogicalSize(600, 500));

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1311>

##### [setMinimizable()](#setminimizable)

```

setMinimizable(minimizable): Promise<void>

```

Sets whether the window’s native minimize button is enabled or not.

#### [Platform-specific](#platform-specific-12)

* **Linux / iOS / Android:** Unsupported.

###### [Parameters](#parameters-33)

| Parameter | Type |
| --- | --- |
| `minimizable` | `boolean` |

###### [Returns](#returns-59)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-54)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setMinimizable(false);

```

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

###### [Example](#example-55)

```

import { getCurrentWindow, PhysicalSize } from '@tauri-apps/api/window';

await getCurrentWindow().setMinSize(new PhysicalSize(600, 500));

```

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

###### [Example](#example-56)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setOverlayIcon("/tauri/awesome.png");

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1672>

##### [setPosition()](#setposition)

```

setPosition(position): Promise<void>

```

Sets the window outer position.

###### [Parameters](#parameters-36)

| Parameter | Type | Description |
| --- | --- | --- |
| `position` | [`LogicalPosition`](namespacedpi.md) | [`PhysicalPosition`](namespacedpi.md) | [`Position`](namespacedpi.md) | The new position, in logical or physical pixels. |

###### [Returns](#returns-62)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-57)

```

import { getCurrentWindow, LogicalPosition } from '@tauri-apps/api/window';

await getCurrentWindow().setPosition(new LogicalPosition(600, 500));

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1360>

##### [setProgressBar()](#setprogressbar)

```

setProgressBar(state): Promise<void>

```

Sets the taskbar progress state.

#### [Platform-specific](#platform-specific-13)

* **Linux / macOS**: Progress bar is app-wide and not specific to this window.
* **Linux**: Only supported desktop environments with `libunity` (e.g. GNOME).

###### [Parameters](#parameters-37)

| Parameter | Type |
| --- | --- |
| `state` | [`ProgressBarState`](namespacewindow.md) |

###### [Returns](#returns-63)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-58)

```

import { getCurrentWindow, ProgressBarStatus } from '@tauri-apps/api/window';

await getCurrentWindow().setProgressBar({

status: ProgressBarStatus.Normal,

progress: 50,

});

```

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

###### [Example](#example-59)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setResizable(false);

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L868>

##### [setShadow()](#setshadow)

```

setShadow(enable): Promise<void>

```

Whether or not the window should have shadow.

#### [Platform-specific](#platform-specific-14)

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

###### [Example](#example-60)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setShadow(false);

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1182>

##### [setSize()](#setsize)

```

setSize(size): Promise<void>

```

Resizes the window with a new inner size.

###### [Parameters](#parameters-40)

| Parameter | Type | Description |
| --- | --- | --- |
| `size` | [`LogicalSize`](namespacedpi.md) | [`PhysicalSize`](namespacedpi.md) | [`Size`](namespacedpi.md) | The logical or physical inner size. |

###### [Returns](#returns-66)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-61)

```

import { getCurrentWindow, LogicalSize } from '@tauri-apps/api/window';

await getCurrentWindow().setSize(new LogicalSize(600, 500));

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1273>

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

###### [Example](#example-62)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setSizeConstraints({ minWidth: 300 });

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1331>

##### [setSkipTaskbar()](#setskiptaskbar)

```

setSkipTaskbar(skip): Promise<void>

```

Whether the window icon should be hidden from the taskbar or not.

#### [Platform-specific](#platform-specific-15)

* **macOS:** Unsupported.

###### [Parameters](#parameters-42)

| Parameter | Type | Description |
| --- | --- | --- |
| `skip` | `boolean` | true to hide window icon, false to show it. |

###### [Returns](#returns-68)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-63)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setSkipTaskbar(true);

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1445>

##### [setTheme()](#settheme)

```

setTheme(theme?): Promise<void>

```

Set window theme, pass in `null` or `undefined` to follow system theme

#### [Platform-specific](#platform-specific-16)

* **Linux / macOS**: Theme is app-wide and not specific to this window.
* **iOS / Android:** Unsupported.

###### [Parameters](#parameters-43)

| Parameter | Type |
| --- | --- |
| `theme`? | `null` | [`Theme`](namespacewindow.md) |

###### [Returns](#returns-69)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Since](#since-8)

2.0.0

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

###### [Example](#example-64)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().setTitle('Tauri');

```

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

###### [Since](#since-9)

2.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1728>

##### [setVisibleOnAllWorkspaces()](#setvisibleonallworkspaces)

```

setVisibleOnAllWorkspaces(visible): Promise<void>

```

Sets whether the window should be visible on all workspaces or virtual desktops.

#### [Platform-specific](#platform-specific-17)

* **Windows / iOS / Android:** Unsupported.

###### [Parameters](#parameters-46)

| Parameter | Type |
| --- | --- |
| `visible` | `boolean` |

###### [Returns](#returns-72)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Since](#since-10)

2.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1716>

##### [show()](#show)

```

show(): Promise<void>

```

Sets the window visibility to true.

###### [Returns](#returns-73)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-65)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().show();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1089>

##### [startDragging()](#startdragging)

```

startDragging(): Promise<void>

```

Starts dragging the window.

###### [Returns](#returns-74)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-66)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().startDragging();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1585>

##### [startResizeDragging()](#startresizedragging)

```

startResizeDragging(direction): Promise<void>

```

Starts resize-dragging the window.

###### [Parameters](#parameters-47)

| Parameter | Type |
| --- | --- |
| `direction` | `ResizeDirection` |

###### [Returns](#returns-75)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-67)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().startResizeDragging();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1601>

##### [theme()](#theme)

```

theme(): Promise<null | Theme>

```

Gets the window’s current theme.

#### [Platform-specific](#platform-specific-18)

* **macOS:** Theme was introduced on macOS 10.14. Returns `light` on macOS 10.13 and below.

###### [Returns](#returns-76)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`null` | [`Theme`](namespacewindow.md)>

The window theme.

###### [Example](#example-68)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const theme = await getCurrentWindow().theme();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L796>

##### [title()](#title)

```

title(): Promise<string>

```

Gets the window’s current title.

###### [Returns](#returns-77)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

###### [Example](#example-69)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const title = await getCurrentWindow().title();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L775>

##### [toggleMaximize()](#togglemaximize)

```

toggleMaximize(): Promise<void>

```

Toggles the window maximized state.

###### [Returns](#returns-78)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-70)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().toggleMaximize();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1041>

##### [unmaximize()](#unmaximize)

```

unmaximize(): Promise<void>

```

Unmaximizes the window.

###### [Returns](#returns-79)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-71)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().unmaximize();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1025>

##### [unminimize()](#unminimize)

```

unminimize(): Promise<void>

```

Unminimizes the window.

###### [Returns](#returns-80)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example-72)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

await getCurrentWindow().unminimize();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L1073>

##### [getAll()](#getall)

```

static getAll(): Promise<Window[]>

```

Gets a list of instances of `Window` for all available windows.

###### [Returns](#returns-81)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Window`](namespacewindow.md)[]>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L340>

##### [getByLabel()](#getbylabel)

```

static getByLabel(label): Promise<null | Window>

```

Gets the Window associated with the given label.

###### [Parameters](#parameters-48)

| Parameter | Type | Description |
| --- | --- | --- |
| `label` | `string` | The window label. |

###### [Returns](#returns-82)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`null` | [`Window`](namespacewindow.md)>

The Window instance to communicate with the window or null if the window doesn’t exist.

###### [Example](#example-73)

```

import { Window } from '@tauri-apps/api/window';

const mainWindow = Window.getByLabel('main');

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L326>

##### [getCurrent()](#getcurrent)

```

static getCurrent(): Window

```

Get an instance of `Window` for the current window.

###### [Returns](#returns-83)

[`Window`](namespacewindow.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L333>

##### [getFocusedWindow()](#getfocusedwindow)

```

static getFocusedWindow(): Promise<null | Window>

```

Gets the focused window.

###### [Returns](#returns-84)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`null` | [`Window`](namespacewindow.md)>

The Window instance or `undefined` if there is not any focused window.

###### [Example](#example-74)

```

import { Window } from '@tauri-apps/api/window';

const focusedWindow = Window.getFocusedWindow();

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L354>

## [Interfaces](#interfaces)

### [Effects](#effects)

The window effects configuration object

#### [Since](#since-11)

2.0.0

#### [Properties](#properties-2)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `color?` | [`Color`](namespacewebview.md) | Window effect color. Affects [Effect.Blur](namespacewindow.md) and [Effect.Acrylic](namespacewindow.md) only on Windows 10 v1903+. Doesn’t have any effect on Windows 7 or Windows 11. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2205> |
| `effects` | [`Effect`](namespacewindow.md)[] | List of Window effects to apply to the Window. Conflicting effects will apply the first one and ignore the rest. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2192> |
| `radius?` | `number` | Window effect corner radius **macOS Only** | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2200> |
| `state?` | [`EffectState`](namespacewindow.md) | Window effect state **macOS Only** | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2196> |

---

### [Monitor](#monitor)

Allows you to retrieve information about a given monitor.

#### [Since](#since-12)

1.0.0

#### [Properties](#properties-3)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `name` | `null` | `string` | Human-readable name of the monitor | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L49> |
| `position` | [`PhysicalPosition`](namespacedpi.md) | the Top-left corner position of the monitor relative to the larger full screen area. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L53> |
| `scaleFactor` | `number` | The scale factor that can be used to map physical pixels to logical pixels. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L55> |
| `size` | [`PhysicalSize`](namespacedpi.md) | The monitor’s resolution. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L51> |

---

### [ProgressBarState](#progressbarstate)

#### [Properties](#properties-4)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `progress?` | `number` | The progress bar progress. This can be a value ranging from `0` to `100` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L203> |
| `status?` | [`ProgressBarStatus`](namespacewindow.md) | The progress bar status. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L199> |

---

### [ScaleFactorChanged](#scalefactorchanged)

The payload for the `scaleChange` event.

#### [Since](#since-13)

1.0.2

#### [Properties](#properties-5)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `scaleFactor` | `number` | The new window scale factor. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L78> |
| `size` | [`PhysicalSize`](namespacedpi.md) | The new window size | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L80> |

---

### [WindowOptions](#windowoptions)

Configuration for the window to create.

#### [Since](#since-14)

1.0.0

#### [Properties](#properties-6)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `alwaysOnBottom?` | `boolean` | Whether the window should always be below other windows. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2255> |
| `alwaysOnTop?` | `boolean` | Whether the window should always be on top of other windows or not. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2253> |
| `backgroundColor?` | [`Color`](namespacewebview.md) | Set the window background color. #### Platform-specific: - **Android / iOS:** Unsupported. - **Windows**: alpha channel is ignored. **Since** 2.1.0 | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2351> |

| `backgroundThrottling?` | [`BackgroundThrottlingPolicy`](namespacewindow.md) | Change the default background throttling behaviour. ## Platform-specific - **Linux / Windows / Android**: Unsupported. Workarounds like a pending WebLock transaction might suffice. - **iOS**: Supported since version 17.0+. - **macOS**: Supported since version 14.0+. see <https://github.com/tauri-apps/tauri/issues/5250#issuecomment-2569380578> **Since** 2.3.0 | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2365> |

| `center?` | `boolean` | Show window in the center of the screen.. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2215> |
| `closable?` | `boolean` | Whether the window’s native close button is enabled or not. Defaults to `true`. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2306> |
| `contentProtected?` | `boolean` | Prevents the window contents from being captured by other apps. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2257> |
| `decorations?` | `boolean` | Whether the window should have borders and bars or not. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2251> |
| `focus?` | `boolean` | Whether the window will be initially focused or not. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2239> |
| `fullscreen?` | `boolean` | Whether the window is in fullscreen mode or not. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2237> |
| `height?` | `number` | The initial height. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2223> |
| `hiddenTitle?` | `boolean` | If `true`, sets the window title to be hidden on macOS. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2287> |
| `maxHeight?` | `number` | The maximum height. Only applies if `maxWidth` is also set. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2231> |
| `maximizable?` | `boolean` | Whether the window’s native maximize button is enabled or not. Defaults to `true`. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2298> |
| `maximized?` | `boolean` | Whether the window should be maximized upon creation or not. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2247> |
| `maxWidth?` | `number` | The maximum width. Only applies if `maxHeight` is also set. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2229> |
| `minHeight?` | `number` | The minimum height. Only applies if `minWidth` is also set. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2227> |
| `minimizable?` | `boolean` | Whether the window’s native minimize button is enabled or not. Defaults to `true`. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2302> |
| `minWidth?` | `number` | The minimum width. Only applies if `minHeight` is also set. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2225> |
| `parent?` | `string` | [`Window`](namespacewindow.md) | [`WebviewWindow`](namespacewebviewwindow.md) | Sets a parent to the window to be created. Can be either a [`Window`](namespacewindow.md) or a label of the window. #### Platform-specific - **Windows**: This sets the passed parent as an owner window to the window to be created. From [MSDN owned windows docs](https://docs.microsoft.com/en-us/windows/win32/winmsg/window-features#owned-windows): - An owned window is always above its owner in the z-order. - The system automatically destroys an owned window when its owner is destroyed. - An owned window is hidden when its owner is minimized. - **Linux**: This makes the new window transient for parent, see <https://docs.gtk.org/gtk3/method.Window.set_transient_for.html> - **macOS**: This adds the window as a child of parent, see <https://developer.apple.com/documentation/appkit/nswindow/1419152-addchildwindow?language=objc> | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2320> |

| `resizable?` | `boolean` | Whether the window is resizable or not. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2233> |
| `shadow?` | `boolean` | Whether or not the window has shadow. #### Platform-specific - **Windows:** - `false` has no effect on decorated window, shadows are always ON. - `true` will make undecorated window have a 1px white border, and on Windows 11, it will have a rounded corners. - **Linux:** Unsupported. **Since** 2.0.0 | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2273> |

| `skipTaskbar?` | `boolean` | Whether or not the window icon should be added to the taskbar. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2259> |
| `tabbingIdentifier?` | `string` | Defines the window [tabbing identifier](https://developer.apple.com/documentation/appkit/nswindow/1644704-tabbingidentifier) on macOS. Windows with the same tabbing identifier will be grouped together. If the tabbing identifier is not set, automatic tabbing will be disabled. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2294> |
| `theme?` | [`Theme`](namespacewindow.md) | The initial window theme. Defaults to the system theme. Only implemented on Windows and macOS 10.14+. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2279> |
| `title?` | `string` | Window title. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2235> |
| `titleBarStyle?` | [`TitleBarStyle`](namespacewindow.md) | The style of the macOS title bar. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2283> |
| `transparent?` | `boolean` | Whether the window is transparent or not. Note that on `macOS` this requires the `macos-private-api` feature flag, enabled under `tauri.conf.json > app > macOSPrivateApi`. WARNING: Using private APIs on `macOS` prevents your application from being accepted to the `App Store`. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2245> |
| `visible?` | `boolean` | Whether the window should be immediately visible upon creation or not. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2249> |
| `visibleOnAllWorkspaces?` | `boolean` | Whether the window should be visible on all workspaces or virtual desktops. #### Platform-specific - **Windows / iOS / Android:** Unsupported. **Since** 2.0.0 | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2329> |

| `width?` | `number` | The initial width. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2221> |
| `windowEffects?` | [`Effects`](namespacewindow.md) | Window effects. Requires the window to be transparent. #### Platform-specific: - **Windows**: If using decorations or shadows, you may want to try this workaround <https://github.com/tauri-apps/tao/issues/72#issuecomment-975607891> - **Linux**: Unsupported | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2340> |

| `x?` | `number` | The initial vertical position. Only applies if `y` is also set. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2217> |
| `y?` | `number` | The initial horizontal position. Only applies if `x` is also set. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2219> |

---

### [WindowSizeConstraints](#windowsizeconstraints)

#### [Properties](#properties-7)

| Property | Type | Defined in |
| --- | --- | --- |
| `maxHeight?` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L192> |
| `maxWidth?` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L191> |
| `minHeight?` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L190> |
| `minWidth?` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L189> |

## [Type Aliases](#type-aliases)

### [CursorIcon](#cursoricon)

```

type CursorIcon:

| "default"

| "crosshair"

| "hand"

| "arrow"

| "move"

| "text"

| "wait"

| "help"

| "progress"

| "notAllowed"

| "contextMenu"

| "cell"

| "verticalText"

| "alias"

| "copy"

| "noDrop"

| "grab"

| "grabbing"

| "allScroll"

| "zoomIn"

| "zoomOut"

| "eResize"

| "nResize"

| "neResize"

| "nwResize"

| "sResize"

| "seResize"

| "swResize"

| "wResize"

| "ewResize"

| "nsResize"

| "neswResize"

| "nwseResize"

| "colResize"

| "rowResize";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L124>

---

### [Theme](#theme-1)

```

type Theme: "light" | "dark";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L58>

---

### [TitleBarStyle](#titlebarstyle)

```

type TitleBarStyle: "visible" | "transparent" | "overlay";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L59>

## [Functions](#functions)

### [availableMonitors()](#availablemonitors)

```

function availableMonitors(): Promise<Monitor[]>

```

Returns the list of all the monitors available on the system.

#### [Returns](#returns-85)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Monitor`](namespacewindow.md)[]>

#### [Example](#example-75)

```

import { availableMonitors } from '@tauri-apps/api/window';

const monitors = availableMonitors();

```

#### [Since](#since-15)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2440>

---

### [currentMonitor()](#currentmonitor)

```

function currentMonitor(): Promise<Monitor | null>

```

Returns the monitor on which the window currently resides.
Returns `null` if current monitor can’t be detected.

#### [Returns](#returns-86)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Monitor`](namespacewindow.md) | `null`>

#### [Example](#example-76)

```

import { currentMonitor } from '@tauri-apps/api/window';

const monitor = currentMonitor();

```

#### [Since](#since-16)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2390>

---

### [cursorPosition()](#cursorposition)

```

function cursorPosition(): Promise<PhysicalPosition>

```

Get the cursor position relative to the top-left hand corner of the desktop.

Note that the top-left hand corner of the desktop is not necessarily the same as the screen.
If the user uses a desktop with multiple monitors,
the top-left hand corner of the desktop is the top-left hand corner of the main monitor on Windows and macOS
or the top-left of the leftmost monitor on X11.

The coordinates can be negative if the top-left hand corner of the window is outside of the visible screen region.

#### [Returns](#returns-87)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`PhysicalPosition`](namespacedpi.md)>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2456>

---

### [getAllWindows()](#getallwindows)

```

function getAllWindows(): Promise<Window[]>

```

Gets a list of instances of `Window` for all available windows.

#### [Returns](#returns-88)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Window`](namespacewindow.md)[]>

#### [Since](#since-17)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L223>

---

### [getCurrentWindow()](#getcurrentwindow)

```

function getCurrentWindow(): Window

```

Get an instance of `Window` for the current window.

#### [Returns](#returns-89)

[`Window`](namespacewindow.md)

#### [Since](#since-18)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L211>

---

### [monitorFromPoint()](#monitorfrompoint)

```

function monitorFromPoint(x, y): Promise<Monitor | null>

```

Returns the monitor that contains the given point. Returns `null` if can’t find any.

#### [Parameters](#parameters-49)

| Parameter | Type |
| --- | --- |
| `x` | `number` |
| `y` | `number` |

#### [Returns](#returns-90)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Monitor`](namespacewindow.md) | `null`>

#### [Example](#example-77)

```

import { monitorFromPoint } from '@tauri-apps/api/window';

const monitor = monitorFromPoint();

```

#### [Since](#since-19)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2423>

---

### [primaryMonitor()](#primarymonitor)

```

function primaryMonitor(): Promise<Monitor | null>

```

Returns the primary monitor of the system.
Returns `null` if it can’t identify any monitor as a primary one.

#### [Returns](#returns-91)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Monitor`](namespacewindow.md) | `null`>

#### [Example](#example-78)

```

import { primaryMonitor } from '@tauri-apps/api/window';

const monitor = primaryMonitor();

```

#### [Since](#since-20)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/window.ts#L2407>

[Previous   
 webviewWindow](namespacewebviewwindow.md)   [Next   
 barcode-scanner](..\barcode-scanner.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT