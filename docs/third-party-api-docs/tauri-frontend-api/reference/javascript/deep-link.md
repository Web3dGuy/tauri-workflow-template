# @tauri-apps/plugin-deep-link

## [Functions](#functions)

### [getCurrent()](#getcurrent)

```

function getCurrent(): Promise<string[] | null>

```

Get the current URLs that triggered the deep link. Use this on app load to check whether your app was started via a deep link.

#### [Returns](#returns)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`[] | `null`>

#### [Example](#example)

```

import { getCurrent } from '@tauri-apps/plugin-deep-link';

const urls = await getCurrent();

```

#### [- **Windows / Linux**: This function reads the command line arguments and checks if there’s only one value, which must be an URL with scheme matching one of the configured values.](#--windows--linux-this-function-reads-the-command-line-arguments-and-checks-if-theres-only-one-value-which-must-be-an-url-with-scheme-matching-one-of-the-configured-values)

Note that you must manually check the arguments when registering deep link schemes dynamically with [`Self::register`].
Additionally, the deep link might have been provided as a CLI argument so you should check if its format matches what you expect..

#### [Since](#since)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/deep-link/guest-js/index.ts#L23>

---

### [isRegistered()](#isregistered)

```

function isRegistered(protocol): Promise<boolean>

```

Check whether the app is the default handler for the specified protocol.

#### [Parameters](#parameters)

| Parameter | Type | Description |
| --- | --- | --- |
| `protocol` | `string` | The name of the protocol without `://`. |

#### [Returns](#returns-1)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

#### [Example](#example-1)

```

import { isRegistered } from '@tauri-apps/plugin-deep-link';

await isRegistered("my-scheme");

```

#### [- **macOS / Android / iOS**: Unsupported.](#--macos--android--ios-unsupported)

#### [Since](#since-1)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/deep-link/guest-js/index.ts#L80>

---

### [onOpenUrl()](#onopenurl)

```

function onOpenUrl(handler): Promise<UnlistenFn>

```

Helper function for the `deep-link://new-url` event to run a function each time the protocol is triggered while the app is running. Use `getCurrent` on app load to check whether your app was started via a deep link.

#### [Parameters](#parameters-1)

| Parameter | Type |
| --- | --- |
| `handler` | (`urls`) => `void` |

#### [Returns](#returns-2)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`UnlistenFn`>

#### [Example](#example-2)

```

import { onOpenUrl } from '@tauri-apps/plugin-deep-link';

await onOpenUrl((urls) => { console.log(urls) });

```

#### [- **Windows / Linux**: Unsupported without the single-instance plugin. The OS will spawn a new app instance passing the URL as a CLI argument.](#--windows--linux-unsupported-without-the-single-instance-plugin-the-os-will-spawn-a-new-app-instance-passing-the-url-as-a-cli-argument)

#### [Since](#since-2)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/deep-link/guest-js/index.ts#L99>

---

### [register()](#register)

```

function register(protocol): Promise<null>

```

Register the app as the default handler for the specified protocol.

#### [Parameters](#parameters-2)

| Parameter | Type | Description |
| --- | --- | --- |
| `protocol` | `string` | The name of the protocol without `://`. For example, if you want your app to handle `tauri://` links, call this method with `tauri` as the protocol. |

#### [Returns](#returns-3)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`null`>

#### [Example](#example-3)

```

import { register } from '@tauri-apps/plugin-deep-link';

await register("my-scheme");

```

#### [- **macOS / Android / iOS**: Unsupported.](#--macos--android--ios-unsupported-1)

#### [Since](#since-3)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/deep-link/guest-js/index.ts#L42>

---

### [unregister()](#unregister)

```

function unregister(protocol): Promise<null>

```

Unregister the app as the default handler for the specified protocol.

#### [Parameters](#parameters-3)

| Parameter | Type | Description |
| --- | --- | --- |
| `protocol` | `string` | The name of the protocol without `://`. |

#### [Returns](#returns-4)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`null`>

#### [Example](#example-4)

```

import { unregister } from '@tauri-apps/plugin-deep-link';

await unregister("my-scheme");

```

#### [- **macOS / Linux / Android / iOS**: Unsupported.](#--macos--linux--android--ios-unsupported)

#### [Since](#since-4)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/deep-link/guest-js/index.ts#L61>

[Previous   
 clipboard-manager](clipboard-manager.md)   [Next   
 dialog](dialog.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT