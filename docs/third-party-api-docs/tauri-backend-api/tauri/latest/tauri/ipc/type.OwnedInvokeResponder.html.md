# Type Alias OwnedInvokeResponderCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/ipc/mod.rs.html#44-45)

```
pub type OwnedInvokeResponder<R> = dyn FnOnce(Webview<R>, String, InvokeResponse, CallbackFn, CallbackFn) + Send + 'static;
```

Expand description

Similar to [`InvokeResponder`](type.InvokeResponder.html.md "type tauri::ipc::InvokeResponder") but taking owned arguments.