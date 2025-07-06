# Constant RESTART\_EXIT\_CODECopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](../src/tauri/app.rs.html#74)

```
pub const RESTART_EXIT_CODE: i32 = i32::MAX; // 2_147_483_647i32
```

Expand description

The exit code on [`RunEvent::ExitRequested`](enum.RunEvent.html_variant.ExitRequested.md "variant tauri::RunEvent::ExitRequested") when [`AppHandle`](struct.AppHandle.html_method.restart.md "struct tauri::AppHandle") is called.