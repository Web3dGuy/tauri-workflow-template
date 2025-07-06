# Module pluginCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/plugin.rs.html#5-980)

Expand description

The Tauri plugin extension to expand Tauri functionality.

## Structs[§](#structs)

[Builder](struct.Builder.html.md "struct tauri::plugin::Builder")
:   Builds a [`TauriPlugin`](struct.TauriPlugin.html.md "struct tauri::plugin::TauriPlugin").

[PluginApi](struct.PluginApi.html.md "struct tauri::plugin::PluginApi")
:   Api exposed to the plugin setup hook.

[PluginHandle](struct.PluginHandle.html.md "struct tauri::plugin::PluginHandle")
:   A handle to a plugin.

[TauriPlugin](struct.TauriPlugin.html.md "struct tauri::plugin::TauriPlugin")
:   Plugin struct that is returned by the [`Builder`](struct.Builder.html.md "struct tauri::plugin::Builder"). Should only be constructed through the builder.

## Enums[§](#enums)

[BuilderError](enum.BuilderError.html.md "enum tauri::plugin::BuilderError")
:   Errors that can happen during [`Builder`](struct.Builder.html.md "struct tauri::plugin::Builder").

[PermissionState](enum.PermissionState.html.md "enum tauri::plugin::PermissionState")
:   Permission state.

## Traits[§](#traits)

[Plugin](trait.Plugin.html.md "trait tauri::plugin::Plugin")
:   The plugin interface.