# @tauri-apps/plugin-global-shortcut

Register global shortcuts.

## [Interfaces](#interfaces)

### [ShortcutEvent](#shortcutevent)

#### [Properties](#properties)

| Property | Type | Defined in |
| --- | --- | --- |
| `id` | `number` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/global-shortcut/guest-js/index.ts#L15> |
| `shortcut` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/global-shortcut/guest-js/index.ts#L14> |
| `state` | `"Released"` | `"Pressed"` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/global-shortcut/guest-js/index.ts#L16> |

## [Type Aliases](#type-aliases)

### [ShortcutHandler()](#shortcuthandler)

```

type ShortcutHandler: (event) => void;

```

#### [Parameters](#parameters)

| Parameter | Type |
| --- | --- |
| `event` | [`ShortcutEvent`](global-shortcut.md) |

#### [Returns](#returns)

`void`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/global-shortcut/guest-js/index.ts#L19>

## [Functions](#functions)

### [isRegistered()](#isregistered)

```

function isRegistered(shortcut): Promise<boolean>

```

Determines whether the given shortcut is registered by this application or not.

If the shortcut is registered by another application, it will still return `false`.

#### [Parameters](#parameters-1)

| Parameter | Type | Description |
| --- | --- | --- |
| `shortcut` | `string` | shortcut definition, modifiers and key separated by ”+” e.g. CmdOrControl+Q |

#### [Returns](#returns-1)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

#### [Example](#example)

```

import { isRegistered } from '@tauri-apps/plugin-global-shortcut';

const isRegistered = await isRegistered('CommandOrControl+P');

```

#### [Since](#since)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/global-shortcut/guest-js/index.ts#L117>

---

### [register()](#register)

```

function register(shortcuts, handler): Promise<void>

```

Register a global shortcut or a list of shortcuts.

The handler is called when any of the registered shortcuts are pressed by the user.

If the shortcut is already taken by another application, the handler will not be triggered.
Make sure the shortcut is as unique as possible while still taking user experience into consideration.

#### [Parameters](#parameters-2)

| Parameter | Type | Description |
| --- | --- | --- |
| `shortcuts` | `string` | `string`[] | - |
| `handler` | [`ShortcutHandler`](global-shortcut.md) | Shortcut handler callback - takes the triggered shortcut as argument |

#### [Returns](#returns-2)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

#### [Example](#example-1)

```

import { register } from '@tauri-apps/plugin-global-shortcut';

// register a single hotkey

await register('CommandOrControl+Shift+C', (event) => {

if (event.state === "Pressed") {

console.log('Shortcut triggered');

}

});

// or register multiple hotkeys at once

await register(['CommandOrControl+Shift+C', 'Alt+A'], (event) => {

console.log(`Shortcut ${event.shortcut} triggered`);

});

```

#### [Since](#since-1)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/global-shortcut/guest-js/index.ts#L51>

---

### [unregister()](#unregister)

```

function unregister(shortcuts): Promise<void>

```

Unregister a global shortcut or a list of shortcuts.

#### [Parameters](#parameters-3)

| Parameter | Type |
| --- | --- |
| `shortcuts` | `string` | `string`[] |

#### [Returns](#returns-3)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

#### [Example](#example-2)

```

import { unregister } from '@tauri-apps/plugin-global-shortcut';

// unregister a single hotkey

await unregister('CmdOrControl+Space');

// or unregister multiple hotkeys at the same time

await unregister(['CmdOrControl+Space', 'Alt+A']);

```

#### [Since](#since-2)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/global-shortcut/guest-js/index.ts#L82>

---

### [unregisterAll()](#unregisterall)

```

function unregisterAll(): Promise<void>

```

Unregister all global shortcuts.

#### [Returns](#returns-4)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

#### [Example](#example-3)

```

import { unregisterAll } from '@tauri-apps/plugin-global-shortcut';

await unregisterAll();

```

#### [Since](#since-3)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/global-shortcut/guest-js/index.ts#L98>

[Previous   
 fs](fs.md)   [Next   
 http](http.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT