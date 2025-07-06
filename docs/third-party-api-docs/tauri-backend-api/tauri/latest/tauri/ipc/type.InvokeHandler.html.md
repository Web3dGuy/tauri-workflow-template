# Type Alias InvokeHandlerCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/ipc/mod.rs.html#38)

```
pub type InvokeHandler<R> = dyn Fn(Invoke<R>) -> bool + Send + Sync + 'static;
```

Expand description

A closure that is run every time Tauri receives a message it doesn’t explicitly handle.