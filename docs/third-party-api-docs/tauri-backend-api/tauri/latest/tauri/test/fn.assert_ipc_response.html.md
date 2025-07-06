# Function assert\_ipc\_responseCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/test/mod.rs.html#228-244)

```
pub fn assert_ipc_response<T: Serialize + Debug + Send + Sync + 'static, W: AsRef<Webview<MockRuntime>>>(
    webview: &W,
    request: InvokeRequest,
    expected: Result<T, T>,
)
```

Available on **crate feature `test`** only.

Expand description

Executes the given IPC message and assert the response matches the expected value.

## [§](#examples)Examples

```
use tauri::test::{mock_builder, mock_context, noop_assets};

#[tauri::command]
fn ping() -> &'static str {
    "pong"
}

fn create_app<R: tauri::Runtime>(builder: tauri::Builder<R>) -> tauri::App<R> {
    builder
        .invoke_handler(tauri::generate_handler![ping])
        // remove the string argument to use your app's config file
        .build(tauri::generate_context!("test/fixture/src-tauri/tauri.conf.json"))
        .expect("failed to build app")
}

fn main() {
    let app = create_app(mock_builder());
    let webview = tauri::WebviewWindowBuilder::new(&app, "main", Default::default()).build().unwrap();

    // run the `ping` command and assert it returns `pong`
    tauri::test::assert_ipc_response(
        &webview,
        tauri::webview::InvokeRequest {
            cmd: "ping".into(),
            callback: tauri::ipc::CallbackFn(0),
            error: tauri::ipc::CallbackFn(1),
            url: "http://tauri.localhost".parse().unwrap(),
            body: tauri::ipc::InvokeBody::default(),
            headers: Default::default(),
            invoke_key: tauri::test::INVOKE_KEY.to_string(),
        },
      Ok("pong")
    );
}
```