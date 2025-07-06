# @tauri-apps/plugin-opener

Open files and URLs using their default application.

## [Security](#security)

This API has a scope configuration that forces you to restrict the files and urls to be opened.

### [Restricting access to the open | `open` API](#restricting-access-to-the-open--open-api)

On the configuration object, `open: true` means that the open API can be used with any URL,
as the argument is validated with the `^((mailto:\w+)|(tel:\w+)|(https?://\w+)).+` regex.
You can change that regex by changing the boolean value to a string, e.g. `open: ^https://github.com/`.

## [Functions](#functions)

### [openPath()](#openpath)

```

function openPath(path, openWith?): Promise<void>

```

Opens a path with the system’s default app, or the one specified with openWith.

#### [Parameters](#parameters)

| Parameter | Type | Description |
| --- | --- | --- |
| `path` | `string` | The path to open. |
| `openWith`? | `string` | The app to open the path with. If not specified, defaults to the system default application for the specified path type. |

#### [Returns](#returns)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

#### [Example](#example)

```

import { openPath } from '@tauri-apps/plugin-opener';

// opens a file using the default program:

await openPath('/path/to/file');

// opens a file using `vlc` command on Windows.

await openPath('C:/path/to/file', 'vlc');

```

#### [Since](#since)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/opener/guest-js/index.ts#L66>

---

### [openUrl()](#openurl)

```

function openUrl(url, openWith?): Promise<void>

```

Opens a url with the system’s default app, or the one specified with openWith.

#### [Parameters](#parameters-1)

| Parameter | Type | Description |
| --- | --- | --- |
| `url` | `string` | The URL to open. |
| `openWith`? | `string` | The app to open the URL with. If not specified, defaults to the system default application for the specified url type. |

#### [Returns](#returns-1)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

#### [Example](#example-1)

```

import { openUrl } from '@tauri-apps/plugin-opener';

// opens the given URL on the default browser:

await openUrl('https://github.com/tauri-apps/tauri');

// opens the given URL using `firefox`:

await openUrl('https://github.com/tauri-apps/tauri', 'firefox');

```

#### [Since](#since-1)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/opener/guest-js/index.ts#L41>

---

### [revealItemInDir()](#revealitemindir)

```

function revealItemInDir(path): Promise<unknown>

```

Reveal a path with the system’s default explorer.

#### [Platform-specific:](#platform-specific)

* **Android / iOS:** Unsupported.

#### [Parameters](#parameters-2)

| Parameter | Type | Description |
| --- | --- | --- |
| `path` | `string` | The path to reveal. |

#### [Returns](#returns-2)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`unknown`>

#### [Example](#example-2)

```

import { revealItemInDir } from '@tauri-apps/plugin-opener';

await revealItemInDir('/path/to/file');

```

#### [Since](#since-2)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/opener/guest-js/index.ts#L90>

[Previous   
 notification](notification.md)   [Next   
 os](os.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT