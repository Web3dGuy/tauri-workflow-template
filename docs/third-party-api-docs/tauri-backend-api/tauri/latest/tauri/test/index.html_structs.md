# Module testCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/test/mod.rs.html#5-329)

Available on **crate feature `test`** only.

Expand description

Utilities for unit testing on Tauri applications.

## [§](#stability)Stability

This module is unstable.

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
    // Use `tauri::Builder::default()` to use the default runtime rather than the `MockRuntime`;
    // let app = create_app(tauri::Builder::default());
    let app = create_app(mock_builder());
    let webview = tauri::WebviewWindowBuilder::new(&app, "main", Default::default()).build().unwrap();

    // run the `ping` command and assert it returns `pong`
    let res = tauri::test::get_ipc_response(
        &webview,
        tauri::webview::InvokeRequest {
            cmd: "ping".into(),
            callback: tauri::ipc::CallbackFn(0),
            error: tauri::ipc::CallbackFn(1),
            // alternatively use "tauri://localhost"
            url: "http://tauri.localhost".parse().unwrap(),
            body: tauri::ipc::InvokeBody::default(),
            headers: Default::default(),
            invoke_key: tauri::test::INVOKE_KEY.to_string(),
        },
    ).map(|b| b.deserialize::<String>().unwrap());
}
```

## Structs[§](#structs)

[EventProxy](struct.EventProxy.html.md "struct tauri::test::EventProxy")

[MockRuntime](struct.MockRuntime.html.md "struct tauri::test::MockRuntime")

[MockRuntimeHandle](struct.MockRuntimeHandle.html.md "struct tauri::test::MockRuntimeHandle")

[MockWebviewDispatcher](struct.MockWebviewDispatcher.html.md "struct tauri::test::MockWebviewDispatcher")

[MockWindowBuilder](struct.MockWindowBuilder.html.md "struct tauri::test::MockWindowBuilder")

[MockWindowDispatcher](struct.MockWindowDispatcher.html.md "struct tauri::test::MockWindowDispatcher")

[NoopAsset](struct.NoopAsset.html.md "struct tauri::test::NoopAsset")
:   An empty [`Assets`](..\trait.Assets.html.md "trait tauri::Assets") implementation.

[RuntimeContext](struct.RuntimeContext.html.md "struct tauri::test::RuntimeContext")

## Constants[§](#constants)

[INVOKE\_KEY](constant.INVOKE_KEY.html.md "constant tauri::test::INVOKE_KEY")
:   The invoke key used for tests.

## Functions[§](#functions)

[assert\_ipc\_response](fn.assert_ipc_response.html.md "fn tauri::test::assert_ipc_response")
:   Executes the given IPC message and assert the response matches the expected value.

[get\_ipc\_response](fn.get_ipc_response.html.md "fn tauri::test::get_ipc_response")
:   Executes the given IPC message and get the return value.

[mock\_app](fn.mock_app.html.md "fn tauri::test::mock_app")
:   Creates a new [`App`](..\struct.App.html.md "struct tauri::App") for testing using the [`mock_context`](fn.mock_context.html.md "fn tauri::test::mock_context") with a [`noop_assets`](fn.noop_assets.html.md "fn tauri::test::noop_assets").

[mock\_builder](fn.mock_builder.html.md "fn tauri::test::mock_builder")
:   Creates a new [`Builder`](..\struct.Builder.html.md "struct tauri::Builder") using the [`MockRuntime`](struct.MockRuntime.html.md "struct tauri::test::MockRuntime").

[mock\_context](fn.mock_context.html.md "fn tauri::test::mock_context")
:   Creates a new [`crate::Context`](..\struct.Context.html.md "struct tauri::Context") for testing.

[noop\_assets](fn.noop_assets.html.md "fn tauri::test::noop_assets")
:   Creates a new empty [`Assets`](..\trait.Assets.html.md "trait tauri::Assets") implementation.