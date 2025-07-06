# Function restartCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/process.rs.html#74-92)

```
pub fn restart(env: &Env) -> !
```

Expand description

Restarts the currently running binary.

See [`current_binary`](fn.current_binary.html.md "fn tauri::process::current_binary") for platform specific behavior, and
[`tauri_utils::platform::current_exe`](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/platform/fn.current_exe.html "fn tauri_utils::platform::current_exe") for possible security implications.

## [§](#examples)Examples

```
use tauri::{process::restart, Env, Manager};

tauri::Builder::default()
  .setup(|app| {
    restart(&app.env());
    Ok(())
  });
```