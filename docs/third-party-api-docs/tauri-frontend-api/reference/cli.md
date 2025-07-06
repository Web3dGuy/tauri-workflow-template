# Command Line Interface

The Tauri command line interface (CLI) is the way to interact with Tauri throughout the development lifecycle.

You can add the Tauri CLI to your current project using your package manager of choice:

(() => {
class StarlightTabsRestore extends HTMLElement {
connectedCallback() {
const starlightTabs = this.closest('starlight-tabs');
if (!(starlightTabs instanceof HTMLElement) || typeof localStorage === 'undefined') return;
const syncKey = starlightTabs.dataset.syncKey;
if (!syncKey) return;
const label = localStorage.getItem(`starlight-synced-tabs\_\_${syncKey}`);
if (!label) return;
const tabs = [...starlightTabs?.querySelectorAll('[role="tab"]')];
const tabIndexToRestore = tabs.findIndex(
(tab) => tab instanceof HTMLAnchorElement && tab.textContent?.trim() === label
);
const panels = starlightTabs?.querySelectorAll(':scope > [role="tabpanel"]');
const newTab = tabs[tabIndexToRestore];
const newPanel = panels[tabIndexToRestore];
if (tabIndexToRestore < 1 || !newTab || !newPanel) return;
tabs[0]?.setAttribute('aria-selected', 'false');
tabs[0]?.setAttribute('tabindex', '-1');
panels?.[0]?.setAttribute('hidden', 'true');
newTab.removeAttribute('tabindex');
newTab.setAttribute('aria-selected', 'true');
newPanel.removeAttribute('hidden');
}
}
customElements.define('starlight-tabs-restore', StarlightTabsRestore);
})()

```

npm install --save-dev @tauri-apps/cli@latest

```
```

yarn add -D @tauri-apps/cli@latest

```
```

pnpm add -D @tauri-apps/cli@latest

```
```

deno add -D npm:@tauri-apps/cli@latest

```
```

cargo install tauri-cli --version "^2.0.0" --locked

```

 

Developing a Plugin

For CLI commands related to developing plugins visit the [Develop a Tauri Plugin guide](/develop/plugins/).

## [List of Commands](#list-of-commands)

| Command | Description |
| --- | --- |
| [`init`](#init) | Initialize a Tauri project in an existing directory |
| [`dev`](#dev) | Run your app in development mode |
| [`build`](#build) | Build your app in release mode and generate bundles and installers |
| [`bundle`](#bundle) | Generate bundles and installers for your app (already built by `tauri build`) |
| [`android`](#android) | Android commands |
| [`android init`](#android-init) | Initialize Android target in the project |
| [`android dev`](#android-dev) | Run your app in development mode on Android |
| [`android build`](#android-build) | Build your app in release mode for Android and generate APKs and AABs |
| [`migrate`](#migrate) | Migrate from v1 to v2 |
| [`info`](#info) | Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations |
| [`add`](#add) | Add a tauri plugin to the project |
| [`remove`](#remove) | Remove a tauri plugin from the project |
| [`plugin`](#plugin) | Manage or create Tauri plugins |
| [`plugin new`](#plugin-new) | Initializes a new Tauri plugin project |
| [`plugin init`](#plugin-init) | Initialize a Tauri plugin project on an existing directory |
| [`plugin android`](#plugin-android) | Manage the Android project for a Tauri plugin |
| [`plugin ios`](#plugin-ios) | Manage the iOS project for a Tauri plugin |
| [`plugin android init`](#plugin-android-init) | Initializes the Android project for an existing Tauri plugin |
| [`plugin ios init`](#plugin-ios-init) | Initializes the iOS project for an existing Tauri plugin |
| [`icon`](#icon) | Generate various icons for all major platforms |
| [`signer`](#signer) | Generate signing keys for Tauri updater or sign files |
| [`signer sign`](#signer-sign) | Sign a file |
| [`signer generate`](#signer-generate) | Generate a new signing key to sign files |
| [`completions`](#completions) | Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish |
| [`permission`](#permission) | Manage or create permissions for your app or plugin |
| [`permission new`](#permission-new) | Create a new permission file |
| [`permission add`](#permission-add) | Add a permission to capabilities |
| [`permission rm`](#permission-rm) | Remove a permission file, and its reference from any capability |
| [`permission ls`](#permission-ls) | List permissions available to your application |
| [`capability`](#capability) | Manage or create capabilities for your app |
| [`capability new`](#capability-new) | Create a new permission file |
| [`inspect`](#inspect) | Manage or create permissions for your app or plugin |
| [`inspect wix-upgrade-code`](#inspect-wix-upgrade-code) | Print the default Upgrade Code used by MSI installer derived from productName |

### [`init`](#init)

```

npm run tauri init

```
```

yarn tauri init

```
```

pnpm tauri init

```
```

deno task tauri init

```
```

bun tauri init

```
```

cargo tauri init

```
```

Initialize a Tauri project in an existing directory

Usage: tauri init [OPTIONS]

Options:

--ci

Skip prompting for values [env: CI=true]

-v, --verbose...

Enables verbose logging

-f, --force

Force init to overwrite the src-tauri folder

-l, --log

Enables logging

-d, --directory <DIRECTORY>

Set target directory for init [default: /opt/build/repo/packages/cli-generator]

-t, --tauri-path <TAURI_PATH>

Path of the Tauri project to use (relative to the cwd)

-A, --app-name <APP_NAME>

Name of your Tauri application

-W, --window-title <WINDOW_TITLE>

Window title of your Tauri application

-D, --frontend-dist <FRONTEND_DIST>

Web assets location, relative to <project-dir>/src-tauri

-P, --dev-url <DEV_URL>

Url of your dev server

--before-dev-command <BEFORE_DEV_COMMAND>

A shell command to run before `tauri dev` kicks in

--before-build-command <BEFORE_BUILD_COMMAND>

A shell command to run before `tauri build` kicks in

-h, --help

Print help

-V, --version

Print version

```

### [`dev`](#dev)

```

npm run tauri dev

```
```

yarn tauri dev

```
```

pnpm tauri dev

```
```

deno task tauri dev

```
```

bun tauri dev

```
```

cargo tauri dev

```
```

Run your app in development mode with hot-reloading for the Rust code. It makes use of the `build.devUrl` property from your `tauri.conf.json` file. It also runs your `build.beforeDevCommand` which usually starts your frontend devServer.

Usage: tauri dev [OPTIONS] [ARGS]...

Arguments:

[ARGS]...

Command line arguments passed to the runner. Use `--` to explicitly mark the start of the arguments. Arguments after a second `--` are passed to the application e.g. `tauri dev -- [runnerArgs] -- [appArgs]`

Options:

-r, --runner <RUNNER>

Binary to use to run the application

-v, --verbose...

Enables verbose logging

-t, --target <TARGET>

Target triple to build against

-f, --features [<FEATURES>...]

List of cargo features to activate

-e, --exit-on-panic

Exit on panic

-c, --config <CONFIG>

JSON strings or path to JSON files to merge with the default configuration file

Configurations are merged in the order they are provided, which means a particular value overwrites previous values when a config key-value pair conflicts.

Note that a platform-specific file is looked up and merged with the default file by default (tauri.macos.conf.json, tauri.linux.conf.json, tauri.windows.conf.json, tauri.android.conf.json and tauri.ios.conf.json) but you can use this for more specific use cases such as different build flavors.

--release

Run the code in release mode

--no-dev-server-wait

Skip waiting for the frontend dev server to start before building the tauri application

[env: TAURI_CLI_NO_DEV_SERVER_WAIT=]

--no-watch

Disable the file watcher

--no-dev-server

Disable the built-in dev server for static files

--port <PORT>

Specify port for the built-in dev server for static files. Defaults to 1430

[env: TAURI_CLI_PORT=]

-h, --help

Print help (see a summary with '-h')

-V, --version

Print version

```

### [`build`](#build)

```

npm run tauri build

```
```

yarn tauri build

```
```

pnpm tauri build

```
```

deno task tauri build

```
```

bun tauri build

```
```

cargo tauri build

```
```

Build your app in release mode and generate bundles and installers. It makes use of the `build.frontendDist` property from your `tauri.conf.json` file. It also runs your `build.beforeBuildCommand` which usually builds your frontend into `build.frontendDist`. This will also run `build.beforeBundleCommand` before generating the bundles and installers of your app.

Usage: tauri build [OPTIONS] [ARGS]...

Arguments:

[ARGS]...

Command line arguments passed to the runner. Use `--` to explicitly mark the start of the arguments

Options:

-r, --runner <RUNNER>

Binary to use to build the application, defaults to `cargo`

-v, --verbose...

Enables verbose logging

-d, --debug

Builds with the debug flag

-t, --target <TARGET>

Target triple to build against.

It must be one of the values outputted by `$rustc --print target-list` or `universal-apple-darwin` for an universal macOS application.

Note that compiling an universal macOS application requires both `aarch64-apple-darwin` and `x86_64-apple-darwin` targets to be installed.

-f, --features [<FEATURES>...]

Space or comma separated list of features to activate

-b, --bundles [<BUNDLES>...]

Space or comma separated list of bundles to package

[possible values: deb, rpm, appimage]

--no-bundle

Skip the bundling step even if `bundle > active` is `true` in tauri config

-c, --config <CONFIG>

JSON strings or path to JSON files to merge with the default configuration file

Configurations are merged in the order they are provided, which means a particular value overwrites previous values when a config key-value pair conflicts.

Note that a platform-specific file is looked up and merged with the default file by default (tauri.macos.conf.json, tauri.linux.conf.json, tauri.windows.conf.json, tauri.android.conf.json and tauri.ios.conf.json) but you can use this for more specific use cases such as different build flavors.

--ci

Skip prompting for values

[env: CI=true]

-h, --help

Print help (see a summary with '-h')

-V, --version

Print version

```

### [`bundle`](#bundle)

```

npm run tauri bundle

```
```

yarn tauri bundle

```
```

pnpm tauri bundle

```
```

deno task tauri bundle

```
```

bun tauri bundle

```
```

cargo tauri bundle

```
```

Generate bundles and installers for your app (already built by `tauri build`). This run `build.beforeBundleCommand` before generating the bundles and installers of your app.

Usage: tauri bundle [OPTIONS]

Options:

-d, --debug

Builds with the debug flag

-v, --verbose...

Enables verbose logging

-b, --bundles [<BUNDLES>...]

Space or comma separated list of bundles to package

[possible values: deb, rpm, appimage]

-c, --config <CONFIG>

JSON strings or path to JSON files to merge with the default configuration file

Configurations are merged in the order they are provided, which means a particular value overwrites previous values when a config key-value pair conflicts.

Note that a platform-specific file is looked up and merged with the default file by default (tauri.macos.conf.json, tauri.linux.conf.json, tauri.windows.conf.json, tauri.android.conf.json and tauri.ios.conf.json) but you can use this for more specific use cases such as different build flavors.

-f, --features [<FEATURES>...]

Space or comma separated list of features, should be the same features passed to `tauri build` if any

-t, --target <TARGET>

Target triple to build against.

It must be one of the values outputted by `$rustc --print target-list` or `universal-apple-darwin` for an universal macOS application.

Note that compiling an universal macOS application requires both `aarch64-apple-darwin` and `x86_64-apple-darwin` targets to be installed.

--ci

Skip prompting for values

[env: CI=true]

-h, --help

Print help (see a summary with '-h')

-V, --version

Print version

```

### [`android`](#android)

```

npm run tauri android

```
```

yarn tauri android

```
```

pnpm tauri android

```
```

deno task tauri android

```
```

bun tauri android

```
```

cargo tauri android

```
```

Android commands

Usage: tauri android [OPTIONS] <COMMAND>

Commands:

init   Initialize Android target in the project

dev    Run your app in development mode on Android

build  Build your app in release mode for Android and generate APKs and AABs

help   Print this message or the help of the given subcommand(s)

Options:

-v, --verbose...  Enables verbose logging

-h, --help        Print help

-V, --version     Print version

```

#### [`android init`](#android-init)

```

npm run tauri android init

```
```

yarn tauri android init

```
```

pnpm tauri android init

```
```

deno task tauri android init

```
```

bun tauri android init

```
```

cargo tauri android init

```
```

Initialize Android target in the project

Usage: tauri android init [OPTIONS]

Options:

--ci                    Skip prompting for values [env: CI=true]

-v, --verbose...            Enables verbose logging

--skip-targets-install  Skips installing rust toolchains via rustup

-h, --help                  Print help

-V, --version               Print version

```

#### [`android dev`](#android-dev)

```

npm run tauri android dev

```
```

yarn tauri android dev

```
```

pnpm tauri android dev

```
```

deno task tauri android dev

```
```

bun tauri android dev

```
```

cargo tauri android dev

```
```

Run your app in development mode on Android with hot-reloading for the Rust code. It makes use of the `build.devUrl` property from your `tauri.conf.json` file. It also runs your `build.beforeDevCommand` which usually starts your frontend devServer.

Usage: tauri android dev [OPTIONS] [DEVICE]

Arguments:

[DEVICE]

Runs on the given device name

Options:

-f, --features [<FEATURES>...]

List of cargo features to activate

-v, --verbose...

Enables verbose logging

-e, --exit-on-panic

Exit on panic

-c, --config <CONFIG>

JSON strings or path to JSON files to merge with the default configuration file

Configurations are merged in the order they are provided, which means a particular value overwrites previous values when a config key-value pair conflicts.

Note that a platform-specific file is looked up and merged with the default file by default (tauri.macos.conf.json, tauri.linux.conf.json, tauri.windows.conf.json, tauri.android.conf.json and tauri.ios.conf.json) but you can use this for more specific use cases such as different build flavors.

--release

Run the code in release mode

--no-dev-server-wait

Skip waiting for the frontend dev server to start before building the tauri application

[env: TAURI_CLI_NO_DEV_SERVER_WAIT=]

--no-watch

Disable the file watcher

-o, --open

Open Android Studio instead of trying to run on a connected device

--force-ip-prompt

Force prompting for an IP to use to connect to the dev server on mobile

--host [<HOST>]

Use the public network address for the development server. If an actual address it provided, it is used instead of prompting to pick one.

On Windows we use the public network address by default.

This option is particularly useful along the `--open` flag when you intend on running on a physical device.

This replaces the devUrl configuration value to match the public network address host, it is your responsibility to set up your development server to listen on this address by using 0.0.0.0 as host for instance.

When this is set or when running on an iOS device the CLI sets the `TAURI_DEV_HOST` environment variable so you can check this on your framework's configuration to expose the development server on the public network address.

[default: <none>]

--no-dev-server

Disable the built-in dev server for static files

--port <PORT>

Specify port for the built-in dev server for static files. Defaults to 1430

[env: TAURI_CLI_PORT=]

-h, --help

Print help (see a summary with '-h')

-V, --version

Print version

```

#### [`android build`](#android-build)

```

npm run tauri android build

```
```

yarn tauri android build

```
```

pnpm tauri android build

```
```

deno task tauri android build

```
```

bun tauri android build

```
```

cargo tauri android build

```
```

Build your app in release mode for Android and generate APKs and AABs. It makes use of the `build.frontendDist` property from your `tauri.conf.json` file. It also runs your `build.beforeBuildCommand` which usually builds your frontend into `build.frontendDist`.

Usage: tauri android build [OPTIONS]

Options:

-d, --debug

Builds with the debug flag

-v, --verbose...

Enables verbose logging

-t, --target [<TARGETS>...]

Which targets to build (all by default)

[possible values: aarch64, armv7, i686, x86_64]

-f, --features [<FEATURES>...]

List of cargo features to activate

-c, --config <CONFIG>

JSON strings or path to JSON files to merge with the default configuration file

Configurations are merged in the order they are provided, which means a particular value overwrites previous values when a config key-value pair conflicts.

Note that a platform-specific file is looked up and merged with the default file by default (tauri.macos.conf.json, tauri.linux.conf.json, tauri.windows.conf.json, tauri.android.conf.json and tauri.ios.conf.json) but you can use this for more specific use cases such as different build flavors.

--split-per-abi

Whether to split the APKs and AABs per ABIs

--apk

Build APKs

--aab

Build AABs

-o, --open

Open Android Studio

--ci

Skip prompting for values

[env: CI=true]

-h, --help

Print help (see a summary with '-h')

-V, --version

Print version

```

### [`migrate`](#migrate)

```

npm run tauri migrate

```
```

yarn tauri migrate

```
```

pnpm tauri migrate

```
```

deno task tauri migrate

```
```

bun tauri migrate

```
```

cargo tauri migrate

```
```

Migrate from v1 to v2

Usage: tauri migrate [OPTIONS]

Options:

-v, --verbose...  Enables verbose logging

-h, --help        Print help

-V, --version     Print version

```

### [`info`](#info)

```

npm run tauri info

```
```

yarn tauri info

```
```

pnpm tauri info

```
```

deno task tauri info

```
```

bun tauri info

```
```

cargo tauri info

```
```

Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations

Usage: tauri info [OPTIONS]

Options:

--interactive  Interactive mode to apply automatic fixes

-v, --verbose...   Enables verbose logging

-h, --help         Print help

-V, --version      Print version

```

### [`add`](#add)

```

npm run tauri add

```
```

yarn tauri add

```
```

pnpm tauri add

```
```

deno task tauri add

```
```

bun tauri add

```
```

cargo tauri add

```
```

Add a tauri plugin to the project

Usage: tauri add [OPTIONS] <PLUGIN>

Arguments:

<PLUGIN>  The plugin to add

Options:

-t, --tag <TAG>        Git tag to use

-v, --verbose...       Enables verbose logging

-r, --rev <REV>        Git rev to use

-b, --branch <BRANCH>  Git branch to use

--no-fmt           Don't format code with rustfmt

-h, --help             Print help

-V, --version          Print version

```

### [`remove`](#remove)

```

npm run tauri remove

```
```

yarn tauri remove

```
```

pnpm tauri remove

```
```

deno task tauri remove

```
```

bun tauri remove

```
```

cargo tauri remove

```
```

Remove a tauri plugin from the project

Usage: tauri remove [OPTIONS] <PLUGIN>

Arguments:

<PLUGIN>  The plugin to remove

Options:

-v, --verbose...  Enables verbose logging

-h, --help        Print help

-V, --version     Print version

```

### [`plugin`](#plugin)

```

npm run tauri plugin

```
```

yarn tauri plugin

```
```

pnpm tauri plugin

```
```

deno task tauri plugin

```
```

bun tauri plugin

```
```

cargo tauri plugin

```
```

Manage or create Tauri plugins

Usage: tauri plugin [OPTIONS] <COMMAND>

Commands:

new      Initializes a new Tauri plugin project

init     Initialize a Tauri plugin project on an existing directory

android  Manage the Android project for a Tauri plugin

ios      Manage the iOS project for a Tauri plugin

help     Print this message or the help of the given subcommand(s)

Options:

-v, --verbose...  Enables verbose logging

-h, --help        Print help

-V, --version     Print version

```

#### [`plugin new`](#plugin-new)

```

npm run tauri plugin new

```
```

yarn tauri plugin new

```
```

pnpm tauri plugin new

```
```

deno task tauri plugin new

```
```

bun tauri plugin new

```
```

cargo tauri plugin new

```
```

Initializes a new Tauri plugin project

Usage: tauri plugin new [OPTIONS] <PLUGIN_NAME>

Arguments:

<PLUGIN_NAME>

Name of your Tauri plugin

Options:

--no-api

Initializes a Tauri plugin without the TypeScript API

-v, --verbose...

Enables verbose logging

--no-example

Initialize without an example project

-d, --directory <DIRECTORY>

Set target directory for init

-a, --author <AUTHOR>

Author name

--android

Whether to initialize an Android project for the plugin

--ios

Whether to initialize an iOS project for the plugin

--mobile

Whether to initialize Android and iOS projects for the plugin

--ios-framework <IOS_FRAMEWORK>

Type of framework to use for the iOS project

[default: spm]

Possible values:

- spm:   Swift Package Manager project

- xcode: Xcode project

--github-workflows

Generate github workflows

-t, --tauri-path <TAURI_PATH>

Path of the Tauri project to use (relative to the cwd)

-h, --help

Print help (see a summary with '-h')

-V, --version

Print version

```

#### [`plugin init`](#plugin-init)

```

npm run tauri plugin init

```
```

yarn tauri plugin init

```
```

pnpm tauri plugin init

```
```

deno task tauri plugin init

```
```

bun tauri plugin init

```
```

cargo tauri plugin init

```
```

Initialize a Tauri plugin project on an existing directory

Usage: tauri plugin init [OPTIONS] [PLUGIN_NAME]

Arguments:

[PLUGIN_NAME]

Name of your Tauri plugin. If not specified, it will be inferred from the current directory

Options:

--no-api

Initializes a Tauri plugin without the TypeScript API

-v, --verbose...

Enables verbose logging

--no-example

Initialize without an example project

-d, --directory <DIRECTORY>

Set target directory for init

[default: /opt/build/repo/packages/cli-generator]

-a, --author <AUTHOR>

Author name

--android

Whether to initialize an Android project for the plugin

--ios

Whether to initialize an iOS project for the plugin

--mobile

Whether to initialize Android and iOS projects for the plugin

--ios-framework <IOS_FRAMEWORK>

Type of framework to use for the iOS project

[default: spm]

Possible values:

- spm:   Swift Package Manager project

- xcode: Xcode project

--github-workflows

Generate github workflows

-t, --tauri-path <TAURI_PATH>

Path of the Tauri project to use (relative to the cwd)

-h, --help

Print help (see a summary with '-h')

-V, --version

Print version

```

#### [`plugin android`](#plugin-android)

```

npm run tauri plugin android

```
```

yarn tauri plugin android

```
```

pnpm tauri plugin android

```
```

deno task tauri plugin android

```
```

bun tauri plugin android

```
```

cargo tauri plugin android

```
```

Manage the Android project for a Tauri plugin

Usage: tauri plugin android [OPTIONS] <COMMAND>

Commands:

init  Initializes the Android project for an existing Tauri plugin

help  Print this message or the help of the given subcommand(s)

Options:

-v, --verbose...  Enables verbose logging

-h, --help        Print help

-V, --version     Print version

```

##### [`plugin android init`](#plugin-android-init)

```

npm run tauri plugin android init

```
```

yarn tauri plugin android init

```
```

pnpm tauri plugin android init

```
```

deno task tauri plugin android init

```
```

bun tauri plugin android init

```
```

cargo tauri plugin android init

```
```

Initializes the Android project for an existing Tauri plugin

Usage: tauri plugin android init [OPTIONS] [PLUGIN_NAME]

Arguments:

[PLUGIN_NAME]  Name of your Tauri plugin. Must match the current plugin's name. If not specified, it will be inferred from the current directory

Options:

-o, --out-dir <OUT_DIR>  The output directory [default: /opt/build/repo/packages/cli-generator]

-v, --verbose...         Enables verbose logging

-h, --help               Print help

-V, --version            Print version

```

#### [`plugin ios`](#plugin-ios)

```

npm run tauri plugin ios

```
```

yarn tauri plugin ios

```
```

pnpm tauri plugin ios

```
```

deno task tauri plugin ios

```
```

bun tauri plugin ios

```
```

cargo tauri plugin ios

```
```

Manage the iOS project for a Tauri plugin

Usage: tauri plugin ios [OPTIONS] <COMMAND>

Commands:

init  Initializes the iOS project for an existing Tauri plugin

help  Print this message or the help of the given subcommand(s)

Options:

-v, --verbose...  Enables verbose logging

-h, --help        Print help

-V, --version     Print version

```

##### [`plugin ios init`](#plugin-ios-init)

```

npm run tauri plugin ios init

```
```

yarn tauri plugin ios init

```
```

pnpm tauri plugin ios init

```
```

deno task tauri plugin ios init

```
```

bun tauri plugin ios init

```
```

cargo tauri plugin ios init

```
```

Initializes the iOS project for an existing Tauri plugin

Usage: tauri plugin ios init [OPTIONS] [PLUGIN_NAME]

Arguments:

[PLUGIN_NAME]

Name of your Tauri plugin. Must match the current plugin's name. If not specified, it will be inferred from the current directory

Options:

-o, --out-dir <OUT_DIR>

The output directory

[default: /opt/build/repo/packages/cli-generator]

-v, --verbose...

Enables verbose logging

--ios-framework <IOS_FRAMEWORK>

Type of framework to use for the iOS project

[default: spm]

Possible values:

- spm:   Swift Package Manager project

- xcode: Xcode project

-h, --help

Print help (see a summary with '-h')

-V, --version

Print version

```

### [`icon`](#icon)

```

npm run tauri icon

```
```

yarn tauri icon

```
```

pnpm tauri icon

```
```

deno task tauri icon

```
```

bun tauri icon

```
```

cargo tauri icon

```
```

Generate various icons for all major platforms

Usage: tauri icon [OPTIONS] [INPUT]

Arguments:

[INPUT]  Path to the source icon (squared PNG or SVG file with transparency) [default: ./app-icon.png]

Options:

-o, --output <OUTPUT>        Output directory. Default: 'icons' directory next to the tauri.conf.json file

-v, --verbose...             Enables verbose logging

-p, --png <PNG>              Custom PNG icon sizes to generate. When set, the default icons are not generated

--ios-color <IOS_COLOR>  The background color of the iOS icon - string as defined in the W3C's CSS Color Module Level 4 <https://www.w3.org/TR/css-color-4/> [default: #fff]

-h, --help                   Print help

-V, --version                Print version

```

### [`signer`](#signer)

```

npm run tauri signer

```
```

yarn tauri signer

```
```

pnpm tauri signer

```
```

deno task tauri signer

```
```

bun tauri signer

```
```

cargo tauri signer

```
```

Generate signing keys for Tauri updater or sign files

Usage: tauri signer [OPTIONS] <COMMAND>

Commands:

sign      Sign a file

generate  Generate a new signing key to sign files

help      Print this message or the help of the given subcommand(s)

Options:

-v, --verbose...  Enables verbose logging

-h, --help        Print help

-V, --version     Print version

```

#### [`signer sign`](#signer-sign)

```

npm run tauri signer sign

```
```

yarn tauri signer sign

```
```

pnpm tauri signer sign

```
```

deno task tauri signer sign

```
```

bun tauri signer sign

```
```

cargo tauri signer sign

```
```

Sign a file

Usage: tauri signer sign [OPTIONS] <FILE>

Arguments:

<FILE>  Sign the specified file

Options:

-k, --private-key <PRIVATE_KEY>

Load the private key from a string [env: TAURI_PRIVATE_KEY=]

-v, --verbose...

Enables verbose logging

-f, --private-key-path <PRIVATE_KEY_PATH>

Load the private key from a file [env: TAURI_PRIVATE_KEY_PATH=]

-p, --password <PASSWORD>

Set private key password when signing [env: TAURI_PRIVATE_KEY_PASSWORD=]

-h, --help

Print help

-V, --version

Print version

```

#### [`signer generate`](#signer-generate)

```

npm run tauri signer generate

```
```

yarn tauri signer generate

```
```

pnpm tauri signer generate

```
```

deno task tauri signer generate

```
```

bun tauri signer generate

```
```

cargo tauri signer generate

```
```

Generate a new signing key to sign files

Usage: tauri signer generate [OPTIONS]

Options:

-p, --password <PASSWORD>      Set private key password when signing

-v, --verbose...               Enables verbose logging

-w, --write-keys <WRITE_KEYS>  Write private key to a file

-f, --force                    Overwrite private key even if it exists on the specified path

--ci                       Skip prompting for values [env: CI=true]

-h, --help                     Print help

-V, --version                  Print version

```

### [`completions`](#completions)

```

npm run tauri completions

```
```

yarn tauri completions

```
```

pnpm tauri completions

```
```

deno task tauri completions

```
```

bun tauri completions

```
```

cargo tauri completions

```
```

Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish

Usage: tauri completions [OPTIONS] --shell <SHELL>

Options:

-s, --shell <SHELL>    Shell to generate a completion script for. [possible values: bash, elvish, fish, powershell, zsh]

-v, --verbose...       Enables verbose logging

-o, --output <OUTPUT>  Output file for the shell completions. By default the completions are printed to stdout

-h, --help             Print help

-V, --version          Print version

```

### [`permission`](#permission)

```

npm run tauri permission

```
```

yarn tauri permission

```
```

pnpm tauri permission

```
```

deno task tauri permission

```
```

bun tauri permission

```
```

cargo tauri permission

```
```

Manage or create permissions for your app or plugin

Usage: tauri permission [OPTIONS] <COMMAND>

Commands:

new   Create a new permission file

add   Add a permission to capabilities

rm    Remove a permission file, and its reference from any capability

ls    List permissions available to your application

help  Print this message or the help of the given subcommand(s)

Options:

-v, --verbose...  Enables verbose logging

-h, --help        Print help

-V, --version     Print version

```

#### [`permission new`](#permission-new)

```

npm run tauri permission new

```
```

yarn tauri permission new

```
```

pnpm tauri permission new

```
```

deno task tauri permission new

```
```

bun tauri permission new

```
```

cargo tauri permission new

```
```

Create a new permission file

Usage: tauri permission new [OPTIONS] [IDENTIFIER]

Arguments:

[IDENTIFIER]  Permission identifier

Options:

--description <DESCRIPTION>  Permission description

-v, --verbose...                 Enables verbose logging

-a, --allow <ALLOW>              List of commands to allow

-d, --deny <DENY>                List of commands to deny

--format <FORMAT>            Output file format [default: json] [possible values: json, toml]

-o, --out <OUT>                  The output file

-h, --help                       Print help

-V, --version                    Print version

```

#### [`permission add`](#permission-add)

```

npm run tauri permission add

```
```

yarn tauri permission add

```
```

pnpm tauri permission add

```
```

deno task tauri permission add

```
```

bun tauri permission add

```
```

cargo tauri permission add

```
```

Add a permission to capabilities

Usage: tauri permission add [OPTIONS] <IDENTIFIER> [CAPABILITY]

Arguments:

<IDENTIFIER>  Permission to add

[CAPABILITY]  Capability to add the permission to

Options:

-v, --verbose...  Enables verbose logging

-h, --help        Print help

-V, --version     Print version

```

#### [`permission rm`](#permission-rm)

```

npm run tauri permission rm

```
```

yarn tauri permission rm

```
```

pnpm tauri permission rm

```
```

deno task tauri permission rm

```
```

bun tauri permission rm

```
```

cargo tauri permission rm

```
```

Remove a permission file, and its reference from any capability

Usage: tauri permission rm [OPTIONS] <IDENTIFIER>

Arguments:

<IDENTIFIER>

Permission to remove.

To remove all permissions for a given plugin, provide `<plugin-name>:*`

Options:

-v, --verbose...

Enables verbose logging

-h, --help

Print help (see a summary with '-h')

-V, --version

Print version

```

#### [`permission ls`](#permission-ls)

```

npm run tauri permission ls

```
```

yarn tauri permission ls

```
```

pnpm tauri permission ls

```
```

deno task tauri permission ls

```
```

bun tauri permission ls

```
```

cargo tauri permission ls

```
```

List permissions available to your application

Usage: tauri permission ls [OPTIONS] [PLUGIN]

Arguments:

[PLUGIN]  Name of the plugin to list permissions

Options:

-f, --filter <FILTER>  Permission identifier filter

-v, --verbose...       Enables verbose logging

-h, --help             Print help

-V, --version          Print version

```

### [`capability`](#capability)

```

npm run tauri capability

```
```

yarn tauri capability

```
```

pnpm tauri capability

```
```

deno task tauri capability

```
```

bun tauri capability

```
```

cargo tauri capability

```
```

Manage or create capabilities for your app

Usage: tauri capability [OPTIONS] <COMMAND>

Commands:

new   Create a new permission file

help  Print this message or the help of the given subcommand(s)

Options:

-v, --verbose...  Enables verbose logging

-h, --help        Print help

-V, --version     Print version

```

#### [`capability new`](#capability-new)

```

npm run tauri capability new

```
```

yarn tauri capability new

```
```

pnpm tauri capability new

```
```

deno task tauri capability new

```
```

bun tauri capability new

```
```

cargo tauri capability new

```
```

Create a new permission file

Usage: tauri capability new [OPTIONS] [IDENTIFIER]

Arguments:

[IDENTIFIER]  Capability identifier

Options:

--description <DESCRIPTION>  Capability description

-v, --verbose...                 Enables verbose logging

--windows <WINDOWS>          Capability windows

--permission <PERMISSION>    Capability permissions

--format <FORMAT>            Output file format [default: json] [possible values: json, toml]

-o, --out <OUT>                  The output file

-h, --help                       Print help

-V, --version                    Print version

```

### [`inspect`](#inspect)

```

npm run tauri inspect

```
```

yarn tauri inspect

```
```

pnpm tauri inspect

```
```

deno task tauri inspect

```
```

bun tauri inspect

```
```

cargo tauri inspect

```
```

Manage or create permissions for your app or plugin

Usage: tauri inspect [OPTIONS] <COMMAND>

Commands:

wix-upgrade-code  Print the default Upgrade Code used by MSI installer derived from productName

help              Print this message or the help of the given subcommand(s)

Options:

-v, --verbose...  Enables verbose logging

-h, --help        Print help

-V, --version     Print version

```

#### [`inspect wix-upgrade-code`](#inspect-wix-upgrade-code)

```

npm run tauri inspect wix-upgrade-code

```
```

yarn tauri inspect wix-upgrade-code

```
```

pnpm tauri inspect wix-upgrade-code

```
```

deno task tauri inspect wix-upgrade-code

```
```

bun tauri inspect wix-upgrade-code

```
```

cargo tauri inspect wix-upgrade-code

```
```

Print the default Upgrade Code used by MSI installer derived from productName

Usage: tauri inspect wix-upgrade-code [OPTIONS]

Options:

-v, --verbose...  Enables verbose logging

-h, --help        Print help

-V, --version     Print version

```

[Edit page](https://github.com/tauri-apps/tauri-docs/edit/v2/src/content/docs/reference/cli.mdx)

Last updated: Aug 12, 2024

[Previous   
 Core Permissions](acl\core-permissions.md)   [Next   
 Configuration](config.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT