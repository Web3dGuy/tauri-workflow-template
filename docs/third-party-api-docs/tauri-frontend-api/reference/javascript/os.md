# @tauri-apps/plugin-os

Provides operating system-related utility methods and properties.

## [Type Aliases](#type-aliases)

### [Arch](#arch)

```

type Arch:

| "x86"

| "x86_64"

| "arm"

| "aarch64"

| "mips"

| "mips64"

| "powerpc"

| "powerpc64"

| "riscv64"

| "s390x"

| "sparc64";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/os/guest-js/index.ts#L42>

---

### [Family](#family)

```

type Family: "unix" | "windows";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/os/guest-js/index.ts#L97>

---

### [OsType](#ostype)

```

type OsType:

| "linux"

| "windows"

| "macos"

| "ios"

| "android";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/os/guest-js/index.ts#L40>

---

### [Platform](#platform)

```

type Platform:

| "linux"

| "macos"

| "ios"

| "freebsd"

| "dragonfly"

| "netbsd"

| "openbsd"

| "solaris"

| "android"

| "windows";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/os/guest-js/index.ts#L28>

## [Functions](#functions)

### [arch()](#arch-1)

```

function arch(): Arch

```

Returns the current operating system architecture.
Possible values are `'x86'`, `'x86_64'`, `'arm'`, `'aarch64'`, `'mips'`, `'mips64'`, `'powerpc'`, `'powerpc64'`, `'riscv64'`, `'s390x'`, `'sparc64'`.

#### [Returns](#returns)

[`Arch`](os.md)

#### [Example](#example)

```

import { arch } from '@tauri-apps/plugin-os';

const archName = arch();

```

#### [Since](#since)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/os/guest-js/index.ts#L138>

---

### [eol()](#eol)

```

function eol(): string

```

Returns the operating system-specific end-of-line marker.

* `\n` on POSIX
* `\r\n` on Windows

#### [Returns](#returns-1)

`string`

#### [Since](#since-1)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/os/guest-js/index.ts#L62>

---

### [exeExtension()](#exeextension)

```

function exeExtension(): string

```

Returns the file extension, if any, used for executable binaries on this platform. Possible values are `'exe'` and `''` (empty string).

#### [Returns](#returns-2)

`string`

#### [Example](#example-1)

```

import { exeExtension } from '@tauri-apps/plugin-os';

const exeExt = exeExtension();

```

#### [Since](#since-2)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/os/guest-js/index.ts#L152>

---

### [family()](#family-1)

```

function family(): Family

```

Returns the current operating system family. Possible values are `'unix'`, `'windows'`.

#### [Returns](#returns-3)

[`Family`](os.md)

#### [Example](#example-2)

```

import { family } from '@tauri-apps/plugin-os';

const family = family();

```

#### [Since](#since-3)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/os/guest-js/index.ts#L109>

---

### [hostname()](#hostname)

```

function hostname(): Promise<string | null>

```

Returns the host name of the operating system.

#### [Returns](#returns-4)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string` | `null`>

#### [Example](#example-3)

```

import { hostname } from '@tauri-apps/plugin-os';

const hostname = await hostname();

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/os/guest-js/index.ts#L181>

---

### [locale()](#locale)

```

function locale(): Promise<string | null>

```

Returns a String with a `BCP-47` language tag inside. If the locale couldn’t be obtained, `null` is returned instead.

#### [Returns](#returns-5)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string` | `null`>

#### [Example](#example-4)

```

import { locale } from '@tauri-apps/plugin-os';

const locale = await locale();

if (locale) {

// use the locale string here

}

```

#### [Since](#since-4)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/os/guest-js/index.ts#L169>

---

### [platform()](#platform-1)

```

function platform(): Platform

```

Returns a string describing the specific operating system in use.
The value is set at compile time. Possible values are `'linux'`, `'macos'`, `'ios'`, `'freebsd'`, `'dragonfly'`, `'netbsd'`, `'openbsd'`, `'solaris'`, `'android'`, `'windows'`

#### [Returns](#returns-6)

[`Platform`](os.md)

#### [Example](#example-5)

```

import { platform } from '@tauri-apps/plugin-os';

const platformName = platform();

```

#### [Since](#since-5)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/os/guest-js/index.ts#L79>

---

### [type()](#type)

```

function type(): OsType

```

Returns the current operating system type. Returns `'linux'` on Linux, `'macos'` on macOS, `'windows'` on Windows, `'ios'` on iOS and `'android'` on Android.

#### [Returns](#returns-7)

[`OsType`](os.md)

#### [Example](#example-6)

```

import { type } from '@tauri-apps/plugin-os';

const osType = type();

```

#### [Since](#since-6)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/os/guest-js/index.ts#L123>

---

### [version()](#version)

```

function version(): string

```

Returns the current operating system version.

#### [Returns](#returns-8)

`string`

#### [Example](#example-7)

```

import { version } from '@tauri-apps/plugin-os';

const osVersion = version();

```

#### [Since](#since-7)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/os/guest-js/index.ts#L93>

[Previous   
 opener](opener.md)   [Next   
 positioner](positioner.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT