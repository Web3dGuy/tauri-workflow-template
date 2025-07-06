# @tauri-apps/plugin-dialog

## [Interfaces](#interfaces)

### [ConfirmDialogOptions](#confirmdialogoptions)

#### [Properties](#properties)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `cancelLabel?` | `string` | The label of the cancel button. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L100> |
| `kind?` | `"info"` | `"warning"` | `"error"` | The kind of the dialog. Defaults to `info`. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L96> |
| `okLabel?` | `string` | The label of the confirm button. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L98> |
| `title?` | `string` | The title of the dialog. Defaults to the app name. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L94> |

---

### [DialogFilter](#dialogfilter)

Extension filters for the file dialog.

#### [Since](#since)

2.0.0

#### [Properties](#properties-1)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `extensions` | `string`[] | Extensions to filter, without a `.` prefix. **Example** `extensions: ['svg', 'png']` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L22> |
| `name` | `string` | Filter name. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L14> |

---

### [MessageDialogOptions](#messagedialogoptions)

#### [Since](#since-1)

2.0.0

#### [Properties](#properties-2)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `kind?` | `"info"` | `"warning"` | `"error"` | The kind of the dialog. Defaults to `info`. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L87> |
| `okLabel?` | `string` | The label of the confirm button. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L89> |
| `title?` | `string` | The title of the dialog. Defaults to the app name. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L85> |

---

### [OpenDialogOptions](#opendialogoptions)

Options for the open dialog.

#### [Since](#since-2)

2.0.0

#### [Properties](#properties-3)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `canCreateDirectories?` | `boolean` | Whether to allow creating directories in the dialog. Enabled by default. **macOS Only** | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L54> |
| `defaultPath?` | `string` | Initial directory or file path. If it’s a directory path, the dialog interface will change to that folder. If it’s not an existing directory, the file name will be set to the dialog’s file name input and the dialog will be set to the parent folder. On mobile the file name is always used on the dialog’s file name input. If not provided, Android uses `(invalid).txt` as default file name. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L43> |
| `directory?` | `boolean` | Whether the dialog is a directory selection or not. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L47> |
| `filters?` | [`DialogFilter`](dialog.md)[] | The filters of the dialog. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L34> |
| `multiple?` | `boolean` | Whether the dialog allows multiple selection or not. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L45> |
| `recursive?` | `boolean` | If `directory` is true, indicates that it will be read recursively later. Defines whether subdirectories will be allowed on the scope or not. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L52> |
| `title?` | `string` | The title of the dialog window (desktop only). | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L32> |

---

### [SaveDialogOptions](#savedialogoptions)

Options for the save dialog.

#### [Since](#since-3)

2.0.0

#### [Properties](#properties-4)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `canCreateDirectories?` | `boolean` | Whether to allow creating directories in the dialog. Enabled by default. **macOS Only** | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L77> |
| `defaultPath?` | `string` | Initial directory or file path. If it’s a directory path, the dialog interface will change to that folder. If it’s not an existing directory, the file name will be set to the dialog’s file name input and the dialog will be set to the parent folder. On mobile the file name is always used on the dialog’s file name input. If not provided, Android uses `(invalid).txt` as default file name. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L75> |
| `filters?` | [`DialogFilter`](dialog.md)[] | The filters of the dialog. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L66> |
| `title?` | `string` | The title of the dialog window (desktop only). | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L64> |

## [Type Aliases](#type-aliases)

### [OpenDialogReturn<T>](#opendialogreturnt)

```

type OpenDialogReturn<T>: T["directory"] extends true ? T["multiple"] extends true ? string[] | null : string | null : T["multiple"] extends true ? string[] | null : string | null;

```

#### [Type Parameters](#type-parameters)

| Type Parameter |
| --- |
| `T` *extends* [`OpenDialogOptions`](dialog.md) |

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L103>

## [Functions](#functions)

### [ask()](#ask)

```

function ask(message, options?): Promise<boolean>

```

Shows a question dialog with `Yes` and `No` buttons.

#### [Parameters](#parameters)

| Parameter | Type | Description |
| --- | --- | --- |
| `message` | `string` | The message to show. |
| `options`? | `string` | [`ConfirmDialogOptions`](dialog.md) | The dialog’s options. If a string, it represents the dialog title. |

#### [Returns](#returns)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

A promise resolving to a boolean indicating whether `Yes` was clicked or not.

#### [Example](#example)

```

import { ask } from '@tauri-apps/plugin-dialog';

const yes = await ask('Are you sure?', 'Tauri');

const yes2 = await ask('This action cannot be reverted. Are you sure?', { title: 'Tauri', kind: 'warning' });

```

#### [Since](#since-4)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L251>

---

### [confirm()](#confirm)

```

function confirm(message, options?): Promise<boolean>

```

Shows a question dialog with `Ok` and `Cancel` buttons.

#### [Parameters](#parameters-1)

| Parameter | Type | Description |
| --- | --- | --- |
| `message` | `string` | The message to show. |
| `options`? | `string` | [`ConfirmDialogOptions`](dialog.md) | The dialog’s options. If a string, it represents the dialog title. |

#### [Returns](#returns-1)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

A promise resolving to a boolean indicating whether `Ok` was clicked or not.

#### [Example](#example-1)

```

import { confirm } from '@tauri-apps/plugin-dialog';

const confirmed = await confirm('Are you sure?', 'Tauri');

const confirmed2 = await confirm('This action cannot be reverted. Are you sure?', { title: 'Tauri', kind: 'warning' });

```

#### [Since](#since-5)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L281>

---

### [message()](#message)

```

function message(message, options?): Promise<void>

```

Shows a message dialog with an `Ok` button.

#### [Parameters](#parameters-2)

| Parameter | Type | Description |
| --- | --- | --- |
| `message` | `string` | The message to show. |
| `options`? | `string` | [`MessageDialogOptions`](dialog.md) | The dialog’s options. If a string, it represents the dialog title. |

#### [Returns](#returns-2)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

#### [Example](#example-2)

```

import { message } from '@tauri-apps/plugin-dialog';

await message('Tauri is awesome', 'Tauri');

await message('File not found', { title: 'Tauri', kind: 'error' });

```

#### [Since](#since-6)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L222>

---

### [open()](#open)

```

function open<T>(options): Promise<OpenDialogReturn<T>>

```

Open a file/directory selection dialog.

The selected paths are added to the filesystem and asset protocol scopes.
When security is more important than the easy of use of this API,
prefer writing a dedicated command instead.

Note that the scope change is not persisted, so the values are cleared when the application is restarted.
You can save it to the filesystem using [tauri-plugin-persisted-scope](https://github.com/tauri-apps/tauri-plugin-persisted-scope).

#### [Type Parameters](#type-parameters-1)

| Type Parameter |
| --- |
| `T` *extends* [`OpenDialogOptions`](dialog.md) |

#### [Parameters](#parameters-3)

| Parameter | Type |
| --- | --- |
| `options` | `T` |

#### [Returns](#returns-3)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`OpenDialogReturn`](dialog.md)<`T`>>

A promise resolving to the selected path(s)

#### [Examples](#examples)

```

import { open } from '@tauri-apps/plugin-dialog';

// Open a selection dialog for image files

const selected = await open({

multiple: true,

filters: [{

name: 'Image',

extensions: ['png', 'jpeg']

}]

});

if (Array.isArray(selected)) {

// user selected multiple files

} else if (selected === null) {

// user cancelled the selection

} else {

// user selected a single file

}

```
```

import { open } from '@tauri-apps/plugin-dialog';

import { appDir } from '@tauri-apps/api/path';

// Open a selection dialog for directories

const selected = await open({

directory: true,

multiple: true,

defaultPath: await appDir(),

});

if (Array.isArray(selected)) {

// user selected multiple directories

} else if (selected === null) {

// user cancelled the selection

} else {

// user selected a single directory

}

```

#### [Since](#since-7)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L163>

---

### [save()](#save)

```

function save(options): Promise<string | null>

```

Open a file/directory save dialog.

The selected path is added to the filesystem and asset protocol scopes.
When security is more important than the easy of use of this API,
prefer writing a dedicated command instead.

Note that the scope change is not persisted, so the values are cleared when the application is restarted.
You can save it to the filesystem using [tauri-plugin-persisted-scope](https://github.com/tauri-apps/tauri-plugin-persisted-scope).

#### [Parameters](#parameters-4)

| Parameter | Type |
| --- | --- |
| `options` | [`SaveDialogOptions`](dialog.md) |

#### [Returns](#returns-4)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string` | `null`>

A promise resolving to the selected path.

#### [Example](#example-3)

```

import { save } from '@tauri-apps/plugin-dialog';

const filePath = await save({

filters: [{

name: 'Image',

extensions: ['png', 'jpeg']

}]

});

```

#### [Since](#since-8)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/dialog/guest-js/index.ts#L197>

[Previous   
 deep-link](deep-link.md)   [Next   
 fs](fs.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT