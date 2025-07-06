# image

## [Classes](#classes)

### [Image](#image)

An RGBA Image in row-major order from top to bottom.

#### [Extends](#extends)

#### [Accessors](#accessors)

##### [rid](#rid)

###### [Get Signature](#get-signature)

```

get rid(): number

```

###### [Returns](#returns)

`number`

###### [Inherited from](#inherited-from)

[`Resource`](namespacecore.md).[`rid`](namespacecore.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L286>

#### [Methods](#methods)

##### [close()](#close)

```

close(): Promise<void>

```

Destroys and cleans up this resource from memory.
**You should not call any method on this object anymore and should drop any reference to it.**

###### [Returns](#returns-1)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Inherited from](#inherited-from-1)

[`Resource`](namespacecore.md).[`close`](namespacecore.md)

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/core.ts#L298>

##### [rgba()](#rgba)

```

rgba(): Promise<Uint8Array<ArrayBufferLike>>

```

Returns the RGBA data for this image, in row-major order from top to bottom.

###### [Returns](#returns-2)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`>>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/image.ts#L79>

##### [size()](#size)

```

size(): Promise<ImageSize>

```

Returns the size of this image.

###### [Returns](#returns-3)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`ImageSize`](namespaceimage.md)>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/image.ts#L86>

##### [fromBytes()](#frombytes)

```

static fromBytes(bytes): Promise<Image>

```

Creates a new image using the provided bytes by inferring the file format.
If the format is known, prefer [@link Image.fromPngBytes] or [@link Image.fromIcoBytes].

Only `ico` and `png` are supported (based on activated feature flag).

Note that you need the `image-ico` or `image-png` Cargo features to use this API.
To enable it, change your Cargo.toml file:

```

[dependencies]

tauri = { version = "...", features = ["...", "image-png"] }

```

###### [Parameters](#parameters)

| Parameter | Type |
| --- | --- |
| `bytes` | `number`[] | [`ArrayBuffer`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer) | [`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`> |

###### [Returns](#returns-4)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Image`](namespaceimage.md)>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/image.ts#L52>

##### [fromPath()](#frompath)

```

static fromPath(path): Promise<Image>

```

Creates a new image using the provided path.

Only `ico` and `png` are supported (based on activated feature flag).

Note that you need the `image-ico` or `image-png` Cargo features to use this API.
To enable it, change your Cargo.toml file:

```

[dependencies]

tauri = { version = "...", features = ["...", "image-png"] }

```

###### [Parameters](#parameters-1)

| Parameter | Type |
| --- | --- |
| `path` | `string` |

###### [Returns](#returns-5)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Image`](namespaceimage.md)>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/image.ts#L72>

##### [new()](#new)

```

static new(

rgba,

width,

height): Promise<Image>

```

Creates a new Image using RGBA data, in row-major order from top to bottom, and with specified width and height.

###### [Parameters](#parameters-2)

| Parameter | Type |
| --- | --- |
| `rgba` | `number`[] | [`ArrayBuffer`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer) | [`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`> |
| `width` | `number` |
| `height` | `number` |

###### [Returns](#returns-6)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Image`](namespaceimage.md)>

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/image.ts#L27>

## [Interfaces](#interfaces)

### [ImageSize](#imagesize)

#### [Properties](#properties)

| Property | Type | Defined in |
| --- | --- | --- |
| `height` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/image.ts#L12> |
| `width` | `number` | **Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/image.ts#L10> |

## [Functions](#functions)

### [transformImage()](#transformimage)

```

function transformImage<T>(image): T

```

Transforms image from various types into a type acceptable by Rust.

See [tauri::image::JsImage](https://docs.rs/tauri/2/tauri/image/enum.JsImage.html) for more information.
Note the API signature is not stable and might change.

#### [Type Parameters](#type-parameters)

| Type Parameter |
| --- |
| `T` |

#### [Parameters](#parameters-3)

| Parameter | Type |
| --- | --- |
| `image` | | `null` | `string` | `number`[] | [`ArrayBuffer`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer) | [`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`> | [`Image`](namespaceimage.md) |

#### [Returns](#returns-7)

`T`

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/image.ts#L97>

[Previous   
 event](namespaceevent.md)   [Next   
 menu](namespacemenu.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT