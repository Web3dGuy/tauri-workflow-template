# Function block\_onCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/async_runtime.rs.html#262-265)

```
pub fn block_on<F: Future>(task: F) -> F::Output
```

Expand description

Runs a future to completion on runtime.