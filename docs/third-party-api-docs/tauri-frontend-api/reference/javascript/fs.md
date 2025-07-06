# @tauri-apps/plugin-fs

Access the file system.

## [Security](#security)

This module prevents path traversal, not allowing parent directory accessors to be used
(i.e. “/usr/path/to/../file” or ”../path/to/file” paths are not allowed).
Paths accessed with this API must be either relative to one of the [base directories](fs.md)
or created with the [path API](https://v2.tauri.app/reference/javascript/api/namespacepath/).

The API has a scope configuration that forces you to restrict the paths that can be accessed using glob patterns.

The scope configuration is an array of glob patterns describing file/directory paths that are allowed.
For instance, this scope configuration allows **all** enabled `fs` APIs to (only) access files in the
*databases* directory of the [`$APPDATA` directory](https://v2.tauri.app/reference/javascript/api/namespacepath/#appdatadir):

```

{

"permissions": [

{

"identifier": "fs:scope",

"allow": [{ "path": "$APPDATA/databases/*" }]

}

]

}

```

Scopes can also be applied to specific `fs` APIs by using the API’s identifier instead of `fs:scope`:

```

{

"permissions": [

{

"identifier": "fs:allow-exists",

"allow": [{ "path": "$APPDATA/databases/*" }]

}

]

}

```

Notice the use of the `$APPDATA` variable. The value is injected at runtime, resolving to the [app data directory](https://v2.tauri.app/reference/javascript/api/namespacepath/#appdatadir).

The available variables are:
[`$APPCONFIG`](https://v2.tauri.app/reference/javascript/api/namespacepath/#appconfigdir),
[`$APPDATA`](https://v2.tauri.app/reference/javascript/api/namespacepath/#appdatadir),
[`$APPLOCALDATA`](https://v2.tauri.app/reference/javascript/api/namespacepath/#applocaldatadir),
[`$APPCACHE`](https://v2.tauri.app/reference/javascript/api/namespacepath/#appcachedir),
[`$APPLOG`](https://v2.tauri.app/reference/javascript/api/namespacepath/#applogdir),
[`$AUDIO`](https://v2.tauri.app/reference/javascript/api/namespacepath/#audiodir),
[`$CACHE`](https://v2.tauri.app/reference/javascript/api/namespacepath/#cachedir),
[`$CONFIG`](https://v2.tauri.app/reference/javascript/api/namespacepath/#configdir),
[`$DATA`](https://v2.tauri.app/reference/javascript/api/namespacepath/#datadir),
[`$LOCALDATA`](https://v2.tauri.app/reference/javascript/api/namespacepath/#localdatadir),
[`$DESKTOP`](https://v2.tauri.app/reference/javascript/api/namespacepath/#desktopdir),
[`$DOCUMENT`](https://v2.tauri.app/reference/javascript/api/namespacepath/#documentdir),
[`$DOWNLOAD`](https://v2.tauri.app/reference/javascript/api/namespacepath/#downloaddir),
[`$EXE`](https://v2.tauri.app/reference/javascript/api/namespacepath/#executabledir),
[`$FONT`](https://v2.tauri.app/reference/javascript/api/namespacepath/#fontdir),
[`$HOME`](https://v2.tauri.app/reference/javascript/api/namespacepath/#homedir),
[`$PICTURE`](https://v2.tauri.app/reference/javascript/api/namespacepath/#picturedir),
[`$PUBLIC`](https://v2.tauri.app/reference/javascript/api/namespacepath/#publicdir),
[`$RUNTIME`](https://v2.tauri.app/reference/javascript/api/namespacepath/#runtimedir),
[`$TEMPLATE`](https://v2.tauri.app/reference/javascript/api/namespacepath/#templatedir),
[`$VIDEO`](https://v2.tauri.app/reference/javascript/api/namespacepath/#videodir),
[`$RESOURCE`](https://v2.tauri.app/reference/javascript/api/namespacepath/#resourcedir),
[`$TEMP`](https://v2.tauri.app/reference/javascript/api/namespacepath/#tempdir).

Trying to execute any API with a URL not configured on the scope results in a promise rejection due to denied access.

## [Enumerations](#enumerations)

### [BaseDirectory](#basedirectory)

#### [Since](#since)

2.0.0

#### [Enumeration Members](#enumeration-members)

##### [AppCache](#appcache)

```

AppCache: 16;

```

**Source**: undefined

##### [AppConfig](#appconfig)

```

AppConfig: 13;

```

**Source**: undefined

##### [AppData](#appdata)

```

AppData: 14;

```

**Source**: undefined

##### [AppLocalData](#applocaldata)

```

AppLocalData: 15;

```

**Source**: undefined

##### [AppLog](#applog)

```

AppLog: 17;

```

**Source**: undefined

##### [Audio](#audio)

```

Audio: 1;

```

**Source**: undefined

##### [Cache](#cache)

```

Cache: 2;

```

**Source**: undefined

##### [Config](#config)

```

Config: 3;

```

**Source**: undefined

##### [Data](#data)

```

Data: 4;

```

**Source**: undefined

##### [Desktop](#desktop)

```

Desktop: 18;

```

**Source**: undefined

##### [Document](#document)

```

Document: 6;

```

**Source**: undefined

##### [Download](#download)

```

Download: 7;

```

**Source**: undefined

##### [Executable](#executable)

```

Executable: 19;

```

**Source**: undefined

##### [Font](#font)

```

Font: 20;

```

**Source**: undefined

##### [Home](#home)

```

Home: 21;

```

**Source**: undefined

##### [LocalData](#localdata)

```

LocalData: 5;

```

**Source**: undefined

##### [Picture](#picture)

```

Picture: 8;

```

**Source**: undefined

##### [Public](#public)

```

Public: 9;

```

**Source**: undefined

##### [Resource](#resource)

```

Resource: 11;

```

**Source**: undefined

##### [Runtime](#runtime)

```

Runtime: 22;

```

**Source**: undefined

##### [Temp](#temp)

```

Temp: 12;

```

**Source**: undefined

##### [Template](#template)

```

Template: 23;

```

**Source**: undefined

##### [Video](#video)

```

Video: 10;

```

**Source**: undefined

---

### [SeekMode](#seekmode)

#### [Enumeration Members](#enumeration-members-1)

##### [Current](#current)

```

Current: 1;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L80>

##### [End](#end)

```

End: 2;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L81>

##### [Start](#start)

```

Start: 0;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L79>

## [Classes](#classes)

### [FileHandle](#filehandle)

The Tauri abstraction for reading and writing files.

#### [Since](#since-1)

2.0.0

#### [Extends](#extends)

* `Resource`

#### [Constructors](#constructors)

##### [new FileHandle()](#new-filehandle)

```

new FileHandle(rid): FileHandle

```

###### [Parameters](#parameters)

| Parameter | Type |
| --- | --- |
| `rid` | `number` |

###### [Returns](#returns)

[`FileHandle`](fs.md)

###### [Inherited from](#inherited-from)

`Resource.constructor`

**Source**: undefined

#### [Accessors](#accessors)

##### [rid](#rid)

###### [Get Signature](#get-signature)

```

get rid(): number

```

###### [Returns](#returns-1)

`number`

###### [Inherited from](#inherited-from-1)

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

###### [Inherited from](#inherited-from-2)

`Resource.close`

**Source**: undefined

##### [read()](#read)

```

read(buffer): Promise<null | number>

```

Reads up to `p.byteLength` bytes into `p`. It resolves to the number of
bytes read (`0` < `n` <= `p.byteLength`) and rejects if any error
encountered. Even if `read()` resolves to `n` < `p.byteLength`, it may
use all of `p` as scratch space during the call. If some data is
available but not `p.byteLength` bytes, `read()` conventionally resolves
to what is available instead of waiting for more.

When `read()` encounters end-of-file condition, it resolves to EOF
(`null`).

When `read()` encounters an error, it rejects with an error.

Callers should always process the `n` > `0` bytes returned before
considering the EOF (`null`). Doing so correctly handles I/O errors that
happen after reading some bytes and also both of the allowed EOF
behaviors.

###### [Parameters](#parameters-1)

| Parameter | Type |
| --- | --- |
| `buffer` | [`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`> |

###### [Returns](#returns-3)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`null` | `number`>

###### [Example](#example)

```

import { open, BaseDirectory } from "@tauri-apps/plugin-fs"

// if "$APPCONFIG/foo/bar.txt" contains the text "hello world":

const file = await open("foo/bar.txt", { baseDir: BaseDirectory.AppConfig });

const buf = new Uint8Array(100);

const numberOfBytesRead = await file.read(buf); // 11 bytes

const text = new TextDecoder().decode(buf);  // "hello world"

await file.close();

```

###### [Since](#since-2)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L314>

##### [seek()](#seek)

```

seek(offset, whence): Promise<number>

```

Seek sets the offset for the next `read()` or `write()` to offset,
interpreted according to `whence`: `Start` means relative to the
start of the file, `Current` means relative to the current offset,
and `End` means relative to the end. Seek resolves to the new offset
relative to the start of the file.

Seeking to an offset before the start of the file is an error. Seeking to
any positive offset is legal, but the behavior of subsequent I/O
operations on the underlying object is implementation-dependent.
It returns the number of cursor position.

###### [Parameters](#parameters-2)

| Parameter | Type |
| --- | --- |
| `offset` | `number` |
| `whence` | [`SeekMode`](fs.md) |

###### [Returns](#returns-4)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`number`>

###### [Example](#example-1)

```

import { open, SeekMode, BaseDirectory } from '@tauri-apps/plugin-fs';

// Given hello.txt pointing to file with "Hello world", which is 11 bytes long:

const file = await open('hello.txt', { read: true, write: true, truncate: true, create: true, baseDir: BaseDirectory.AppLocalData });

await file.write(new TextEncoder().encode("Hello world"));

// Seek 6 bytes from the start of the file

console.log(await file.seek(6, SeekMode.Start)); // "6"

// Seek 2 more bytes from the current position

console.log(await file.seek(2, SeekMode.Current)); // "8"

// Seek backwards 2 bytes from the end of the file

console.log(await file.seek(-2, SeekMode.End)); // "9" (e.g. 11-2)

await file.close();

```

###### [Since](#since-3)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L369>

##### [stat()](#stat)

```

stat(): Promise<FileInfo>

```

Returns a [`FileInfo`](fs.md) for this file.

###### [Returns](#returns-5)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`FileInfo`](fs.md)>

###### [Example](#example-2)

```

import { open, BaseDirectory } from '@tauri-apps/plugin-fs';

const file = await open("file.txt", { read: true, baseDir: BaseDirectory.AppLocalData });

const fileInfo = await file.stat();

console.log(fileInfo.isFile); // true

await file.close();

```

###### [Since](#since-4)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L391>

##### [truncate()](#truncate)

```

truncate(len?): Promise<void>

```

Truncates or extends this file, to reach the specified `len`.
If `len` is not specified then the entire file contents are truncated.

###### [Parameters](#parameters-3)

| Parameter | Type |
| --- | --- |
| `len`? | `number` |

###### [Returns](#returns-6)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Example](#example-3)

```

import { open, BaseDirectory } from '@tauri-apps/plugin-fs';

// truncate the entire file

const file = await open("my_file.txt", { read: true, write: true, create: true, baseDir: BaseDirectory.AppLocalData });

await file.truncate();

// truncate part of the file

const file = await open("my_file.txt", { read: true, write: true, create: true, baseDir: BaseDirectory.AppLocalData });

await file.write(new TextEncoder().encode("Hello World"));

await file.truncate(7);

const data = new Uint8Array(32);

await file.read(data);

console.log(new TextDecoder().decode(data)); // Hello W

await file.close();

```

###### [Since](#since-5)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L423>

##### [write()](#write)

```

write(data): Promise<number>

```

Writes `data.byteLength` bytes from `data` to the underlying data stream. It
resolves to the number of bytes written from `data` (`0` <= `n` <=
`data.byteLength`) or reject with the error encountered that caused the
write to stop early. `write()` must reject with a non-null error if
would resolve to `n` < `data.byteLength`. `write()` must not modify the
slice data, even temporarily.

###### [Parameters](#parameters-4)

| Parameter | Type |
| --- | --- |
| `data` | [`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`> |

###### [Returns](#returns-7)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`number`>

###### [Example](#example-4)

```

import { open, write, BaseDirectory } from '@tauri-apps/plugin-fs';

const encoder = new TextEncoder();

const data = encoder.encode("Hello world");

const file = await open("bar.txt", { write: true, baseDir: BaseDirectory.AppLocalData });

const bytesWritten = await file.write(data); // 11

await file.close();

```

###### [Since](#since-6)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L450>

## [Interfaces](#interfaces)

### [CopyFileOptions](#copyfileoptions)

#### [Since](#since-7)

2.0.0

#### [Properties](#properties)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `fromPathBaseDir?` | [`BaseDirectory`](fs.md) | Base directory for `fromPath`. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L586> |
| `toPathBaseDir?` | [`BaseDirectory`](fs.md) | Base directory for `toPath`. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L588> |

---

### [CreateOptions](#createoptions)

#### [Since](#since-8)

2.0.0

#### [Properties](#properties-1)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `baseDir?` | [`BaseDirectory`](fs.md) | Base directory for `path` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L463> |

---

### [DebouncedWatchOptions](#debouncedwatchoptions)

#### [Since](#since-9)

2.0.0

#### [Extends](#extends-1)

#### [Properties](#properties-2)

| Property | Type | Description | Inherited from | Defined in |
| --- | --- | --- | --- | --- |
| `baseDir?` | [`BaseDirectory`](fs.md) | Base directory for `path` | [`WatchOptions`](fs.md).[`baseDir`](fs.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1162> |
| `delayMs?` | `number` | Debounce delay | - | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1170> |
| `recursive?` | `boolean` | Watch a directory recursively | [`WatchOptions`](fs.md).[`recursive`](fs.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1160> |

---

### [DirEntry](#direntry)

A disk entry which is either a file, a directory or a symlink.

This is the result of the [`readDir`](fs.md).

#### [Since](#since-10)

2.0.0

#### [Properties](#properties-3)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `isDirectory` | `boolean` | Specifies whether this entry is a directory or not. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L677> |
| `isFile` | `boolean` | Specifies whether this entry is a file or not. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L679> |
| `isSymlink` | `boolean` | Specifies whether this entry is a symlink or not. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L681> |
| `name` | `string` | The name of the entry (file name with extension or directory name). | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L675> |

---

### [ExistsOptions](#existsoptions)

#### [Since](#since-11)

2.0.0

#### [Properties](#properties-4)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `baseDir?` | [`BaseDirectory`](fs.md) | Base directory for `path`. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1127> |

---

### [FileInfo](#fileinfo)

A FileInfo describes a file and is returned by `stat`, `lstat` or `fstat`.

#### [Since](#since-12)

2.0.0

#### [Properties](#properties-5)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `atime` | `null` | [`Date`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Date) | The last access time of the file. This corresponds to the `atime` field from `stat` on Unix and `ftLastAccessTime` on Windows. This may not be available on all platforms. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L120> |
| `birthtime` | `null` | [`Date`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Date) | The creation time of the file. This corresponds to the `birthtime` field from `stat` on Mac/BSD and `ftCreationTime` on Windows. This may not be available on all platforms. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L126> |
| `blksize` | `null` | `number` | Blocksize for filesystem I/O. #### Platform-specific - **Windows:** Unsupported. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L203> |

| `blocks` | `null` | `number` | Number of blocks allocated to the file, in 512-byte units. #### Platform-specific - **Windows:** Unsupported. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L211> |

| `dev` | `null` | `number` | ID of the device containing the file. #### Platform-specific - **Windows:** Unsupported. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L146> |

| `fileAttributes` | `null` | `number` | This field contains the file system attribute information for a file or directory. For possible values and their descriptions, see [File Attribute Constants](https://docs.microsoft.com/en-us/windows/win32/fileio/file-attribute-constants) in the Windows Dev Center #### Platform-specific - **macOS / Linux / Android / iOS:** Unsupported. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L138> |

| `gid` | `null` | `number` | Group ID of the owner of this file. #### Platform-specific - **Windows:** Unsupported. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L187> |

| `ino` | `null` | `number` | Inode number. #### Platform-specific - **Windows:** Unsupported. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L154> |

| `isDirectory` | `boolean` | True if this is info for a regular directory. Mutually exclusive to `FileInfo.isFile` and `FileInfo.isSymlink`. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L99> |
| `isFile` | `boolean` | True if this is info for a regular file. Mutually exclusive to `FileInfo.isDirectory` and `FileInfo.isSymlink`. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L94> |
| `isSymlink` | `boolean` | True if this is info for a symlink. Mutually exclusive to `FileInfo.isFile` and `FileInfo.isDirectory`. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L104> |
| `mode` | `null` | `number` | The underlying raw `st_mode` bits that contain the standard Unix permissions for this file/directory. #### Platform-specific - **Windows:** Unsupported. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L163> |

| `mtime` | `null` | [`Date`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Date) | The last modification time of the file. This corresponds to the `mtime` field from `stat` on Linux/Mac OS and `ftLastWriteTime` on Windows. This may not be available on all platforms. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L114> |
| `nlink` | `null` | `number` | Number of hard links pointing to this file. #### Platform-specific - **Windows:** Unsupported. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L171> |

| `rdev` | `null` | `number` | Device ID of this file. #### Platform-specific - **Windows:** Unsupported. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L195> |

| `readonly` | `boolean` | Whether this is a readonly (unwritable) file. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L128> |
| `size` | `number` | The size of the file, in bytes. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L108> |
| `uid` | `null` | `number` | User ID of the owner of this file. #### Platform-specific - **Windows:** Unsupported. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L179> |

---

### [MkdirOptions](#mkdiroptions)

#### [Since](#since-13)

2.0.0

#### [Properties](#properties-6)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `baseDir?` | [`BaseDirectory`](fs.md) | Base directory for `path` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L631> |
| `mode?` | `number` | Permissions to use when creating the directory (defaults to `0o777`, before the process’s umask). Ignored on Windows. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L625> |
| `recursive?` | `boolean` | Defaults to `false`. If set to `true`, means that any intermediate directories will also be created (as with the shell command `mkdir -p`). | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L629> |

---

### [OpenOptions](#openoptions)

#### [Since](#since-14)

2.0.0

#### [Properties](#properties-7)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `append?` | `boolean` | Sets the option for the append mode. This option, when `true`, means that writes will append to a file instead of overwriting previous contents. Note that setting `{ write: true, append: true }` has the same effect as setting only `{ append: true }`. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L518> |
| `baseDir?` | [`BaseDirectory`](fs.md) | Base directory for `path` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L546> |
| `create?` | `boolean` | Sets the option to allow creating a new file, if one doesn’t already exist at the specified path. Requires write or append access to be used. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L531> |
| `createNew?` | `boolean` | Defaults to `false`. If set to `true`, no file, directory, or symlink is allowed to exist at the target location. Requires write or append access to be used. When createNew is set to `true`, create and truncate are ignored. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L538> |
| `mode?` | `number` | Permissions to use if creating the file (defaults to `0o666`, before the process’s umask). Ignored on Windows. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L544> |
| `read?` | `boolean` | Sets the option for read access. This option, when `true`, means that the file should be read-able if opened. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L504> |
| `truncate?` | `boolean` | Sets the option for truncating a previous file. If a file is successfully opened with this option set it will truncate the file to `0` size if it already exists. The file must be opened with write access for truncate to work. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L525> |
| `write?` | `boolean` | Sets the option for write access. This option, when `true`, means that the file should be write-able if opened. If the file already exists, any write calls on it will overwrite its contents, by default without truncating it. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L511> |

---

### [ReadDirOptions](#readdiroptions)

#### [Since](#since-15)

2.0.0

#### [Properties](#properties-8)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `baseDir?` | [`BaseDirectory`](fs.md) | Base directory for `path` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L663> |

---

### [ReadFileOptions](#readfileoptions)

#### [Since](#since-16)

2.0.0

#### [Properties](#properties-9)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `baseDir?` | [`BaseDirectory`](fs.md) | Base directory for `path` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L725> |

---

### [RemoveOptions](#removeoptions)

#### [Since](#since-17)

2.0.0

#### [Properties](#properties-10)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `baseDir?` | [`BaseDirectory`](fs.md) | Base directory for `path` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L862> |
| `recursive?` | `boolean` | Defaults to `false`. If set to `true`, path will be removed even if it’s a non-empty directory. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L860> |

---

### [RenameOptions](#renameoptions)

#### [Since](#since-18)

2.0.0

#### [Properties](#properties-11)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `newPathBaseDir?` | [`BaseDirectory`](fs.md) | Base directory for `newPath`. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L898> |
| `oldPathBaseDir?` | [`BaseDirectory`](fs.md) | Base directory for `oldPath`. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L896> |

---

### [StatOptions](#statoptions)

#### [Since](#since-19)

2.0.0

#### [Properties](#properties-12)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `baseDir?` | [`BaseDirectory`](fs.md) | Base directory for `path`. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L940> |

---

### [TruncateOptions](#truncateoptions)

#### [Since](#since-20)

2.0.0

#### [Properties](#properties-13)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `baseDir?` | [`BaseDirectory`](fs.md) | Base directory for `path`. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L999> |

---

### [WatchEvent](#watchevent)

#### [Since](#since-21)

2.0.0

#### [Properties](#properties-14)

| Property | Type | Defined in |
| --- | --- | --- |
| `attrs` | `unknown` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1179> |
| `paths` | `string`[] | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1178> |
| `type` | [`WatchEventKind`](fs.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1177> |

---

### [WatchOptions](#watchoptions)

#### [Since](#since-22)

2.0.0

#### [Extended by](#extended-by)

#### [Properties](#properties-15)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `baseDir?` | [`BaseDirectory`](fs.md) | Base directory for `path` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1162> |
| `recursive?` | `boolean` | Watch a directory recursively | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1160> |

---

### [WriteFileOptions](#writefileoptions)

#### [Since](#since-23)

2.0.0

#### [Properties](#properties-16)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `append?` | `boolean` | Defaults to `false`. If set to `true`, will append to a file instead of overwriting previous contents. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1043> |
| `baseDir?` | [`BaseDirectory`](fs.md) | Base directory for `path` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1051> |
| `create?` | `boolean` | Sets the option to allow creating a new file, if one doesn’t already exist at the specified path (defaults to `true`). | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1045> |
| `createNew?` | `boolean` | Sets the option to create a new file, failing if it already exists. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1047> |
| `mode?` | `number` | File permissions. Ignored on Windows. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1049> |

## [Type Aliases](#type-aliases)

### [UnwatchFn()](#unwatchfn)

```

type UnwatchFn: () => void;

```

#### [Returns](#returns-8)

`void`

#### [Since](#since-24)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1243>

---

### [WatchEventKind](#watcheventkind)

```

type WatchEventKind:

| "any"

| object

| object

| object

| object

| "other";

```

#### [Since](#since-25)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1185>

---

### [WatchEventKindAccess](#watcheventkindaccess)

```

type WatchEventKindAccess: object | object | object | object;

```

#### [Since](#since-26)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1196>

---

### [WatchEventKindCreate](#watcheventkindcreate)

```

type WatchEventKindCreate: object | object | object | object;

```

#### [Since](#since-27)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1205>

---

### [WatchEventKindModify](#watcheventkindmodify)

```

type WatchEventKindModify:

| object

| object

| object

| object

| object;

```

#### [Since](#since-28)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1214>

---

### [WatchEventKindRemove](#watcheventkindremove)

```

type WatchEventKindRemove: object | object | object | object;

```

#### [Since](#since-29)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1234>

## [Functions](#functions)

### [copyFile()](#copyfile)

```

function copyFile(

fromPath,

toPath,

options?): Promise<void>

```

Copies the contents and permissions of one file to another specified path, by default creating a new file if needed, else overwriting.

#### [Parameters](#parameters-5)

| Parameter | Type |
| --- | --- |
| `fromPath` | `string` | [`URL`](https://developer.mozilla.org/docs/Web/API/URL) |
| `toPath` | `string` | [`URL`](https://developer.mozilla.org/docs/Web/API/URL) |
| `options`? | [`CopyFileOptions`](fs.md) |

#### [Returns](#returns-9)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

#### [Example](#example-5)

```

import { copyFile, BaseDirectory } from '@tauri-apps/plugin-fs';

await copyFile('app.conf', 'app.conf.bk', { fromPathBaseDir: BaseDirectory.AppConfig, toPathBaseDir: BaseDirectory.AppConfig });

```

#### [Since](#since-30)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L601>

---

### [create()](#create)

```

function create(path, options?): Promise<FileHandle>

```

Creates a file if none exists or truncates an existing file and resolves to
an instance of [`FileHandle`](fs.md).

#### [Parameters](#parameters-6)

| Parameter | Type |
| --- | --- |
| `path` | `string` | [`URL`](https://developer.mozilla.org/docs/Web/API/URL) |
| `options`? | [`CreateOptions`](fs.md) |

#### [Returns](#returns-10)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`FileHandle`](fs.md)>

#### [Example](#example-6)

```

import { create, BaseDirectory } from "@tauri-apps/plugin-fs"

const file = await create("foo/bar.txt", { baseDir: BaseDirectory.AppConfig });

await file.write(new TextEncoder().encode("Hello world"));

await file.close();

```

#### [Since](#since-31)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L480>

---

### [exists()](#exists)

```

function exists(path, options?): Promise<boolean>

```

Check if a path exists.

#### [Parameters](#parameters-7)

| Parameter | Type |
| --- | --- |
| `path` | `string` | [`URL`](https://developer.mozilla.org/docs/Web/API/URL) |
| `options`? | [`ExistsOptions`](fs.md) |

#### [Returns](#returns-11)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

#### [Example](#example-7)

```

import { exists, BaseDirectory } from '@tauri-apps/plugin-fs';

// Check if the `$APPDATA/avatar.png` file exists

await exists('avatar.png', { baseDir: BaseDirectory.AppData });

```

#### [Since](#since-32)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1141>

---

### [lstat()](#lstat)

```

function lstat(path, options?): Promise<FileInfo>

```

Resolves to a [`FileInfo`](fs.md) for the specified `path`. If `path` is a
symlink, information for the symlink will be returned instead of what it
points to.

#### [Parameters](#parameters-8)

| Parameter | Type |
| --- | --- |
| `path` | `string` | [`URL`](https://developer.mozilla.org/docs/Web/API/URL) |
| `options`? | [`StatOptions`](fs.md) |

#### [Returns](#returns-12)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`FileInfo`](fs.md)>

#### [Example](#example-8)

```

import { lstat, BaseDirectory } from '@tauri-apps/plugin-fs';

const fileInfo = await lstat("hello.txt", { baseDir: BaseDirectory.AppLocalData });

console.log(fileInfo.isFile); // true

```

#### [Since](#since-33)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L982>

---

### [mkdir()](#mkdir)

```

function mkdir(path, options?): Promise<void>

```

Creates a new directory with the specified path.

#### [Parameters](#parameters-9)

| Parameter | Type |
| --- | --- |
| `path` | `string` | [`URL`](https://developer.mozilla.org/docs/Web/API/URL) |
| `options`? | [`MkdirOptions`](fs.md) |

#### [Returns](#returns-13)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

#### [Example](#example-9)

```

import { mkdir, BaseDirectory } from '@tauri-apps/plugin-fs';

await mkdir('users', { baseDir: BaseDirectory.AppLocalData });

```

#### [Since](#since-34)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L644>

---

### [open()](#open)

```

function open(path, options?): Promise<FileHandle>

```

Open a file and resolve to an instance of [`FileHandle`](fs.md). The
file does not need to previously exist if using the `create` or `createNew`
open options. It is the callers responsibility to close the file when finished
with it.

#### [Parameters](#parameters-10)

| Parameter | Type |
| --- | --- |
| `path` | `string` | [`URL`](https://developer.mozilla.org/docs/Web/API/URL) |
| `options`? | [`OpenOptions`](fs.md) |

#### [Returns](#returns-14)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`FileHandle`](fs.md)>

#### [Example](#example-10)

```

import { open, BaseDirectory } from "@tauri-apps/plugin-fs"

const file = await open("foo/bar.txt", { read: true, write: true, baseDir: BaseDirectory.AppLocalData });

// Do work with file

await file.close();

```

#### [Since](#since-35)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L565>

---

### [readDir()](#readdir)

```

function readDir(path, options?): Promise<DirEntry[]>

```

Reads the directory given by path and returns an array of `DirEntry`.

#### [Parameters](#parameters-11)

| Parameter | Type |
| --- | --- |
| `path` | `string` | [`URL`](https://developer.mozilla.org/docs/Web/API/URL) |
| `options`? | [`ReadDirOptions`](fs.md) |

#### [Returns](#returns-15)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`DirEntry`](fs.md)[]>

#### [Example](#example-11)

```

import { readDir, BaseDirectory } from '@tauri-apps/plugin-fs';

import { join } from '@tauri-apps/api/path';

const dir = "users"

const entries = await readDir('users', { baseDir: BaseDirectory.AppLocalData });

processEntriesRecursively(dir, entries);

async function processEntriesRecursively(parent, entries) {

for (const entry of entries) {

console.log(`Entry: ${entry.name}`);

if (entry.isDirectory) {

const dir = await join(parent, entry.name);

processEntriesRecursively(dir, await readDir(dir, { baseDir: BaseDirectory.AppLocalData }))

}

}

}

```

#### [Since](#since-36)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L706>

---

### [readFile()](#readfile)

```

function readFile(path, options?): Promise<Uint8Array>

```

Reads and resolves to the entire contents of a file as an array of bytes.
TextDecoder can be used to transform the bytes to string if required.

#### [Parameters](#parameters-12)

| Parameter | Type |
| --- | --- |
| `path` | `string` | [`URL`](https://developer.mozilla.org/docs/Web/API/URL) |
| `options`? | [`ReadFileOptions`](fs.md) |

#### [Returns](#returns-16)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)>

#### [Example](#example-12)

```

import { readFile, BaseDirectory } from '@tauri-apps/plugin-fs';

const contents = await readFile('avatar.png', { baseDir: BaseDirectory.Resource });

```

#### [Since](#since-37)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L739>

---

### [readTextFile()](#readtextfile)

```

function readTextFile(path, options?): Promise<string>

```

Reads and returns the entire contents of a file as UTF-8 string.

#### [Parameters](#parameters-13)

| Parameter | Type |
| --- | --- |
| `path` | `string` | [`URL`](https://developer.mozilla.org/docs/Web/API/URL) |
| `options`? | [`ReadFileOptions`](fs.md) |

#### [Returns](#returns-17)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`>

#### [Example](#example-13)

```

import { readTextFile, BaseDirectory } from '@tauri-apps/plugin-fs';

const contents = await readTextFile('app.conf', { baseDir: BaseDirectory.AppConfig });

```

#### [Since](#since-38)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L765>

---

### [readTextFileLines()](#readtextfilelines)

```

function readTextFileLines(path, options?): Promise<AsyncIterableIterator<string>>

```

Returns an async AsyncIterableIterator over the lines of a file as UTF-8 string.

#### [Parameters](#parameters-14)

| Parameter | Type |
| --- | --- |
| `path` | `string` | [`URL`](https://developer.mozilla.org/docs/Web/API/URL) |
| `options`? | [`ReadFileOptions`](fs.md) |

#### [Returns](#returns-18)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`AsyncIterableIterator`<`string`>>

#### [Example](#example-14)

```

import { readTextFileLines, BaseDirectory } from '@tauri-apps/plugin-fs';

const lines = await readTextFileLines('app.conf', { baseDir: BaseDirectory.AppConfig });

for await (const line of lines) {

console.log(line);

}

```

You could also call AsyncIterableIterator.next to advance the
iterator so you can lazily read the next line whenever you want.

#### [Since](#since-39)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L798>

---

### [remove()](#remove)

```

function remove(path, options?): Promise<void>

```

Removes the named file or directory.
If the directory is not empty and the `recursive` option isn’t set to true, the promise will be rejected.

#### [Parameters](#parameters-15)

| Parameter | Type |
| --- | --- |
| `path` | `string` | [`URL`](https://developer.mozilla.org/docs/Web/API/URL) |
| `options`? | [`RemoveOptions`](fs.md) |

#### [Returns](#returns-19)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

#### [Example](#example-15)

```

import { remove, BaseDirectory } from '@tauri-apps/plugin-fs';

await remove('users/file.txt', { baseDir: BaseDirectory.AppLocalData });

await remove('users', { baseDir: BaseDirectory.AppLocalData });

```

#### [Since](#since-40)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L877>

---

### [rename()](#rename)

```

function rename(

oldPath,

newPath,

options?): Promise<void>

```

Renames (moves) oldpath to newpath. Paths may be files or directories.
If newpath already exists and is not a directory, rename() replaces it.
OS-specific restrictions may apply when oldpath and newpath are in different directories.

On Unix, this operation does not follow symlinks at either path.

#### [Parameters](#parameters-16)

| Parameter | Type |
| --- | --- |
| `oldPath` | `string` | [`URL`](https://developer.mozilla.org/docs/Web/API/URL) |
| `newPath` | `string` | [`URL`](https://developer.mozilla.org/docs/Web/API/URL) |
| `options`? | [`RenameOptions`](fs.md) |

#### [Returns](#returns-20)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

#### [Example](#example-16)

```

import { rename, BaseDirectory } from '@tauri-apps/plugin-fs';

await rename('avatar.png', 'deleted.png', { oldPathBaseDir: BaseDirectory.App, newPathBaseDir: BaseDirectory.AppLocalData });

```

#### [Since](#since-41)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L916>

---

### [size()](#size)

```

function size(path): Promise<number>

```

Get the size of a file or directory. For files, the `stat` functions can be used as well.

If `path` is a directory, this function will recursively iterate over every file and every directory inside of `path` and therefore will be very time consuming if used on larger directories.

#### [Parameters](#parameters-17)

| Parameter | Type |
| --- | --- |
| `path` | `string` | [`URL`](https://developer.mozilla.org/docs/Web/API/URL) |

#### [Returns](#returns-21)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`number`>

#### [Example](#example-17)

```

import { size, BaseDirectory } from '@tauri-apps/plugin-fs';

// Get the size of the `$APPDATA/tauri` directory.

const dirSize = await size('tauri', { baseDir: BaseDirectory.AppData });

console.log(dirSize); // 1024

```

#### [Since](#since-42)

2.1.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1340>

---

### [stat()](#stat-1)

```

function stat(path, options?): Promise<FileInfo>

```

Resolves to a [`FileInfo`](fs.md) for the specified `path`. Will always
follow symlinks but will reject if the symlink points to a path outside of the scope.

#### [Parameters](#parameters-18)

| Parameter | Type |
| --- | --- |
| `path` | `string` | [`URL`](https://developer.mozilla.org/docs/Web/API/URL) |
| `options`? | [`StatOptions`](fs.md) |

#### [Returns](#returns-22)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`FileInfo`](fs.md)>

#### [Example](#example-18)

```

import { stat, BaseDirectory } from '@tauri-apps/plugin-fs';

const fileInfo = await stat("hello.txt", { baseDir: BaseDirectory.AppLocalData });

console.log(fileInfo.isFile); // true

```

#### [Since](#since-43)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L956>

---

### [truncate()](#truncate-1)

```

function truncate(

path,

len?,

options?): Promise<void>

```

Truncates or extends the specified file, to reach the specified `len`.
If `len` is `0` or not specified, then the entire file contents are truncated.

#### [Parameters](#parameters-19)

| Parameter | Type |
| --- | --- |
| `path` | `string` | [`URL`](https://developer.mozilla.org/docs/Web/API/URL) |
| `len`? | `number` |
| `options`? | [`TruncateOptions`](fs.md) |

#### [Returns](#returns-23)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

#### [Example](#example-19)

```

import { truncate, readTextFile, writeTextFile, BaseDirectory } from '@tauri-apps/plugin-fs';

// truncate the entire file

await truncate("my_file.txt", 0, { baseDir: BaseDirectory.AppLocalData });

// truncate part of the file

const filePath = "file.txt";

await writeTextFile(filePath, "Hello World", { baseDir: BaseDirectory.AppLocalData });

await truncate(filePath, 7, { baseDir: BaseDirectory.AppLocalData });

const data = await readTextFile(filePath, { baseDir: BaseDirectory.AppLocalData });

console.log(data);  // "Hello W"

```

#### [Since](#since-44)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1022>

---

### [watch()](#watch)

```

function watch(

paths,

cb,

options?): Promise<UnwatchFn>

```

Watch changes (after a delay) on files or directories.

#### [Parameters](#parameters-20)

| Parameter | Type |
| --- | --- |
| `paths` | `string` | [`URL`](https://developer.mozilla.org/docs/Web/API/URL) | `string`[] | [`URL`](https://developer.mozilla.org/docs/Web/API/URL)[] |
| `cb` | (`event`) => `void` |
| `options`? | [`DebouncedWatchOptions`](fs.md) |

#### [Returns](#returns-24)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnwatchFn`](fs.md)>

#### [Since](#since-45)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1254>

---

### [watchImmediate()](#watchimmediate)

```

function watchImmediate(

paths,

cb,

options?): Promise<UnwatchFn>

```

Watch changes on files or directories.

#### [Parameters](#parameters-21)

| Parameter | Type |
| --- | --- |
| `paths` | `string` | [`URL`](https://developer.mozilla.org/docs/Web/API/URL) | `string`[] | [`URL`](https://developer.mozilla.org/docs/Web/API/URL)[] |
| `cb` | (`event`) => `void` |
| `options`? | [`WatchOptions`](fs.md) |

#### [Returns](#returns-25)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`UnwatchFn`](fs.md)>

#### [Since](#since-46)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1292>

---

### [writeFile()](#writefile)

```

function writeFile(

path,

data,

options?): Promise<void>

```

Write `data` to the given `path`, by default creating a new file if needed, else overwriting.

#### [Parameters](#parameters-22)

| Parameter | Type |
| --- | --- |
| `path` | `string` | [`URL`](https://developer.mozilla.org/docs/Web/API/URL) |
| `data` | [`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`> | [`ReadableStream`](https://developer.mozilla.org/docs/Web/API/ReadableStream)<[`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`>> |
| `options`? | [`WriteFileOptions`](fs.md) |

#### [Returns](#returns-26)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

#### [Example](#example-20)

```

import { writeFile, BaseDirectory } from '@tauri-apps/plugin-fs';

let encoder = new TextEncoder();

let data = encoder.encode("Hello World");

await writeFile('file.txt', data, { baseDir: BaseDirectory.AppLocalData });

```

#### [Since](#since-47)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1067>

---

### [writeTextFile()](#writetextfile)

```

function writeTextFile(

path,

data,

options?): Promise<void>

```

Writes UTF-8 string `data` to the given `path`, by default creating a new file if needed, else overwriting.

#### [Parameters](#parameters-23)

| Parameter | Type |
| --- | --- |
| `path` | `string` | [`URL`](https://developer.mozilla.org/docs/Web/API/URL) |
| `data` | `string` |
| `options`? | [`WriteFileOptions`](fs.md) |

#### [Returns](#returns-27)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

#### [Example](#example-21)

```

import { writeTextFile, BaseDirectory } from '@tauri-apps/plugin-fs';

await writeTextFile('file.txt', "Hello world", { baseDir: BaseDirectory.AppLocalData });

```

#### [Since](#since-48)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/fs/guest-js/index.ts#L1103>

[Previous   
 dialog](dialog.md)   [Next   
 global-shortcut](global-shortcut.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT