# @tauri-apps/plugin-log

## [Interfaces](#interfaces)

### [LogOptions](#logoptions)

#### [Properties](#properties)

| Property | Type | Defined in |
| --- | --- | --- |
| `file?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/log/guest-js/index.ts#L9> |
| `keyValues?` | [`Record`](https://www.typescriptlang.org/docs/handbook/utility-types.html#recordkeys-type)<`string`, `undefined` | `string`> | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/log/guest-js/index.ts#L11> |
| `line?` | `number` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/log/guest-js/index.ts#L10> |

## [Functions](#functions)

### [attachConsole()](#attachconsole)

```

function attachConsole(): Promise<UnlistenFn>

```

Attaches a listener that writes log entries to the console as they come in.

#### [Returns](#returns)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`UnlistenFn`>

a function to cancel the listener.

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/log/guest-js/index.ts#L277>

---

### [attachLogger()](#attachlogger)

```

function attachLogger(fn): Promise<UnlistenFn>

```

Attaches a listener for the log, and calls the passed function for each log entry.

#### [Parameters](#parameters)

| Parameter | Type | Description |
| --- | --- | --- |
| `fn` | `LoggerFn` |  |

#### [Returns](#returns-1)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`UnlistenFn`>

a function to cancel the listener.

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/log/guest-js/index.ts#L256>

---

### [debug()](#debug)

```

function debug(message, options?): Promise<void>

```

Logs a message at the debug level.

#### [Parameters](#parameters-1)

| Parameter | Type | Description |
| --- | --- | --- |
| `message` | `string` | # Examples `import { debug } from '@tauri-apps/plugin-log'; const pos = { x: 3.234, y: -1.223 }; debug(`New position: x: {pos.x}, y: {pos.y}`);` |

| `options`? | [`LogOptions`](log.md) | - |

#### [Returns](#returns-2)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/log/guest-js/index.ts#L214>

---

### [error()](#error)

```

function error(message, options?): Promise<void>

```

Logs a message at the error level.

#### [Parameters](#parameters-2)

| Parameter | Type | Description |
| --- | --- | --- |
| `message` | `string` | # Examples `import { error } from '@tauri-apps/plugin-log'; const err_info = "No connection"; const port = 22; error(`Error: ${err\_info} on port ${port}`);` |

| `options`? | [`LogOptions`](log.md) | - |

#### [Returns](#returns-3)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/log/guest-js/index.ts#L148>

---

### [info()](#info)

```

function info(message, options?): Promise<void>

```

Logs a message at the info level.

#### [Parameters](#parameters-3)

| Parameter | Type | Description |
| --- | --- | --- |
| `message` | `string` | # Examples `import { info } from '@tauri-apps/plugin-log'; const conn_info = { port: 40, speed: 3.20 }; info(`Connected to port {conn\_info.port} at {conn\_info.speed} Mb/s`);` |

| `options`? | [`LogOptions`](log.md) | - |

#### [Returns](#returns-4)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/log/guest-js/index.ts#L192>

---

### [trace()](#trace)

```

function trace(message, options?): Promise<void>

```

Logs a message at the trace level.

#### [Parameters](#parameters-4)

| Parameter | Type | Description |
| --- | --- | --- |
| `message` | `string` | # Examples `import { trace } from '@tauri-apps/plugin-log'; let pos = { x: 3.234, y: -1.223 }; trace(`Position is: x: {pos.x}, y: {pos.y}`);` |

| `options`? | [`LogOptions`](log.md) | - |

#### [Returns](#returns-5)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/log/guest-js/index.ts#L236>

---

### [warn()](#warn)

```

function warn(message, options?): Promise<void>

```

Logs a message at the warn level.

#### [Parameters](#parameters-5)

| Parameter | Type | Description |
| --- | --- | --- |
| `message` | `string` | # Examples `import { warn } from '@tauri-apps/plugin-log'; const warn_description = "Invalid Input"; warn(`Warning! {warn\_description}!`);` |

| `options`? | [`LogOptions`](log.md) | - |

#### [Returns](#returns-6)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/log/guest-js/index.ts#L170>

[Previous   
 http](http.md)   [Next   
 nfc](nfc.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT