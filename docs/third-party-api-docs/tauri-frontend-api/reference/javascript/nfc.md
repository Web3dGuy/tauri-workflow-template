# @tauri-apps/plugin-nfc

## [Enumerations](#enumerations)

### [NFCTypeNameFormat](#nfctypenameformat)

#### [Enumeration Members](#enumeration-members)

##### [AbsoluteURI](#absoluteuri)

```

AbsoluteURI: 3;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L84>

##### [Empty](#empty)

```

Empty: 0;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L81>

##### [Media](#media)

```

Media: 2;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L83>

##### [NfcExternal](#nfcexternal)

```

NfcExternal: 4;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L85>

##### [NfcWellKnown](#nfcwellknown)

```

NfcWellKnown: 1;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L82>

##### [Unchanged](#unchanged)

```

Unchanged: 6;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L87>

##### [Unknown](#unknown)

```

Unknown: 5;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L86>

---

### [TechKind](#techkind)

#### [Enumeration Members](#enumeration-members-1)

##### [IsoDep](#isodep)

```

IsoDep: 0;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L17>

##### [MifareClassic](#mifareclassic)

```

MifareClassic: 1;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L18>

##### [MifareUltralight](#mifareultralight)

```

MifareUltralight: 2;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L19>

##### [Ndef](#ndef)

```

Ndef: 3;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L20>

##### [NdefFormatable](#ndefformatable)

```

NdefFormatable: 4;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L21>

##### [NfcA](#nfca)

```

NfcA: 5;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L22>

##### [NfcB](#nfcb)

```

NfcB: 6;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L23>

##### [NfcBarcode](#nfcbarcode)

```

NfcBarcode: 7;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L24>

##### [NfcF](#nfcf)

```

NfcF: 8;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L25>

##### [NfcV](#nfcv)

```

NfcV: 9;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L26>

## [Interfaces](#interfaces)

### [NFCRecord](#nfcrecord)

#### [Properties](#properties)

| Property | Type | Defined in |
| --- | --- | --- |
| `format` | [`NFCTypeNameFormat`](nfc.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L104> |
| `id` | `number`[] | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L106> |
| `kind` | `number`[] | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L105> |
| `payload` | `number`[] | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L107> |

---

### [ScanOptions](#scanoptions)

#### [Properties](#properties-1)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `keepSessionAlive?` | `boolean` | - | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L63> |
| `message?` | `string` | Message displayed in the UI. iOS only. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L65> |
| `successMessage?` | `string` | Message displayed in the UI when the message has been read. iOS only. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L67> |

---

### [Tag](#tag)

#### [Properties](#properties-2)

| Property | Type | Defined in |
| --- | --- | --- |
| `id` | `number`[] | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L98> |
| `kind` | `string`[] | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L99> |
| `records` | [`TagRecord`](nfc.md)[] | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L100> |

---

### [TagRecord](#tagrecord)

#### [Properties](#properties-3)

| Property | Type | Defined in |
| --- | --- | --- |
| `id` | `number`[] | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L93> |
| `kind` | `number`[] | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L92> |
| `payload` | `number`[] | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L94> |
| `tnf` | [`NFCTypeNameFormat`](nfc.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L91> |

---

### [UriFilter](#urifilter)

#### [Properties](#properties-4)

| Property | Type | Defined in |
| --- | --- | --- |
| `host?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L12> |
| `pathPrefix?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L13> |
| `scheme?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L11> |

---

### [WriteOptions](#writeoptions)

#### [Properties](#properties-5)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `kind?` | [`ScanKind`](nfc.md) | - | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L71> |
| `message?` | `string` | Message displayed in the UI when reading the tag. iOS only. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L73> |
| `successfulReadMessage?` | `string` | Message displayed in the UI when the tag has been read. iOS only. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L75> |
| `successMessage?` | `string` | Message displayed in the UI when the message has been written. iOS only. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L77> |

## [Type Aliases](#type-aliases)

### [ScanKind](#scankind)

```

type ScanKind: object | object;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L29>

## [Variables](#variables)

### [RTD\_TEXT](#rtd_text)

```

const RTD_TEXT: number[];

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L7>

---

### [RTD\_URI](#rtd_uri)

```

const RTD_URI: number[];

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L8>

## [Functions](#functions)

### [isAvailable()](#isavailable)

```

function isAvailable(): Promise<boolean>

```

#### [Returns](#returns)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L271>

---

### [record()](#record)

```

function record(

format,

kind,

id,

payload): NFCRecord

```

#### [Parameters](#parameters)

| Parameter | Type |
| --- | --- |
| `format` | [`NFCTypeNameFormat`](nfc.md) |
| `kind` | `string` | `number`[] |
| `id` | `string` | `number`[] |
| `payload` | `string` | `number`[] |

#### [Returns](#returns-1)

[`NFCRecord`](nfc.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L110>

---

### [scan()](#scan)

```

function scan(kind, options?): Promise<Tag>

```

Scans an NFC tag.

```

import { scan } from "@tauri-apps/plugin-nfc";

await scan({ type: "tag" });

```

See <https://developer.android.com/develop/connectivity/nfc/nfc#ndef> for more information.

#### [Parameters](#parameters-1)

| Parameter | Type | Description |
| --- | --- | --- |
| `kind` | [`ScanKind`](nfc.md) |  |
| `options`? | [`ScanOptions`](nfc.md) |  |

#### [Returns](#returns-2)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Tag`](nfc.md)>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L231>

---

### [textRecord()](#textrecord)

```

function textRecord(

text,

id?,

language?): NFCRecord

```

#### [Parameters](#parameters-2)

| Parameter | Type | Default value |
| --- | --- | --- |
| `text` | `string` | `undefined` |
| `id`? | `string` | `number`[] | `undefined` |
| `language`? | `string` | `'en'` |

#### [Returns](#returns-3)

[`NFCRecord`](nfc.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L130>

---

### [uriRecord()](#urirecord)

```

function uriRecord(uri, id?): NFCRecord

```

#### [Parameters](#parameters-3)

| Parameter | Type |
| --- | --- |
| `uri` | `string` |
| `id`? | `string` | `number`[] |

#### [Returns](#returns-4)

[`NFCRecord`](nfc.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L203>

---

### [write()](#write)

```

function write(records, options?): Promise<void>

```

Write to an NFC tag.

```

import { uriRecord, write } from "@tauri-apps/plugin-nfc";

await write([uriRecord("https://tauri.app")], { kind: { type: "ndef" } });

```

If you did not previously call [scan](nfc.md) with [ScanOptions.keepSessionAlive](nfc.md) set to true,
it will first scan the tag then write to it.

#### [Parameters](#parameters-4)

| Parameter | Type | Description |
| --- | --- | --- |
| `records` | [`NFCRecord`](nfc.md)[] |  |
| `options`? | [`WriteOptions`](nfc.md) |  |

#### [Returns](#returns-5)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/nfc/guest-js/index.ts#L256>

[Previous   
 log](log.md)   [Next   
 notification](notification.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT