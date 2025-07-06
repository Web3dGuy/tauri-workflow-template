# @tauri-apps/plugin-shell

Access the system shell.
Allows you to spawn child processes and manage files and URLs using their default application.

## [Security](#security)

This API has a scope configuration that forces you to restrict the programs and arguments that can be used.

### [Restricting access to the](#restricting-access-to-the-open-api) [`open`](shell.md) API

On the configuration object, `open: true` means that the [open](shell.md) API can be used with any URL,
as the argument is validated with the `^((mailto:\w+)|(tel:\w+)|(https?://\w+)).+` regex.
You can change that regex by changing the boolean value to a string, e.g. `open: ^https://github.com/`.

### [Restricting access to the](#restricting-access-to-the-command-apis) [`Command`](shell.md) APIs

The plugin permissions object has a `scope` field that defines an array of CLIs that can be used.
Each CLI is a configuration object `{ name: string, cmd: string, sidecar?: bool, args?: boolean | Arg[] }`.

* `name`: the unique identifier of the command, passed to the [Command.create function](shell.md).
  If it’s a sidecar, this must be the value defined on `tauri.conf.json > bundle > externalBin`.
* `cmd`: the program that is executed on this configuration. If it’s a sidecar, this value is ignored.
* `sidecar`: whether the object configures a sidecar or a system program.
* `args`: the arguments that can be passed to the program. By default no arguments are allowed.
  + `true` means that any argument list is allowed.
  + `false` means that no arguments are allowed.
  + otherwise an array can be configured. Each item is either a string representing the fixed argument value
    or a `{ validator: string }` that defines a regex validating the argument value.

#### [Example scope configuration](#example-scope-configuration)

CLI: `git commit -m "the commit message"`

Capability:

```

{

"permissions": [

{

"identifier": "shell:allow-execute",

"allow": [

{

"name": "run-git-commit",

"cmd": "git",

"args": ["commit", "-m", { "validator": "\\S+" }]

}

]

}

]

}

```

Usage:

```

import { Command } from '@tauri-apps/plugin-shell'

Command.create('run-git-commit', ['commit', '-m', 'the commit message'])

```

Trying to execute any API with a program not configured on the scope results in a promise rejection due to denied access.

## [Classes](#classes)

### [Child](#child)

#### [Since](#since)

2.0.0

#### [Constructors](#constructors)

##### [new Child()](#new-child)

```

new Child(pid): Child

```

###### [Parameters](#parameters)

| Parameter | Type |
| --- | --- |
| `pid` | `number` |

###### [Returns](#returns)

