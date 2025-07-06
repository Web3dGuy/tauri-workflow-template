# @tauri-apps/plugin-store

## [Classes](#classes)

### [LazyStore](#lazystore)

A lazy loaded key-value store persisted by the backend layer.

#### [Implements](#implements)

* `IStore`

#### [Constructors](#constructors)

##### [new LazyStore()](#new-lazystore)

```

new LazyStore(path, options?): LazyStore

```

Note that the options are not applied if someone else already created the store

###### [Parameters](#parameters)

| Parameter | Type | Description |
| --- | --- | --- |
| `path` | `string` | Path to save the store in `app_data_dir` |
| `options`? | [`StoreOptions`](store.md) | Store configuration options |

###### [Returns](#returns)

[`LazyStore`](store.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L96>

#### [Methods](#methods)

##### [clear()](#clear)

```

clear(): Promise<void>

```

Clears the store, removing all key-value pairs.

Note: To clear the storage and reset it to its `default` value, use [`reset`](store.md) instead.

###### [Returns](#returns-1)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Implementation of](#implementation-of)

`IStore.clear`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L124>

##### [close()](#close)

```

close(): Promise<void>

```

Close the store and cleans up this resource from memory.
**You should not call any method on this object anymore and should drop any reference to it.**

###### [Returns](#returns-2)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Implementation of](#implementation-of-1)

`IStore.close`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L169>

##### [delete()](#delete)

```

delete(key): Promise<boolean>

```

Removes a key-value pair from the store.

###### [Parameters](#parameters-1)

| Parameter | Type | Description |
| --- | --- | --- |
| `key` | `string` |  |

###### [Returns](#returns-3)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

###### [Implementation of](#implementation-of-2)

`IStore.delete`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L120>

##### [entries()](#entries)

```

entries<T>(): Promise<[string, T][]>

```

Returns a list of all entries in the store.

###### [Type Parameters](#type-parameters)

| Type Parameter |
| --- |
| `T` |

###### [Returns](#returns-4)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`string`, `T`][]>

###### [Implementation of](#implementation-of-3)

`IStore.entries`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L140>

##### [get()](#get)

```

get<T>(key): Promise<undefined | T>

```

Returns the value for the given `key` or `undefined` if the key does not exist.

###### [Type Parameters](#type-parameters-1)

| Type Parameter |
| --- |
| `T` |

###### [Parameters](#parameters-2)

| Parameter | Type | Description |
| --- | --- | --- |
| `key` | `string` |  |

###### [Returns](#returns-5)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`undefined` | `T`>

###### [Implementation of](#implementation-of-4)

`IStore.get`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L112>

##### [has()](#has)

```

has(key): Promise<boolean>

```

Returns `true` if the given `key` exists in the store.

###### [Parameters](#parameters-3)

| Parameter | Type | Description |
| --- | --- | --- |
| `key` | `string` |  |

###### [Returns](#returns-6)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

###### [Implementation of](#implementation-of-5)

`IStore.has`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L116>

##### [init()](#init)

```

init(): Promise<void>

```

Init/load the store if it’s not loaded already

###### [Returns](#returns-7)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L104>

##### [keys()](#keys)

```

keys(): Promise<string[]>

```

Returns a list of all keys in the store.

###### [Returns](#returns-8)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`[]>

###### [Implementation of](#implementation-of-6)

`IStore.keys`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L132>

##### [length()](#length)

```

length(): Promise<number>

```

Returns the number of key-value pairs in the store.

###### [Returns](#returns-9)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`number`>

###### [Implementation of](#implementation-of-7)

`IStore.length`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L144>

##### [onChange()](#onchange)

```

onChange<T>(cb): Promise<UnlistenFn>

```

Listen to changes on the store.

###### [Type Parameters](#type-parameters-2)

| Type Parameter |
| --- |
| `T` |

###### [Parameters](#parameters-4)

| Parameter | Type | Description |
| --- | --- | --- |
| `cb` | (`key`, `value`) => `void` |  |

###### [Returns](#returns-10)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`UnlistenFn`>

A promise resolving to a function to unlisten to the event.

###### [Since](#since)

2.0.0

###### [Implementation of](#implementation-of-8)

`IStore.onChange`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L163>

##### [onKeyChange()](#onkeychange)

```

onKeyChange<T>(key, cb): Promise<UnlistenFn>

```

Listen to changes on a store key.

###### [Type Parameters](#type-parameters-3)

| Type Parameter |
| --- |
| `T` |

###### [Parameters](#parameters-5)

| Parameter | Type | Description |
| --- | --- | --- |
| `key` | `string` |  |
| `cb` | (`value`) => `void` |  |

###### [Returns](#returns-11)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`UnlistenFn`>

A promise resolving to a function to unlisten to the event.

###### [Since](#since-1)

2.0.0

###### [Implementation of](#implementation-of-9)

`IStore.onKeyChange`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L156>

##### [reload()](#reload)

```

reload(): Promise<void>

```

Attempts to load the on-disk state at the store’s `path` into memory.

This method is useful if the on-disk state was edited by the user and you want to synchronize the changes.

Note: This method does not emit change events.

###### [Returns](#returns-12)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Implementation of](#implementation-of-10)

`IStore.reload`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L148>

##### [reset()](#reset)

```

reset(): Promise<void>

```

Resets the store to its `default` value.

If no default value has been set, this method behaves identical to [`clear`](store.md).

###### [Returns](#returns-13)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Implementation of](#implementation-of-11)

`IStore.reset`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L128>

##### [save()](#save)

```

save(): Promise<void>

```

Saves the store to disk at the store’s `path`.

###### [Returns](#returns-14)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Implementation of](#implementation-of-12)

`IStore.save`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L152>

##### [set()](#set)

```

set(key, value): Promise<void>

```

Inserts a key-value pair into the store.

###### [Parameters](#parameters-6)

| Parameter | Type | Description |
| --- | --- | --- |
| `key` | `string` |  |
| `value` | `unknown` |  |

###### [Returns](#returns-15)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Implementation of](#implementation-of-13)

`IStore.set`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L108>

##### [values()](#values)

```

values<T>(): Promise<T[]>

```

Returns a list of all values in the store.

###### [Type Parameters](#type-parameters-4)

| Type Parameter |
| --- |
| `T` |

###### [Returns](#returns-16)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`T`[]>

###### [Implementation of](#implementation-of-14)

`IStore.values`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L136>

---

### [Store](#store)

A key-value store persisted by the backend layer.

#### [Extends](#extends)

* `Resource`

#### [Implements](#implements-1)

* `IStore`

#### [Accessors](#accessors)

##### [rid](#rid)

###### [Get Signature](#get-signature)

```

get rid(): number

```

###### [Returns](#returns-17)

`number`

###### [Inherited from](#inherited-from)

`Resource.rid`

**Source**: undefined

#### [Methods](#methods-1)

##### [clear()](#clear-1)

```

clear(): Promise<void>

```

Clears the store, removing all key-value pairs.

Note: To clear the storage and reset it to its `default` value, use [`reset`](store.md) instead.

###### [Returns](#returns-18)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Implementation of](#implementation-of-15)

`IStore.clear`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L259>

##### [close()](#close-1)

```

close(): Promise<void>

```

Destroys and cleans up this resource from memory.
**You should not call any method on this object anymore and should drop any reference to it.**

###### [Returns](#returns-19)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Implementation of](#implementation-of-16)

`IStore.close`

###### [Inherited from](#inherited-from-1)

`Resource.close`

**Source**: undefined

##### [delete()](#delete-1)

```

delete(key): Promise<boolean>

```

Removes a key-value pair from the store.

###### [Parameters](#parameters-7)

| Parameter | Type | Description |
| --- | --- | --- |
| `key` | `string` |  |

###### [Returns](#returns-20)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

###### [Implementation of](#implementation-of-17)

`IStore.delete`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L252>

##### [entries()](#entries-1)

```

entries<T>(): Promise<[string, T][]>

```

Returns a list of all entries in the store.

###### [Type Parameters](#type-parameters-5)

| Type Parameter |
| --- |
| `T` |

###### [Returns](#returns-21)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`string`, `T`][]>

###### [Implementation of](#implementation-of-18)

`IStore.entries`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L275>

##### [get()](#get-1)

```

get<T>(key): Promise<undefined | T>

```

Returns the value for the given `key` or `undefined` if the key does not exist.

###### [Type Parameters](#type-parameters-6)

| Type Parameter |
| --- |
| `T` |

###### [Parameters](#parameters-8)

| Parameter | Type | Description |
| --- | --- | --- |
| `key` | `string` |  |

###### [Returns](#returns-22)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`undefined` | `T`>

###### [Implementation of](#implementation-of-19)

`IStore.get`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L237>

##### [has()](#has-1)

```

has(key): Promise<boolean>

```

Returns `true` if the given `key` exists in the store.

###### [Parameters](#parameters-9)

| Parameter | Type | Description |
| --- | --- | --- |
| `key` | `string` |  |

###### [Returns](#returns-23)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

###### [Implementation of](#implementation-of-20)

`IStore.has`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L245>

##### [keys()](#keys-1)

```

keys(): Promise<string[]>

```

Returns a list of all keys in the store.

###### [Returns](#returns-24)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`string`[]>

###### [Implementation of](#implementation-of-21)

`IStore.keys`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L267>

##### [length()](#length-1)

```

length(): Promise<number>

```

Returns the number of key-value pairs in the store.

###### [Returns](#returns-25)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`number`>

###### [Implementation of](#implementation-of-22)

`IStore.length`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L279>

##### [onChange()](#onchange-1)

```

onChange<T>(cb): Promise<UnlistenFn>

```

Listen to changes on the store.

###### [Type Parameters](#type-parameters-7)

| Type Parameter |
| --- |
| `T` |

###### [Parameters](#parameters-10)

| Parameter | Type | Description |
| --- | --- | --- |
| `cb` | (`key`, `value`) => `void` |  |

###### [Returns](#returns-26)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`UnlistenFn`>

A promise resolving to a function to unlisten to the event.

###### [Since](#since-2)

2.0.0

###### [Implementation of](#implementation-of-23)

`IStore.onChange`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L302>

##### [onKeyChange()](#onkeychange-1)

```

onKeyChange<T>(key, cb): Promise<UnlistenFn>

```

Listen to changes on a store key.

###### [Type Parameters](#type-parameters-8)

| Type Parameter |
| --- |
| `T` |

###### [Parameters](#parameters-11)

| Parameter | Type | Description |
| --- | --- | --- |
| `key` | `string` |  |
| `cb` | (`value`) => `void` |  |

###### [Returns](#returns-27)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`UnlistenFn`>

A promise resolving to a function to unlisten to the event.

###### [Since](#since-3)

2.0.0

###### [Implementation of](#implementation-of-24)

`IStore.onKeyChange`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L291>

##### [reload()](#reload-1)

```

reload(): Promise<void>

```

Attempts to load the on-disk state at the store’s `path` into memory.

This method is useful if the on-disk state was edited by the user and you want to synchronize the changes.

Note: This method does not emit change events.

###### [Returns](#returns-28)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Implementation of](#implementation-of-25)

`IStore.reload`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L283>

##### [reset()](#reset-1)

```

reset(): Promise<void>

```

Resets the store to its `default` value.

If no default value has been set, this method behaves identical to [`clear`](store.md).

###### [Returns](#returns-29)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Implementation of](#implementation-of-26)

`IStore.reset`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L263>

##### [save()](#save-1)

```

save(): Promise<void>

```

Saves the store to disk at the store’s `path`.

###### [Returns](#returns-30)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Implementation of](#implementation-of-27)

`IStore.save`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L287>

##### [set()](#set-1)

```

set(key, value): Promise<void>

```

Inserts a key-value pair into the store.

###### [Parameters](#parameters-12)

| Parameter | Type | Description |
| --- | --- | --- |
| `key` | `string` |  |
| `value` | `unknown` |  |

###### [Returns](#returns-31)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

###### [Implementation of](#implementation-of-28)

`IStore.set`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L229>

##### [values()](#values-1)

```

values<T>(): Promise<T[]>

```

Returns a list of all values in the store.

###### [Type Parameters](#type-parameters-9)

| Type Parameter |
| --- |
| `T` |

###### [Returns](#returns-32)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`T`[]>

###### [Implementation of](#implementation-of-29)

`IStore.values`

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L271>

##### [get()](#get-2)

```

static get(path): Promise<null | Store>

```

Gets an already loaded store.

If the store is not loaded, returns `null`. In this case you must [load](store.md) it.

This function is more useful when you already know the store is loaded
and just need to access its instance. Prefer [Store.load](store.md) otherwise.

###### [Parameters](#parameters-13)

| Parameter | Type | Description |
| --- | --- | --- |
| `path` | `string` | Path of the store. |

###### [Returns](#returns-33)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`null` | [`Store`](store.md)>

###### [Example](#example)

```

import { Store } from '@tauri-apps/api/store';

let store = await Store.get('store.json');

if (!store) {

store = await Store.load('store.json');

}

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L223>

##### [load()](#load)

```

static load(path, options?): Promise<Store>

```

Create a new Store or load the existing store with the path.

###### [Parameters](#parameters-14)

| Parameter | Type | Description |
| --- | --- | --- |
| `path` | `string` | Path to save the store in `app_data_dir` |
| `options`? | [`StoreOptions`](store.md) | Store configuration options |

###### [Returns](#returns-34)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Store`](store.md)>

###### [Example](#example-1)

```

import { Store } from '@tauri-apps/api/store';

const store = await Store.load('store.json');

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L196>

## [Type Aliases](#type-aliases)

### [StoreOptions](#storeoptions)

```

type StoreOptions: object;

```

Options to create a store

#### [Type declaration](#type-declaration)

| Name | Type | Description | Defined in |
| --- | --- | --- | --- |
| `autoSave`? | `boolean` | `number` | Auto save on modification with debounce duration in milliseconds, it’s 100ms by default, pass in `false` to disable it | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L24> |
| `createNew`? | `boolean` | Force create a new store with default values even if it already exists. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L36> |
| `deserializeFnName`? | `string` | Name of a deserialize function registered in the rust side plugin builder | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L32> |
| `serializeFnName`? | `string` | Name of a serialize function registered in the rust side plugin builder | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L28> |

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L20>

## [Functions](#functions)

### [getStore()](#getstore)

```

function getStore(path): Promise<Store | null>

```

Gets an already loaded store.

If the store is not loaded, returns `null`. In this case you must [load](store.md) it.

This function is more useful when you already know the store is loaded
and just need to access its instance. Prefer [Store.load](store.md) otherwise.

#### [Parameters](#parameters-15)

| Parameter | Type | Description |
| --- | --- | --- |
| `path` | `string` | Path of the store. |

#### [Returns](#returns-35)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Store`](store.md) | `null`>

#### [Example](#example-2)

```

import { getStore } from '@tauri-apps/api/store';

const store = await getStore('store.json');

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L74>

---

### [load()](#load-1)

```

function load(path, options?): Promise<Store>

```

Create a new Store or load the existing store with the path.

#### [Parameters](#parameters-16)

| Parameter | Type | Description |
| --- | --- | --- |
| `path` | `string` | Path to save the store in `app_data_dir` |
| `options`? | [`StoreOptions`](store.md) | Store configuration options |

#### [Returns](#returns-36)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Store`](store.md)>

#### [Example](#example-3)

```

import { Store } from '@tauri-apps/api/store';

const store = await Store.load('store.json');

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/store/guest-js/index.ts#L51>

[Previous   
 sql](sql.md)   [Next   
 stronghold](stronghold.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT