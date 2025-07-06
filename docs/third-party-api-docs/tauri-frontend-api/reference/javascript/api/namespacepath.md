# path

The path module provides utilities for working with file and directory paths.

This package is also accessible with `window.__TAURI__.path` when [`app.withGlobalTauri`](https://v2.tauri.app/reference/config/#withglobaltauri) in `tauri.conf.json` is set to `true`.

It is recommended to allowlist only the APIs you use for optimal bundle size and security.

## [Enumerations](#enumerations)

### [BaseDirectory](#basedirectory)

#### [Since](#since)

2.0.0

#### [Enumeration Members](#enumeration-members)

##### [AppCache](#appcache)

```

AppCache: 16;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L35>

##### [AppConfig](#appconfig)

```

AppConfig: 13;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L32>

##### [AppData](#appdata)

```

AppData: 14;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L33>

##### [AppLocalData](#applocaldata)

```

AppLocalData: 15;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L34>

##### [AppLog](#applog)

```

AppLog: 17;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L36>

##### [Audio](#audio)

```

Audio: 1;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L20>

##### [Cache](#cache)

```

Cache: 2;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L21>

##### [Config](#config)

```

Config: 3;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L22>

##### [Data](#data)

```

Data: 4;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L23>

##### [Desktop](#desktop)

```

Desktop: 18;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L37>

##### [Document](#document)

```

Document: 6;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L25>

##### [Download](#download)

```

Download: 7;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L26>

##### [Executable](#executable)

```

Executable: 19;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L38>

##### [Font](#font)

```

Font: 20;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L39>

##### [Home](#home)

```

Home: 21;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L40>

##### [LocalData](#localdata)

```

LocalData: 5;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L24>

##### [Picture](#picture)

```

Picture: 8;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L27>

##### [Public](#public)

```

Public: 9;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L28>

##### [Resource](#resource)

```

Resource: 11;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L30>

##### [Runtime](#runtime)

```

Runtime: 22;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L41>

##### [Temp](#temp)

```

Temp: 12;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L31>

##### [Template](#template)

```

Template: 23;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L42>

##### [Video](#video)

```

Video: 10;

```

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L29>

## [Functions](#functions)

### [appCacheDir()](#appcachedir)

```

function appCacheDir(): Promise<string>

```

Returns the path to the suggested directory for your app’s cache files.
Resolves to `${cacheDir}/${bundleIdentifier}`, where `bundleIdentifier` is the [`identifier`](https://v2.tauri.app/reference/config/#identifier) value configured in `tauri.conf.json`.

#### [Returns](#returns)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example)

```

import { appCacheDir } from '@tauri-apps/api/path';

const appCacheDirPath = await appCacheDir();

```

#### [Since](#since-1)

1.2.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L107>

---

### [appConfigDir()](#appconfigdir)

```

function appConfigDir(): Promise<string>

```

Returns the path to the suggested directory for your app’s config files.
Resolves to `${configDir}/${bundleIdentifier}`, where `bundleIdentifier` is the [`identifier`](https://v2.tauri.app/reference/config/#identifier) value configured in `tauri.conf.json`.

#### [Returns](#returns-1)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-1)

```

import { appConfigDir } from '@tauri-apps/api/path';

const appConfigDirPath = await appConfigDir();

```

#### [Since](#since-2)

1.2.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L56>

---

### [appDataDir()](#appdatadir)

```

function appDataDir(): Promise<string>

```

Returns the path to the suggested directory for your app’s data files.
Resolves to `${dataDir}/${bundleIdentifier}`, where `bundleIdentifier` is the [`identifier`](https://v2.tauri.app/reference/config/#identifier) value configured in `tauri.conf.json`.

#### [Returns](#returns-2)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-2)

```

import { appDataDir } from '@tauri-apps/api/path';

const appDataDirPath = await appDataDir();

```

#### [Since](#since-3)

1.2.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L73>

---

### [appLocalDataDir()](#applocaldatadir)

```

function appLocalDataDir(): Promise<string>

```

Returns the path to the suggested directory for your app’s local data files.
Resolves to `${localDataDir}/${bundleIdentifier}`, where `bundleIdentifier` is the [`identifier`](https://v2.tauri.app/reference/config/#identifier) value configured in `tauri.conf.json`.

#### [Returns](#returns-3)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-3)

```

import { appLocalDataDir } from '@tauri-apps/api/path';

const appLocalDataDirPath = await appLocalDataDir();

```

#### [Since](#since-4)

1.2.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L90>

---

### [appLogDir()](#applogdir)

```

function appLogDir(): Promise<string>

```

Returns the path to the suggested directory for your app’s log files.

#### [Platform-specific](#platform-specific)

* **Linux:** Resolves to `${configDir}/${bundleIdentifier}/logs`.
* **macOS:** Resolves to `${homeDir}/Library/Logs/{bundleIdentifier}`
* **Windows:** Resolves to `${configDir}/${bundleIdentifier}/logs`.

#### [Returns](#returns-4)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-4)

```

import { appLogDir } from '@tauri-apps/api/path';

const appLogDirPath = await appLogDir();

```

#### [Since](#since-5)

1.2.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L519>

---

### [audioDir()](#audiodir)

```

function audioDir(): Promise<string>

```

Returns the path to the user’s audio directory.

#### [Platform-specific](#platform-specific-1)

* **Linux:** Resolves to [`xdg-user-dirs`](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/)’ `XDG_MUSIC_DIR`.
* **macOS:** Resolves to `$HOME/Music`.
* **Windows:** Resolves to `{FOLDERID_Music}`.

#### [Returns](#returns-5)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-5)

```

import { audioDir } from '@tauri-apps/api/path';

const audioDirPath = await audioDir();

```

#### [Since](#since-6)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L129>

---

### [basename()](#basename)

```

function basename(path, ext?): Promise<string>

```

Returns the last portion of a `path`. Trailing directory separators are ignored.

#### [Parameters](#parameters)

| Parameter | Type | Description |
| --- | --- | --- |
| `path` | `string` | - |
| `ext`? | `string` | An optional file extension to be removed from the returned path. |

#### [Returns](#returns-6)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-6)

```

import { basename } from '@tauri-apps/api/path';

const base = await basename('path/to/app.conf');

assert(base === 'app.conf');

```

#### [Since](#since-7)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L649>

---

### [cacheDir()](#cachedir)

```

function cacheDir(): Promise<string>

```

Returns the path to the user’s cache directory.

#### [Platform-specific](#platform-specific-2)

* **Linux:** Resolves to `$XDG_CACHE_HOME` or `$HOME/.cache`.
* **macOS:** Resolves to `$HOME/Library/Caches`.
* **Windows:** Resolves to `{FOLDERID_LocalAppData}`.

#### [Returns](#returns-7)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-7)

```

import { cacheDir } from '@tauri-apps/api/path';

const cacheDirPath = await cacheDir();

```

#### [Since](#since-8)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L151>

---

### [configDir()](#configdir)

```

function configDir(): Promise<string>

```

Returns the path to the user’s config directory.

#### [Platform-specific](#platform-specific-3)

* **Linux:** Resolves to `$XDG_CONFIG_HOME` or `$HOME/.config`.
* **macOS:** Resolves to `$HOME/Library/Application Support`.
* **Windows:** Resolves to `{FOLDERID_RoamingAppData}`.

#### [Returns](#returns-8)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-8)

```

import { configDir } from '@tauri-apps/api/path';

const configDirPath = await configDir();

```

#### [Since](#since-9)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L173>

---

### [dataDir()](#datadir)

```

function dataDir(): Promise<string>

```

Returns the path to the user’s data directory.

#### [Platform-specific](#platform-specific-4)

* **Linux:** Resolves to `$XDG_DATA_HOME` or `$HOME/.local/share`.
* **macOS:** Resolves to `$HOME/Library/Application Support`.
* **Windows:** Resolves to `{FOLDERID_RoamingAppData}`.

#### [Returns](#returns-9)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-9)

```

import { dataDir } from '@tauri-apps/api/path';

const dataDirPath = await dataDir();

```

#### [Since](#since-10)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L195>

---

### [delimiter()](#delimiter)

```

function delimiter(): string

```

Returns the platform-specific path segment delimiter:

* `;` on Windows
* `:` on POSIX

#### [Returns](#returns-10)

`string`

#### [Since](#since-11)

2.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L559>

---

### [desktopDir()](#desktopdir)

```

function desktopDir(): Promise<string>

```

Returns the path to the user’s desktop directory.

#### [Platform-specific](#platform-specific-5)

* **Linux:** Resolves to [`xdg-user-dirs`](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/)’ `XDG_DESKTOP_DIR`.
* **macOS:** Resolves to `$HOME/Desktop`.
* **Windows:** Resolves to `{FOLDERID_Desktop}`.

#### [Returns](#returns-11)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-10)

```

import { desktopDir } from '@tauri-apps/api/path';

const desktopPath = await desktopDir();

```

#### [Since](#since-12)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L217>

---

### [dirname()](#dirname)

```

function dirname(path): Promise<string>

```

Returns the directory name of a `path`. Trailing directory separators are ignored.

#### [Parameters](#parameters-1)

| Parameter | Type |
| --- | --- |
| `path` | `string` |

#### [Returns](#returns-12)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-11)

```

import { dirname } from '@tauri-apps/api/path';

const dir = await dirname('/path/to/somedir/');

assert(dir === 'somedir');

```

#### [Since](#since-13)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L618>

---

### [documentDir()](#documentdir)

```

function documentDir(): Promise<string>

```

Returns the path to the user’s document directory.

#### [Returns](#returns-13)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-12)

```

import { documentDir } from '@tauri-apps/api/path';

const documentDirPath = await documentDir();

```

#### [Platform-specific](#platform-specific-6)

* **Linux:** Resolves to [`xdg-user-dirs`](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/)’ `XDG_DOCUMENTS_DIR`.
* **macOS:** Resolves to `$HOME/Documents`.
* **Windows:** Resolves to `{FOLDERID_Documents}`.

#### [Since](#since-14)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L239>

---

### [downloadDir()](#downloaddir)

```

function downloadDir(): Promise<string>

```

Returns the path to the user’s download directory.

#### [Platform-specific](#platform-specific-7)

* **Linux**: Resolves to [`xdg-user-dirs`](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/)’ `XDG_DOWNLOAD_DIR`.
* **macOS**: Resolves to `$HOME/Downloads`.
* **Windows**: Resolves to `{FOLDERID_Downloads}`.

#### [Returns](#returns-14)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-13)

```

import { downloadDir } from '@tauri-apps/api/path';

const downloadDirPath = await downloadDir();

```

#### [Since](#since-15)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L261>

---

### [executableDir()](#executabledir)

```

function executableDir(): Promise<string>

```

Returns the path to the user’s executable directory.

#### [Platform-specific](#platform-specific-8)

* **Linux:** Resolves to `$XDG_BIN_HOME/../bin` or `$XDG_DATA_HOME/../bin` or `$HOME/.local/bin`.
* **macOS:** Not supported.
* **Windows:** Not supported.

#### [Returns](#returns-15)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-14)

```

import { executableDir } from '@tauri-apps/api/path';

const executableDirPath = await executableDir();

```

#### [Since](#since-16)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L283>

---

### [extname()](#extname)

```

function extname(path): Promise<string>

```

Returns the extension of the `path`.

#### [Parameters](#parameters-2)

| Parameter | Type |
| --- | --- |
| `path` | `string` |

#### [Returns](#returns-16)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-15)

```

import { extname } from '@tauri-apps/api/path';

const ext = await extname('/path/to/file.html');

assert(ext === 'html');

```

#### [Since](#since-17)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L633>

---

### [fontDir()](#fontdir)

```

function fontDir(): Promise<string>

```

Returns the path to the user’s font directory.

#### [Platform-specific](#platform-specific-9)

* **Linux:** Resolves to `$XDG_DATA_HOME/fonts` or `$HOME/.local/share/fonts`.
* **macOS:** Resolves to `$HOME/Library/Fonts`.
* **Windows:** Not supported.

#### [Returns](#returns-17)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-16)

```

import { fontDir } from '@tauri-apps/api/path';

const fontDirPath = await fontDir();

```

#### [Since](#since-18)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L305>

---

### [homeDir()](#homedir)

```

function homeDir(): Promise<string>

```

Returns the path to the user’s home directory.

#### [Platform-specific](#platform-specific-10)

* **Linux:** Resolves to `$HOME`.
* **macOS:** Resolves to `$HOME`.
* **Windows:** Resolves to `{FOLDERID_Profile}`.

#### [Returns](#returns-18)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-17)

```

import { homeDir } from '@tauri-apps/api/path';

const homeDirPath = await homeDir();

```

#### [Since](#since-19)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L327>

---

### [isAbsolute()](#isabsolute)

```

function isAbsolute(path): Promise<boolean>

```

Returns whether the path is absolute or not.

#### [Parameters](#parameters-3)

| Parameter | Type |
| --- | --- |
| `path` | `string` |

#### [Returns](#returns-19)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

#### [Example](#example-18)

```

import { isAbsolute } from '@tauri-apps/api/path';

assert(await isAbsolute('/home/tauri'));

```

#### [Since](#since-20)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L663>

---

### [join()](#join)

```

function join(...paths): Promise<string>

```

Joins all given `path` segments together using the platform-specific separator as a delimiter, then normalizes the resulting path.

#### [Parameters](#parameters-4)

| Parameter | Type |
| --- | --- |
| …`paths` | `string`[] |

#### [Returns](#returns-20)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-19)

```

import { join, appDataDir } from '@tauri-apps/api/path';

const appDataDirPath = await appDataDir();

const path = await join(appDataDirPath, 'users', 'tauri', 'avatar.png');

```

#### [Since](#since-21)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L603>

---

### [localDataDir()](#localdatadir)

```

function localDataDir(): Promise<string>

```

Returns the path to the user’s local data directory.

#### [Platform-specific](#platform-specific-11)

* **Linux:** Resolves to `$XDG_DATA_HOME` or `$HOME/.local/share`.
* **macOS:** Resolves to `$HOME/Library/Application Support`.
* **Windows:** Resolves to `{FOLDERID_LocalAppData}`.

#### [Returns](#returns-21)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-20)

```

import { localDataDir } from '@tauri-apps/api/path';

const localDataDirPath = await localDataDir();

```

#### [Since](#since-22)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L349>

---

### [normalize()](#normalize)

```

function normalize(path): Promise<string>

```

Normalizes the given `path`, resolving `'..'` and `'.'` segments and resolve symbolic links.

#### [Parameters](#parameters-5)

| Parameter | Type |
| --- | --- |
| `path` | `string` |

#### [Returns](#returns-22)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-21)

```

import { normalize, appDataDir } from '@tauri-apps/api/path';

const appDataDirPath = await appDataDir();

const path = await normalize(`${appDataDirPath}/../users/tauri/avatar.png`);

```

#### [Since](#since-23)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L588>

---

### [pictureDir()](#picturedir)

```

function pictureDir(): Promise<string>

```

Returns the path to the user’s picture directory.

#### [Platform-specific](#platform-specific-12)

* **Linux:** Resolves to [`xdg-user-dirs`](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/)’ `XDG_PICTURES_DIR`.
* **macOS:** Resolves to `$HOME/Pictures`.
* **Windows:** Resolves to `{FOLDERID_Pictures}`.

#### [Returns](#returns-23)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-22)

```

import { pictureDir } from '@tauri-apps/api/path';

const pictureDirPath = await pictureDir();

```

#### [Since](#since-24)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L371>

---

### [publicDir()](#publicdir)

```

function publicDir(): Promise<string>

```

Returns the path to the user’s public directory.

#### [Platform-specific](#platform-specific-13)

* **Linux:** Resolves to [`xdg-user-dirs`](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/)’ `XDG_PUBLICSHARE_DIR`.
* **macOS:** Resolves to `$HOME/Public`.
* **Windows:** Resolves to `{FOLDERID_Public}`.

#### [Returns](#returns-24)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-23)

```

import { publicDir } from '@tauri-apps/api/path';

const publicDirPath = await publicDir();

```

#### [Since](#since-25)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L393>

---

### [resolve()](#resolve)

```

function resolve(...paths): Promise<string>

```

Resolves a sequence of `paths` or `path` segments into an absolute path.

#### [Parameters](#parameters-6)

| Parameter | Type |
| --- | --- |
| …`paths` | `string`[] |

#### [Returns](#returns-25)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-24)

```

import { resolve, appDataDir } from '@tauri-apps/api/path';

const appDataDirPath = await appDataDir();

const path = await resolve(appDataDirPath, '..', 'users', 'tauri', 'avatar.png');

```

#### [Since](#since-26)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L573>

---

### [resolveResource()](#resolveresource)

```

function resolveResource(resourcePath): Promise<string>

```

Resolve the path to a resource file.

#### [Parameters](#parameters-7)

| Parameter | Type | Description |
| --- | --- | --- |
| `resourcePath` | `string` | The path to the resource. Must follow the same syntax as defined in `tauri.conf.json > bundle > resources`, i.e. keeping subfolders and parent dir components (`../`). |

#### [Returns](#returns-26)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

The full path to the resource.

#### [Example](#example-25)

```

import { resolveResource } from '@tauri-apps/api/path';

const resourcePath = await resolveResource('script.sh');

```

#### [Since](#since-27)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L430>

---

### [resourceDir()](#resourcedir)

```

function resourceDir(): Promise<string>

```

Returns the path to the application’s resource directory.
To resolve a resource path, see the [[resolveResource | `resolveResource API`]].

#### [Returns](#returns-27)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-26)

```

import { resourceDir } from '@tauri-apps/api/path';

const resourceDirPath = await resourceDir();

```

#### [Since](#since-28)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L410>

---

### [runtimeDir()](#runtimedir)

```

function runtimeDir(): Promise<string>

```

Returns the path to the user’s runtime directory.

#### [Platform-specific](#platform-specific-14)

* **Linux:** Resolves to `$XDG_RUNTIME_DIR`.
* **macOS:** Not supported.
* **Windows:** Not supported.

#### [Returns](#returns-28)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-27)

```

import { runtimeDir } from '@tauri-apps/api/path';

const runtimeDirPath = await runtimeDir();

```

#### [Since](#since-29)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L453>

---

### [sep()](#sep)

```

function sep(): string

```

Returns the platform-specific path segment separator:

* `\` on Windows
* `/` on POSIX

#### [Returns](#returns-29)

`string`

#### [Since](#since-30)

2.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L548>

---

### [tempDir()](#tempdir)

```

function tempDir(): Promise<string>

```

Returns a temporary directory.

#### [Returns](#returns-30)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-28)

```

import { tempDir } from '@tauri-apps/api/path';

const temp = await tempDir();

```

#### [Since](#since-31)

2.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L535>

---

### [templateDir()](#templatedir)

```

function templateDir(): Promise<string>

```

Returns the path to the user’s template directory.

#### [Platform-specific](#platform-specific-15)

* **Linux:** Resolves to [`xdg-user-dirs`](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/)’ `XDG_TEMPLATES_DIR`.
* **macOS:** Not supported.
* **Windows:** Resolves to `{FOLDERID_Templates}`.

#### [Returns](#returns-31)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-29)

```

import { templateDir } from '@tauri-apps/api/path';

const templateDirPath = await templateDir();

```

#### [Since](#since-32)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L475>

---

### [videoDir()](#videodir)

```

function videoDir(): Promise<string>

```

Returns the path to the user’s video directory.

#### [Platform-specific](#platform-specific-16)

* **Linux:** Resolves to [`xdg-user-dirs`](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/)’ `XDG_VIDEOS_DIR`.
* **macOS:** Resolves to `$HOME/Movies`.
* **Windows:** Resolves to `{FOLDERID_Videos}`.

#### [Returns](#returns-32)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-30)

```

import { videoDir } from '@tauri-apps/api/path';

const videoDirPath = await videoDir();

```

#### [Since](#since-33)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/path.ts#L497>

[Previous   
 mocks](namespacemocks.md)   [Next   
 tray](namespacetray.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT