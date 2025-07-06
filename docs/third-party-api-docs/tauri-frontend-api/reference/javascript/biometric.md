# @tauri-apps/plugin-biometric

## [Enumerations](#enumerations)

### [BiometryType](#biometrytype)

#### [Enumeration Members](#enumeration-members)

##### [FaceID](#faceid)

```

FaceID: 2;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/biometric/guest-js/index.ts#L12>

##### [Iris](#iris)

```

Iris: 3;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/biometric/guest-js/index.ts#L14>

##### [None](#none)

```

None: 0;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/biometric/guest-js/index.ts#L8>

##### [TouchID](#touchid)

```

TouchID: 1;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/biometric/guest-js/index.ts#L10>

## [Interfaces](#interfaces)

### [AuthOptions](#authoptions)

#### [Properties](#properties)

| Property | Type | Defined in |
| --- | --- | --- |
| `allowDeviceCredential?` | `boolean` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/biometric/guest-js/index.ts#L36> |
| `cancelTitle?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/biometric/guest-js/index.ts#L37> |
| `confirmationRequired?` | `boolean` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/biometric/guest-js/index.ts#L45> |
| `fallbackTitle?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/biometric/guest-js/index.ts#L40> |
| `maxAttemps?` | `number` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/biometric/guest-js/index.ts#L46> |
| `subtitle?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/biometric/guest-js/index.ts#L44> |
| `title?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/biometric/guest-js/index.ts#L43> |

---

### [Status](#status)

#### [Properties](#properties-1)

| Property | Type | Defined in |
| --- | --- | --- |
| `biometryType` | [`BiometryType`](biometric.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/biometric/guest-js/index.ts#L19> |
| `error?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/biometric/guest-js/index.ts#L20> |
| `errorCode?` | | `"appCancel"` | `"authenticationFailed"` | `"invalidContext"` | `"notInteractive"` | `"passcodeNotSet"` | `"systemCancel"` | `"userCancel"` | `"userFallback"` | `"biometryLockout"` | `"biometryNotAvailable"` | `"biometryNotEnrolled"` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/biometric/guest-js/index.ts#L21> |
| `isAvailable` | `boolean` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/biometric/guest-js/index.ts#L18> |

## [Functions](#functions)

### [authenticate()](#authenticate)

```

function authenticate(reason, options?): Promise<void>

```

Prompts the user for authentication using the system interface (touchID, faceID or Android Iris).
Rejects if the authentication fails.

```

import { authenticate } from "@tauri-apps/plugin-biometric";

await authenticate('Open your wallet');

```

#### [Parameters](#parameters)

| Parameter | Type | Description |
| --- | --- | --- |
| `reason` | `string` |  |
| `options`? | [`AuthOptions`](biometric.md) |  |

#### [Returns](#returns)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/biometric/guest-js/index.ts#L69>

---

### [checkStatus()](#checkstatus)

```

function checkStatus(): Promise<Status>

```

Checks if the biometric authentication is available.

#### [Returns](#returns-1)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Status`](biometric.md)>

a promise resolving to an object containing all the information about the status of the biometry.

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/biometric/guest-js/index.ts#L53>

[Previous   
 barcode-scanner](barcode-scanner.md)   [Next   
 cli](cli.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT