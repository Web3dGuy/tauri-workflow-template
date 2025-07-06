# @tauri-apps/plugin-upload

## [Functions](#functions)

### [download()](#download)

```

function download(

url,

filePath,

progressHandler?,

headers?,

body?): Promise<void>

```

#### [Parameters](#parameters)

| Parameter | Type |
| --- | --- |
| `url` | `string` |
| `filePath` | `string` |
| `progressHandler`? | `ProgressHandler` |
| `headers`? | [`Map`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Map)<`string`, `string`> |
| `body`? | `string` |

#### [Returns](#returns)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/upload/guest-js/index.ts#L44>

---

### [upload()](#upload)

```

function upload(

url,

filePath,

progressHandler?,

headers?): Promise<string>

```

#### [Parameters](#parameters-1)

| Parameter | Type |
| --- | --- |
| `url` | `string` |
| `filePath` | `string` |
| `progressHandler`? | `ProgressHandler` |
| `headers`? | [`Map`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Map)<`string`, `string`> |

#### [Returns](#returns-1)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/upload/guest-js/index.ts#L16>

[Previous   
 updater](updater.md)   [Next   
 websocket](websocket.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT