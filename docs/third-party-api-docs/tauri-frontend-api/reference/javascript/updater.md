# @tauri-apps/plugin-updater

## [Classes](#classes)

### [Update](#update)

#### [Extends](#extends)

* `Resource`

#### [Constructors](#constructors)

##### [new Update()](#new-update)

```

new Update(metadata): Update

```

###### [Parameters](#parameters)

| Parameter | Type |
| --- | --- |
| `metadata` | `UpdateMetadata` |

###### [Returns](#returns)

[`Update`](updater.md)

###### [Overrides](#overrides)

`Resource.constructor`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/updater/guest-js/index.ts#L64>

#### [Properties](#properties)

| Property | Type | Defined in |
| --- | --- | --- |
| `available` | `boolean` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/updater/guest-js/index.ts#L56> |
| `body?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/updater/guest-js/index.ts#L60> |
| `currentVersion` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/updater/guest-js/index.ts#L57> |
| `date?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/updater/guest-js/index.ts#L59> |
| `rawJson` | [`Record`](https://www.typescriptlang.org/docs/handbook/utility-types.html#recordkeys-type)<`string`, `unknown`> | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/updater/guest-js/index.ts#L61> |
| `version` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/updater/guest-js/index.ts#L58> |

#### [Accessors](#accessors)

##### [rid](#rid)

###### [Get Signature](#get-signature)

```

get rid(): number

```

###### [Returns](#returns-1)

`number`

###### [Inherited from](#inherited-from)

`Resource.rid`

**Source**: undefined

#### [Methods](#methods)

##### [close()](#close)

```

close(): Promise<void>

```

Destroys and cleans up this resource from memory.
**You should not call any method on this object anymore and should drop any reference to it.**

###### [Returns](#returns-2)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Overrides](#overrides-1)

`Resource.close`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/updater/guest-js/index.ts#L122>

##### [download()](#download)

```

download(onEvent?, options?): Promise<void>

```

Download the updater package

###### [Parameters](#parameters-1)

| Parameter | Type |
| --- | --- |
| `onEvent`? | (`progress`) => `void` |
| `options`? | [`DownloadOptions`](updater.md) |

###### [Returns](#returns-3)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/updater/guest-js/index.ts#L75>

##### [downloadAndInstall()](#downloadandinstall)

```

downloadAndInstall(onEvent?, options?): Promise<void>

```

Downloads the updater package and installs it

###### [Parameters](#parameters-2)

| Parameter | Type |
| --- | --- |
| `onEvent`? | (`progress`) => `void` |
| `options`? | [`DownloadOptions`](updater.md) |

###### [Returns](#returns-4)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/updater/guest-js/index.ts#L107>

##### [install()](#install)

```

install(): Promise<void>

```

Install downloaded updater package

###### [Returns](#returns-5)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/updater/guest-js/index.ts#L92>

## [Interfaces](#interfaces)

### [CheckOptions](#checkoptions)

Options used when checking for updates

#### [Properties](#properties-1)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `headers?` | `HeadersInit` | Request headers | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/updater/guest-js/index.ts#L12> |
| `proxy?` | `string` | A proxy url to be used when checking and downloading updates. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/updater/guest-js/index.ts#L20> |
| `target?` | `string` | Target identifier for the running application. This is sent to the backend. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/updater/guest-js/index.ts#L24> |
| `timeout?` | `number` | Timeout in milliseconds | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/updater/guest-js/index.ts#L16> |

---

### [DownloadOptions](#downloadoptions)

Options used when downloading an update

#### [Properties](#properties-2)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `headers?` | `HeadersInit` | Request headers | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/updater/guest-js/index.ts#L32> |
| `timeout?` | `number` | Timeout in milliseconds | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/updater/guest-js/index.ts#L36> |

## [Type Aliases](#type-aliases)

### [DownloadEvent](#downloadevent)

```

type DownloadEvent: object | object | object;

```

Updater download event

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/updater/guest-js/index.ts#L50>

## [Functions](#functions)

### [check()](#check)

```

function check(options?): Promise<Update | null>

```

Check for updates, resolves to `null` if no updates are available

#### [Parameters](#parameters-3)

| Parameter | Type |
| --- | --- |
| `options`? | [`CheckOptions`](updater.md) |

#### [Returns](#returns-6)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Update`](updater.md) | `null`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/updater/guest-js/index.ts#L129>

[Previous   
 stronghold](stronghold.md)   [Next   
 upload](upload.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT