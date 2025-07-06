# Trait IpcResponseCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/ipc/mod.rs.html#171-174)

```
pub trait IpcResponse {
    // Required method
    fn body(self) -> Result<InvokeResponseBody>;
}
```

Expand description

Marks a type as a response to an IPC call.

## Required Methods[§](#required-methods)

[Source](../../src/tauri/ipc/mod.rs.html#173)

#### fn [body](#tymethod.body)(self) -> [Result](..\type.Result.html.md "type tauri::Result")<[InvokeResponseBody](enum.InvokeResponseBody.html.md "enum tauri::ipc::InvokeResponseBody")>

Resolve the IPC response body.

## Implementors[§](#implementors)

[Source](../../src/tauri/ipc/mod.rs.html#122-126)[§](#impl-IpcResponse-for-InvokeResponseBody)

### impl [IpcResponse](trait.IpcResponse.html.md "trait tauri::ipc::IpcResponse") for [InvokeResponseBody](enum.InvokeResponseBody.html.md "enum tauri::ipc::InvokeResponseBody")

[Source](../../src/tauri/ipc/mod.rs.html#189-193)[§](#impl-IpcResponse-for-Response)

### impl [IpcResponse](trait.IpcResponse.html.md "trait tauri::ipc::IpcResponse") for [Response](struct.Response.html.md "struct tauri::ipc::Response")

[Source](../../src/tauri/ipc/mod.rs.html#176-182)[§](#impl-IpcResponse-for-T)

### impl<T: [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize")> [IpcResponse](trait.IpcResponse.html.md "trait tauri::ipc::IpcResponse") for T