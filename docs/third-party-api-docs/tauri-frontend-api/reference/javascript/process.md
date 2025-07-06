# @tauri-apps/plugin-process

Perform operations on the current process.

## [Functions](#functions)

### [exit()](#exit)

```

function exit(code): Promise<void>

```

Exits immediately with the given `exitCode`.

#### [Parameters](#parameters)

| Parameter | Type | Default value | Description |
| --- | --- | --- | --- |
| `code` | `number` | `0` | The exit code to use. |

#### [Returns](#returns)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

#### [Example](#example)

```

import { exit } from '@tauri-apps/plugin-process';

await exit(1);

```

#### [Since](#since)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/process/guest-js/index.ts#L25>

---

### [relaunch()](#relaunch)

```

function relaunch(): Promise<void>

```

Exits the current instance of the app then relaunches it.

#### [Returns](#returns-1)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

#### [Example](#example-1)

```

import { relaunch } from '@tauri-apps/plugin-process';

await relaunch();

```

#### [Since](#since-1)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/process/guest-js/index.ts#L41>

[Previous   
 positioner](positioner.md)   [Next   
 shell](shell.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT