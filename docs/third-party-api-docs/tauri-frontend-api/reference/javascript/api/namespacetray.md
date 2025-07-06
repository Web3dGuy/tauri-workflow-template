# tray

## [Classes](#classes)

### [TrayIcon](#trayicon)

Tray icon class and associated methods. This type constructor is private,
instead, you should use the static method [`TrayIcon.new`](namespacetray.md).

#### [Warning](#warning)

Unlike Rust, javascript does not have any way to run cleanup code
when an object is being removed by garbage collection, but this tray icon
will be cleaned up when the tauri app exists, however if you want to cleanup
this object early, you need to call [`TrayIcon.close`](namespacecore.md).

#### [Example](#example)

```

import { TrayIcon } from '@tauri-apps/api/tray';

const tray = await TrayIcon.new({ tooltip: 'awesome tray tooltip' });

tray.set_tooltip('new tooltip');

```

#### [Extends](#extends)

#### [Properties](#properties)

| Property | Modifier | Type | Description | Defined in |
| --- | --- | --- | --- | --- |
| `id` | `public` | `string` | The id associated with this tray icon. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L160> |

#### [Accessors](#accessors)

##### [rid](#rid)

###### [Get Signature](#get-signature)

```

get rid(): number

```

###### [Returns](#returns)

`number`

###### [Inherited from](#inherited-from)

[`Resource`](namespacecore.md).[`rid`](namespacecore.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L286>

#### [Methods](#methods)

##### [close()](#close)

```

close(): Promise<void>

```

Destroys and cleans up this resource from memory.
**You should not call any method on this object anymore and should drop any reference to it.**

###### [Returns](#returns-1)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Inherited from](#inherited-from-1)

[`Resource`](namespacecore.md).[`close`](namespacecore.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L298>

##### [setIcon()](#seticon)

```

setIcon(icon): Promise<void>

```

Sets a new tray icon. If `null` is provided, it will remove the icon.

Note that you may need the `image-ico` or `image-png` Cargo features to use this API.
To enable it, change your Cargo.toml file:

```

[dependencies]

tauri = { version = "...", features = ["...", "image-png"] }

```

###### [Parameters](#parameters)

| Parameter | Type |
| --- | --- |
| `icon` | | `null` | `string` | `number`[] | [`ArrayBuffer`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer) | [`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`> | [`Image`](namespaceimage.md) |

###### [Returns](#returns-2)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L224>

##### [setIconAsTemplate()](#seticonastemplate)

```

setIconAsTemplate(asTemplate): Promise<void>

```

Sets the current icon as a [template](https://developer.apple.com/documentation/appkit/nsimage/1520017-template?language=objc). **macOS only**

###### [Parameters](#parameters-1)

| Parameter | Type |
| --- | --- |
| `asTemplate` | `boolean` |

###### [Returns](#returns-3)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L292>

##### [setMenu()](#setmenu)

```

setMenu(menu): Promise<void>

```

Sets a new tray menu.

#### [Platform-specific:](#platform-specific)

* **Linux**: once a menu is set it cannot be removed so `null` has no effect

###### [Parameters](#parameters-2)

| Parameter | Type |
| --- | --- |
| `menu` | `null` | [`Submenu`](namespacemenu.md) | [`Menu`](namespacemenu.md) |

###### [Returns](#returns-4)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L241>

##### [~~setMenuOnLeftClick()~~](#setmenuonleftclick)

```

setMenuOnLeftClick(onLeft): Promise<void>

```

Disable or enable showing the tray menu on left click.

#### [Platform-specific:](#platform-specific-1)

* **Linux**: Unsupported.

###### [Parameters](#parameters-3)

| Parameter | Type |
| --- | --- |
| `onLeft` | `boolean` |

###### [Returns](#returns-5)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Deprecated](#deprecated)

use [`TrayIcon.setShowMenuOnLeftClick`](namespacetray.md) instead.

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L308>

##### [setShowMenuOnLeftClick()](#setshowmenuonleftclick)

```

setShowMenuOnLeftClick(onLeft): Promise<void>

```

Disable or enable showing the tray menu on left click.

#### [Platform-specific:](#platform-specific-2)

* **Linux**: Unsupported.

###### [Parameters](#parameters-4)

| Parameter | Type |
| --- | --- |
| `onLeft` | `boolean` |

###### [Returns](#returns-6)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Since](#since)

2.2.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L324>

##### [setTempDirPath()](#settempdirpath)

```

setTempDirPath(path): Promise<void>

```

Sets the tray icon temp dir path. **Linux only**.

On Linux, we need to write the icon to the disk and usually it will
be `$XDG_RUNTIME_DIR/tray-icon` or `$TEMP/tray-icon`.

###### [Parameters](#parameters-5)

| Parameter | Type |
| --- | --- |
| `path` | `null` | `string` |

###### [Returns](#returns-7)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L287>

##### [setTitle()](#settitle)

```

setTitle(title): Promise<void>

```

Sets the tooltip for this tray icon.

#### [Platform-specific:](#platform-specific-3)

* **Linux:** The title will not be shown unless there is an icon
  as well. The title is useful for numerical and other frequently
  updated information. In general, it shouldn’t be shown unless a
  user requests it as it can take up a significant amount of space
  on the user’s panel. This may not be shown in all visualizations.
* **Windows:** Unsupported

###### [Parameters](#parameters-6)

| Parameter | Type |
| --- | --- |
| `title` | `null` | `string` |

###### [Returns](#returns-8)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L272>

##### [setTooltip()](#settooltip)

```

setTooltip(tooltip): Promise<void>

```

Sets the tooltip for this tray icon.

#### [Platform-specific:](#platform-specific-4)

* **Linux:** Unsupported

###### [Parameters](#parameters-7)

| Parameter | Type |
| --- | --- |
| `tooltip` | `null` | `string` |

###### [Returns](#returns-9)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L256>

##### [setVisible()](#setvisible)

```

setVisible(visible): Promise<void>

```

Show or hide this tray icon.

###### [Parameters](#parameters-8)

| Parameter | Type |
| --- | --- |
| `visible` | `boolean` |

###### [Returns](#returns-10)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L277>

##### [getById()](#getbyid)

```

static getById(id): Promise<null | TrayIcon>

```

Gets a tray icon using the provided id.

###### [Parameters](#parameters-9)

| Parameter | Type |
| --- | --- |
| `id` | `string` |

###### [Returns](#returns-11)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`null` | [`TrayIcon`](namespacetray.md)>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L168>

##### [new()](#new)

```

static new(options?): Promise<TrayIcon>

```

Creates a new [`TrayIcon`](namespacetray.md)

#### [Platform-specific:](#platform-specific-5)

* **Linux:** Sometimes the icon won’t be visible unless a menu is set.
  Setting an empty [`Menu`](namespacemenu.md) is enough.

###### [Parameters](#parameters-10)

| Parameter | Type |
| --- | --- |
| `options`? | [`TrayIconOptions`](namespacetray.md) |

###### [Returns](#returns-12)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`TrayIcon`](namespacetray.md)>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L192>

##### [removeById()](#removebyid)

```

static removeById(id): Promise<void>

```

Removes a tray icon using the provided id from tauri’s internal state.

Note that this may cause the tray icon to disappear
if it wasn’t cloned somewhere else or referenced by JS.

###### [Parameters](#parameters-11)

| Parameter | Type |
| --- | --- |
| `id` | `string` |

###### [Returns](#returns-13)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L180>

## [Interfaces](#interfaces)

### [TrayIconOptions](#trayiconoptions)

[`TrayIcon`](namespacetray.md) creation options

#### [Properties](#properties-1)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `action?` | (`event`: [`TrayIconEvent`](namespacetray.md)) => `void` | A handler for an event on the tray icon. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L137> |
| `icon?` | | `string` | `number`[] | [`ArrayBuffer`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer) | [`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`> | [`Image`](namespaceimage.md) | The tray icon which could be icon bytes or path to the icon file. Note that you may need the `image-ico` or `image-png` Cargo features to use this API. To enable it, change your Cargo.toml file: `[dependencies] tauri = { version = "...", features = ["...", "image-png"] }` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L89> |
| `iconAsTemplate?` | `boolean` | Use the icon as a [template](https://developer.apple.com/documentation/appkit/nsimage/1520017-template?language=objc). **macOS only**. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L115> |
| `id?` | `string` | The tray icon id. If undefined, a random one will be assigned | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L76> |
| `menu?` | [`Submenu`](namespacemenu.md) | [`Menu`](namespacemenu.md) | The tray icon menu | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L78> |
| ~~`menuOnLeftClick?`~~ | `boolean` | Whether to show the tray menu on left click or not, default is `true`. #### Platform-specific: - **Linux**: Unsupported. **Deprecated** use [`TrayIconOptions.showMenuOnLeftClick`](namespacetray.md) instead. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L125> |

| `showMenuOnLeftClick?` | `boolean` | Whether to show the tray menu on left click or not, default is `true`. #### Platform-specific: - **Linux**: Unsupported. **Since** 2.2.0 | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L135> |

| `tempDirPath?` | `string` | The tray icon temp dir path. **Linux only**. On Linux, we need to write the icon to the disk and usually it will be `$XDG_RUNTIME_DIR/tray-icon` or `$TEMP/tray-icon`. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L111> |
| `title?` | `string` | The tray title #### Platform-specific - **Linux:** The title will not be shown unless there is an icon as well. The title is useful for numerical and other frequently updated information. In general, it shouldn’t be shown unless a user requests it as it can take up a significant amount of space on the user’s panel. This may not be shown in all visualizations. - **Windows:** Unsupported. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L104> |

| `tooltip?` | `string` | The tray icon tooltip | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L91> |

## [Type Aliases](#type-aliases)

### [MouseButton](#mousebutton)

```

type MouseButton: "Left" | "Right" | "Middle";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L11>

---

### [MouseButtonState](#mousebuttonstate)

```

type MouseButtonState: "Up" | "Down";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L10>

---

### [TrayIconClickEvent](#trayiconclickevent)

```

type TrayIconClickEvent: object;

```

#### [Type declaration](#type-declaration)

| Name | Type | Description | Defined in |
| --- | --- | --- | --- |
| `button` | [`MouseButton`](namespacetray.md) | Mouse button that triggered this event. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L35> |
| `buttonState` | [`MouseButtonState`](namespacetray.md) | Mouse button state when this event was triggered. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L37> |

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L33>

---

### [TrayIconEvent](#trayiconevent)

```

type TrayIconEvent:

| TrayIconEventBase<"Click"> & TrayIconClickEvent

| TrayIconEventBase<"DoubleClick"> & Omit<TrayIconClickEvent, "buttonState">

| TrayIconEventBase<"Enter">

| TrayIconEventBase<"Move">

| TrayIconEventBase<"Leave">;

```

Describes a tray icon event.

#### [Platform-specific:](#platform-specific-6)

* **Linux**: Unsupported. The event is not emitted even though the icon is shown,
  the icon will still show a context menu on right click.

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L48>

---

### [TrayIconEventBase<T>](#trayiconeventbaset)

```

type TrayIconEventBase<T>: object;

```

#### [Type Parameters](#type-parameters)

| Type Parameter |
| --- |
| `T` *extends* [`TrayIconEventType`](namespacetray.md) |

#### [Type declaration](#type-declaration-1)

| Name | Type | Description | Defined in |
| --- | --- | --- | --- |
| `id` | `string` | Id of the tray icon which triggered this event. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L23> |
| `position` | [`PhysicalPosition`](namespacedpi.md) | Physical position of the click the triggered this event. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L25> |
| `rect` | `object` | Position and size of the tray icon. | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L27> |
| `rect.position` | [`PhysicalPosition`](namespacedpi.md) | - | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L28> |
| `rect.size` | [`PhysicalSize`](namespacedpi.md) | - | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L29> |
| `type` | `T` | The tray icon event type | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L21> |

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L19>

---

### [TrayIconEventType](#trayiconeventtype)

```

type TrayIconEventType:

| "Click"

| "DoubleClick"

| "Enter"

| "Move"

| "Leave";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/tray.ts#L12>

[Previous   
 path](namespacepath.md)   [Next   
 webview](namespacewebview.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT