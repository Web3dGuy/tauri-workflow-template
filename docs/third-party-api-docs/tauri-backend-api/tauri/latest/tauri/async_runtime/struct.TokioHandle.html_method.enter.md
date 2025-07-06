# Struct TokioHandleCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/handle.rs.html#14)

```
pub struct TokioHandle { /* private fields */ }
```

Expand description

Handle to the runtime.

The handle is internally reference-counted and can be freely cloned. A handle can be
obtained using the [`Runtime::handle`](struct.TokioRuntime.html_method.handle.md "method tauri::async_runtime::TokioRuntime::handle") method.

## Implementations[§](#implementations)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/handle.rs.html#40)[§](#impl-Handle)

### impl [Handle](struct.TokioHandle.html.md "struct tauri::async_runtime::TokioHandle")

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/handle.rs.html#84)

#### pub fn [enter](#method.enter)(&self) -> [EnterGuard](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/runtime/handle/struct.EnterGuard.html "struct tokio::runtime::handle::EnterGuard")<'\_>

Enters the runtime context. This allows you to construct types that must
have an executor available on creation such as [`Sleep`](struct@crate__time__Sleep.md) or
[`TcpStream`](struct@crate__net__TcpStream.md). It will also allow you to call methods such as
[`tokio::spawn`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/task/spawn/fn.spawn.html "fn tokio::task::spawn::spawn") and [`Handle::current`](struct.TokioHandle.html_method.current.md "associated function tauri::async_runtime::TokioHandle::current") without panicking.

##### [§](#panics)Panics

When calling `Handle::enter` multiple times, the returned guards
**must** be dropped in the reverse order that they were acquired.
Failure to do so will result in a panic and possible memory leaks.

##### [§](#examples)Examples

```
use tokio::runtime::Runtime;

let rt = Runtime::new().unwrap();

let _guard = rt.enter();
tokio::spawn(async {
    println!("Hello world!");
});
```

Do **not** do the following, this shows a scenario that will result in a
panic and possible memory leak.

[ⓘ](# "This example panics")

```
use tokio::runtime::Runtime;

let rt1 = Runtime::new().unwrap();
let rt2 = Runtime::new().unwrap();

let enter1 = rt1.enter();
let enter2 = rt2.enter();

drop(enter1);
drop(enter2);
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/handle.rs.html#139)

#### pub fn [current](#method.current)() -> [Handle](struct.TokioHandle.html.md "struct tauri::async_runtime::TokioHandle")

Returns a `Handle` view over the currently running `Runtime`.

##### [§](#panics-1)Panics

This will panic if called outside the context of a Tokio runtime. That means that you must
call this on one of the threads **being run by the runtime**, or from a thread with an active
`EnterGuard`. Calling this from within a thread created by `std::thread::spawn` (for example)
will cause a panic unless that thread has an active `EnterGuard`.

##### [§](#examples-1)Examples

This can be used to obtain the handle of the surrounding runtime from an async
block or function running on that runtime.

```
use tokio::runtime::Handle;

// Inside an async block or function.
let handle = Handle::current();
handle.spawn(async {
    println!("now running in the existing Runtime");
});

thread::spawn(move || {
    // Notice that the handle is created outside of this thread and then moved in
    handle.spawn(async { /* ... */ });
    // This next line would cause a panic because we haven't entered the runtime
    // and created an EnterGuard
    // let handle2 = Handle::current(); // panic
    // So we create a guard here with Handle::enter();
    let _guard = handle.enter();
    // Now we can call Handle::current();
    let handle2 = Handle::current();
});
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/handle.rs.html#150)

#### pub fn [try\_current](#method.try_current)() -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Handle](struct.TokioHandle.html.md "struct tauri::async_runtime::TokioHandle"), [TryCurrentError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/runtime/handle/struct.TryCurrentError.html "struct tokio::runtime::handle::TryCurrentError")>

Returns a Handle view over the currently running Runtime

Returns an error if no Runtime has been started

Contrary to `current`, this never panics

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/handle.rs.html#188-191)

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
// Get a handle from this runtime
let handle = rt.handle();

// Spawn a future onto the runtime using the handle
handle.spawn(async {
    println!("now running on a worker thread");
});
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/handle.rs.html#221-224)

#### pub fn [spawn\_blocking](#method.spawn_blocking)<F, R>(&self, func: F) -> [JoinHandle](struct.TokioJoinHandle.html.md "struct tauri::async_runtime::TokioJoinHandle")<R> [ⓘ](#) where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")() -> R + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static, R: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

Runs the provided function on an executor dedicated to blocking
operations.

##### [§](#examples-3)Examples

```
use tokio::runtime::Runtime;

// Create the runtime
let rt = Runtime::new().unwrap();
// Get a handle from this runtime
let handle = rt.handle();

// Spawn a blocking function onto the runtime using the handle
handle.spawn_blocking(|| {
    println!("now running on a worker thread");
});
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/handle.rs.html#300)

#### pub fn [block\_on](#method.block_on)<F>(&self, future: F) -> <F as [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future")>::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output") where F: [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future"),

Runs a future to completion on this `Handle`’s associated `Runtime`.

This runs the given future on the current thread, blocking until it is
complete, and yielding its resolved result. Any tasks or timers which
the future spawns internally will be executed on the runtime.

When this is used on a `current_thread` runtime, only the
[`Runtime::block_on`](struct.TokioRuntime.html_method.block_on.md "method tauri::async_runtime::TokioRuntime::block_on") method can drive the IO and timer drivers, but the
`Handle::block_on` method cannot drive them. This means that, when using
this method on a `current_thread` runtime, anything that relies on IO or
timers will not work unless there is another thread currently calling
[`Runtime::block_on`](struct.TokioRuntime.html_method.block_on.md "method tauri::async_runtime::TokioRuntime::block_on") on the same runtime.

##### [§](#if-the-runtime-has-been-shut-down)If the runtime has been shut down

If the `Handle`’s associated `Runtime` has been shut down (through
[`Runtime::shutdown_background`](struct.TokioRuntime.html_method.shutdown_background.md "method tauri::async_runtime::TokioRuntime::shutdown_background"), [`Runtime::shutdown_timeout`](struct.TokioRuntime.html_method.shutdown_timeout.md "method tauri::async_runtime::TokioRuntime::shutdown_timeout"), or by
dropping it) and `Handle::block_on` is used it might return an error or
panic. Specifically IO resources will return an error and timers will
panic. Runtime independent futures will run as normal.

##### [§](#panics-2)Panics

This function panics if the provided future panics, if called within an
asynchronous execution context, or if a timer future is executed on a runtime that has been
shut down.

##### [§](#examples-4)Examples

```
use tokio::runtime::Runtime;

// Create the runtime
let rt  = Runtime::new().unwrap();

// Get a handle from this runtime
let handle = rt.handle();

// Execute the future, blocking the current thread until completion
handle.block_on(async {
    println!("hello");
});
```

Or using `Handle::current`:

```
use tokio::runtime::Handle;

#[tokio::main]
async fn main () {
    let handle = Handle::current();
    std::thread::spawn(move || {
        // Using Handle::block_on to run async code in the new thread.
        handle.block_on(async {
            println!("hello");
        });
    });
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/handle.rs.html#397)

#### pub fn [runtime\_flavor](#method.runtime_flavor)(&self) -> [RuntimeFlavor](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/runtime/runtime/enum.RuntimeFlavor.html "enum tokio::runtime::runtime::RuntimeFlavor")

Returns the flavor of the current `Runtime`.

##### [§](#examples-5)Examples

```
use tokio::runtime::{Handle, RuntimeFlavor};

#[tokio::main(flavor = "current_thread")]
async fn main() {
  assert_eq!(RuntimeFlavor::CurrentThread, Handle::current().runtime_flavor());
}
```
```
use tokio::runtime::{Handle, RuntimeFlavor};

#[tokio::main(flavor = "multi_thread", worker_threads = 4)]
async fn main() {
  assert_eq!(RuntimeFlavor::MultiThread, Handle::current().runtime_flavor());
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/handle.rs.html#441)

#### pub fn [metrics](#method.metrics)(&self) -> [RuntimeMetrics](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/runtime/metrics/runtime/struct.RuntimeMetrics.html "struct tokio::runtime::metrics::runtime::RuntimeMetrics")

Returns a view that lets you get information about how the runtime
is performing.

## Trait Implementations[§](#trait-implementations)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/handle.rs.html#11)[§](#impl-Clone-for-Handle)

### impl [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [Handle](struct.TokioHandle.html.md "struct tauri::async_runtime::TokioHandle")

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/handle.rs.html#11)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> [Handle](struct.TokioHandle.html.md "struct tauri::async_runtime::TokioHandle")

Returns a copy of the value. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#174)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &Self)

Performs copy-assignment from `source`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/handle.rs.html#11)[§](#impl-Debug-for-Handle)

### impl [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [Handle](struct.TokioHandle.html.md "struct tauri::async_runtime::TokioHandle")

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/runtime/handle.rs.html#11)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")>

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-Handle)

### impl [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [Handle](struct.TokioHandle.html.md "struct tauri::async_runtime::TokioHandle")

[§](#impl-RefUnwindSafe-for-Handle)

### impl ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [Handle](struct.TokioHandle.html.md "struct tauri::async_runtime::TokioHandle")

[§](#impl-Send-for-Handle)

### impl [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [Handle](struct.TokioHandle.html.md "struct tauri::async_runtime::TokioHandle")

[§](#impl-Sync-for-Handle)

### impl [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [Handle](struct.TokioHandle.html.md "struct tauri::async_runtime::TokioHandle")

[§](#impl-Unpin-for-Handle)

### impl [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [Handle](struct.TokioHandle.html.md "struct tauri::async_runtime::TokioHandle")

[§](#impl-UnwindSafe-for-Handle)

### impl ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [Handle](struct.TokioHandle.html.md "struct tauri::async_runtime::TokioHandle")

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

[Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#441)[§](#impl-CloneToUninit-for-T)

### impl<T> [CloneToUninit](https://doc.rust-lang.org/nightly/core/clone/trait.CloneToUninit.html "trait core::clone::CloneToUninit") for T where T: [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone"),

[Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#443)[§](#method.clone_to_uninit)

#### unsafe fn [clone\_to\_uninit](https://doc.rust-lang.org/nightly/core/clone/trait.CloneToUninit.html#tymethod.clone_to_uninit)(&self, dest: [\*mut](https://doc.rust-lang.org/nightly/std/primitive.pointer.html) [u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html))

🔬This is a nightly-only experimental API. (`clone_to_uninit`)

Performs copy-assignment from `self` to `dest`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.CloneToUninit.html#tymethod.clone_to_uninit)

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

[Source](https://doc.rust-lang.org/nightly/src/alloc/borrow.rs.html#82-84)[§](#impl-ToOwned-for-T)

### impl<T> [ToOwned](https://doc.rust-lang.org/nightly/alloc/borrow/trait.ToOwned.html "trait alloc::borrow::ToOwned") for T where T: [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/borrow.rs.html#86)[§](#associatedtype.Owned)

#### type [Owned](https://doc.rust-lang.org/nightly/alloc/borrow/trait.ToOwned.html#associatedtype.Owned) = T

The resulting type after obtaining ownership.

[Source](https://doc.rust-lang.org/nightly/src/alloc/borrow.rs.html#87)[§](#method.to_owned)

#### fn [to\_owned](https://doc.rust-lang.org/nightly/alloc/borrow/trait.ToOwned.html#tymethod.to_owned)(&self) -> T

Creates owned data from borrowed data, usually by cloning. [Read more](https://doc.rust-lang.org/nightly/alloc/borrow/trait.ToOwned.html#tymethod.to_owned)

[Source](https://doc.rust-lang.org/nightly/src/alloc/borrow.rs.html#91)[§](#method.clone_into)

#### fn [clone\_into](https://doc.rust-lang.org/nightly/alloc/borrow/trait.ToOwned.html#method.clone_into)(&self, target: [&mut T](https://doc.rust-lang.org/nightly/std/primitive.reference.html))

Uses borrowed data to replace owned data, usually by cloning. [Read more](https://doc.rust-lang.org/nightly/alloc/borrow/trait.ToOwned.html#method.clone_into)

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

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/lib.rs.html#210)[§](#impl-UserEvent-for-T)

### impl<T> [UserEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.UserEvent.html "trait tauri_runtime::UserEvent") for T where T: [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") + [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,

{"JoinHandle<<F as Future>::Output>":"<h3>Notable traits for <code><a class=\"struct\" href=\"struct.TokioJoinHandle.html\" title=\"struct tauri::async\_runtime::TokioJoinHandle\">JoinHandle</a>&lt;T&gt;</code></h3><pre><code><div class=\"where\">impl&lt;T&gt; <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html\" title=\"trait core::future::future::Future\">Future</a> for <a class=\"struct\" href=\"struct.TokioJoinHandle.html\" title=\"struct tauri::async\_runtime::TokioJoinHandle\">JoinHandle</a>&lt;T&gt;</div><div class=\"where\"> type <a href=\"https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output\" class=\"associatedtype\">Output</a> = <a class=\"enum\" href=\"https://doc.rust-lang.org/nightly/core/result/enum.Result.html\" title=\"enum core::result::Result\">Result</a>&lt;T, <a class=\"struct\" href=\"https://docs.rs/tokio/1.44.1/x86\_64-unknown-linux-gnu/tokio/runtime/task/error/struct.JoinError.html\" title=\"struct tokio::runtime::task::error::JoinError\">JoinError</a>&gt;;</div>","JoinHandle<R>":"<h3>Notable traits for <code><a class=\"struct\" href=\"struct.TokioJoinHandle.html\" title=\"struct tauri::async\_runtime::TokioJoinHandle\">JoinHandle</a>&lt;T&gt;</code></h3><pre><code><div class=\"where\">impl&lt;T&gt; <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html\" title=\"trait core::future::future::Future\">Future</a> for <a class=\"struct\" href=\"struct.TokioJoinHandle.html\" title=\"struct tauri::async\_runtime::TokioJoinHandle\">JoinHandle</a>&lt;T&gt;</div><div class=\"where\"> type <a href=\"https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output\" class=\"associatedtype\">Output</a> = <a class=\"enum\" href=\"https://doc.rust-lang.org/nightly/core/result/enum.Result.html\" title=\"enum core::result::Result\">Result</a>&lt;T, <a class=\"struct\" href=\"https://docs.rs/tokio/1.44.1/x86\_64-unknown-linux-gnu/tokio/runtime/task/error/struct.JoinError.html\" title=\"struct tokio::runtime::task::error::JoinError\">JoinError</a>&gt;;</div>"}