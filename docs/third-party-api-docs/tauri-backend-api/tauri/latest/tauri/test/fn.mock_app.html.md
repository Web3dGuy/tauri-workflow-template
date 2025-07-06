# Function mock\_appCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/test/mod.rs.html#184-186)

```
pub fn mock_app() -> App<MockRuntime>
```

Available on **crate feature `test`** only.

Expand description

Creates a new [`App`](..\struct.App.html.md "struct tauri::App") for testing using the [`mock_context`](fn.mock_context.html.md "fn tauri::test::mock_context") with a [`noop_assets`](fn.noop_assets.html.md "fn tauri::test::noop_assets").