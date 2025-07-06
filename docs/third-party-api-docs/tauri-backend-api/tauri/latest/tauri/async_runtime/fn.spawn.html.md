# Function spawnCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/async_runtime.rs.html#268-275)

```
pub fn spawn<F>(task: F) -> JoinHandle<F::Output> ⓘ

where
    F: Future + Send + 'static,
    F::Output: Send + 'static,

```

Expand description

Spawns a future onto the runtime.

{"JoinHandle<F::Output>":"<h3>Notable traits for <code><a class=\"enum\" href=\"enum.JoinHandle.html\" title=\"enum tauri::async\_runtime::JoinHandle\">JoinHandle</a>&lt;T&gt;</code></h3><pre><code><div class=\"where\">impl&lt;T&gt; <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html\" title=\"trait core::future::future::Future\">Future</a> for <a class=\"enum\" href=\"enum.JoinHandle.html\" title=\"enum tauri::async\_runtime::JoinHandle\">JoinHandle</a>&lt;T&gt;</div><div class=\"where\"> type <a href=\"https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output\" class=\"associatedtype\">Output</a> = <a class=\"type\" href=\"../type.Result.html\" title=\"type tauri::Result\">Result</a>&lt;T&gt;;</div>"}