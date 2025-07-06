# Struct TokioRuntimeCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/runtime.rs.html#99)

```
pub struct TokioRuntime { /* private fields */ }
```

Expand description

The Tokio runtime.

The runtime provides an I/O driver, task scheduler, [timer](crate::time), and
blocking pool, necessary for running asynchronous tasks.

Instances of `Runtime` can be created using [`new`](struct.TokioRuntime.html_method.new.md "associated function tauri::async_runtime::TokioRuntime::new"), or [`Builder`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/runtime/builder/struct.Builder.html "struct tokio::runtime::builder::Builder").
However, most users will use the [`#[tokio::main]`](macro@crate__main.md) annotation on
their entry point instead.

See [module level](index.html.md) documentation for more details.

## [§](#shutdown)Shutdown

Shutting down the runtime is done by dropping the value, or calling
[`shutdown_background`](struct.TokioRuntime.html_method.shutdown_background.md "method tauri::async_runtime::TokioRuntime::shutdown_background") or [`shutdown_timeout`](struct.TokioRuntime.html_method.shutdown_timeout.md "method tauri::async_runtime::TokioRuntime::shutdown_timeout").

Tasks spawned through [`Runtime::spawn`](struct.TokioRuntime.html_method.spawn.md "method tauri::async_runtime::TokioRuntime::spawn") keep running until they yield.
Then they are dropped. They are not *guaranteed* to run to completion, but
*might* do so if they do not yield until completion.

Blocking functions spawned through [`Runtime::spawn_blocking`](struct.TokioRuntime.html_method.spawn_blocking.md "method tauri::async_runtime::TokioRuntime::spawn_blocking") keep running
until they return.

The thread initiating the shutdown blocks until all spawned work has been
stopped. This can take an indefinite amount of time. The `Drop`
implementation waits forever for this.

The [`shutdown_background`](struct.TokioRuntime.html_method.shutdown_background.md "method tauri::async_runtime::TokioRuntime::shutdown_background") and [`shutdown_timeout`](struct.TokioRuntime.html_method.shutdown_timeout.md "method tauri::async_runtime::TokioRuntime::shutdown_timeout") methods can be used if
waiting forever is undesired. When the timeout is reached, spawned work that
did not stop in time and threads running it are leaked. The work continues
to run until one of the stopping conditions is fulfilled, but the thread
initiating the shutdown is unblocked.

Once the runtime has been dropped, any outstanding I/O resources bound to
it will no longer function. Calling any method on them will result in an
error.

## [§](#sharing)Sharing

There are several ways to establish shared access to a Tokio runtime:

* Using an `Arc<Runtime>`.
* Using a [`Handle`](struct.TokioHandle.html.md "struct tauri::async_runtime::TokioHandle").
* Entering the runtime context.

Using an `Arc<Runtime>` or [`Handle`](struct.TokioHandle.html.md "struct tauri::async_runtime::TokioHandle") allows you to do various
things with the runtime such as spawning new tasks or entering the runtime
context. Both types can be cloned to create a new handle that allows access
to the same runtime. By passing clones into different tasks or threads, you
will be able to access the runtime from those tasks or threads.

The difference between `Arc<Runtime>` and [`Handle`](struct.TokioHandle.html.md "struct tauri::async_runtime::TokioHandle") is that
an `Arc<Runtime>` will prevent the runtime from shutting down,
whereas a [`Handle`](struct.TokioHandle.html.md "struct tauri::async_runtime::TokioHandle") does not prevent that. This is because shutdown of the
runtime happens when the destructor of the `Runtime` object runs.