[`Child`](shell.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L301>

#### [Properties](#properties)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `pid` | `number` | The child process `pid`. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L299> |

#### [Methods](#methods)

##### [kill()](#kill)

```

kill(): Promise<void>

```

Kills the child process.

###### [Returns](#returns-1)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Since](#since-1)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L336>

##### [write()](#write)

```

write(data): Promise<void>

```

Writes `data` to the `stdin`.

###### [Parameters](#parameters-1)

| Parameter | Type | Description |
| --- | --- | --- |
| `data` | [`IOPayload`](shell.md) | `number`[] | The message to write, either a string or a byte array. |

###### [Returns](#returns-2)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

###### [Example](#example)

```

import { Command } from '@tauri-apps/plugin-shell';

const command = Command.create('node');

const child = await command.spawn();

await child.write('message');

await child.write([0, 1, 2, 3, 4, 5]);

```

###### [Since](#since-2)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L322>

---

### [Command<O>](#commando)

The entry point for spawning child processes.
It emits the `close` and `error` events.

#### [Example](#example-1)

```

import { Command } from '@tauri-apps/plugin-shell';

const command = Command.create('node');

command.on('close', data => {

console.log(`command finished with code ${data.code} and signal ${data.signal}`)

});

command.on('error', error => console.error(`command error: "${error}"`));

command.stdout.on('data', line => console.log(`command stdout: "${line}"`));

command.stderr.on('data', line => console.log(`command stderr: "${line}"`));

const child = await command.spawn();

console.log('pid:', child.pid);

```

#### [Since](#since-3)

2.0.0

#### [Extends](#extends)

* [`EventEmitter`](shell.md)<[`CommandEvents`](shell.md)>

#### [Type Parameters](#type-parameters)

| Type Parameter |
| --- |
| `O` *extends* [`IOPayload`](shell.md) |

#### [Properties](#properties-1)

| Property | Modifier | Type | Description | Defined in |
| --- | --- | --- | --- | --- |
| `stderr` | `readonly` | [`EventEmitter`](shell.md)<[`OutputEvents`](shell.md)<`O`>> | Event emitter for the `stderr`. Emits the `data` event. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L384> |
| `stdout` | `readonly` | [`EventEmitter`](shell.md)<[`OutputEvents`](shell.md)<`O`>> | Event emitter for the `stdout`. Emits the `data` event. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L382> |

#### [Methods](#methods-1)

##### [addListener()](#addlistener)

```

addListener<N>(eventName, listener): this

```

Alias for `emitter.on(eventName, listener)`.

###### [Type Parameters](#type-parameters-1)

| Type Parameter |
| --- |
| `N` *extends* keyof [`CommandEvents`](shell.md) |

###### [Parameters](#parameters-2)

| Parameter | Type |
| --- | --- |
| `eventName` | `N` |
| `listener` | (`arg`) => `void` |

###### [Returns](#returns-3)

`this`

###### [Since](#since-4)

2.0.0

###### [Inherited from](#inherited-from)

[`EventEmitter`](shell.md).[`addListener`](shell.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L118>

##### [execute()](#execute)

```

execute(): Promise<ChildProcess<O>>

```

Executes the command as a child process, waiting for it to finish and collecting all of its output.

###### [Returns](#returns-4)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`ChildProcess`](shell.md)<`O`>>

A promise resolving to the child process output.

###### [Example](#example-2)

```

import { Command } from '@tauri-apps/plugin-shell';

const output = await Command.create('echo', 'message').execute();

assert(output.code === 0);

assert(output.signal === null);

assert(output.stdout === 'message');

assert(output.stderr === '');

```

###### [Since](#since-5)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L530>

##### [listenerCount()](#listenercount)

```

listenerCount<N>(eventName): number

```

Returns the number of listeners listening to the event named `eventName`.

###### [Type Parameters](#type-parameters-2)

| Type Parameter |
| --- |
| `N` *extends* keyof [`CommandEvents`](shell.md) |

###### [Parameters](#parameters-3)

| Parameter | Type |
| --- | --- |
| `eventName` | `N` |

###### [Returns](#returns-5)

`number`

###### [Since](#since-6)

2.0.0

###### [Inherited from](#inherited-from-1)

[`EventEmitter`](shell.md).[`listenerCount`](shell.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L241>

##### [off()](#off)

```

off<N>(eventName, listener): this

```

Removes the all specified listener from the listener array for the event eventName
Returns a reference to the `EventEmitter`, so that calls can be chained.

###### [Type Parameters](#type-parameters-3)

| Type Parameter |
| --- |
| `N` *extends* keyof [`CommandEvents`](shell.md) |

###### [Parameters](#parameters-4)

| Parameter | Type |
| --- | --- |
| `eventName` | `N` |
| `listener` | (`arg`) => `void` |

###### [Returns](#returns-6)

`this`

###### [Since](#since-7)

2.0.0

###### [Inherited from](#inherited-from-2)

[`EventEmitter`](shell.md).[`off`](shell.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L186>

##### [on()](#on)

```

on<N>(eventName, listener): this

```

Adds the `listener` function to the end of the listeners array for the
event named `eventName`. No checks are made to see if the `listener` has
already been added. Multiple calls passing the same combination of `eventName`and `listener` will result in the `listener` being added, and called, multiple
times.

Returns a reference to the `EventEmitter`, so that calls can be chained.

###### [Type Parameters](#type-parameters-4)

| Type Parameter |
| --- |
| `N` *extends* keyof [`CommandEvents`](shell.md) |

###### [Parameters](#parameters-5)

| Parameter | Type |
| --- | --- |
| `eventName` | `N` |
| `listener` | (`arg`) => `void` |

###### [Returns](#returns-7)

`this`

###### [Since](#since-8)

2.0.0

###### [Inherited from](#inherited-from-3)

[`EventEmitter`](shell.md).[`on`](shell.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L147>

##### [once()](#once)

```

once<N>(eventName, listener): this

```

Adds a **one-time**`listener` function for the event named `eventName`. The
next time `eventName` is triggered, this listener is removed and then invoked.

Returns a reference to the `EventEmitter`, so that calls can be chained.

###### [Type Parameters](#type-parameters-5)

| Type Parameter |
| --- |
| `N` *extends* keyof [`CommandEvents`](shell.md) |

###### [Parameters](#parameters-6)

| Parameter | Type |
| --- | --- |
| `eventName` | `N` |
| `listener` | (`arg`) => `void` |

###### [Returns](#returns-8)

`this`

###### [Since](#since-9)

2.0.0

###### [Inherited from](#inherited-from-4)

[`EventEmitter`](shell.md).[`once`](shell.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L169>

##### [prependListener()](#prependlistener)

```

prependListener<N>(eventName, listener): this

```

Adds the `listener` function to the *beginning* of the listeners array for the
event named `eventName`. No checks are made to see if the `listener` has
already been added. Multiple calls passing the same combination of `eventName`and `listener` will result in the `listener` being added, and called, multiple
times.

Returns a reference to the `EventEmitter`, so that calls can be chained.

###### [Type Parameters](#type-parameters-6)

| Type Parameter |
| --- |
| `N` *extends* keyof [`CommandEvents`](shell.md) |

###### [Parameters](#parameters-7)

| Parameter | Type |
| --- | --- |
| `eventName` | `N` |
| `listener` | (`arg`) => `void` |

###### [Returns](#returns-9)

`this`

###### [Since](#since-10)

2.0.0

###### [Inherited from](#inherited-from-5)

[`EventEmitter`](shell.md).[`prependListener`](shell.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L258>

##### [prependOnceListener()](#prependoncelistener)

```

prependOnceListener<N>(eventName, listener): this

```

Adds a **one-time**`listener` function for the event named `eventName` to the\_beginning\_ of the listeners array. The next time `eventName` is triggered, this
listener is removed, and then invoked.

Returns a reference to the `EventEmitter`, so that calls can be chained.

###### [Type Parameters](#type-parameters-7)

| Type Parameter |
| --- |
| `N` *extends* keyof [`CommandEvents`](shell.md) |

###### [Parameters](#parameters-8)

| Parameter | Type |
| --- | --- |
| `eventName` | `N` |
| `listener` | (`arg`) => `void` |

###### [Returns](#returns-10)

`this`

###### [Since](#since-11)

2.0.0

###### [Inherited from](#inherited-from-6)

[`EventEmitter`](shell.md).[`prependOnceListener`](shell.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L280>

##### [removeAllListeners()](#removealllisteners)

```

removeAllListeners<N>(event?): this

```

Removes all listeners, or those of the specified eventName.

Returns a reference to the `EventEmitter`, so that calls can be chained.

###### [Type Parameters](#type-parameters-8)

| Type Parameter |
| --- |
| `N` *extends* keyof [`CommandEvents`](shell.md) |

###### [Parameters](#parameters-9)

| Parameter | Type |
| --- | --- |
| `event`? | `N` |

###### [Returns](#returns-11)

`this`

###### [Since](#since-12)

2.0.0

###### [Inherited from](#inherited-from-7)

[`EventEmitter`](shell.md).[`removeAllListeners`](shell.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L206>

##### [removeListener()](#removelistener)

```

removeListener<N>(eventName, listener): this

```

Alias for `emitter.off(eventName, listener)`.

###### [Type Parameters](#type-parameters-9)

| Type Parameter |
| --- |
| `N` *extends* keyof [`CommandEvents`](shell.md) |

###### [Parameters](#parameters-10)

| Parameter | Type |
| --- | --- |
| `eventName` | `N` |
| `listener` | (`arg`) => `void` |

###### [Returns](#returns-12)

`this`

###### [Since](#since-13)

2.0.0

###### [Inherited from](#inherited-from-8)

[`EventEmitter`](shell.md).[`removeListener`](shell.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L130>

##### [spawn()](#spawn)

```

spawn(): Promise<Child>

```

Executes the command as a child process, returning a handle to it.

###### [Returns](#returns-13)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Child`](shell.md)>

A promise resolving to the child process handle.

###### [Since](#since-14)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L479>

##### [create()](#create)

Creates a command to execute the given program.

###### [Example](#example-3)

```

import { Command } from '@tauri-apps/plugin-shell';

const command = Command.create('my-app', ['run', 'tauri']);

const output = await command.execute();

```

###### [Param](#param)

The program to execute.
It must be configured on `tauri.conf.json > plugins > shell > scope`.

###### [create(program, args)](#createprogram-args)

```

static create(program, args?): Command<string>

```

Creates a command to execute the given program.

###### [Parameters](#parameters-11)

| Parameter | Type |
| --- | --- |
| `program` | `string` |
| `args`? | `string` | `string`[] |

###### [Returns](#returns-14)

[`Command`](shell.md)<`string`>

###### [Example](#example-4)

```

import { Command } from '@tauri-apps/plugin-shell';

const command = Command.create('my-app', ['run', 'tauri']);

const output = await command.execute();

```

###### [Param](#param-1)

The program to execute.
It must be configured on `tauri.conf.json > plugins > shell > scope`.

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L406>

###### [create(program, args, options)](#createprogram-args-options)

```

static create(

program,

args?,

options?): Command<Uint8Array<ArrayBufferLike>>

```

Creates a command to execute the given program.

###### [Parameters](#parameters-12)

| Parameter | Type |
| --- | --- |
| `program` | `string` |
| `args`? | `string` | `string`[] |
| `options`? | [`SpawnOptions`](shell.md) & `object` |

###### [Returns](#returns-15)

[`Command`](shell.md)<[`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`>>

###### [Example](#example-5)

```

import { Command } from '@tauri-apps/plugin-shell';

const command = Command.create('my-app', ['run', 'tauri']);

const output = await command.execute();

```

###### [Param](#param-2)

The program to execute.
It must be configured on `tauri.conf.json > plugins > shell > scope`.

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L407>

###### [create(program, args, options)](#createprogram-args-options-1)

```

static create(

program,

args?,

options?): Command<string>

```

Creates a command to execute the given program.

###### [Parameters](#parameters-13)

| Parameter | Type |
| --- | --- |
| `program` | `string` |
| `args`? | `string` | `string`[] |
| `options`? | [`SpawnOptions`](shell.md) |

###### [Returns](#returns-16)

[`Command`](shell.md)<`string`>

###### [Example](#example-6)

```

import { Command } from '@tauri-apps/plugin-shell';

const command = Command.create('my-app', ['run', 'tauri']);

const output = await command.execute();

```

###### [Param](#param-3)

The program to execute.
It must be configured on `tauri.conf.json > plugins > shell > scope`.

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L412>

##### [sidecar()](#sidecar)

Creates a command to execute the given sidecar program.

###### [Example](#example-7)

```

import { Command } from '@tauri-apps/plugin-shell';

const command = Command.sidecar('my-sidecar');

const output = await command.execute();

```

###### [Param](#param-4)

The program to execute.
It must be configured on `tauri.conf.json > plugins > shell > scope`.

###### [sidecar(program, args)](#sidecarprogram-args)

```

static sidecar(program, args?): Command<string>

```

Creates a command to execute the given sidecar program.

###### [Parameters](#parameters-14)

| Parameter | Type |
| --- | --- |
| `program` | `string` |
| `args`? | `string` | `string`[] |

###### [Returns](#returns-17)

[`Command`](shell.md)<`string`>

###### [Example](#example-8)

```

import { Command } from '@tauri-apps/plugin-shell';

const command = Command.sidecar('my-sidecar');

const output = await command.execute();

```

###### [Param](#param-5)

The program to execute.
It must be configured on `tauri.conf.json > plugins > shell > scope`.

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L438>

###### [sidecar(program, args, options)](#sidecarprogram-args-options)

```

static sidecar(

program,

args?,

options?): Command<Uint8Array<ArrayBufferLike>>

```

Creates a command to execute the given sidecar program.

###### [Parameters](#parameters-15)

| Parameter | Type |
| --- | --- |
| `program` | `string` |
| `args`? | `string` | `string`[] |
| `options`? | [`SpawnOptions`](shell.md) & `object` |

###### [Returns](#returns-18)

[`Command`](shell.md)<[`Uint8Array`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)<`ArrayBufferLike`>>

###### [Example](#example-9)

```

import { Command } from '@tauri-apps/plugin-shell';

const command = Command.sidecar('my-sidecar');

const output = await command.execute();

```

###### [Param](#param-6)

The program to execute.
It must be configured on `tauri.conf.json > plugins > shell > scope`.

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L439>

###### [sidecar(program, args, options)](#sidecarprogram-args-options-1)

```

static sidecar(

program,

args?,

options?): Command<string>

```

Creates a command to execute the given sidecar program.

###### [Parameters](#parameters-16)

| Parameter | Type |
| --- | --- |
| `program` | `string` |
| `args`? | `string` | `string`[] |
| `options`? | [`SpawnOptions`](shell.md) |

###### [Returns](#returns-19)

[`Command`](shell.md)<`string`>

###### [Example](#example-10)

```

import { Command } from '@tauri-apps/plugin-shell';

const command = Command.sidecar('my-sidecar');

const output = await command.execute();

```

###### [Param](#param-7)

The program to execute.
It must be configured on `tauri.conf.json > plugins > shell > scope`.

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L444>

---

### [EventEmitter<E>](#eventemittere)

#### [Since](#since-15)

2.0.0

#### [Extended by](#extended-by)

#### [Type Parameters](#type-parameters-10)

| Type Parameter |
| --- |
| `E` *extends* [`Record`](https://www.typescriptlang.org/docs/handbook/utility-types.html#recordkeys-type)<`string`, `any`> |

#### [Constructors](#constructors-1)

##### [new EventEmitter()](#new-eventemitter)

```

new EventEmitter<E>(): EventEmitter<E>

```

###### [Returns](#returns-20)

[`EventEmitter`](shell.md)<`E`>

#### [Methods](#methods-2)

##### [addListener()](#addlistener-1)

```

addListener<N>(eventName, listener): this

```

Alias for `emitter.on(eventName, listener)`.

###### [Type Parameters](#type-parameters-11)

| Type Parameter |
| --- |
| `N` *extends* `string` | `number` | `symbol` |

###### [Parameters](#parameters-17)

| Parameter | Type |
| --- | --- |
| `eventName` | `N` |
| `listener` | (`arg`) => `void` |

###### [Returns](#returns-21)

`this`

###### [Since](#since-16)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L118>

##### [listenerCount()](#listenercount-1)

```

listenerCount<N>(eventName): number

```

Returns the number of listeners listening to the event named `eventName`.

###### [Type Parameters](#type-parameters-12)

| Type Parameter |
| --- |
| `N` *extends* `string` | `number` | `symbol` |

###### [Parameters](#parameters-18)

| Parameter | Type |
| --- | --- |
| `eventName` | `N` |

###### [Returns](#returns-22)

`number`

###### [Since](#since-17)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L241>

##### [off()](#off-1)

```

off<N>(eventName, listener): this

```

Removes the all specified listener from the listener array for the event eventName
Returns a reference to the `EventEmitter`, so that calls can be chained.

###### [Type Parameters](#type-parameters-13)

| Type Parameter |
| --- |
| `N` *extends* `string` | `number` | `symbol` |

###### [Parameters](#parameters-19)

| Parameter | Type |
| --- | --- |
| `eventName` | `N` |
| `listener` | (`arg`) => `void` |

###### [Returns](#returns-23)

`this`

###### [Since](#since-18)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L186>

##### [on()](#on-1)

```

on<N>(eventName, listener): this

```

Adds the `listener` function to the end of the listeners array for the
event named `eventName`. No checks are made to see if the `listener` has
already been added. Multiple calls passing the same combination of `eventName`and `listener` will result in the `listener` being added, and called, multiple
times.

Returns a reference to the `EventEmitter`, so that calls can be chained.

###### [Type Parameters](#type-parameters-14)

| Type Parameter |
| --- |
| `N` *extends* `string` | `number` | `symbol` |

###### [Parameters](#parameters-20)

| Parameter | Type |
| --- | --- |
| `eventName` | `N` |
| `listener` | (`arg`) => `void` |

###### [Returns](#returns-24)

`this`

###### [Since](#since-19)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L147>

##### [once()](#once-1)

```

once<N>(eventName, listener): this

```

Adds a **one-time**`listener` function for the event named `eventName`. The
next time `eventName` is triggered, this listener is removed and then invoked.

Returns a reference to the `EventEmitter`, so that calls can be chained.

###### [Type Parameters](#type-parameters-15)

| Type Parameter |
| --- |
| `N` *extends* `string` | `number` | `symbol` |

###### [Parameters](#parameters-21)

| Parameter | Type |
| --- | --- |
| `eventName` | `N` |
| `listener` | (`arg`) => `void` |

###### [Returns](#returns-25)

`this`

###### [Since](#since-20)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L169>

##### [prependListener()](#prependlistener-1)

```

prependListener<N>(eventName, listener): this

```

Adds the `listener` function to the *beginning* of the listeners array for the
event named `eventName`. No checks are made to see if the `listener` has
already been added. Multiple calls passing the same combination of `eventName`and `listener` will result in the `listener` being added, and called, multiple
times.

Returns a reference to the `EventEmitter`, so that calls can be chained.

###### [Type Parameters](#type-parameters-16)

| Type Parameter |
| --- |
| `N` *extends* `string` | `number` | `symbol` |

###### [Parameters](#parameters-22)

| Parameter | Type |
| --- | --- |
| `eventName` | `N` |
| `listener` | (`arg`) => `void` |

###### [Returns](#returns-26)

`this`

###### [Since](#since-21)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L258>

##### [prependOnceListener()](#prependoncelistener-1)

```

prependOnceListener<N>(eventName, listener): this

```

Adds a **one-time**`listener` function for the event named `eventName` to the\_beginning\_ of the listeners array. The next time `eventName` is triggered, this
listener is removed, and then invoked.

Returns a reference to the `EventEmitter`, so that calls can be chained.

###### [Type Parameters](#type-parameters-17)

| Type Parameter |
| --- |
| `N` *extends* `string` | `number` | `symbol` |

###### [Parameters](#parameters-23)

| Parameter | Type |
| --- | --- |
| `eventName` | `N` |
| `listener` | (`arg`) => `void` |

###### [Returns](#returns-27)

`this`

###### [Since](#since-22)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L280>

##### [removeAllListeners()](#removealllisteners-1)

```

removeAllListeners<N>(event?): this

```

Removes all listeners, or those of the specified eventName.

Returns a reference to the `EventEmitter`, so that calls can be chained.

###### [Type Parameters](#type-parameters-18)

| Type Parameter |
| --- |
| `N` *extends* `string` | `number` | `symbol` |

###### [Parameters](#parameters-24)

| Parameter | Type |
| --- | --- |
| `event`? | `N` |

###### [Returns](#returns-28)

`this`

###### [Since](#since-23)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L206>

##### [removeListener()](#removelistener-1)

```

removeListener<N>(eventName, listener): this

```

Alias for `emitter.off(eventName, listener)`.

###### [Type Parameters](#type-parameters-19)

| Type Parameter |
| --- |
| `N` *extends* `string` | `number` | `symbol` |

###### [Parameters](#parameters-25)

| Parameter | Type |
| --- | --- |
| `eventName` | `N` |
| `listener` | (`arg`) => `void` |

###### [Returns](#returns-29)

`this`

###### [Since](#since-24)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L130>

## [Interfaces](#interfaces)

### [ChildProcess<O>](#childprocesso)

#### [Since](#since-25)

2.0.0

#### [Type Parameters](#type-parameters-20)

| Type Parameter |
| --- |
| `O` *extends* [`IOPayload`](shell.md) |

#### [Properties](#properties-2)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `code` | `null` | `number` | Exit code of the process. `null` if the process was terminated by a signal on Unix. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L94> |
| `signal` | `null` | `number` | If the process was terminated by a signal, represents that signal. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L96> |
| `stderr` | `O` | The data that the process wrote to `stderr`. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L100> |
| `stdout` | `O` | The data that the process wrote to `stdout`. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L98> |

---

### [CommandEvents](#commandevents)

#### [Properties](#properties-3)

| Property | Type | Defined in |
| --- | --- | --- |
| `close` | [`TerminatedPayload`](shell.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L345> |
| `error` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L346> |

---

### [OutputEvents<O>](#outputeventso)

#### [Type Parameters](#type-parameters-21)

| Type Parameter |
| --- |
| `O` *extends* [`IOPayload`](shell.md) |

#### [Properties](#properties-4)

| Property | Type | Defined in |
| --- | --- | --- |
| `data` | `O` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L350> |

---

### [SpawnOptions](#spawnoptions)

#### [Since](#since-26)

2.0.0

#### [Properties](#properties-5)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `cwd?` | `string` | Current working directory. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L73> |
| `encoding?` | `string` | Character encoding for stdout/stderr **Since** 2.0.0 | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L81> |
| `env?` | [`Record`](https://www.typescriptlang.org/docs/handbook/utility-types.html#recordkeys-type)<`string`, `string`> | Environment variables. set to `null` to clear the process env. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L75> |

---

### [TerminatedPayload](#terminatedpayload)

Payload for the `Terminated` command event.

#### [Properties](#properties-6)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `code` | `null` | `number` | Exit code of the process. `null` if the process was terminated by a signal on Unix. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L560> |
| `signal` | `null` | `number` | If the process was terminated by a signal, represents that signal. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L562> |

## [Type Aliases](#type-aliases)

### [IOPayload](#iopayload)

```

type IOPayload: string | Uint8Array;

```

Event payload type

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L566>

## [Functions](#functions)

### [open()](#open)

```

function open(path, openWith?): Promise<void>

```

Opens a path or URL with the system’s default app,
or the one specified with `openWith`.

The `openWith` value must be one of `firefox`, `google chrome`, `chromium` `safari`,
`open`, `start`, `xdg-open`, `gio`, `gnome-open`, `kde-open` or `wslview`.

#### [Parameters](#parameters-26)

| Parameter | Type | Description |
| --- | --- | --- |
| `path` | `string` | The path or URL to open. This value is matched against the string regex defined on `tauri.conf.json > plugins > shell > open`, which defaults to `^((mailto:\w+) |
| `openWith`? | `string` | The app to open the file or URL with. Defaults to the system default application for the specified path type. |

#### [Returns](#returns-30)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

#### [Example](#example-11)

```

import { open } from '@tauri-apps/plugin-shell';

// opens the given URL on the default browser:

await open('https://github.com/tauri-apps/tauri');

// opens the given URL using `firefox`:

await open('https://github.com/tauri-apps/tauri', 'firefox');

// opens a file using the default program:

await open('/path/to/file');

```

#### [Since](#since-27)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/shell/guest-js/index.ts#L601>

[Previous   
 process](process.md)   [Next   
 sql](sql.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT