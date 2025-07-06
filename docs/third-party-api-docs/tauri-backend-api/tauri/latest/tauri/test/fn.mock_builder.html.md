# Function mock\_builderCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/test/mod.rs.html#165-181)

```
pub fn mock_builder() -> Builder<MockRuntime>
```

Available on **crate feature `test`** only.

Expand description

Creates a new [`Builder`](..\struct.Builder.html.md "struct tauri::Builder") using the [`MockRuntime`](struct.MockRuntime.html.md "struct tauri::test::MockRuntime").

To use a dummy [`Context`](..\struct.Context.html.md "struct tauri::Context"), see [`mock_app`](fn.mock_app.html.md "fn tauri::test::mock_app").

## [§](#examples)Examples

```
#[cfg(test)]
fn do_something() {
  let app = tauri::test::mock_builder()
    // remove the string argument to use your app's config file
    .build(tauri::generate_context!("test/fixture/src-tauri/tauri.conf.json"))
    .unwrap();
}
```