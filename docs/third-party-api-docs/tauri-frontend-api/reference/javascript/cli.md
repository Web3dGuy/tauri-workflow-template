# @tauri-apps/plugin-cli

Parse arguments from your Command Line Interface.

## [Interfaces](#interfaces)

### [ArgMatch](#argmatch)

#### [Since](#since)

2.0.0

#### [Properties](#properties)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `occurrences` | `number` | Number of occurrences | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/cli/guest-js/index.ts#L26> |
| `value` | `null` | `string` | `boolean` | `string`[] | string if takes value boolean if flag string[] or null if takes multiple values | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/cli/guest-js/index.ts#L22> |

---

### [CliMatches](#climatches)

#### [Since](#since-1)

2.0.0

#### [Properties](#properties-1)

| Property | Type | Defined in |
| --- | --- | --- |
| `args` | [`Record`](https://www.typescriptlang.org/docs/handbook/utility-types.html#recordkeys-type)<`string`, [`ArgMatch`](cli.md)> | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/cli/guest-js/index.ts#L41> |
| `subcommand` | `null` | [`SubcommandMatch`](cli.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/cli/guest-js/index.ts#L42> |

---

### [SubcommandMatch](#subcommandmatch)

#### [Since](#since-2)

2.0.0

#### [Properties](#properties-2)

| Property | Type | Defined in |
| --- | --- | --- |
| `matches` | [`CliMatches`](cli.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/cli/guest-js/index.ts#L34> |
| `name` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/cli/guest-js/index.ts#L33> |

## [Functions](#functions)

### [getMatches()](#getmatches)

```

function getMatches(): Promise<CliMatches>

```

Parse the arguments provided to the current process and get the matches using the configuration defined [`tauri.cli`](https://tauri.app/v1/api/config/#tauriconfig.cli) in `tauri.conf.json`

#### [Returns](#returns)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`CliMatches`](cli.md)>

#### [Example](#example)

```

import { getMatches } from '@tauri-apps/plugin-cli';

const matches = await getMatches();

if (matches.subcommand?.name === 'run') {

// `./your-app run $ARGS` was executed

const args = matches.subcommand?.matches.args

if ('debug' in args) {

// `./your-app run --debug` was executed

}

} else {

const args = matches.args

// `./your-app $ARGS` was executed

}

```

#### [Since](#since-3)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/cli/guest-js/index.ts#L66>

[Previous   
 biometric](biometric.md)   [Next   
 clipboard-manager](clipboard-manager.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT