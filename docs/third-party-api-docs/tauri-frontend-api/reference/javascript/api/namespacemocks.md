# mocks

## [Functions](#functions)

### [clearMocks()](#clearmocks)

```

function clearMocks(): void

```

Clears mocked functions/data injected by the other functions in this module.
When using a test runner that doesn’t provide a fresh window object for each test, calling this function will reset tauri specific properties.

# [Example](#example)

```

import { mockWindows, clearMocks } from "@tauri-apps/api/mocks"

afterEach(() => {

clearMocks()

})

test("mocked windows", () => {

mockWindows("main", "second", "third");

expect(window.__TAURI_INTERNALS__).toHaveProperty("metadata")

})

test("no mocked windows", () => {

expect(window.__TAURI_INTERNALS__).not.toHaveProperty("metadata")

})

```

#### [Returns](#returns)

`void`

#### [Since](#since)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/mocks.ts#L211>

---

### [mockConvertFileSrc()](#mockconvertfilesrc)

```

function mockConvertFileSrc(osName): void

```

Mock `convertFileSrc` function

#### [Parameters](#parameters)

| Parameter | Type | Description |
| --- | --- | --- |
| `osName` | `string` | The operating system to mock, can be one of linux, macos, or windows |

#### [Returns](#returns-1)

`void`

#### [Example](#example-1)

```

import { mockConvertFileSrc } from "@tauri-apps/api/mocks";

import { convertFileSrc } from "@tauri-apps/api/core";

mockConvertFileSrc("windows")

const url = convertFileSrc("C:\\Users\\user\\file.txt")

```

#### [Since](#since-1)

1.6.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/mocks.ts#L172>

---

### [mockIPC()](#mockipc)

```

function mockIPC(cb): void

```

Intercepts all IPC requests with the given mock handler.

This function can be used when testing tauri frontend applications or when running the frontend in a Node.js context during static site generation.

# [Examples](#examples)

Testing setup using vitest:

```

import { mockIPC, clearMocks } from "@tauri-apps/api/mocks"

import { invoke } from "@tauri-apps/api/core"

afterEach(() => {

clearMocks()

})

test("mocked command", () => {

mockIPC((cmd, payload) => {

switch (cmd) {

case "add":

return (payload.a as number) + (payload.b as number);

default:

break;

}

});

expect(invoke('add', { a: 12, b: 15 })).resolves.toBe(27);

})

```

The callback function can also return a Promise:

```

import { mockIPC, clearMocks } from "@tauri-apps/api/mocks"

import { invoke } from "@tauri-apps/api/core"

afterEach(() => {

clearMocks()

})

test("mocked command", () => {

mockIPC((cmd, payload) => {

if(cmd === "get_data") {

return fetch("https://example.com/data.json")

.then((response) => response.json())

}

});

expect(invoke('get_data')).resolves.toBe({ foo: 'bar' });

})

```

#### [Parameters](#parameters-1)

| Parameter | Type |
| --- | --- |
| `cb` | (`cmd`, `payload`?) => `unknown` |

#### [Returns](#returns-2)

`void`

#### [Since](#since-2)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/mocks.ts#L64>

---

### [mockWindows()](#mockwindows)

```

function mockWindows(current, ..._additionalWindows): void

```

Mocks one or many window labels.
In non-tauri context it is required to call this function *before* using the `@tauri-apps/api/window` module.

This function only mocks the *presence* of windows,
window properties (e.g. width and height) can be mocked like regular IPC calls using the `mockIPC` function.

# [Examples](#examples-1)

```

import { mockWindows } from "@tauri-apps/api/mocks";

import { getCurrentWindow } from "@tauri-apps/api/window";

mockWindows("main", "second", "third");

const win = getCurrentWindow();

win.label // "main"

```
```

import { mockWindows } from "@tauri-apps/api/mocks";

mockWindows("main", "second", "third");

mockIPC((cmd, args) => {

if (cmd === "plugin:event|emit") {

console.log('emit event', args?.event, args?.payload);

}

});

const { emit } = await import("@tauri-apps/api/event");

await emit('loaded'); // this will cause the mocked IPC handler to log to the console.

```

#### [Parameters](#parameters-2)

| Parameter | Type | Description |
| --- | --- | --- |
| `current` | `string` | Label of window this JavaScript context is running in. |
| …`_additionalWindows` | `string`[] | - |

#### [Returns](#returns-3)

`void`

#### [Since](#since-3)

1.0.0

**Source**: <https://github.com/tauri-apps/tauri/blob/dev/packages/api/src/mocks.ts#L143>

[Previous   
 menu](namespacemenu.md)   [Next   
 path](namespacepath.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT