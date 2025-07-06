# Type Alias InvokeResponderCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/ipc/mod.rs.html#41-42)

```
pub type InvokeResponder<R> = dyn Fn(&Webview<R>, &str, &InvokeResponse, CallbackFn, CallbackFn) + Send + Sync + 'static;
```

Expand description

A closure that is responsible for respond a JS message.