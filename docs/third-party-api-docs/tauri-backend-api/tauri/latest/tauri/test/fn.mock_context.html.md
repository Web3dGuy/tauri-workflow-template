# Function mock\_contextCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/test/mod.rs.html#109-148)

```
pub fn mock_context<R: Runtime, A: Assets<R>>(assets: A) -> Context<R>
```

Available on **crate feature `test`** only.

Expand description

Creates a new [`crate::Context`](..\struct.Context.html.md "struct tauri::Context") for testing.