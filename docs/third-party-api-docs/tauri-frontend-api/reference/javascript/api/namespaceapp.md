# app

## [Functions](#functions)

### [defaultWindowIcon()](#defaultwindowicon)

```

function defaultWindowIcon(): Promise<Image | null>

```

Get the default window icon.

#### [Returns](#returns)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Image`](namespaceimage.md) | `null`>

#### [Example](#example)

```

import { defaultWindowIcon } from '@tauri-apps/api/app';

await defaultWindowIcon();

```

#### [Since](#since)

2.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/app.ts#L99>

---

### [getName()](#getname)

```

function getName(): Promise<string>

```

Gets the application name.

#### [Returns](#returns-1)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-1)

```

import { getName } from '@tauri-apps/api/app';

const appName = await getName();

```

#### [Since](#since-1)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/app.ts#L39>

---

### [getTauriVersion()](#gettauriversion)

```

function getTauriVersion(): Promise<string>

```

Gets the Tauri version.

#### [Returns](#returns-2)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-2)

```

import { getTauriVersion } from '@tauri-apps/api/app';

const tauriVersion = await getTauriVersion();

```

#### [Since](#since-2)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/app.ts#L54>

---

### [getVersion()](#getversion)

```

function getVersion(): Promise<string>

```

Gets the application version.

#### [Returns](#returns-3)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-3)

```

import { getVersion } from '@tauri-apps/api/app';

const appVersion = await getVersion();

```

#### [Since](#since-3)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/app.ts#L25>

---

### [hide()](#hide)

```

function hide(): Promise<void>

```

Hides the application on macOS.

#### [Returns](#returns-4)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

#### [Example](#example-4)

```

import { hide } from '@tauri-apps/api/app';

await hide();

```

#### [Since](#since-4)

1.2.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/app.ts#L84>

---

### [setTheme()](#settheme)

```

function setTheme(theme?): Promise<void>

```

Set app’s theme, pass in `null` or `undefined` to follow system theme

#### [Parameters](#parameters)

| Parameter | Type |
| --- | --- |
| `theme`? | `null` | [`Theme`](namespacewindow.md) |

#### [Returns](#returns-5)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

#### [Example](#example-5)

```

import { setTheme } from '@tauri-apps/api/app';

await setTheme('dark');

```

#### [Platform-specific](#platform-specific)

* **iOS / Android:** Unsupported.

#### [Since](#since-5)

2.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/app.ts#L120>

---

### [show()](#show)

```

function show(): Promise<void>

```

Shows the application on macOS. This function does not automatically focus any specific app window.

#### [Returns](#returns-6)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

#### [Example](#example-6)

```

import { show } from '@tauri-apps/api/app';

await show();

```

#### [Since](#since-6)

1.2.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/app.ts#L69>

[Previous   
 @tauri-apps/api](..\api.md)   [Next   
 core](namespacecore.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT