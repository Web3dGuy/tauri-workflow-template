# dpi

## [Classes](#classes)

### [LogicalPosition](#logicalposition)

A position represented in logical pixels.

#### [Since](#since)

2.0.0

#### [Constructors](#constructors)

##### [new LogicalPosition()](#new-logicalposition)

```

new LogicalPosition(x, y): LogicalPosition

```

###### [Parameters](#parameters)

| Parameter | Type |
| --- | --- |
| `x` | `number` |
| `y` | `number` |

###### [Returns](#returns)

[`LogicalPosition`](namespacedpi.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L208>

##### [new LogicalPosition()](#new-logicalposition-1)

```

new LogicalPosition(object): LogicalPosition

```

###### [Parameters](#parameters-1)

| Parameter | Type |
| --- | --- |
| `object` | `object` |
| `object.Logical` | `object` |
| `object.Logical.x` | `number` |
| `object.Logical.y` | `number` |

###### [Returns](#returns-1)

[`LogicalPosition`](namespacedpi.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L209>

##### [new LogicalPosition()](#new-logicalposition-2)

```

new LogicalPosition(object): LogicalPosition

```

###### [Parameters](#parameters-2)

| Parameter | Type |
| --- | --- |
| `object` | `object` |
| `object.x` | `number` |
| `object.y` | `number` |

###### [Returns](#returns-2)

[`LogicalPosition`](namespacedpi.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L210>

#### [Properties](#properties)

| Property | Modifier | Type | Default value | Defined in |
| --- | --- | --- | --- | --- |
| `type` | `readonly` | `"Logical"` | `'Logical'` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L204> |
| `x` | `public` | `number` | `undefined` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L205> |
| `y` | `public` | `number` | `undefined` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L206> |

#### [Methods](#methods)

##### [\_\_TAURI\_TO\_IPC\_KEY\_\_()](#__tauri_to_ipc_key__)

```

__TAURI_TO_IPC_KEY__(): object

```

###### [Returns](#returns-3)

`object`

| Name | Type | Defined in |
| --- | --- | --- |
| `x` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L252> |
| `y` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L253> |

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L250>

##### [toJSON()](#tojson)

```

toJSON(): object

```

###### [Returns](#returns-4)

`object`

| Name | Type | Defined in |
| --- | --- | --- |
| `x` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L252> |
| `y` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L253> |

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L257>

##### [toPhysical()](#tophysical)

```

toPhysical(scaleFactor): PhysicalPosition

```

Converts the logical position to a physical one.

###### [Parameters](#parameters-3)

| Parameter | Type |
| --- | --- |
| `scaleFactor` | `number` |

###### [Returns](#returns-5)

[`PhysicalPosition`](namespacedpi.md)

###### [Example](#example)

```

import { LogicalPosition } from '@tauri-apps/api/dpi';

import { getCurrentWindow } from '@tauri-apps/api/window';

const appWindow = getCurrentWindow();

const factor = await appWindow.scaleFactor();

const position = new LogicalPosition(400, 500);

const physical = position.toPhysical(factor);

```

###### [Since](#since-1)

2.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L246>

---

### [LogicalSize](#logicalsize)

A size represented in logical pixels.

#### [Since](#since-2)

2.0.0

#### [Constructors](#constructors-1)

##### [new LogicalSize()](#new-logicalsize)

```

new LogicalSize(width, height): LogicalSize

```

###### [Parameters](#parameters-4)

| Parameter | Type |
| --- | --- |
| `width` | `number` |
| `height` | `number` |

###### [Returns](#returns-6)

[`LogicalSize`](namespacedpi.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L17>

##### [new LogicalSize()](#new-logicalsize-1)

```

new LogicalSize(object): LogicalSize

```

###### [Parameters](#parameters-5)

| Parameter | Type |
| --- | --- |
| `object` | `object` |
| `object.Logical` | `object` |
| `object.Logical.height` | `number` |
| `object.Logical.width` | `number` |

###### [Returns](#returns-7)

[`LogicalSize`](namespacedpi.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L18>

##### [new LogicalSize()](#new-logicalsize-2)

```

new LogicalSize(object): LogicalSize

```

###### [Parameters](#parameters-6)

| Parameter | Type |
| --- | --- |
| `object` | `object` |
| `object.height` | `number` |
| `object.width` | `number` |

###### [Returns](#returns-8)

[`LogicalSize`](namespacedpi.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L19>

#### [Properties](#properties-1)

| Property | Modifier | Type | Default value | Defined in |
| --- | --- | --- | --- | --- |
| `height` | `public` | `number` | `undefined` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L15> |
| `type` | `readonly` | `"Logical"` | `'Logical'` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L13> |
| `width` | `public` | `number` | `undefined` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L14> |

#### [Methods](#methods-1)

##### [\_\_TAURI\_TO\_IPC\_KEY\_\_()](#__tauri_to_ipc_key__-1)

```

__TAURI_TO_IPC_KEY__(): object

```

###### [Returns](#returns-9)

`object`

| Name | Type | Defined in |
| --- | --- | --- |
| `height` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L62> |
| `width` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L61> |

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L59>

##### [toJSON()](#tojson-1)

```

toJSON(): object

```

###### [Returns](#returns-10)

`object`

| Name | Type | Defined in |
| --- | --- | --- |
| `height` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L62> |
| `width` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L61> |

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L66>

##### [toPhysical()](#tophysical-1)

```

toPhysical(scaleFactor): PhysicalSize

```

Converts the logical size to a physical one.

###### [Parameters](#parameters-7)

| Parameter | Type |
| --- | --- |
| `scaleFactor` | `number` |

###### [Returns](#returns-11)

[`PhysicalSize`](namespacedpi.md)

###### [Example](#example-1)

```

import { LogicalSize } from '@tauri-apps/api/dpi';

import { getCurrentWindow } from '@tauri-apps/api/window';

const appWindow = getCurrentWindow();

const factor = await appWindow.scaleFactor();

const size = new LogicalSize(400, 500);

const physical = size.toPhysical(factor);

```

###### [Since](#since-3)

2.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L55>

---

### [PhysicalPosition](#physicalposition)

A position represented in physical pixels.

#### [Since](#since-4)

2.0.0

#### [Constructors](#constructors-2)

##### [new PhysicalPosition()](#new-physicalposition)

```

new PhysicalPosition(x, y): PhysicalPosition

```

###### [Parameters](#parameters-8)

| Parameter | Type |
| --- | --- |
| `x` | `number` |
| `y` | `number` |

###### [Returns](#returns-12)

[`PhysicalPosition`](namespacedpi.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L273>

##### [new PhysicalPosition()](#new-physicalposition-1)

```

new PhysicalPosition(object): PhysicalPosition

```

###### [Parameters](#parameters-9)

| Parameter | Type |
| --- | --- |
| `object` | `object` |
| `object.Physical` | `object` |
| `object.Physical.x` | `number` |
| `object.Physical.y` | `number` |

###### [Returns](#returns-13)

[`PhysicalPosition`](namespacedpi.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L274>

##### [new PhysicalPosition()](#new-physicalposition-2)

```

new PhysicalPosition(object): PhysicalPosition

```

###### [Parameters](#parameters-10)

| Parameter | Type |
| --- | --- |
| `object` | `object` |
| `object.x` | `number` |
| `object.y` | `number` |

###### [Returns](#returns-14)

[`PhysicalPosition`](namespacedpi.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L275>

#### [Properties](#properties-2)

| Property | Modifier | Type | Default value | Defined in |
| --- | --- | --- | --- | --- |
| `type` | `readonly` | `"Physical"` | `'Physical'` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L269> |
| `x` | `public` | `number` | `undefined` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L270> |
| `y` | `public` | `number` | `undefined` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L271> |

#### [Methods](#methods-2)

##### [\_\_TAURI\_TO\_IPC\_KEY\_\_()](#__tauri_to_ipc_key__-2)

```

__TAURI_TO_IPC_KEY__(): object

```

###### [Returns](#returns-15)

`object`

| Name | Type | Defined in |
| --- | --- | --- |
| `x` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L317> |
| `y` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L318> |

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L315>

##### [toJSON()](#tojson-2)

```

toJSON(): object

```

###### [Returns](#returns-16)

`object`

| Name | Type | Defined in |
| --- | --- | --- |
| `x` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L317> |
| `y` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L318> |

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L322>

##### [toLogical()](#tological)

```

toLogical(scaleFactor): LogicalPosition

```

Converts the physical position to a logical one.

###### [Parameters](#parameters-11)

| Parameter | Type |
| --- | --- |
| `scaleFactor` | `number` |

###### [Returns](#returns-17)

[`LogicalPosition`](namespacedpi.md)

###### [Example](#example-2)

```

import { PhysicalPosition } from '@tauri-apps/api/dpi';

import { getCurrentWindow } from '@tauri-apps/api/window';

const appWindow = getCurrentWindow();

const factor = await appWindow.scaleFactor();

const position = new PhysicalPosition(400, 500);

const physical = position.toLogical(factor);

```

###### [Since](#since-5)

2.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L311>

---

### [PhysicalSize](#physicalsize)

A size represented in physical pixels.

#### [Since](#since-6)

2.0.0

#### [Constructors](#constructors-3)

##### [new PhysicalSize()](#new-physicalsize)

```

new PhysicalSize(width, height): PhysicalSize

```

###### [Parameters](#parameters-12)

| Parameter | Type |
| --- | --- |
| `width` | `number` |
| `height` | `number` |

###### [Returns](#returns-18)

[`PhysicalSize`](namespacedpi.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L82>

##### [new PhysicalSize()](#new-physicalsize-1)

```

new PhysicalSize(object): PhysicalSize

```

###### [Parameters](#parameters-13)

| Parameter | Type |
| --- | --- |
| `object` | `object` |
| `object.Physical` | `object` |
| `object.Physical.height` | `number` |
| `object.Physical.width` | `number` |

###### [Returns](#returns-19)

[`PhysicalSize`](namespacedpi.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L83>

##### [new PhysicalSize()](#new-physicalsize-2)

```

new PhysicalSize(object): PhysicalSize

```

###### [Parameters](#parameters-14)

| Parameter | Type |
| --- | --- |
| `object` | `object` |
| `object.height` | `number` |
| `object.width` | `number` |

###### [Returns](#returns-20)

[`PhysicalSize`](namespacedpi.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L84>

#### [Properties](#properties-3)

| Property | Modifier | Type | Default value | Defined in |
| --- | --- | --- | --- | --- |
| `height` | `public` | `number` | `undefined` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L80> |
| `type` | `readonly` | `"Physical"` | `'Physical'` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L78> |
| `width` | `public` | `number` | `undefined` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L79> |

#### [Methods](#methods-3)

##### [\_\_TAURI\_TO\_IPC\_KEY\_\_()](#__tauri_to_ipc_key__-3)

```

__TAURI_TO_IPC_KEY__(): object

```

###### [Returns](#returns-21)

`object`

| Name | Type | Defined in |
| --- | --- | --- |
| `height` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L123> |
| `width` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L122> |

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L120>

##### [toJSON()](#tojson-3)

```

toJSON(): object

```

###### [Returns](#returns-22)

`object`

| Name | Type | Defined in |
| --- | --- | --- |
| `height` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L123> |
| `width` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L122> |

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L127>

##### [toLogical()](#tological-1)

```

toLogical(scaleFactor): LogicalSize

```

Converts the physical size to a logical one.

###### [Parameters](#parameters-15)

| Parameter | Type |
| --- | --- |
| `scaleFactor` | `number` |

###### [Returns](#returns-23)

[`LogicalSize`](namespacedpi.md)

###### [Example](#example-3)

```

import { getCurrentWindow } from '@tauri-apps/api/window';

const appWindow = getCurrentWindow();

const factor = await appWindow.scaleFactor();

const size = await appWindow.innerSize(); // PhysicalSize

const logical = size.toLogical(factor);

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L116>

---

### [Position](#position)

A position represented either in physical or in logical pixels.

This type is basically a union type of [`LogicalSize`](namespacedpi.md) and [`PhysicalSize`](namespacedpi.md)
but comes in handy when using `tauri::Position` in Rust as an argument to a command, as this class
automatically serializes into a valid format so it can be deserialized correctly into `tauri::Position`

So instead of

```

import { invoke } from '@tauri-apps/api/core';

import { LogicalPosition, PhysicalPosition } from '@tauri-apps/api/dpi';

const position: LogicalPosition | PhysicalPosition = someFunction(); // where someFunction returns either LogicalPosition or PhysicalPosition

const validPosition = position instanceof LogicalPosition

? { Logical: { x: position.x, y: position.y } }

: { Physical: { x: position.x, y: position.y } }

await invoke("do_something_with_position", { position: validPosition });

```

You can just use [`Position`](namespacedpi.md)

```

import { invoke } from '@tauri-apps/api/core';

import { LogicalPosition, PhysicalPosition, Position } from '@tauri-apps/api/dpi';

const position: LogicalPosition | PhysicalPosition = someFunction(); // where someFunction returns either LogicalPosition or PhysicalPosition

const validPosition = new Position(position);

await invoke("do_something_with_position", { position: validPosition });

```

#### [Since](#since-7)

2.1.0

#### [Constructors](#constructors-4)

##### [new Position()](#new-position)

```

new Position(position): Position

```

###### [Parameters](#parameters-16)

| Parameter | Type |
| --- | --- |
| `position` | [`LogicalPosition`](namespacedpi.md) | [`PhysicalPosition`](namespacedpi.md) |

###### [Returns](#returns-24)

[`Position`](namespacedpi.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L362>

#### [Properties](#properties-4)

| Property | Type | Defined in |
| --- | --- | --- |
| `position` | [`LogicalPosition`](namespacedpi.md) | [`PhysicalPosition`](namespacedpi.md) | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L360> |

#### [Methods](#methods-4)

##### [\_\_TAURI\_TO\_IPC\_KEY\_\_()](#__tauri_to_ipc_key__-4)

```

__TAURI_TO_IPC_KEY__(): object

```

###### [Returns](#returns-25)

`object`

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L378>

##### [toJSON()](#tojson-4)

```

toJSON(): object

```

###### [Returns](#returns-26)

`object`

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L387>

##### [toLogical()](#tological-2)

```

toLogical(scaleFactor): LogicalPosition

```

###### [Parameters](#parameters-17)

| Parameter | Type |
| --- | --- |
| `scaleFactor` | `number` |

###### [Returns](#returns-27)

[`LogicalPosition`](namespacedpi.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L366>

##### [toPhysical()](#tophysical-2)

```

toPhysical(scaleFactor): PhysicalPosition

```

###### [Parameters](#parameters-18)

| Parameter | Type |
| --- | --- |
| `scaleFactor` | `number` |

###### [Returns](#returns-28)

[`PhysicalPosition`](namespacedpi.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L372>

---

### [Size](#size)

A size represented either in physical or in logical pixels.

This type is basically a union type of [`LogicalSize`](namespacedpi.md) and [`PhysicalSize`](namespacedpi.md)
but comes in handy when using `tauri::Size` in Rust as an argument to a command, as this class
automatically serializes into a valid format so it can be deserialized correctly into `tauri::Size`

So instead of

```

import { invoke } from '@tauri-apps/api/core';

import { LogicalSize, PhysicalSize } from '@tauri-apps/api/dpi';

const size: LogicalSize | PhysicalSize = someFunction(); // where someFunction returns either LogicalSize or PhysicalSize

const validSize = size instanceof LogicalSize

? { Logical: { width: size.width, height: size.height } }

: { Physical: { width: size.width, height: size.height } }

await invoke("do_something_with_size", { size: validSize });

```

You can just use [`Size`](namespacedpi.md)

```

import { invoke } from '@tauri-apps/api/core';

import { LogicalSize, PhysicalSize, Size } from '@tauri-apps/api/dpi';

const size: LogicalSize | PhysicalSize = someFunction(); // where someFunction returns either LogicalSize or PhysicalSize

const validSize = new Size(size);

await invoke("do_something_with_size", { size: validSize });

```

#### [Since](#since-8)

2.1.0

#### [Constructors](#constructors-5)

##### [new Size()](#new-size)

```

new Size(size): Size

```

###### [Parameters](#parameters-19)

| Parameter | Type |
| --- | --- |
| `size` | [`LogicalSize`](namespacedpi.md) | [`PhysicalSize`](namespacedpi.md) |

###### [Returns](#returns-29)

[`Size`](namespacedpi.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L167>

#### [Properties](#properties-5)

| Property | Type | Defined in |
| --- | --- | --- |
| `size` | [`LogicalSize`](namespacedpi.md) | [`PhysicalSize`](namespacedpi.md) | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L165> |

#### [Methods](#methods-5)

##### [\_\_TAURI\_TO\_IPC\_KEY\_\_()](#__tauri_to_ipc_key__-5)

```

__TAURI_TO_IPC_KEY__(): object

```

###### [Returns](#returns-30)

`object`

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L183>

##### [toJSON()](#tojson-5)

```

toJSON(): object

```

###### [Returns](#returns-31)

`object`

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L192>

##### [toLogical()](#tological-3)

```

toLogical(scaleFactor): LogicalSize

```

###### [Parameters](#parameters-20)

| Parameter | Type |
| --- | --- |
| `scaleFactor` | `number` |

###### [Returns](#returns-32)

[`LogicalSize`](namespacedpi.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L171>

##### [toPhysical()](#tophysical-3)

```

toPhysical(scaleFactor): PhysicalSize

```

###### [Parameters](#parameters-21)

| Parameter | Type |
| --- | --- |
| `scaleFactor` | `number` |

###### [Returns](#returns-33)

[`PhysicalSize`](namespacedpi.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/dpi.ts#L177>

[Previous   
 core](namespacecore.md)   [Next   
 event](namespaceevent.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT