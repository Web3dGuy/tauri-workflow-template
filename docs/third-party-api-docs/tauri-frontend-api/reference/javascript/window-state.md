# @tauri-apps/plugin-window-state

## [Enumerations](#enumerations)

### [StateFlags](#stateflags)

#### [Enumeration Members](#enumeration-members)

##### [ALL](#all)

```

ALL: 63;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/window-state/guest-js/index.ts#L15>

##### [DECORATIONS](#decorations)

```

DECORATIONS: 16;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/window-state/guest-js/index.ts#L13>

##### [FULLSCREEN](#fullscreen)

```

FULLSCREEN: 32;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/window-state/guest-js/index.ts#L14>

##### [MAXIMIZED](#maximized)

```

MAXIMIZED: 4;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/window-state/guest-js/index.ts#L11>

##### [POSITION](#position)

```

POSITION: 2;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/window-state/guest-js/index.ts#L10>

##### [SIZE](#size)

```

SIZE: 1;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/window-state/guest-js/index.ts#L9>

##### [VISIBLE](#visible)

```

VISIBLE: 8;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/window-state/guest-js/index.ts#L12>

## [Functions](#functions)

### [filename()](#filename)

```

function filename(): Promise<string>

```

Get the name of the file used to store window state.

#### [Returns](#returns)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/window-state/guest-js/index.ts#L44>

---

### [restoreState()](#restorestate)

```

function restoreState(label, flags): Promise<void>

```

Restore the state for the specified window from disk.

#### [Parameters](#parameters)

| Parameter | Type |
| --- | --- |
| `label` | `string` |
| `flags` | [`StateFlags`](window-state.md) |

#### [Returns](#returns-1)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/window-state/guest-js/index.ts#L28>

---

### [restoreStateCurrent()](#restorestatecurrent)

```

function restoreStateCurrent(flags): Promise<void>

```

Restore the state for the current window from disk.

#### [Parameters](#parameters-1)

| Parameter | Type |
| --- | --- |
| `flags` | [`StateFlags`](window-state.md) |

#### [Returns](#returns-2)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/window-state/guest-js/index.ts#L38>

---

### [saveWindowState()](#savewindowstate)

```

function saveWindowState(flags): Promise<void>

```

Save the state of all open windows to disk.

#### [Parameters](#parameters-2)

| Parameter | Type |
| --- | --- |
| `flags` | [`StateFlags`](window-state.md) |

#### [Returns](#returns-3)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/window-state/guest-js/index.ts#L21>

[Previous   
 websocket](websocket.md)   [Next   
 Rust (docs.rs)](https://docs.rs/tauri/~2/)

 

---

© 2025 Tauri Contributors. CC-BY / MIT