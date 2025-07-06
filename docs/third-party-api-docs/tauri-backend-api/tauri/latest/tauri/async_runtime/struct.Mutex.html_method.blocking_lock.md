# Struct MutexCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mutex.rs.html#133)

```
pub struct Mutex<T>

where
    T: ?Sized,

{ /* private fields */ }
```

Expand description

An asynchronous `Mutex`-like type.

This type acts similarly to [`std::sync::Mutex`](https://doc.rust-lang.org/nightly/std/sync/poison/mutex/struct.Mutex.html "struct std::sync::poison::mutex::Mutex"), with two major
differences: [`lock`](struct.Mutex.html_method.lock.md "method tauri::async_runtime::Mutex::lock") is an async method so does not block, and the lock
guard is designed to be held across `.await` points.

Tokio’s Mutex operates on a guaranteed FIFO basis.
This means that the order in which tasks call the [`lock`](struct.Mutex.html_method.lock.md "method tauri::async_runtime::Mutex::lock") method is
the exact order in which they will acquire the lock.

## [§](#which-kind-of-mutex-should-you-use)Which kind of mutex should you use?

Contrary to popular belief, it is ok and often preferred to use the ordinary
[`Mutex`](https://doc.rust-lang.org/nightly/std/sync/poison/mutex/struct.Mutex.html "struct std::sync::poison::mutex::Mutex") from the standard library in asynchronous code.

The feature that the async mutex offers over the blocking mutex is the
ability to keep it locked across an `.await` point. This makes the async
mutex more expensive than the blocking mutex, so the blocking mutex should
be preferred in the cases where it can be used. The primary use case for the
async mutex is to provide shared mutable access to IO resources such as a
database connection. If the value behind the mutex is just data, it’s
usually appropriate to use a blocking mutex such as the one in the standard
library or [`parking_lot`](https://docs.rs/parking_lot).

Note that, although the compiler will not prevent the std `Mutex` from holding
its guard across `.await` points in situations where the task is not movable
between threads, this virtually never leads to correct concurrent code in
practice as it can easily lead to deadlocks.

A common pattern is to wrap the `Arc<Mutex<...>>` in a struct that provides
non-async methods for performing operations on the data within, and only
lock the mutex inside these methods. The [mini-redis](https://github.com/tokio-rs/mini-redis/blob/master/src/db.rs) example provides an
illustration of this pattern.

Additionally, when you *do* want shared access to an IO resource, it is
often better to spawn a task to manage the IO resource, and to use message
passing to communicate with that task.

## [§](#examples)Examples:

```
use tokio::sync::Mutex;
use std::sync::Arc;

#[tokio::main]
async fn main() {
    let data1 = Arc::new(Mutex::new(0));
    let data2 = Arc::clone(&data1);

    tokio::spawn(async move {
        let mut lock = data2.lock().await;
        *lock += 1;
    });

    let mut lock = data1.lock().await;
    *lock += 1;
}
```
```
use tokio::sync::Mutex;
use std::sync::Arc;

#[tokio::main]
async fn main() {
    let count = Arc::new(Mutex::new(0));

    for i in 0..5 {
        let my_count = Arc::clone(&count);
        tokio::spawn(async move {
            for j in 0..10 {
                let mut lock = my_count.lock().await;
                *lock += 1;
                println!("{} {} {}", i, j, lock);
            }
        });
    }

    loop {
        if *count.lock().await >= 50 {
            break;
        }
    }
    println!("Count hit 50.");
}
```

There are a few things of note here to pay attention to in this example.

1. The mutex is wrapped in an [`Arc`](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc") to allow it to be shared across
   threads.
2. Each spawned task obtains a lock and releases it on every iteration.
3. Mutation of the data protected by the Mutex is done by de-referencing
   the obtained lock as seen on lines 13 and 20.

Tokio’s Mutex works in a simple FIFO (first in, first out) style where all
calls to [`lock`](struct.Mutex.html_method.lock.md "method tauri::async_runtime::Mutex::lock") complete in the order they were performed. In that way the
Mutex is “fair” and predictable in how it distributes the locks to inner
data. Locks are released and reacquired after every iteration, so basically,
each thread goes to the back of the line after it increments the value once.
Note that there’s some unpredictability to the timing between when the
threads are started, but once they are going they alternate predictably.
Finally, since there is only a single valid lock at any given time, there is
no possibility of a race condition when mutating the inner value.

Note that in contrast to [`std::sync::Mutex`](https://doc.rust-lang.org/nightly/std/sync/poison/mutex/struct.Mutex.html "struct std::sync::poison::mutex::Mutex"), this implementation does not
poison the mutex when a thread holding the [`MutexGuard`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.MutexGuard.html "struct tokio::sync::mutex::MutexGuard") panics. In such a
case, the mutex will be unlocked. If the panic is caught, this might leave
the data protected by the mutex in an inconsistent state.

## Implementations[§](#implementations)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mutex.rs.html#327)[§](#impl-Mutex%3CT%3E)

### impl<T> [Mutex](struct.Mutex.html.md "struct tauri::async_runtime::Mutex")<T> where T: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mutex.rs.html#338-340)

#### pub fn [new](#method.new)(t: T) -> [Mutex](struct.Mutex.html.md "struct tauri::async_runtime::Mutex")<T>

Creates a new lock in an unlocked state ready for use.

##### [§](#examples-1)Examples

```
use tokio::sync::Mutex;

let lock = Mutex::new(5);
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mutex.rs.html#395-397)

#### pub const fn [const\_new](#method.const_new)(t: T) -> [Mutex](struct.Mutex.html.md "struct tauri::async_runtime::Mutex")<T>

Creates a new lock in an unlocked state ready for use.

When using the `tracing` [unstable feature](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/index.html#unstable-features "mod tokio"), a `Mutex` created with
`const_new` will not be instrumented. As such, it will not be visible
in [`tokio-console`](https://github.com/tokio-rs/console). Instead, [`Mutex::new`](struct.Mutex.html_method.new.md "associated function tauri::async_runtime::Mutex::new") should be used to create
an instrumented object if that is needed.

##### [§](#examples-2)Examples

```
use tokio::sync::Mutex;

static LOCK: Mutex<i32> = Mutex::const_new(5);
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mutex.rs.html#434)

#### pub async fn [lock](#method.lock)(&self) -> [MutexGuard](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.MutexGuard.html "struct tokio::sync::mutex::MutexGuard")<'\_, T>

Locks this mutex, causing the current task to yield until the lock has
been acquired. When the lock has been acquired, function returns a
[`MutexGuard`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.MutexGuard.html "struct tokio::sync::mutex::MutexGuard").

If the mutex is available to be acquired immediately, then this call
will typically not yield to the runtime. However, this is not guaranteed
under all circumstances.

##### [§](#cancel-safety)Cancel safety

This method uses a queue to fairly distribute locks in the order they
were requested. Cancelling a call to `lock` makes you lose your place in
the queue.

##### [§](#examples-3)Examples

```
use tokio::sync::Mutex;

#[tokio::main]
async fn main() {
    let mutex = Mutex::new(1);

    let mut n = mutex.lock().await;
    *n = 2;
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mutex.rs.html#518)

#### pub fn [blocking\_lock](#method.blocking_lock)(&self) -> [MutexGuard](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.MutexGuard.html "struct tokio::sync::mutex::MutexGuard")<'\_, T>

Blockingly locks this `Mutex`. When the lock has been acquired, function returns a
[`MutexGuard`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.MutexGuard.html "struct tokio::sync::mutex::MutexGuard").

This method is intended for use cases where you
need to use this mutex in asynchronous code as well as in synchronous code.

##### [§](#panics)Panics

This function panics if called within an asynchronous execution context.

* If you find yourself in an asynchronous execution context and needing
  to call some (synchronous) function which performs one of these
  `blocking_` operations, then consider wrapping that call inside
  [`spawn_blocking()`](struct.TokioHandle.html_method.spawn_blocking.md "method tauri::async_runtime::TokioHandle::spawn_blocking")
  (or [`block_in_place()`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/task/blocking/fn.block_in_place.html "fn tokio::task::blocking::block_in_place")).

##### [§](#examples-4)Examples

```
use std::sync::Arc;
use tokio::sync::Mutex;

#[tokio::main]
async fn main() {
    let mutex =  Arc::new(Mutex::new(1));
    let lock = mutex.lock().await;

    let mutex1 = Arc::clone(&mutex);
    let blocking_task = tokio::task::spawn_blocking(move || {
        // This shall block until the `lock` is released.
        let mut n = mutex1.blocking_lock();
        *n = 2;
    });

    assert_eq!(*lock, 1);
    // Release the lock.
    drop(lock);

    // Await the completion of the blocking task.
    blocking_task.await.unwrap();

    // Assert uncontended.
    let n = mutex.try_lock().unwrap();
    assert_eq!(*n, 2);
}

```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mutex.rs.html#574)

#### pub fn [blocking\_lock\_owned](#method.blocking_lock_owned)(self: [Arc](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc")<[Mutex](struct.Mutex.html.md "struct tauri::async_runtime::Mutex")<T>>) -> [OwnedMutexGuard](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.OwnedMutexGuard.html "struct tokio::sync::mutex::OwnedMutexGuard")<T>

Blockingly locks this `Mutex`. When the lock has been acquired, function returns an
[`OwnedMutexGuard`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.OwnedMutexGuard.html "struct tokio::sync::mutex::OwnedMutexGuard").

This method is identical to [`Mutex::blocking_lock`](struct.Mutex.html_method.blocking_lock.md "method tauri::async_runtime::Mutex::blocking_lock"), except that the returned
guard references the `Mutex` with an [`Arc`](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc") rather than by borrowing
it. Therefore, the `Mutex` must be wrapped in an `Arc` to call this
method, and the guard will live for the `'static` lifetime, as it keeps
the `Mutex` alive by holding an `Arc`.

##### [§](#panics-1)Panics

This function panics if called within an asynchronous execution context.

* If you find yourself in an asynchronous execution context and needing
  to call some (synchronous) function which performs one of these
  `blocking_` operations, then consider wrapping that call inside
  [`spawn_blocking()`](struct.TokioHandle.html_method.spawn_blocking.md "method tauri::async_runtime::TokioHandle::spawn_blocking")
  (or [`block_in_place()`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/task/blocking/fn.block_in_place.html "fn tokio::task::blocking::block_in_place")).

##### [§](#examples-5)Examples

```
use std::sync::Arc;
use tokio::sync::Mutex;

#[tokio::main]
async fn main() {
    let mutex =  Arc::new(Mutex::new(1));
    let lock = mutex.lock().await;

    let mutex1 = Arc::clone(&mutex);
    let blocking_task = tokio::task::spawn_blocking(move || {
        // This shall block until the `lock` is released.
        let mut n = mutex1.blocking_lock_owned();
        *n = 2;
    });

    assert_eq!(*lock, 1);
    // Release the lock.
    drop(lock);

    // Await the completion of the blocking task.
    blocking_task.await.unwrap();

    // Assert uncontended.
    let n = mutex.try_lock().unwrap();
    assert_eq!(*n, 2);
}

```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mutex.rs.html#614)

#### pub async fn [lock\_owned](#method.lock_owned)(self: [Arc](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc")<[Mutex](struct.Mutex.html.md "struct tauri::async_runtime::Mutex")<T>>) -> [OwnedMutexGuard](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.OwnedMutexGuard.html "struct tokio::sync::mutex::OwnedMutexGuard")<T>

Locks this mutex, causing the current task to yield until the lock has
been acquired. When the lock has been acquired, this returns an
[`OwnedMutexGuard`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.OwnedMutexGuard.html "struct tokio::sync::mutex::OwnedMutexGuard").

If the mutex is available to be acquired immediately, then this call
will typically not yield to the runtime. However, this is not guaranteed
under all circumstances.

This method is identical to [`Mutex::lock`](struct.Mutex.html_method.lock.md "method tauri::async_runtime::Mutex::lock"), except that the returned
guard references the `Mutex` with an [`Arc`](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc") rather than by borrowing
it. Therefore, the `Mutex` must be wrapped in an `Arc` to call this
method, and the guard will live for the `'static` lifetime, as it keeps
the `Mutex` alive by holding an `Arc`.

##### [§](#cancel-safety-1)Cancel safety

This method uses a queue to fairly distribute locks in the order they
were requested. Cancelling a call to `lock_owned` makes you lose your
place in the queue.

##### [§](#examples-6)Examples

```
use tokio::sync::Mutex;
use std::sync::Arc;

#[tokio::main]
async fn main() {
    let mutex = Arc::new(Mutex::new(1));

    let mut n = mutex.clone().lock_owned().await;
    *n = 2;
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mutex.rs.html#678)

#### pub fn [try\_lock](#method.try_lock)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[MutexGuard](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.MutexGuard.html "struct tokio::sync::mutex::MutexGuard")<'\_, T>, [TryLockError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.TryLockError.html "struct tokio::sync::mutex::TryLockError")>

Attempts to acquire the lock, and returns [`TryLockError`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.TryLockError.html "struct tokio::sync::mutex::TryLockError") if the
lock is currently held somewhere else.

##### [§](#examples-7)Examples

```
use tokio::sync::Mutex;

let mutex = Mutex::new(1);

let n = mutex.try_lock()?;
assert_eq!(*n, 1);
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mutex.rs.html#718)

#### pub fn [get\_mut](#method.get_mut)(&mut self) -> [&mut T](https://doc.rust-lang.org/nightly/std/primitive.reference.html)

Returns a mutable reference to the underlying data.

Since this call borrows the `Mutex` mutably, no actual locking needs to
take place – the mutable borrow statically guarantees no locks exist.

##### [§](#examples-8)Examples

```
use tokio::sync::Mutex;

fn main() {
    let mut mutex = Mutex::new(1);

    let n = mutex.get_mut();
    *n = 2;
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mutex.rs.html#749)

#### pub fn [try\_lock\_owned](#method.try_lock_owned)( self: [Arc](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc")<[Mutex](struct.Mutex.html.md "struct tauri::async_runtime::Mutex")<T>>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[OwnedMutexGuard](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.OwnedMutexGuard.html "struct tokio::sync::mutex::OwnedMutexGuard")<T>, [TryLockError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.TryLockError.html "struct tokio::sync::mutex::TryLockError")>

Attempts to acquire the lock, and returns [`TryLockError`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.TryLockError.html "struct tokio::sync::mutex::TryLockError") if the lock
is currently held somewhere else.

This method is identical to [`Mutex::try_lock`](struct.Mutex.html_method.try_lock.md "method tauri::async_runtime::Mutex::try_lock"), except that the
returned guard references the `Mutex` with an [`Arc`](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc") rather than by
borrowing it. Therefore, the `Mutex` must be wrapped in an `Arc` to call
this method, and the guard will live for the `'static` lifetime, as it
keeps the `Mutex` alive by holding an `Arc`.

##### [§](#examples-9)Examples

```
use tokio::sync::Mutex;
use std::sync::Arc;

let mutex = Arc::new(Mutex::new(1));

let n = mutex.clone().try_lock_owned()?;
assert_eq!(*n, 1);
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mutex.rs.html#786-788)

#### pub fn [into\_inner](#method.into_inner)(self) -> T

Consumes the mutex, returning the underlying data.

##### [§](#examples-10)Examples

```
use tokio::sync::Mutex;

#[tokio::main]
async fn main() {
    let mutex = Mutex::new(1);

    let n = mutex.into_inner();
    assert_eq!(n, 1);
}
```

## Trait Implementations[§](#trait-implementations)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mutex.rs.html#809-811)[§](#impl-Debug-for-Mutex%3CT%3E)

### impl<T> [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [Mutex](struct.Mutex.html.md "struct tauri::async_runtime::Mutex")<T> where T: [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mutex.rs.html#813)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")>

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mutex.rs.html#800-802)[§](#impl-Default-for-Mutex%3CT%3E)

### impl<T> [Default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html "trait core::default::Default") for [Mutex](struct.Mutex.html.md "struct tauri::async_runtime::Mutex")<T> where T: [Default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html "trait core::default::Default"),

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mutex.rs.html#804)[§](#method.default)

#### fn [default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html#tymethod.default)() -> [Mutex](struct.Mutex.html.md "struct tauri::async_runtime::Mutex")<T>

Returns the “default value” for a type. [Read more](https://doc.rust-lang.org/nightly/core/default/trait.Default.html#tymethod.default)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mutex.rs.html#794)[§](#impl-From%3CT%3E-for-Mutex%3CT%3E)

### impl<T> [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<T> for [Mutex](struct.Mutex.html.md "struct tauri::async_runtime::Mutex")<T>

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mutex.rs.html#795)[§](#method.from)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(s: T) -> [Mutex](struct.Mutex.html.md "struct tauri::async_runtime::Mutex")<T>

Converts to this type from the input type.

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mutex.rs.html#258)[§](#impl-Send-for-Mutex%3CT%3E)

### impl<T> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [Mutex](struct.Mutex.html.md "struct tauri::async_runtime::Mutex")<T> where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mutex.rs.html#259)[§](#impl-Sync-for-Mutex%3CT%3E)

### impl<T> [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [Mutex](struct.Mutex.html.md "struct tauri::async_runtime::Mutex")<T> where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-Mutex%3CT%3E)

### impl<T> ![Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [Mutex](struct.Mutex.html.md "struct tauri::async_runtime::Mutex")<T>

[§](#impl-RefUnwindSafe-for-Mutex%3CT%3E)

### impl<T> ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [Mutex](struct.Mutex.html.md "struct tauri::async_runtime::Mutex")<T>

[§](#impl-Unpin-for-Mutex%3CT%3E)

### impl<T> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [Mutex](struct.Mutex.html.md "struct tauri::async_runtime::Mutex")<T> where T: [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[§](#impl-UnwindSafe-for-Mutex%3CT%3E)

### impl<T> [UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [Mutex](struct.Mutex.html.md "struct tauri::async_runtime::Mutex")<T> where T: [UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

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

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#783)[§](#impl-From%3C!%3E-for-T)

### impl<T> [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[!](https://doc.rust-lang.org/nightly/std/primitive.never.html)> for T

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#784)[§](#method.from-2)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(t: [!](https://doc.rust-lang.org/nightly/std/primitive.never.html)) -> T

Converts to this type from the input type.

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#767)[§](#impl-From%3CT%3E-for-T)

### impl<T> [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<T> for T

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#770)[§](#method.from-1)

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