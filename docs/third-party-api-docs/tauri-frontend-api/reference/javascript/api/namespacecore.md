# core

Invoke your custom commands.

This package is also accessible with `window.__TAURI__.core` when [`app.withGlobalTauri`](https://v2.tauri.app/reference/config/#withglobaltauri) in `tauri.conf.json` is set to `true`.

## [Classes](#classes)

### [Channel<T>](#channelt)

#### [Type Parameters](#type-parameters)

| Type Parameter | Default type |
| --- | --- |
| `T` | `unknown` |

#### [Constructors](#constructors)

##### [new Channel()](#new-channel)

```

new Channel<T>(): Channel<T>

```

###### [Returns](#returns)

[`Channel`](namespacecore.md)<`T`>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L88>

#### [Properties](#properties)

| Property | Type | Defined in |
| --- | --- | --- |
| `id` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L78> |

#### [Accessors](#accessors)

##### [onmessage](#onmessage)

###### [Get Signature](#get-signature)

```

get onmessage(): (response) => void

```

###### [Returns](#returns-1)

`Function`

###### [Parameters](#parameters)

| Parameter | Type |
| --- | --- |
| `response` | `T` |

###### [Returns](#returns-2)

`void`

###### [Set Signature](#set-signature)

```

set onmessage(handler): void

```

###### [Parameters](#parameters-1)

| Parameter | Type |
| --- | --- |
| `handler` | (`response`) => `void` |

###### [Returns](#returns-3)

`void`

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L118>

#### [Methods](#methods)

##### [\_\_TAURI\_TO\_IPC\_KEY\_\_()](#__tauri_to_ipc_key__)

```

__TAURI_TO_IPC_KEY__(): string

```

###### [Returns](#returns-4)

`string`

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L122>

##### [toJSON()](#tojson)

```

toJSON(): string

```

###### [Returns](#returns-5)

`string`

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L126>

---

### [PluginListener](#pluginlistener)

#### [Constructors](#constructors-1)

##### [new PluginListener()](#new-pluginlistener)

```

new PluginListener(

plugin,

event,

channelId): PluginListener

```

###### [Parameters](#parameters-2)

| Parameter | Type |
| --- | --- |
| `plugin` | `string` |
| `event` | `string` |
| `channelId` | `number` |

###### [Returns](#returns-6)

[`PluginListener`](namespacecore.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L137>

#### [Properties](#properties-1)

| Property | Type | Defined in |
| --- | --- | --- |
| `channelId` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L135> |
| `event` | `string` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L134> |
| `plugin` | `string` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L133> |

#### [Methods](#methods-1)

##### [unregister()](#unregister)

```

unregister(): Promise<void>

```

###### [Returns](#returns-7)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L143>

---

### [Resource](#resource)

A rust-backed resource stored through `tauri::Manager::resources_table` API.

The resource lives in the main process and does not exist
in the Javascript world, and thus will not be cleaned up automatiacally
except on application exit. If you want to clean it up early, call [`Resource.close`](namespacecore.md)

#### [Example](#example)

```

import { Resource, invoke } from '@tauri-apps/api/core';

export class DatabaseHandle extends Resource {

static async open(path: string): Promise<DatabaseHandle> {

const rid: number = await invoke('open_db', { path });

return new DatabaseHandle(rid);

}

async execute(sql: string): Promise<void> {

await invoke('execute_sql', { rid: this.rid, sql });

}

}

```

#### [Extended by](#extended-by)

#### [Constructors](#constructors-2)

##### [new Resource()](#new-resource)

```

new Resource(rid): Resource

```

###### [Parameters](#parameters-3)

| Parameter | Type |
| --- | --- |
| `rid` | `number` |

###### [Returns](#returns-8)

[`Resource`](namespacecore.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L290>

#### [Accessors](#accessors-1)

##### [rid](#rid)

###### [Get Signature](#get-signature-1)

```

get rid(): number

```

###### [Returns](#returns-9)

`number`

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L286>

#### [Methods](#methods-2)

##### [close()](#close)

```

close(): Promise<void>

```

Destroys and cleans up this resource from memory.
**You should not call any method on this object anymore and should drop any reference to it.**

###### [Returns](#returns-10)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L298>

## [Interfaces](#interfaces)

### [InvokeOptions](#invokeoptions)

#### [Since](#since)

2.0.0

#### [Properties](#properties-2)

| Property | Type | Defined in |
| --- | --- | --- |
| `headers` | [`Record`](https://www.typescriptlang.org/docs/handbook/utility-types.html#recordkeys-type)<`string`, `string`> | [`Headers`](https://developer.mozilla.org/docs/Web/API/Headers) | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L201> |

## [Type Aliases](#type-aliases)

### [InvokeArgs](#invokeargs)

```

type InvokeArgs: Record<string, unknown> | number[] | ArrayBuffer | Uint8Array;

```

Command arguments.

#### [Since](#since-1)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L195>

---

### [PermissionState](#permissionstate)

```

type PermissionState: "granted" | "denied" | "prompt" | "prompt-with-rationale";

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L170>

## [Variables](#variables)

### [SERIALIZE\_TO\_IPC\_FN](#serialize_to_ipc_fn)

```

const SERIALIZE_TO_IPC_FN: "__TAURI_TO_IPC_KEY__" = '__TAURI_TO_IPC_KEY__';

```

A key to be used to implement a special function
on your types that define how your type should be serialized
when passing across the IPC.

#### [Example](#example-1)

Given a type in Rust that looks like this

```

#[derive(serde::Serialize, serde::Deserialize)

enum UserId {

String(String),

Number(u32),

}

```

`UserId::String("id")` would be serialized into `{ String: "id" }`
and so we need to pass the same structure back to Rust

```

import { SERIALIZE_TO_IPC_FN } from "@tauri-apps/api/core"

class UserIdString {

id

constructor(id) {

this.id = id

}

[SERIALIZE_TO_IPC_FN]() {

return { String: this.id }

}

}

class UserIdNumber {

id

constructor(id) {

this.id = id

}

[SERIALIZE_TO_IPC_FN]() {

return { Number: this.id }

}

}

type UserId = UserIdString | UserIdNumber

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L60>

## [Functions](#functions)

### [addPluginListener()](#addpluginlistener)

```

function addPluginListener<T>(

plugin,

event,

cb): Promise<PluginListener>

```

Adds a listener to a plugin event.

#### [Type Parameters](#type-parameters-1)

| Type Parameter |
| --- |
| `T` |

#### [Parameters](#parameters-4)

| Parameter | Type |
| --- | --- |
| `plugin` | `string` |
| `event` | `string` |
| `cb` | (`payload`) => `void` |

#### [Returns](#returns-11)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`PluginListener`](namespacecore.md)>

The listener object to stop listening to the events.

#### [Since](#since-2)

2.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L158>

---

### [checkPermissions()](#checkpermissions)

```

function checkPermissions<T>(plugin): Promise<T>

```

Get permission state for a plugin.

This should be used by plugin authors to wrap their actual implementation.

#### [Type Parameters](#type-parameters-2)

| Type Parameter |
| --- |
| `T` |

#### [Parameters](#parameters-5)

| Parameter | Type |
| --- | --- |
| `plugin` | `string` |

#### [Returns](#returns-12)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`T`>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L177>

---

### [convertFileSrc()](#convertfilesrc)

```

function convertFileSrc(filePath, protocol): string

```

Convert a device file path to an URL that can be loaded by the webview.
Note that `asset:` and `http://asset.localhost` must be added to [`app.security.csp`](https://v2.tauri.app/reference/config/#csp-1) in `tauri.conf.json`.
Example CSP value: `"csp": "default-src 'self' ipc: http://ipc.localhost; img-src 'self' asset: http://asset.localhost"` to use the asset protocol on image sources.

Additionally, `"enable" : "true"` must be added to [`app.security.assetProtocol`](https://v2.tauri.app/reference/config/#assetprotocolconfig)
in `tauri.conf.json` and its access scope must be defined on the `scope` array on the same `assetProtocol` object.

#### [Parameters](#parameters-6)

| Parameter | Type | Default value | Description |
| --- | --- | --- | --- |
| `filePath` | `string` | `undefined` | The file path. |
| `protocol` | `string` | `'asset'` | The protocol to use. Defaults to `asset`. You only need to set this when using a custom protocol. |

#### [Returns](#returns-13)

`string`

the URL that can be used as source on the webview.

#### [Example](#example-2)

```

import { appDataDir, join } from '@tauri-apps/api/path';

import { convertFileSrc } from '@tauri-apps/api/core';

const appDataDirPath = await appDataDir();

const filePath = await join(appDataDirPath, 'assets/video.mp4');

const assetUrl = convertFileSrc(filePath);

const video = document.getElementById('my-video');

const source = document.createElement('source');

source.type = 'video/mp4';

source.src = assetUrl;

video.appendChild(source);

video.load();

```

#### [Since](#since-3)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L257>

---

### [invoke()](#invoke)

```

function invoke<T>(

cmd,

args,

options?): Promise<T>

```

Sends a message to the backend.

#### [Type Parameters](#type-parameters-3)

| Type Parameter |
| --- |
| `T` |

#### [Parameters](#parameters-7)

| Parameter | Type | Description |
| --- | --- | --- |
| `cmd` | `string` | The command name. |
| `args` | [`InvokeArgs`](namespacecore.md) | The optional arguments to pass to the command. |
| `options`? | [`InvokeOptions`](namespacecore.md) | The request options. |

#### [Returns](#returns-14)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`T`>

A promise resolving or rejecting to the backend response.

#### [Example](#example-3)

```

import { invoke } from '@tauri-apps/api/core';

await invoke('login', { user: 'tauri', password: 'poiwe3h4r5ip3yrhtew9ty' });

```

#### [Since](#since-4)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L219>

---

### [isTauri()](#istauri)

```

function isTauri(): boolean

```

#### [Returns](#returns-15)

`boolean`

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L305>

---

### [requestPermissions()](#requestpermissions)

```

function requestPermissions<T>(plugin): Promise<T>

```

Request permissions.

This should be used by plugin authors to wrap their actual implementation.

#### [Type Parameters](#type-parameters-4)

| Type Parameter |
| --- |
| `T` |

#### [Parameters](#parameters-8)

| Parameter | Type |
| --- | --- |
| `plugin` | `string` |

#### [Returns](#returns-16)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`T`>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L186>

---

### [transformCallback()](#transformcallback)

```

function transformCallback<T>(callback?, once?): number

```

Transforms a callback function to a string identifier that can be passed to the backend.
The backend uses the identifier to `eval()` the callback.

#### [Type Parameters](#type-parameters-5)

| Type Parameter | Default type |
| --- | --- |
| `T` | `unknown` |

#### [Parameters](#parameters-9)

| Parameter | Type | Default value |
| --- | --- | --- |
| `callback`? | (`response`) => `void` | `undefined` |
| `once`? | `boolean` | `false` |

#### [Returns](#returns-17)

`number`

A unique identifier associated with the callback function.

#### [Since](#since-5)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L70>

[Previous   
 app](namespaceapp.md)   [Next   
 dpi](namespacedpi.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT