# @tauri-apps/plugin-clipboard-manager

Read and write to the system clipboard.

## [Functions](#functions)

### [clear()](#clear)

```

function clear(): Promise<void>

```

Clears the clipboard.

#### [Platform-specific](#platform-specific)

* **Android:** Only supported on SDK 28+. For older releases we write an empty string to the clipboard instead.

#### [Returns](#returns)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

#### [Example](#example)

```

import { clear } from '@tauri-apps/plugin-clipboard-manager';

await clear();

```

#### [Since](#since)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/clipboard-manager/guest-js/index.ts#L147>

---

### [readImage()](#readimage)

```

function readImage(): Promise<Image>

```

Gets the clipboard content as Uint8Array image.

#### [Platform-specific](#platform-specific-1)

* **Android / iOS:** Not supported.

#### [Returns](#returns-1)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`Image`>

#### [Example](#example-1)

```

import { readImage } from '@tauri-apps/plugin-clipboard-manager';

const clipboardImage = await readImage();

const blob = new Blob([await clipboardImage.rgba()], { type: 'image' })

const url = URL.createObjectURL(blob)

```

#### [Since](#since-1)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/clipboard-manager/guest-js/index.ts#L99>

---

### [readText()](#readtext)

```

function readText(): Promise<string>

```

Gets the clipboard content as plain text.

#### [Returns](#returns-2)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-2)

```

import { readText } from '@tauri-apps/plugin-clipboard-manager';

const clipboardText = await readText();

```

#### [Since](#since-2)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/clipboard-manager/guest-js/index.ts#L46>

---

### [writeHtml()](#writehtml)

```

function writeHtml(html, altText?): Promise<void>

```

* Writes HTML or fallbacks to write provided plain text to the clipboard.

#### [Platform-specific](#platform-specific-2)

* **Android / iOS:** Not supported.

#### [Parameters](#parameters)

| Parameter | Type |
| --- | --- |
| `html` | `string` |
| `altText`? | `string` |

#### [Returns](#returns-3)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

#### [Example](#example-3)

```

import { writeHtml } from '@tauri-apps/plugin-clipboard-manager';

await writeHtml('<h1>Tauri is awesome!</h1>', 'plaintext');

// The following will write "<h1>Tauri is awesome</h1>" as plain text

await writeHtml('<h1>Tauri is awesome!</h1>', '<h1>Tauri is awesome</h1>');

// we can read html data only as a string so there's just readText(), no readHtml()

assert(await readText(), '<h1>Tauri is awesome!</h1>');

```

#### [Since](#since-3)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/clipboard-manager/guest-js/index.ts#L126>

---

### [writeImage()](#writeimage)

```

function writeImage(image): Promise<void>

```

Writes image buffer to the clipboard.

#### [Platform-specific](#platform-specific-3)

* **Android / iOS:** Not supported.

#### [Parameters](#parameters-1)

| Parameter | Type |
| --- | --- |
| `image` | | `string` | `number`[] | [`ArrayBuffer`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer) | [`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`> | `Image` |

#### [Returns](#returns-4)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

#### [Example](#example-4)

```

import { writeImage } from '@tauri-apps/plugin-clipboard-manager';

const buffer = [

// A red pixel

255, 0, 0, 255,

// A green pixel

0, 255, 0, 255,

];

await writeImage(buffer);

```

#### [Since](#since-4)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/clipboard-manager/guest-js/index.ts#L74>

---

### [writeText()](#writetext)

```

function writeText(text, opts?): Promise<void>

```

Writes plain text to the clipboard.

#### [Parameters](#parameters-2)

| Parameter | Type |
| --- | --- |
| `text` | `string` |
| `opts`? | `object` |
| `opts.label`? | `string` |

#### [Returns](#returns-5)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

#### [Example](#example-5)

```

import { writeText, readText } from '@tauri-apps/plugin-clipboard-manager';

await writeText('Tauri is awesome!');

assert(await readText(), 'Tauri is awesome!');

```

#### [Since](#since-5)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/clipboard-manager/guest-js/index.ts#L27>

[Previous   
 cli](cli.md)   [Next   
 deep-link](deep-link.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT