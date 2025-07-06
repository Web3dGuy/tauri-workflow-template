# Function setCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/async_runtime.rs.html#246-253)

```
pub fn set(handle: TokioHandle)
```

Expand description

Sets the runtime to use to execute asynchronous tasks.
For convenience, this method takes a [`TokioHandle`](struct.TokioHandle.html.md "struct tauri::async_runtime::TokioHandle").
Note that you cannot drop the underlying [`TokioRuntime`](struct.TokioRuntime.html.md "struct tauri::async_runtime::TokioRuntime").

## [§](#examples)Examples

```
#[tokio::main]
async fn main() {
  // perform some async task before initializing the app
  do_something().await;
  // share the current runtime with Tauri
  tauri::async_runtime::set(tokio::runtime::Handle::current());

  // bootstrap the tauri app...
  // tauri::Builder::default().run().unwrap();
}

async fn do_something() {}
```

## [§](#panics)Panics

Panics if the runtime is already set.