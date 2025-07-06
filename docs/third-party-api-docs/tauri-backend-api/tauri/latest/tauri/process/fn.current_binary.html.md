# Function current\_binaryCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/process.rs.html#48-56)

```
pub fn current_binary(_env: &Env) -> Result<PathBuf>
```

Expand description

Finds the current running binary’s path.

With exception to any following platform-specific behavior, the path is cached as soon as
possible, and then used repeatedly instead of querying for a new path every time this function
is called.

## [§](#platform-specific-behavior)Platform-specific behavior

### [§](#linux)Linux

On Linux, this function will **attempt** to detect if it’s currently running from a
valid [AppImage](https://appimage.org/) and use that path instead.

### [§](#macos)macOS

On `macOS`, this function will return an error if the original path contained any symlinks
due to less protection on macOS regarding symlinks. This behavior can be disabled by setting the
`process-relaunch-dangerous-allow-symlink-macos` feature, although it is *highly discouraged*.

## [§](#security)Security

See [`tauri_utils::platform::current_exe`](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/platform/fn.current_exe.html "fn tauri_utils::platform::current_exe") for possible security implications.

## [§](#examples)Examples

```
use tauri::{process::current_binary, Env, Manager};
let current_binary_path = current_binary(&Env::default()).unwrap();

tauri::Builder::default()
  .setup(|app| {
    let current_binary_path = current_binary(&app.env())?;
    Ok(())
  });
```