Calls to [`shutdown_background`](struct.TokioRuntime.html_method.shutdown_background.md "method tauri::async_runtime::TokioRuntime::shutdown_background") and [`shutdown_timeout`](struct.TokioRuntime.html_method.shutdown_timeout.md "method tauri::async_runtime::TokioRuntime::shutdown_timeout") require exclusive
ownership of the `Runtime` type. When using an `Arc<Runtime>`,
this can be achieved via [`Arc::try_unwrap`](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html#method.try_unwrap "associated function alloc::sync::Arc::try_unwrap") when only one strong count
reference is left over.

The runtime context is entered using the [`Runtime::enter`](struct.TokioRuntime.html_method.enter.md "method tauri::async_runtime::TokioRuntime::enter") or
[`Handle::enter`](struct.TokioHandle.html_method.enter.md "method tauri::async_runtime::TokioHandle::enter") methods, which use a thread-local variable to store the
current runtime. Whenever you are inside the runtime context, methods such
as [`tokio::spawn`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/task/spawn/fn.spawn.html "fn tokio::task::spawn::spawn") will use the runtime whose context you are inside.

## Implementations[§](#implementations)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/runtime.rs.html#141)[§](#impl-Runtime)

### impl [Runtime](struct.TokioRuntime.html.md "struct tauri::async_runtime::TokioRuntime")

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/runtime.rs.html#184)

#### pub fn [new](#method.new)() -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Runtime](struct.TokioRuntime.html.md "struct tauri::async_runtime::TokioRuntime"), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

Available on **crate feature `rt-multi-thread`** only.

Creates a new runtime instance with default configuration values.

This results in the multi threaded scheduler, I/O driver, and time driver being
initialized.

Most applications will not need to call this function directly. Instead,
they will use the [`#[tokio::main]` attribute](..\attr.main.html.md). When a more complex
configuration is necessary, the [runtime builder](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/runtime/builder/struct.Builder.html "struct tokio::runtime::builder::Builder") may be used.

See [module level](index.html.md) documentation for more details.

##### [§](#examples)Examples

Creating a new `Runtime` with default configuration values.

```
use tokio::runtime::Runtime;

let rt = Runtime::new()
    .unwrap();

// Use the runtime...
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/runtime.rs.html#208)

#### pub fn [handle](#method.handle)(&self) -> &[Handle](struct.TokioHandle.html.md "struct tauri::async_runtime::TokioHandle")

Returns a handle to the runtime’s spawner.

The returned handle can be used to spawn tasks that run on this runtime, and can
be cloned to allow moving the `Handle` to other threads.

Calling [`Handle::block_on`](struct.TokioHandle.html_method.block_on.md "method tauri::async_runtime::TokioHandle::block_on") on a handle to a `current_thread` runtime is error-prone.
Refer to the documentation of [`Handle::block_on`](struct.TokioHandle.html_method.block_on.md "method tauri::async_runtime::TokioHandle::block_on") for more.

##### [§](#examples-1)Examples

```
use tokio::runtime::Runtime;

let rt = Runtime::new()
    .unwrap();

let handle = rt.handle();

// Use the handle...
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/runtime.rs.html#242-245)

#### pub fn [spawn](#method.spawn)<F>(&self, future: F) -> [JoinHandle](struct.TokioJoinHandle.html.md "struct tauri::async_runtime::TokioJoinHandle")<<F as [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future")>::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output")> [ⓘ](#) where F: [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future") + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static, <F as [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future")>::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output"): [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Spawns a future onto the Tokio runtime.

This spawns the given future onto the runtime’s executor, usually a
thread pool. The thread pool is then responsible for polling the future
until it completes.

The provided future will start running in the background immediately
when `spawn` is called, even if you don’t await the returned
`JoinHandle`.

See [module level](index.html.md) documentation for more details.

##### [§](#examples-2)Examples

```
use tokio::runtime::Runtime;

// Create the runtime
let rt = Runtime::new().unwrap();

// Spawn a future onto the runtime
rt.spawn(async {
    println!("now running on a worker thread");
});
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/runtime.rs.html#275-278)

#### pub fn [spawn\_blocking](#method.spawn_blocking)<F, R>(&self, func: F) -> [JoinHandle](struct.TokioJoinHandle.html.md "struct tauri::async_runtime::TokioJoinHandle")<R> [ⓘ](#) where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")() -> R + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static, R: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Runs the provided function on an executor dedicated to blocking operations.

##### [§](#examples-3)Examples

```
use tokio::runtime::Runtime;

// Create the runtime
let rt = Runtime::new().unwrap();

// Spawn a blocking function onto the runtime
rt.spawn_blocking(|| {
    println!("now running on a worker thread");
});
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/runtime.rs.html#337)

#### pub fn [block\_on](#method.block_on)<F>(&self, future: F) -> <F as [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future")>::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output") where F: [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future"),

Runs a future to completion on the Tokio runtime. This is the
runtime’s entry point.

This runs the given future on the current thread, blocking until it is
complete, and yielding its resolved result. Any tasks or timers
which the future spawns internally will be executed on the runtime.

##### [§](#non-worker-future)Non-worker future

Note that the future required by this function does not run as a
worker. The expectation is that other tasks are spawned by the future here.
Awaiting on other futures from the future provided here will not
perform as fast as those spawned as workers.

##### [§](#multi-thread-scheduler)Multi thread scheduler

When the multi thread scheduler is used this will allow futures
to run within the io driver and timer context of the overall runtime.

Any spawned tasks will continue running after `block_on` returns.

##### [§](#current-thread-scheduler)Current thread scheduler

When the current thread scheduler is enabled `block_on`
can be called concurrently from multiple threads. The first call
will take ownership of the io and timer drivers. This means
other threads which do not own the drivers will hook into that one.
When the first `block_on` completes, other threads will be able to
“steal” the driver to allow continued execution of their futures.

Any spawned tasks will be suspended after `block_on` returns. Calling
`block_on` again will resume previously spawned tasks.

##### [§](#panics)Panics

This function panics if the provided future panics, or if called within an
asynchronous execution context.

##### [§](#examples-4)Examples

```
use tokio::runtime::Runtime;

// Create the runtime
let rt  = Runtime::new().unwrap();

// Execute the future, blocking the current thread until completion
rt.block_on(async {
    println!("hello");
});
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/runtime.rs.html#412)

#### pub fn [enter](#method.enter)(&self) -> [EnterGuard](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/runtime/handle/struct.EnterGuard.html "struct tokio::runtime::handle::EnterGuard")<'\_>

Enters the runtime context.

This allows you to construct types that must have an executor
available on creation such as [`Sleep`](struct@crate__time__Sleep.md) or [`TcpStream`](struct@crate__net__TcpStream.md). It will
also allow you to call methods such as [`tokio::spawn`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/task/spawn/fn.spawn.html "fn tokio::task::spawn::spawn").

##### [§](#example)Example

```
use tokio::runtime::Runtime;
use tokio::task::JoinHandle;

fn function_that_spawns(msg: String) -> JoinHandle<()> {
    // Had we not used `rt.enter` below, this would panic.
    tokio::spawn(async move {
        println!("{}", msg);
    })
}

fn main() {
    let rt = Runtime::new().unwrap();

    let s = "Hello World!".to_string();

    // By entering the context, we tie `tokio::spawn` to this executor.
    let _guard = rt.enter();
    let handle = function_that_spawns(s);

    // Wait for the task before we end the test.
    rt.block_on(handle).unwrap();
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/runtime.rs.html#443)

#### pub fn [shutdown\_timeout](#method.shutdown_timeout)(self, duration: [Duration](https://doc.rust-lang.org/nightly/core/time/struct.Duration.html "struct core::time::Duration"))

Shuts down the runtime, waiting for at most `duration` for all spawned
work to stop.

See the [struct level documentation](struct.TokioRuntime.html_shutdown.md "struct tauri::async_runtime::TokioRuntime") for more details.

##### [§](#examples-5)Examples

```
use tokio::runtime::Runtime;
use tokio::task;

use std::thread;
use std::time::Duration;

fn main() {
   let runtime = Runtime::new().unwrap();

   runtime.block_on(async move {
       task::spawn_blocking(move || {
           thread::sleep(Duration::from_secs(10_000));
       });
   });

   runtime.shutdown_timeout(Duration::from_millis(100));
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/runtime.rs.html#477)

#### pub fn [shutdown\_background](#method.shutdown_background)(self)

Shuts down the runtime, without waiting for any spawned work to stop.

This can be useful if you want to drop a runtime from within another runtime.
Normally, dropping a runtime will block indefinitely for spawned blocking tasks
to complete, which would normally not be permitted within an asynchronous context.
By calling `shutdown_background()`, you can drop the runtime from such a context.

Note however, that because we do not wait for any blocking tasks to complete, this
may result in a resource leak (in that any blocking tasks are still running until they
return.

See the [struct level documentation](struct.TokioRuntime.html_shutdown.md "struct tauri::async_runtime::TokioRuntime") for more details.

This function is equivalent to calling `shutdown_timeout(Duration::from_nanos(0))`.

```
use tokio::runtime::Runtime;

fn main() {
   let runtime = Runtime::new().unwrap();

   runtime.block_on(async move {
       let inner_runtime = Runtime::new().unwrap();
       // ...
       inner_runtime.shutdown_background();
   });
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/runtime.rs.html#483)

#### pub fn [metrics](#method.metrics)(&self) -> [RuntimeMetrics](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/runtime/metrics/runtime/struct.RuntimeMetrics.html "struct tokio::runtime::metrics::runtime::RuntimeMetrics")

Returns a view that lets you get information about how the runtime
is performing.

## Trait Implementations[§](#trait-implementations)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/runtime.rs.html#98)[§](#impl-Debug-for-Runtime)

### impl [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [Runtime](struct.TokioRuntime.html.md "struct tauri::async_runtime::TokioRuntime")

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/runtime.rs.html#98)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")>

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/runtime.rs.html#489)[§](#impl-Drop-for-Runtime)

### impl [Drop](https://doc.rust-lang.org/nightly/core/ops/drop/trait.Drop.html "trait core::ops::drop::Drop") for [Runtime](struct.TokioRuntime.html.md "struct tauri::async_runtime::TokioRuntime")

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/runtime.rs.html#490)[§](#method.drop)

#### fn [drop](https://doc.rust-lang.org/nightly/core/ops/drop/trait.Drop.html#tymethod.drop)(&mut self)

Executes the destructor for this type. [Read more](https://doc.rust-lang.org/nightly/core/ops/drop/trait.Drop.html#tymethod.drop)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/runtime.rs.html#516)[§](#impl-RefUnwindSafe-for-Runtime)

### impl [RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [Runtime](struct.TokioRuntime.html.md "struct tauri::async_runtime::TokioRuntime")

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/runtime.rs.html#514)[§](#impl-UnwindSafe-for-Runtime)

### impl [UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [Runtime](struct.TokioRuntime.html.md "struct tauri::async_runtime::TokioRuntime")

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-Runtime)

### impl ![Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [Runtime](struct.TokioRuntime.html.md "struct tauri::async_runtime::TokioRuntime")

[§](#impl-Send-for-Runtime)

### impl [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [Runtime](struct.TokioRuntime.html.md "struct tauri::async_runtime::TokioRuntime")

[§](#impl-Sync-for-Runtime)

### impl [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [Runtime](struct.TokioRuntime.html.md "struct tauri::async_runtime::TokioRuntime")

[§](#impl-Unpin-for-Runtime)

### impl [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [Runtime](struct.TokioRuntime.html.md "struct tauri::async_runtime::TokioRuntime")

## Blanket Implementations[§](#blanket-implementations)

[Source](https://doc.rust-lang.org/nightly/src/core/any.rs.html#138)[§](#impl-Any-for-T)

### impl<T> [Any](https://doc.rust-lang.org/nightly/core/any/trait.Any.html "trait core::any::Any") for T where T: 'static + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/core/any.rs.html#139)[§](#method.type_id)

#### fn [type\_id](https://doc.rust-lang.org/nightly/core/any/trait.Any.html#tymethod.type_id)(&self) -> [TypeId](https://doc.rust-lang.org/nightly/core/any/struct.TypeId.html "struct core::any::TypeId")

Gets the `TypeId` of `self`. [Read more](https://doc.rust-lang.org/nightly/core/any/trait.Any.html#tymethod.type_id)

[Source](https://doc.rust-lang.org/nightly/src/core/borrow.rs.html#209)[§](#impl-Borrow%3CT%3E-for-T)

### impl<T> [Borrow](https://doc.rust-lang.org/nightly/core/borrow/trait.Borrow.html "trait core::borrow::Borrow")<T> for T where T: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/core/borrow.rs.html#211)[§](#method.borrow)

#### fn [borrow](https://doc.rust-lang.org/nightly/core/borrow/trait.Borrow.html#tymethod.borrow)(&self) -> [&T](https://doc.rust-lang.org/nightly/std/primitive.reference.html)

Immutably borrows from an owned value. [Read more](https://doc.rust-lang.org/nightly/core/borrow/trait.Borrow.html#tymethod.borrow)

[Source](https://doc.rust-lang.org/nightly/src/core/borrow.rs.html#217)[§](#impl-BorrowMut%3CT%3E-for-T)

### impl<T> [BorrowMut](https://doc.rust-lang.org/nightly/core/borrow/trait.BorrowMut.html "trait core::borrow::BorrowMut")<T> for T where T: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/core/borrow.rs.html#218)[§](#method.borrow_mut)

#### fn [borrow\_mut](https://doc.rust-lang.org/nightly/core/borrow/trait.BorrowMut.html#tymethod.borrow_mut)(&mut self) -> [&mut T](https://doc.rust-lang.org/nightly/std/primitive.reference.html)

Mutably borrows from an owned value. [Read more](https://doc.rust-lang.org/nightly/core/borrow/trait.BorrowMut.html#tymethod.borrow_mut)

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#767)[§](#impl-From%3CT%3E-for-T)

### impl<T> [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<T> for T

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#770)[§](#method.from)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(t: T) -> T

Returns the argument unchanged.

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#750-752)[§](#impl-Into%3CU%3E-for-T)

### impl<T, U> [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<U> for T where U: [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<T>,

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#760)[§](#method.into)

#### fn [into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html#tymethod.into)(self) -> U

Calls `U::from(self)`.

That is, this conversion is whatever the implementation of
`From<T> for U` chooses to do.

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#806-808)[§](#impl-TryFrom%3CU%3E-for-T)

### impl<T, U> [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<U> for T where U: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<T>,

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#810)[§](#associatedtype.Error-1)

#### type [Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error) = [Infallible](https://doc.rust-lang.org/nightly/core/convert/enum.Infallible.html "enum core::convert::Infallible")

The type returned in the event of a conversion error.

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#813)[§](#method.try_from)

#### fn [try\_from](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#tymethod.try_from)(value: U) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, <T as [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<U>>::[Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error "type core::convert::TryFrom::Error")>

Performs the conversion.

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#791-793)[§](#impl-TryInto%3CU%3E-for-T)

### impl<T, U> [TryInto](https://doc.rust-lang.org/nightly/core/convert/trait.TryInto.html "trait core::convert::TryInto")<U> for T where U: [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<T>,

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#795)[§](#associatedtype.Error)

#### type [Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryInto.html#associatedtype.Error) = <U as [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<T>>::[Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error "type core::convert::TryFrom::Error")

The type returned in the event of a conversion error.

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#798)[§](#method.try_into)

#### fn [try\_into](https://doc.rust-lang.org/nightly/core/convert/trait.TryInto.html#tymethod.try_into)(self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<U, <U as [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<T>>::[Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error "type core::convert::TryFrom::Error")>

Performs the conversion.

[Source](https://docs.rs/yoke/0.7.5/x86_64-unknown-linux-gnu/src/yoke/erased.rs.html#22)[§](#impl-ErasedDestructor-for-T)

### impl<T> [ErasedDestructor](https://docs.rs/yoke/0.7.5/x86_64-unknown-linux-gnu/yoke/erased/trait.ErasedDestructor.html "trait yoke::erased::ErasedDestructor") for T where T: 'static,

[Source](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/src/icu_provider/any.rs.html#32)[§](#impl-MaybeSendSync-for-T)

### impl<T> [MaybeSendSync](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/any/trait.MaybeSendSync.html "trait icu_provider::any::MaybeSendSync") for T

{"JoinHandle<<F as Future>::Output>":"<h3>Notable traits for <code><a class=\"struct\" href=\"struct.TokioJoinHandle.html\" title=\"struct tauri::async\_runtime::TokioJoinHandle\">JoinHandle</a>&lt;T&gt;</code></h3><pre><code><div class=\"where\">impl&lt;T&gt; <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html\" title=\"trait core::future::future::Future\">Future</a> for <a class=\"struct\" href=\"struct.TokioJoinHandle.html\" title=\"struct tauri::async\_runtime::TokioJoinHandle\">JoinHandle</a>&lt;T&gt;</div><div class=\"where\"> type <a href=\"https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output\" class=\"associatedtype\">Output</a> = <a class=\"enum\" href=\"https://doc.rust-lang.org/nightly/core/result/enum.Result.html\" title=\"enum core::result::Result\">Result</a>&lt;T, <a class=\"struct\" href=\"https://docs.rs/tokio/1.44.1/x86\_64-unknown-linux-gnu/tokio/runtime/task/error/struct.JoinError.html\" title=\"struct tokio::runtime::task::error::JoinError\">JoinError</a>&gt;;</div>","JoinHandle<R>":"<h3>Notable traits for <code><a class=\"struct\" href=\"struct.TokioJoinHandle.html\" title=\"struct tauri::async\_runtime::TokioJoinHandle\">JoinHandle</a>&lt;T&gt;</code></h3><pre><code><div class=\"where\">impl&lt;T&gt; <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html\" title=\"trait core::future::future::Future\">Future</a> for <a class=\"struct\" href=\"struct.TokioJoinHandle.html\" title=\"struct tauri::async\_runtime::TokioJoinHandle\">JoinHandle</a>&lt;T&gt;</div><div class=\"where\"> type <a href=\"https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output\" class=\"associatedtype\">Output</a> = <a class=\"enum\" href=\"https://doc.rust-lang.org/nightly/core/result/enum.Result.html\" title=\"enum core::result::Result\">Result</a>&lt;T, <a class=\"struct\" href=\"https://docs.rs/tokio/1.44.1/x86\_64-unknown-linux-gnu/tokio/runtime/task/error/struct.JoinError.html\" title=\"struct tokio::runtime::task::error::JoinError\">JoinError</a>&gt;;</div>"}