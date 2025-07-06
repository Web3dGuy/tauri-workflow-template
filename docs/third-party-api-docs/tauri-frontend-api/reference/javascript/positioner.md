# @tauri-apps/plugin-positioner

## [Enumerations](#enumerations)

### [Position](#position)

Well known window positions.

#### [Enumeration Members](#enumeration-members)

##### [BottomCenter](#bottomcenter)

```

BottomCenter: 5;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/positioner/guest-js/index.ts#L18>

##### [BottomLeft](#bottomleft)

```

BottomLeft: 2;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/positioner/guest-js/index.ts#L15>

##### [BottomRight](#bottomright)

```

BottomRight: 3;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/positioner/guest-js/index.ts#L16>

##### [Center](#center)

```

Center: 8;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/positioner/guest-js/index.ts#L21>

##### [LeftCenter](#leftcenter)

```

LeftCenter: 6;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/positioner/guest-js/index.ts#L19>

##### [RightCenter](#rightcenter)

```

RightCenter: 7;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/positioner/guest-js/index.ts#L20>

##### [TopCenter](#topcenter)

```

TopCenter: 4;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/positioner/guest-js/index.ts#L17>

##### [TopLeft](#topleft)

```

TopLeft: 0;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/positioner/guest-js/index.ts#L13>

##### [TopRight](#topright)

```

TopRight: 1;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/positioner/guest-js/index.ts#L14>

##### [TrayBottomCenter](#traybottomcenter)

```

TrayBottomCenter: 14;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/positioner/guest-js/index.ts#L27>

##### [TrayBottomLeft](#traybottomleft)

```

TrayBottomLeft: 10;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/positioner/guest-js/index.ts#L23>

##### [TrayBottomRight](#traybottomright)

```

TrayBottomRight: 12;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/positioner/guest-js/index.ts#L25>

##### [TrayCenter](#traycenter)

```

TrayCenter: 13;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/positioner/guest-js/index.ts#L26>

##### [TrayLeft](#trayleft)

```

TrayLeft: 9;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/positioner/guest-js/index.ts#L22>

##### [TrayRight](#trayright)

```

TrayRight: 11;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/positioner/guest-js/index.ts#L24>

## [Functions](#functions)

### [handleIconState()](#handleiconstate)

```

function handleIconState(event): Promise<void>

```

#### [Parameters](#parameters)

| Parameter | Type |
| --- | --- |
| `event` | `TrayIconEvent` |

#### [Returns](#returns)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/positioner/guest-js/index.ts#L55>

---

### [moveWindow()](#movewindow)

```

function moveWindow(to): Promise<void>

```

Moves the `Window` to the given [Position](positioner.md) using `WindowExt.move_window()`
All positions are relative to the **current** screen.

#### [Parameters](#parameters-1)

| Parameter | Type | Description |
| --- | --- | --- |
| `to` | [`Position`](positioner.md) | The [Position](positioner.md) to move to. |

#### [Returns](#returns-1)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/positioner/guest-js/index.ts#L36>

---

### [moveWindowConstrained()](#movewindowconstrained)

```

function moveWindowConstrained(to): Promise<void>

```

Moves the `Window` to the given [Position](positioner.md) using `WindowExt.move_window_constrained()`

This move operation constrains the window to the screen dimensions in case of
tray-icon positions.

#### [Parameters](#parameters-2)

| Parameter | Type | Description |
| --- | --- | --- |
| `to` | [`Position`](positioner.md) | The (tray) [Position](positioner.md) to move to. |

#### [Returns](#returns-2)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/positioner/guest-js/index.ts#L49>

[Previous   
 os](os.md)   [Next   
 process](process.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT