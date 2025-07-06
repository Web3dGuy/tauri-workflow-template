# useHotkeys

##### Migrating from [**HotkeysTarget**](#core/legacy/hotkeys-legacy)?

`useHotkeys()` is a replacement for **HotkeysTarget**. You are encouraged to use this new API in your function
components, or the [**HotkeysTarget2** component](#core/components/hotkeys-target2) in your component classes,
as they will become the standard APIs in a future major version of Blueprint. See the full
[migration guide](https://github.com/palantir/blueprint/wiki/HotkeysTarget-&-useHotkeys-migration) on the wiki.

The `useHotkeys()` hook adds hotkey / keyboard shortcut interactions to your application using a custom React hook.
Compared to the deprecated [Hotkeys API](#core/legacy/hotkeys-legacy), it works with function components and its
corresponding [context provider](#core/context/hotkeys-provider) allows more customization of the hotkeys dialog.

Focus on the piano below to try its hotkeys. The global hotkeys dialog can be shown using the `?` key.

#### Click here to start this WebAudio-based interactive example

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/useHotkeysExample.tsx)

## Usage

First, make sure [**HotkeysProvider**](#core/context/hotkeys-provider) is configured correctly at the root of your
React application.

Then, to register hotkeys and generate the relevant event handlers, use the hook like so:

```
import { InputGroup, KeyComboTag, useHotkeys } from "@blueprintjs/core";  
import React, { createRef, useCallback, useMemo } from "react";  
  
export default function () {  
    const inputRef = createRef<HTMLInputElement>();  
    const handleRefresh = useCallback(() => console.info("Refreshing data..."), []);  
    const handleFocus = useCallback(() => inputRef.current?.focus(), [inputRef]);  
  
    // important: hotkeys array must be memoized to avoid infinitely re-binding hotkeys  
    const hotkeys = useMemo(  
        () => [  
            {  
                combo: "R",  
                global: true,  
                label: "Refresh data",  
                onKeyDown: handleRefresh,  
            },  
            {  
                combo: "F",  
                group: "Input",  
                label: "Focus text input",  
                onKeyDown: handleFocus,  
            },  
        ],  
        [handleRefresh, handleFocus],  
    );  
    const { handleKeyDown, handleKeyUp } = useHotkeys(hotkeys);  
  
    return (  
        <div tabIndex={0} onKeyDown={handleKeyDown} onKeyUp={handleKeyUp}>  
            Press <KeyComboTag combo="R" /> to refresh data, <KeyComboTag combo="F" /> to focus the input...  
            <InputGroup inputRef={inputRef} />  
        </div>  
    );  
}  

```

**Important**: the `hotkeys` array must be memoized, as shown above, to prevent the hook from re-binding
hotkeys on every render.

Hotkeys must define a group, or be marked as global. The hook will automatically bind global event handlers
and configure the `?` key to open the generated hotkeys dialog, but it is up to you to bind *local*
event handlers with the returned `handleKeyDown` and `handleKeyUp` functions. The hook takes an optional
second parameter which can customize some of its default behavior.

## Hook options

interface UseHotkeysOptions

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/hooks/hotkeys/useHotkeys.ts#L26)

| Props | Description |
| --- | --- |
| `document` | `Documentwindow.document` A custom document to reference when binding global event handlers. This can be useful when using iframes in an application. |
| `showDialogKeyCombo` | `string"?"` The key combo which will trigger the hotkeys dialog to open. |

method useHotkeys

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/hooks/hotkeys/useHotkeys.ts#L55)

| Returns |  |
| --- | --- |
| `UseHotkeysReturnValue` | React hook to register global and local hotkeys for a component.  See: [object Object] |

| Parameters | Description |
| --- | --- |
| `keys` | `readonly HotkeyConfig[]` list of hotkeys to configure  Required |
| `options` | `UseHotkeysOptions` hook options  Required |

## Hotkey configuration

interface HotkeyConfig

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/hooks/hotkeys/hotkeyConfig.ts#L17)

| Props | Description |
| --- | --- |
| `allowInInput` | `booleanfalse` Whether the hotkey should be triggerable when focused in a text input. |
| `combo` | `string` Hotkey combination string (AKA "key combo"), such as "space" or "cmd+n".  Required |
| `disabled` | `booleanfalse` Whether the hotkey cannot be triggered. |
| `global` | `booleanfalse` If `false`, the hotkey is active only when the target is focused. If `true`, the hotkey can be triggered regardless of what component is focused. |
| `group` | `string` Unless the hotkey is global, you must specify a group where the hotkey will be displayed in the hotkeys dialog. This string will be displayed in a header at the start of the group of hotkeys. |
| `label` | `ReactNode` Human-friendly label for the hotkey.  Required |
| `onKeyDown` | `(e: KeyboardEvent) => any` `keydown` event handler. |
| `onKeyUp` | `(e: KeyboardEvent) => any` `keyup` event handler. |
| `preventDefault` | `booleanfalse` When `true`, invokes `event.preventDefault()` before the respective `onKeyDown` and `onKeyUp` callbacks are invoked. Enabling this can simplify handler implementations. |
| `stopPropagation` | `booleanfalse` When `true`, invokes `event.stopPropagation()` before the respective `onKeyDown` and `onKeyUp` callbacks are invoked. Enabling this can simplify handler implementations. |

## Key combos

Each hotkey must be assigned a key combo that will trigger its events. A key combo consists of zero or more modifier
keys (`alt`, `ctrl`, `shift`, `meta`, `cmd`) and exactly one action key, such as `A`, `return`, or `up`.

Some key combos have aliases. For example, `shift + 1` can equivalently be expressed as `!` and `cmd` is equal to
`meta`. However, normal alphabetic characters do not have this aliasing, so `X` is equivalent to `x` but is not
equivalent to `shift + x`.

Examples of valid key combos:

* `cmd+plus`
* `!` or, equivalently `shift+1`
* `return` or, equivalently `enter`
* `alt + shift + x`
* `ctrl + left`

Note that spaces are ignored.

### Named keys

* `plus`
* `minus`
* `backspace`
* `tab`
* `enter`
* `capslock`
* `esc`
* `space`
* `pageup`
* `pagedown`
* `end`
* `home`
* `left`
* `up`
* `right`
* `down`
* `ins`
* `del`

### Aliased keys

* `option` → `alt`
* `cmd` → `meta`
* `command` → `meta`
* `return` → `enter`
* `escape` → `esc`
* `win` → `meta`

The special modifier `mod` will choose the OS-preferred modifier key: `cmd` for macOS and iOS, or `ctrl` for Windows
and Linux.

## Key combo tester

Below is a little widget to quickly help you try out hotkey combos and see how they will appear in the dialog. See the
[Key combos section](#core/hooks/use-hotkeys.key-combos) above for more info.

Click here then press a key combo

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/hotkeyTesterExample.tsx)