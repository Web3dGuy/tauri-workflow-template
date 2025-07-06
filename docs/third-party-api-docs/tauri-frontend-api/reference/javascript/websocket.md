# @tauri-apps/plugin-websocket

## [Classes](#classes)

### [default](#default)

#### [Constructors](#constructors)

##### [new default()](#new-default)

```

new default(id, listeners): default

```

###### [Parameters](#parameters)

| Parameter | Type |
| --- | --- |
| `id` | `number` |
| `listeners` | [`Set`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Set)<(`arg`) => `void`> |

###### [Returns](#returns)

[`default`](websocket.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/websocket/guest-js/index.ts#L63>

#### [Properties](#properties)

| Property | Type | Defined in |
| --- | --- | --- |
| `id` | `number` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/websocket/guest-js/index.ts#L60> |

#### [Methods](#methods)

##### [addListener()](#addlistener)

```

addListener(cb): () => void

```

###### [Parameters](#parameters-1)

| Parameter | Type |
| --- | --- |
| `cb` | (`arg`) => `void` |

###### [Returns](#returns-1)

`Function`

###### [Returns](#returns-2)

`void`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/websocket/guest-js/index.ts#L92>

##### [disconnect()](#disconnect)

```

disconnect(): Promise<void>

```

###### [Returns](#returns-3)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/websocket/guest-js/index.ts#L119>

##### [send()](#send)

```

send(message): Promise<void>

```

###### [Parameters](#parameters-2)

| Parameter | Type |
| --- | --- |
| `message` | `string` | `number`[] | [`Message`](websocket.md) |

###### [Returns](#returns-4)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/websocket/guest-js/index.ts#L100>

##### [connect()](#connect)

```

static connect(url, config?): Promise<default>

```

###### [Parameters](#parameters-3)

| Parameter | Type |
| --- | --- |
| `url` | `string` |
| `config`? | [`ConnectionConfig`](websocket.md) |

###### [Returns](#returns-5)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`default`](websocket.md)>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/websocket/guest-js/index.ts#L68>

## [Interfaces](#interfaces)

### [CloseFrame](#closeframe)

#### [Properties](#properties-1)

| Property | Type | Defined in |
| --- | --- | --- |
| `code` | `number` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/websocket/guest-js/index.ts#L48> |
| `reason` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/websocket/guest-js/index.ts#L49> |

---

### [ConnectionConfig](#connectionconfig)

#### [Properties](#properties-2)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `acceptUnmaskedFrames?` | `boolean` | When set to true, the server will accept and handle unmasked frames from the client. According to the RFC 6455, the server must close the connection to the client in such cases, however it seems like there are some popular libraries that are sending unmasked frames, ignoring the RFC. By default this option is set to false, i.e. according to RFC 6455. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/websocket/guest-js/index.ts#L35> |
| `headers?` | `HeadersInit` | Additional connect request headers. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/websocket/guest-js/index.ts#L39> |
| `maxFrameSize?` | `number` | `"none"` | The maximum size of a single incoming message frame. The string “none” means no size limit. The limit is for frame payload NOT including the frame header. The default value is 16 MiB which should be reasonably big for all normal use-cases but small enough to prevent memory eating by a malicious user. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/websocket/guest-js/index.ts#L31> |
| `maxMessageSize?` | `number` | `"none"` | The maximum size of an incoming message. The string “none” means no size limit. The default value is 64 MiB which should be reasonably big for all normal use-cases but small enough to prevent memory eating by a malicious user. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/websocket/guest-js/index.ts#L27> |
| `maxWriteBufferSize?` | `number` | The max size of the write buffer in bytes. Setting this can provide backpressure in the case the write buffer is filling up due to write errors. The default value is unlimited. Note: The write buffer only builds up past write\_buffer\_size when writes to the underlying stream are failing. So the write buffer can not fill up if you are not observing write errors. Note: Should always be at least write\_buffer\_size + 1 message and probably a little more depending on error handling strategy. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/websocket/guest-js/index.ts#L23> |
| `readBufferSize?` | `number` | Read buffer capacity. The default value is 128 KiB. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/websocket/guest-js/index.ts#L11> |
| `writeBufferSize?` | `number` | The target minimum size of the write buffer to reach before writing the data to the underlying stream. The default value is 128 KiB. If set to 0 each message will be eagerly written to the underlying stream. It is often more optimal to allow them to buffer a little, hence the default value. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/websocket/guest-js/index.ts#L16> |

---

### [MessageKind<T, D>](#messagekindt-d)

#### [Type Parameters](#type-parameters)

| Type Parameter |
| --- |
| `T` |
| `D` |

#### [Properties](#properties-3)

| Property | Type | Defined in |
| --- | --- | --- |
| `data` | `D` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/websocket/guest-js/index.ts#L44> |
| `type` | `T` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/websocket/guest-js/index.ts#L43> |

## [Type Aliases](#type-aliases)

### [Message](#message)

```

type Message:

| MessageKind<"Text", string>

| MessageKind<"Binary", number[]>

| MessageKind<"Ping", number[]>

| MessageKind<"Pong", number[]>

| MessageKind<"Close", CloseFrame | null>;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/websocket/guest-js/index.ts#L52>

[Previous   
 upload](upload.md)   [Next   
 window-state](window-state.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT