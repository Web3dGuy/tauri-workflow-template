# Macro generate\_handlerCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](https://docs.rs/tauri-macros/2.1.1/x86_64-unknown-linux-gnu/src/tauri_macros/lib.rs.html#72)

```
generate_handler!() { /* proc-macro */ }
```

Expand description

Accepts a list of command functions. Creates a handler that allows commands to be called from JS with invoke().

You can optionally annotate the commands with a inner attribute tag `#![plugin(your_plugin_name)]`
for `build > removeUnusedCommands` to work for plugins not defined in a standalone crate like `tauri-plugin-fs`

## [§](#examples)Examples

[ⓘ](# "This example is not tested")

```
use tauri_macros::{command, generate_handler};
#[command]
fn command_one() {
  println!("command one called");
}
#[command]
fn command_two() {
  println!("command two called");
}
fn main() {
  let _handler = generate_handler![command_one, command_two];
}
```

## [§](#stability)Stability

The output of this macro is managed internally by Tauri,
and should not be accessed directly on normal applications.
It may have breaking changes in the future.