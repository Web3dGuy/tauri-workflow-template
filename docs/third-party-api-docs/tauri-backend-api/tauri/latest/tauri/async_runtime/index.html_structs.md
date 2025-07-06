# Module async\_runtimeCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/async_runtime.rs.html#5-348)

Expand description

The singleton async runtime used by Tauri and exposed to users.

Tauri uses [`tokio`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/index.html "mod tokio") Runtime to initialize code, such as
[`Plugin::initialize`](..\plugin\trait.Plugin.html_method.initialize.md) and [`crate::Builder::setup`](..\struct.Builder.html_method.setup.md "method tauri::Builder::setup") hooks.
This module also re-export some common items most developers need from [`tokio`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/index.html "mod tokio"). If there’s
one you need isn’t here, you could use types in [`tokio`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/index.html "mod tokio") directly.
For custom command handlers, it’s recommended to use a plain `async fn` command.

## Structs[§](#structs)

[Mutex](struct.Mutex.html.md "struct tauri::async_runtime::Mutex")
:   An asynchronous `Mutex`-like type.

[Receiver](struct.Receiver.html.md "struct tauri::async_runtime::Receiver")
:   Receives values from the associated `Sender`.

[RwLock](struct.RwLock.html.md "struct tauri::async_runtime::RwLock")
:   An asynchronous reader-writer lock.

[Sender](struct.Sender.html.md "struct tauri::async_runtime::Sender")
:   Sends values to the associated `Receiver`.

[TokioHandle](struct.TokioHandle.html.md "struct tauri::async_runtime::TokioHandle")
:   Handle to the runtime.

[TokioJoinHandle](struct.TokioJoinHandle.html.md "struct tauri::async_runtime::TokioJoinHandle")
:   An owned permission to join on a task (await its termination).

[TokioRuntime](struct.TokioRuntime.html.md "struct tauri::async_runtime::TokioRuntime")
:   The Tokio runtime.

## Enums[§](#enums)

[JoinHandle](enum.JoinHandle.html.md "enum tauri::async_runtime::JoinHandle")
:   An owned permission to join on a task (await its termination).

[Runtime](enum.Runtime.html.md "enum tauri::async_runtime::Runtime")
:   A runtime used to execute asynchronous tasks.

[RuntimeHandle](enum.RuntimeHandle.html.md "enum tauri::async_runtime::RuntimeHandle")
:   A handle to the async runtime

## Functions[§](#functions)

[block\_on](fn.block_on.html.md "fn tauri::async_runtime::block_on")
:   Runs a future to completion on runtime.

[channel](fn.channel.html.md "fn tauri::async_runtime::channel")
:   Creates a bounded mpsc channel for communicating between asynchronous tasks
    with backpressure.

[handle](fn.handle.html.md "fn tauri::async_runtime::handle")
:   Returns a handle of the async runtime.

[set](fn.set.html.md "fn tauri::async_runtime::set")
:   Sets the runtime to use to execute asynchronous tasks.
    For convenience, this method takes a [`TokioHandle`](struct.TokioHandle.html.md "struct tauri::async_runtime::TokioHandle").
    Note that you cannot drop the underlying [`TokioRuntime`](struct.TokioRuntime.html.md "struct tauri::async_runtime::TokioRuntime").

[spawn](fn.spawn.html.md "fn tauri::async_runtime::spawn")
:   Spawns a future onto the runtime.

[spawn\_blocking](fn.spawn_blocking.html.md "fn tauri::async_runtime::spawn_blocking")
:   Runs the provided function on an executor dedicated to blocking operations.