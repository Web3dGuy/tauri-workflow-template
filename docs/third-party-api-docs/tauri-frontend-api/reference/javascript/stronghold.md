# @tauri-apps/plugin-stronghold

## [Classes](#classes)

### [Client](#client)

#### [Constructors](#constructors)

##### [new Client()](#new-client)

```

new Client(path, name): Client

```

###### [Parameters](#parameters)

| Parameter | Type |
| --- | --- |
| `path` | `string` |
| `name` | [`ClientPath`](stronghold.md) |

###### [Returns](#returns)

[`Client`](stronghold.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L265>

#### [Properties](#properties)

| Property | Type | Defined in |
| --- | --- | --- |
| `name` | [`ClientPath`](stronghold.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L263> |
| `path` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L262> |

#### [Methods](#methods)

##### [getStore()](#getstore)

```

getStore(): Store

```

###### [Returns](#returns-1)

[`Store`](stronghold.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L280>

##### [getVault()](#getvault)

```

getVault(name): Vault

```

Get a vault by name.

###### [Parameters](#parameters-1)

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | [`VaultPath`](stronghold.md) |  |

###### [Returns](#returns-2)

[`Vault`](stronghold.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L276>

---

### [Location](#location)

#### [Constructors](#constructors-1)

##### [new Location()](#new-location)

```

new Location(type, payload): Location

```

###### [Parameters](#parameters-2)

| Parameter | Type |
| --- | --- |
| `type` | `string` |
| `payload` | [`Record`](https://www.typescriptlang.org/docs/handbook/utility-types.html#recordkeys-type)<`string`, `unknown`> |

###### [Returns](#returns-3)

[`Location`](stronghold.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L86>

#### [Properties](#properties-1)

| Property | Type | Defined in |
| --- | --- | --- |
| `payload` | [`Record`](https://www.typescriptlang.org/docs/handbook/utility-types.html#recordkeys-type)<`string`, `unknown`> | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L84> |
| `type` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L83> |

#### [Methods](#methods-1)

##### [counter()](#counter)

```

static counter(vault, counter): Location

```

###### [Parameters](#parameters-3)

| Parameter | Type |
| --- | --- |
| `vault` | [`VaultPath`](stronghold.md) |
| `counter` | `number` |

###### [Returns](#returns-4)

[`Location`](stronghold.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L98>

##### [generic()](#generic)

```

static generic(vault, record): Location

```

###### [Parameters](#parameters-4)

| Parameter | Type |
| --- | --- |
| `vault` | [`VaultPath`](stronghold.md) |
| `record` | [`RecordPath`](stronghold.md) |

###### [Returns](#returns-5)

[`Location`](stronghold.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L91>

---

### [Store](#store)

#### [Constructors](#constructors-2)

##### [new Store()](#new-store)

```

new Store(path, client): Store

```

###### [Parameters](#parameters-5)

| Parameter | Type |
| --- | --- |
| `path` | `string` |
| `client` | [`ClientPath`](stronghold.md) |

###### [Returns](#returns-6)

[`Store`](stronghold.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L289>

#### [Properties](#properties-2)

| Property | Type | Defined in |
| --- | --- | --- |
| `client` | [`ClientPath`](stronghold.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L287> |
| `path` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L286> |

#### [Methods](#methods-2)

##### [get()](#get)

```

get(key): Promise<null | Uint8Array<ArrayBufferLike>>

```

###### [Parameters](#parameters-6)

| Parameter | Type |
| --- | --- |
| `key` | [`StoreKey`](stronghold.md) |

###### [Returns](#returns-7)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`null` | [`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`>>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L294>

##### [insert()](#insert)

```

insert(

key,

value,

lifetime?): Promise<void>

```

###### [Parameters](#parameters-7)

| Parameter | Type |
| --- | --- |
| `key` | [`StoreKey`](stronghold.md) |
| `value` | `number`[] |
| `lifetime`? | [`Duration`](stronghold.md) |

###### [Returns](#returns-8)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L302>

##### [remove()](#remove)

```

remove(key): Promise<null | Uint8Array<ArrayBufferLike>>

```

###### [Parameters](#parameters-8)

| Parameter | Type |
| --- | --- |
| `key` | [`StoreKey`](stronghold.md) |

###### [Returns](#returns-9)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`null` | [`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`>>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L316>

---

### [Stronghold](#stronghold)

A representation of an access to a stronghold.

#### [Properties](#properties-3)

| Property | Type | Defined in |
| --- | --- | --- |
| `path` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L388> |

#### [Methods](#methods-3)

##### [createClient()](#createclient)

```

createClient(client): Promise<Client>

```

###### [Parameters](#parameters-9)

| Parameter | Type |
| --- | --- |
| `client` | [`ClientPath`](stronghold.md) |

###### [Returns](#returns-10)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Client`](stronghold.md)>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L428>

##### [loadClient()](#loadclient)

```

loadClient(client): Promise<Client>

```

###### [Parameters](#parameters-10)

| Parameter | Type |
| --- | --- |
| `client` | [`ClientPath`](stronghold.md) |

###### [Returns](#returns-11)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Client`](stronghold.md)>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L421>

##### [save()](#save)

```

save(): Promise<void>

```

Persists the stronghold state to the snapshot.

###### [Returns](#returns-12)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L439>

##### [unload()](#unload)

```

unload(): Promise<void>

```

Remove this instance from the cache.

###### [Returns](#returns-13)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L415>

##### [load()](#load)

```

static load(path, password): Promise<Stronghold>

```

Load the snapshot if it exists (password must match), or start a fresh stronghold instance otherwise.

###### [Parameters](#parameters-11)

| Parameter | Type | Description |
| --- | --- | --- |
| `path` | `string` | - |
| `password` | `string` |  |

###### [Returns](#returns-14)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Stronghold`](stronghold.md)>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L405>

---

### [Vault](#vault)

A key-value storage that allows create, update and delete operations.
It does not allow reading the data, so one of the procedures must be used to manipulate
the stored data, allowing secure storage of secrets.

#### [Extends](#extends)

* `ProcedureExecutor`

#### [Constructors](#constructors-3)

##### [new Vault()](#new-vault)

```

new Vault(

path,

client,

name): Vault

```

###### [Parameters](#parameters-12)

| Parameter | Type |
| --- | --- |
| `path` | `string` |
| `client` | [`ClientPath`](stronghold.md) |
| `name` | [`VaultPath`](stronghold.md) |

###### [Returns](#returns-15)

[`Vault`](stronghold.md)

###### [Overrides](#overrides)

`ProcedureExecutor.constructor`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L340>

#### [Properties](#properties-4)

| Property | Type | Description | Inherited from | Defined in |
| --- | --- | --- | --- | --- |
| `client` | [`ClientPath`](stronghold.md) | - | - | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L336> |
| `name` | [`VaultPath`](stronghold.md) | The vault name. | - | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L338> |
| `path` | `string` | The vault path. | - | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L335> |
| `procedureArgs` | [`Record`](https://www.typescriptlang.org/docs/handbook/utility-types.html#recordkeys-type)<`string`, `unknown`> | - | `ProcedureExecutor.procedureArgs` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L107> |

#### [Methods](#methods-4)

##### [deriveSLIP10()](#deriveslip10)

```

deriveSLIP10(

chain,

source,

sourceLocation,

outputLocation): Promise<Uint8Array<ArrayBufferLike>>

```

Derive a SLIP10 private key using a seed or key.

###### [Parameters](#parameters-13)

| Parameter | Type | Description |
| --- | --- | --- |
| `chain` | `number`[] | The chain path. |
| `source` | `"Seed"` | `"Key"` | The source type, either ‘Seed’ or ‘Key’. |
| `sourceLocation` | [`Location`](stronghold.md) | The source location, must be the `outputLocation` of a previous call to `generateSLIP10Seed` or `deriveSLIP10`. |
| `outputLocation` | [`Location`](stronghold.md) | Location of the record where the private key will be stored. |

###### [Returns](#returns-16)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`>>

###### [Inherited from](#inherited-from)

`ProcedureExecutor.deriveSLIP10`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L145>

##### [generateBIP39()](#generatebip39)

```

generateBIP39(outputLocation, passphrase?): Promise<Uint8Array<ArrayBufferLike>>

```

Generate a BIP39 seed.

###### [Parameters](#parameters-14)

| Parameter | Type | Description |
| --- | --- | --- |
| `outputLocation` | [`Location`](stronghold.md) | The location of the record where the BIP39 seed will be stored. |
| `passphrase`? | `string` | The optional mnemonic passphrase. |

###### [Returns](#returns-17)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`>>

###### [Inherited from](#inherited-from-1)

`ProcedureExecutor.generateBIP39`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L200>

##### [generateSLIP10Seed()](#generateslip10seed)

```

generateSLIP10Seed(outputLocation, sizeBytes?): Promise<Uint8Array<ArrayBufferLike>>

```

Generate a SLIP10 seed for the given location.

###### [Parameters](#parameters-15)

| Parameter | Type | Description |
| --- | --- | --- |
| `outputLocation` | [`Location`](stronghold.md) | Location of the record where the seed will be stored. |
| `sizeBytes`? | `number` | The size in bytes of the SLIP10 seed. |

###### [Returns](#returns-18)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`>>

###### [Inherited from](#inherited-from-2)

`ProcedureExecutor.generateSLIP10Seed`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L120>

##### [getEd25519PublicKey()](#geted25519publickey)

```

getEd25519PublicKey(privateKeyLocation): Promise<Uint8Array<ArrayBufferLike>>

```

Gets the Ed25519 public key of a SLIP10 private key.

###### [Parameters](#parameters-16)

| Parameter | Type | Description |
| --- | --- | --- |
| `privateKeyLocation` | [`Location`](stronghold.md) | The location of the private key. Must be the `outputLocation` of a previous call to `deriveSLIP10`. |

###### [Returns](#returns-19)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`>>

A promise resolving to the public key hex string.

###### [Since](#since)

2.0.0

###### [Inherited from](#inherited-from-3)

`ProcedureExecutor.getEd25519PublicKey`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L223>

##### [insert()](#insert-1)

```

insert(recordPath, secret): Promise<void>

```

Insert a record to this vault.

###### [Parameters](#parameters-17)

| Parameter | Type |
| --- | --- |
| `recordPath` | [`RecordPath`](stronghold.md) |
| `secret` | `number`[] |

###### [Returns](#returns-20)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L358>

##### [recoverBIP39()](#recoverbip39)

```

recoverBIP39(

mnemonic,

outputLocation,

passphrase?): Promise<Uint8Array<ArrayBufferLike>>

```

Store a BIP39 mnemonic.

###### [Parameters](#parameters-18)

| Parameter | Type | Description |
| --- | --- | --- |
| `mnemonic` | `string` | The mnemonic string. |
| `outputLocation` | [`Location`](stronghold.md) | The location of the record where the BIP39 mnemonic will be stored. |
| `passphrase`? | `string` | The optional mnemonic passphrase. |

###### [Returns](#returns-21)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`>>

###### [Inherited from](#inherited-from-4)

`ProcedureExecutor.recoverBIP39`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L175>

##### [remove()](#remove-1)

```

remove(location): Promise<void>

```

Remove a record from the vault.

###### [Parameters](#parameters-19)

| Parameter | Type | Description |
| --- | --- | --- |
| `location` | [`Location`](stronghold.md) | The record location. |

###### [Returns](#returns-22)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L374>

##### [signEd25519()](#signed25519)

```

signEd25519(privateKeyLocation, msg): Promise<Uint8Array<ArrayBufferLike>>

```

Creates a Ed25519 signature from a private key.

###### [Parameters](#parameters-20)

| Parameter | Type | Description |
| --- | --- | --- |
| `privateKeyLocation` | [`Location`](stronghold.md) | The location of the record where the private key is stored. Must be the `outputLocation` of a previous call to `deriveSLIP10`. |
| `msg` | `string` | The message to sign. |

###### [Returns](#returns-23)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`>>

A promise resolving to the signature hex string.

###### [Since](#since-1)

2.0.0

###### [Inherited from](#inherited-from-5)

`ProcedureExecutor.signEd25519`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L244>

## [Interfaces](#interfaces)

### [AddressInfo](#addressinfo)

#### [Properties](#properties-5)

| Property | Type | Defined in |
| --- | --- | --- |
| `peers` | [`Map`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Map)<`string`, [`PeerAddress`](stronghold.md)> | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L43> |
| `relays` | `string`[] | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L44> |

---

### [ClientAccess](#clientaccess)

#### [Properties](#properties-6)

| Property | Type | Defined in |
| --- | --- | --- |
| `cloneVaultDefault?` | `boolean` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L52> |
| `cloneVaultExceptions?` | [`Map`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Map)<[`VaultPath`](stronghold.md), `boolean`> | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L53> |
| `readStore?` | `boolean` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L54> |
| `useVaultDefault?` | `boolean` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L48> |
| `useVaultExceptions?` | [`Map`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Map)<[`VaultPath`](stronghold.md), `boolean`> | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L49> |
| `writeStore?` | `boolean` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L55> |
| `writeVaultDefault?` | `boolean` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L50> |
| `writeVaultExceptions?` | [`Map`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Map)<[`VaultPath`](stronghold.md), `boolean`> | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L51> |

---

### [ConnectionLimits](#connectionlimits)

#### [Properties](#properties-7)

| Property | Type | Defined in |
| --- | --- | --- |
| `maxEstablishedIncoming?` | `number` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L31> |
| `maxEstablishedOutgoing?` | `number` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L32> |
| `maxEstablishedPerPeer?` | `number` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L33> |
| `maxEstablishedTotal?` | `number` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L34> |
| `maxPendingIncoming?` | `number` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L29> |
| `maxPendingOutgoing?` | `number` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L30> |

---

### [Duration](#duration)

A duration definition.

#### [Properties](#properties-8)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `nanos` | `number` | The fractional part of this Duration, in nanoseconds. Must be greater or equal to 0 and smaller than 1e+9 (the max number of nanoseoncds in a second) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L79> |
| `secs` | `number` | The number of whole seconds contained by this Duration. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L77> |

---

### [NetworkConfig](#networkconfig)

#### [Properties](#properties-9)

| Property | Type | Defined in |
| --- | --- | --- |
| `addresses?` | [`AddressInfo`](stronghold.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L69> |
| `connectionsLimit?` | [`ConnectionLimits`](stronghold.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L66> |
| `connectionTimeout?` | [`Duration`](stronghold.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L65> |
| `enableMdns?` | `boolean` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L67> |
| `enableRelay?` | `boolean` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L68> |
| `peerPermissions?` | [`Map`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Map)<`string`, [`Permissions`](stronghold.md)> | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L70> |
| `permissionsDefault?` | [`Permissions`](stronghold.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L71> |
| `requestTimeout?` | [`Duration`](stronghold.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L64> |

---

### [PeerAddress](#peeraddress)

#### [Properties](#properties-10)

| Property | Type | Defined in |
| --- | --- | --- |
| `known` | `string`[] | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L38> |
| `use_relay_fallback` | `boolean` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L39> |

---

### [Permissions](#permissions)

#### [Properties](#properties-11)

| Property | Type | Defined in |
| --- | --- | --- |
| `default?` | [`ClientAccess`](stronghold.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L59> |
| `exceptions?` | [`Map`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Map)<[`VaultPath`](stronghold.md), [`ClientAccess`](stronghold.md)> | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L60> |

## [Type Aliases](#type-aliases)

### [ClientPath](#clientpath)

```

type ClientPath: string | Iterable<number> | ArrayLike<number> | ArrayBuffer;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L7>

---

### [RecordPath](#recordpath)

```

type RecordPath: string | Iterable<number> | ArrayLike<number> | ArrayBuffer;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L17>

---

### [StoreKey](#storekey)

```

type StoreKey: string | Iterable<number> | ArrayLike<number> | ArrayBuffer;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L22>

---

### [VaultPath](#vaultpath)

```

type VaultPath: string | Iterable<number> | ArrayLike<number> | ArrayBuffer;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/stronghold/guest-js/index.ts#L12>

[Previous   
 store](store.md)   [Next   
 updater](updater.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT