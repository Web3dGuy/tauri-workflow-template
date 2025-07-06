# Macro generate\_contextCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](https://docs.rs/tauri-macros/2.1.1/x86_64-unknown-linux-gnu/src/tauri_macros/lib.rs.html#83)

```
generate_context!() { /* proc-macro */ }
```

Expand description

Reads the config file at compile time and generates a [`Context`](struct.Context.html.md "struct tauri::Context") based on its content.

The default config file path is a `tauri.conf.json` file inside the Cargo manifest directory of
the crate being built.

## [§](#custom-config-path)Custom Config Path

You may pass a string literal to this macro to specify a custom path for the Tauri config file.
If the path is relative, it will be search for relative to the Cargo manifest of the compiling
crate.

## [§](#note)Note

This macro should not be called if you are using [`tauri-build`](https://docs.rs/tauri-build) to generate the context from
inside your build script as it will just cause excess computations that will be discarded. Use
either the [`tauri-build`](https://docs.rs/tauri-build) method or this macro - not both.

Reads a Tauri config file and generates a `::tauri::Context` based on the content.

## [§](#stability)Stability

The output of this macro is managed internally by Tauri,
and should not be accessed directly on normal applications.
It may have breaking changes in the future.