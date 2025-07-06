# @tauri-apps/plugin-barcode-scanner

## [Enumerations](#enumerations)

### [Format](#format)

#### [Enumeration Members](#enumeration-members)

##### [Aztec](#aztec)

```

Aztec: "AZTEC";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L24>

##### [Codabar](#codabar)

```

Codabar: "CODABAR";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L22>

##### [Code128](#code128)

```

Code128: "CODE_128";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L21>

##### [Code39](#code39)

```

Code39: "CODE_39";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L19>

##### [Code93](#code93)

```

Code93: "CODE_93";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L20>

##### [DataMatrix](#datamatrix)

```

DataMatrix: "DATA_MATRIX";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L25>

##### [EAN13](#ean13)

```

EAN13: "EAN_13";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L18>

##### [EAN8](#ean8)

```

EAN8: "EAN_8";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L17>

##### [ITF](#itf)

```

ITF: "ITF";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L23>

##### [PDF417](#pdf417)

```

PDF417: "PDF_417";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L26>

##### [QRCode](#qrcode)

```

QRCode: "QR_CODE";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L14>

##### [UPC\_A](#upc_a)

```

UPC_A: "UPC_A";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L15>

##### [UPC\_E](#upc_e)

```

UPC_E: "UPC_E";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L16>

## [Interfaces](#interfaces)

### [Scanned](#scanned)

#### [Properties](#properties)

| Property | Type | Defined in |
| --- | --- | --- |
| `bounds` | `unknown` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L38> |
| `content` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L36> |
| `format` | [`Format`](barcode-scanner.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L37> |

---

### [ScanOptions](#scanoptions)

#### [Properties](#properties-1)

| Property | Type | Defined in |
| --- | --- | --- |
| `cameraDirection?` | `"back"` | `"front"` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L30> |
| `formats?` | [`Format`](barcode-scanner.md)[] | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L31> |
| `windowed?` | `boolean` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L32> |

## [Type Aliases](#type-aliases)

### [PermissionState](#permissionstate)

```

type PermissionState: "granted" | "denied" | "prompt" | "prompt-with-rationale";

```

**Source**: undefined

## [Functions](#functions)

### [cancel()](#cancel)

```

function cancel(): Promise<void>

```

Cancel the current scan process.

#### [Returns](#returns)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L52>

---

### [checkPermissions()](#checkpermissions)

```

function checkPermissions(): Promise<PermissionState>

```

Get permission state.

#### [Returns](#returns-1)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`PermissionState`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L59>

---

### [openAppSettings()](#openappsettings)

```

function openAppSettings(): Promise<void>

```

Open application settings. Useful if permission was denied and the user must manually enable it.

#### [Returns](#returns-2)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L77>

---

### [requestPermissions()](#requestpermissions)

```

function requestPermissions(): Promise<PermissionState>

```

Request permissions to use the camera.

#### [Returns](#returns-3)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`PermissionState`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L68>

---

### [scan()](#scan)

```

function scan(options?): Promise<Scanned>

```

Start scanning.

#### [Parameters](#parameters)

| Parameter | Type | Description |
| --- | --- | --- |
| `options`? | [`ScanOptions`](barcode-scanner.md) |  |

#### [Returns](#returns-4)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Scanned`](barcode-scanner.md)>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/barcode-scanner/guest-js/index.ts#L45>

[Previous   
 window](api\namespacewindow.md)   [Next   
 biometric](biometric.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT