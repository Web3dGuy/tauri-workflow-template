# Function get\_ipc\_responseCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/test/mod.rs.html#287-304)

```
pub fn get_ipc_response<W: AsRef<Webview<MockRuntime>>>(
    webview: &W,
    request: InvokeRequest,
) -> Result<InvokeResponseBody, Value>
```

Available on **crate feature `test`** only.

Expand description

Executes the given IPC message and get the return value.

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
    let res = tauri::test::get_ipc_response(
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
    );
    assert!(res.is_ok());
    assert_eq!(res.unwrap().deserialize::<String>().unwrap(), String::from("pong"));
}
```