# Struct RwLockCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#88)

```
pub struct RwLock<T>

where
    T: ?Sized,

{ /* private fields */ }
```

Expand description

An asynchronous reader-writer lock.

This type of lock allows a number of readers or at most one writer at any
point in time. The write portion of this lock typically allows modification
of the underlying data (exclusive access) and the read portion of this lock
typically allows for read-only access (shared access).

In comparison, a [`Mutex`](struct.Mutex.html.md "struct tauri::async_runtime::Mutex") does not distinguish between readers or writers
that acquire the lock, therefore causing any tasks waiting for the lock to
become available to yield. An `RwLock` will allow any number of readers to
acquire the lock as long as a writer is not holding the lock.

The priority policy of Tokio’s read-write lock is *fair* (or
[*write-preferring*](https://en.wikipedia.org/wiki/Readers%E2%80%93writer_lock#Priority_policies)), in order to ensure that readers cannot starve
writers. Fairness is ensured using a first-in, first-out queue for the tasks
awaiting the lock; if a task that wishes to acquire the write lock is at the
head of the queue, read locks will not be given out until the write lock has
been released. This is in contrast to the Rust standard library’s
`std::sync::RwLock`, where the priority policy is dependent on the
operating system’s implementation.

The type parameter `T` represents the data that this lock protects. It is
required that `T` satisfies [`Send`](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") to be shared across threads. The RAII guards
returned from the locking methods implement [`Deref`](https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html "trait core::ops::deref::Deref")
(and [`DerefMut`](https://doc.rust-lang.org/nightly/core/ops/deref/trait.DerefMut.html "trait core::ops::deref::DerefMut")
for the `write` methods) to allow access to the content of the lock.

## [§](#examples)Examples

```
use tokio::sync::RwLock;

#[tokio::main]
async fn main() {
    let lock = RwLock::new(5);

    // many reader locks can be held at once
    {
        let r1 = lock.read().await;
        let r2 = lock.read().await;
        assert_eq!(*r1, 5);
        assert_eq!(*r2, 5);
    } // read locks are dropped at this point

    // only one write lock may be held, however
    {
        let mut w = lock.write().await;
        *w += 1;
        assert_eq!(*w, 6);
    } // write lock is dropped here
}
```

## Implementations[§](#implementations)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#193)[§](#impl-RwLock%3CT%3E)

### impl<T> [RwLock](struct.RwLock.html.md "struct tauri::async_runtime::RwLock")<T> where T: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#204-206)

#### pub fn [new](#method.new)(value: T) -> [RwLock](struct.RwLock.html.md "struct tauri::async_runtime::RwLock")<T>

Creates a new instance of an `RwLock<T>` which is unlocked.

##### [§](#examples-1)Examples

```
use tokio::sync::RwLock;

let lock = RwLock::new(5);
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#271-273)

#### pub fn [with\_max\_readers](#method.with_max_readers)(value: T, max\_reads: [u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html)) -> [RwLock](struct.RwLock.html.md "struct tauri::async_runtime::RwLock")<T>

Creates a new instance of an `RwLock<T>` which is unlocked
and allows a maximum of `max_reads` concurrent readers.

##### [§](#examples-2)Examples

```
use tokio::sync::RwLock;

let lock = RwLock::with_max_readers(5, 1024);
```

##### [§](#panics)Panics

Panics if `max_reads` is more than `u32::MAX >> 3`.

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#347-349)

#### pub const fn [const\_new](#method.const_new)(value: T) -> [RwLock](struct.RwLock.html.md "struct tauri::async_runtime::RwLock")<T>

Creates a new instance of an `RwLock<T>` which is unlocked.

When using the `tracing` [unstable feature](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/index.html#unstable-features "mod tokio"), a `RwLock` created with
`const_new` will not be instrumented. As such, it will not be visible
in [`tokio-console`](https://github.com/tokio-rs/console). Instead, [`RwLock::new`](struct.RwLock.html_method.new.md "associated function tauri::async_runtime::RwLock::new") should be used to create
an instrumented object if that is needed.

##### [§](#examples-3)Examples

```
use tokio::sync::RwLock;

static LOCK: RwLock<i32> = RwLock::const_new(5);
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#371-373)

#### pub const fn [const\_with\_max\_readers](#method.const_with_max_readers)(value: T, max\_reads: [u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html)) -> [RwLock](struct.RwLock.html.md "struct tauri::async_runtime::RwLock")<T>

Creates a new instance of an `RwLock<T>` which is unlocked
and allows a maximum of `max_reads` concurrent readers.

##### [§](#examples-4)Examples

```
use tokio::sync::RwLock;

static LOCK: RwLock<i32> = RwLock::const_with_max_readers(5, 1024);
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#431)

#### pub async fn [read](#method.read)(&self) -> [RwLockReadGuard](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/rwlock/read_guard/struct.RwLockReadGuard.html "struct tokio::sync::rwlock::read_guard::RwLockReadGuard")<'\_, T>

Locks this `RwLock` with shared read access, causing the current task
to yield until the lock has been acquired.

The calling task will yield until there are no writers which hold the
lock. There may be other readers inside the lock when the task resumes.

Note that under the priority policy of [`RwLock`](struct.RwLock.html.md "struct tauri::async_runtime::RwLock"), read locks are not
granted until prior write locks, to prevent starvation. Therefore
deadlock may occur if a read lock is held by the current task, a write
lock attempt is made, and then a subsequent read lock attempt is made
by the current task.

Returns an RAII guard which will drop this read access of the `RwLock`
when dropped.

##### [§](#cancel-safety)Cancel safety

This method uses a queue to fairly distribute locks in the order they
were requested. Cancelling a call to `read` makes you lose your place in
the queue.

##### [§](#examples-5)Examples

```
use std::sync::Arc;
use tokio::sync::RwLock;

#[tokio::main]
async fn main() {
    let lock = Arc::new(RwLock::new(1));
    let c_lock = lock.clone();

    let n = lock.read().await;
    assert_eq!(*n, 1);

    tokio::spawn(async move {
        // While main has an active read lock, we acquire one too.
        let r = c_lock.read().await;
        assert_eq!(*r, 1);
    }).await.expect("The spawned task has panicked");

    // Drop the guard after the spawned task finishes.
    drop(n);
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#521)

#### pub fn [blocking\_read](#method.blocking_read)(&self) -> [RwLockReadGuard](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/rwlock/read_guard/struct.RwLockReadGuard.html "struct tokio::sync::rwlock::read_guard::RwLockReadGuard")<'\_, T>

Blockingly locks this `RwLock` with shared read access.

This method is intended for use cases where you
need to use this rwlock in asynchronous code as well as in synchronous code.

Returns an RAII guard which will drop the read access of this `RwLock` when dropped.

##### [§](#panics-1)Panics

This function panics if called within an asynchronous execution context.

* If you find yourself in an asynchronous execution context and needing
  to call some (synchronous) function which performs one of these
  `blocking_` operations, then consider wrapping that call inside
  [`spawn_blocking()`](struct.TokioHandle.html_method.spawn_blocking.md "method tauri::async_runtime::TokioHandle::spawn_blocking")
  (or [`block_in_place()`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/task/blocking/fn.block_in_place.html "fn tokio::task::blocking::block_in_place")).

##### [§](#examples-6)Examples

```
use std::sync::Arc;
use tokio::sync::RwLock;

#[tokio::main]
async fn main() {
    let rwlock = Arc::new(RwLock::new(1));
    let mut write_lock = rwlock.write().await;

    let blocking_task = tokio::task::spawn_blocking({
        let rwlock = Arc::clone(&rwlock);
        move || {
            // This shall block until the `write_lock` is released.
            let read_lock = rwlock.blocking_read();
            assert_eq!(*read_lock, 0);
        }
    });

    *write_lock -= 1;
    drop(write_lock); // release the lock.

    // Await the completion of the blocking task.
    blocking_task.await.unwrap();

    // Assert uncontended.
    assert!(rwlock.try_write().is_ok());
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#576)

#### pub async fn [read\_owned](#method.read_owned)(self: [Arc](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc")<[RwLock](struct.RwLock.html.md "struct tauri::async_runtime::RwLock")<T>>) -> [OwnedRwLockReadGuard](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/rwlock/owned_read_guard/struct.OwnedRwLockReadGuard.html "struct tokio::sync::rwlock::owned_read_guard::OwnedRwLockReadGuard")<T>

Locks this `RwLock` with shared read access, causing the current task
to yield until the lock has been acquired.

The calling task will yield until there are no writers which hold the
lock. There may be other readers inside the lock when the task resumes.

This method is identical to [`RwLock::read`](struct.RwLock.html_method.read.md "method tauri::async_runtime::RwLock::read"), except that the returned
guard references the `RwLock` with an [`Arc`](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc") rather than by borrowing
it. Therefore, the `RwLock` must be wrapped in an `Arc` to call this
method, and the guard will live for the `'static` lifetime, as it keeps
the `RwLock` alive by holding an `Arc`.

Note that under the priority policy of [`RwLock`](struct.RwLock.html.md "struct tauri::async_runtime::RwLock"), read locks are not
granted until prior write locks, to prevent starvation. Therefore
deadlock may occur if a read lock is held by the current task, a write
lock attempt is made, and then a subsequent read lock attempt is made
by the current task.

Returns an RAII guard which will drop this read access of the `RwLock`
when dropped.

##### [§](#cancel-safety-1)Cancel safety

This method uses a queue to fairly distribute locks in the order they
were requested. Cancelling a call to `read_owned` makes you lose your
place in the queue.

##### [§](#examples-7)Examples

```
use std::sync::Arc;
use tokio::sync::RwLock;

#[tokio::main]
async fn main() {
    let lock = Arc::new(RwLock::new(1));
    let c_lock = lock.clone();

    let n = lock.read_owned().await;
    assert_eq!(*n, 1);

    tokio::spawn(async move {
        // While main has an active read lock, we acquire one too.
        let r = c_lock.read_owned().await;
        assert_eq!(*r, 1);
    }).await.expect("The spawned task has panicked");

    // Drop the guard after the spawned task finishes.
    drop(n);
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#652)

#### pub fn [try\_read](#method.try_read)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[RwLockReadGuard](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/rwlock/read_guard/struct.RwLockReadGuard.html "struct tokio::sync::rwlock::read_guard::RwLockReadGuard")<'\_, T>, [TryLockError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.TryLockError.html "struct tokio::sync::mutex::TryLockError")>

Attempts to acquire this `RwLock` with shared read access.

If the access couldn’t be acquired immediately, returns [`TryLockError`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.TryLockError.html "struct tokio::sync::mutex::TryLockError").
Otherwise, an RAII guard is returned which will release read access
when dropped.

##### [§](#examples-8)Examples

```
use std::sync::Arc;
use tokio::sync::RwLock;

#[tokio::main]
async fn main() {
    let lock = Arc::new(RwLock::new(1));
    let c_lock = lock.clone();

    let v = lock.try_read().unwrap();
    assert_eq!(*v, 1);

    tokio::spawn(async move {
        // While main has an active read lock, we acquire one too.
        let n = c_lock.read().await;
        assert_eq!(*n, 1);
    }).await.expect("The spawned task has panicked");

    // Drop the guard when spawned task finishes.
    drop(v);
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#717)

#### pub fn [try\_read\_owned](#method.try_read_owned)( self: [Arc](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc")<[RwLock](struct.RwLock.html.md "struct tauri::async_runtime::RwLock")<T>>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[OwnedRwLockReadGuard](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/rwlock/owned_read_guard/struct.OwnedRwLockReadGuard.html "struct tokio::sync::rwlock::owned_read_guard::OwnedRwLockReadGuard")<T>, [TryLockError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.TryLockError.html "struct tokio::sync::mutex::TryLockError")>

Attempts to acquire this `RwLock` with shared read access.

If the access couldn’t be acquired immediately, returns [`TryLockError`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.TryLockError.html "struct tokio::sync::mutex::TryLockError").
Otherwise, an RAII guard is returned which will release read access
when dropped.

This method is identical to [`RwLock::try_read`](struct.RwLock.html_method.try_read.md "method tauri::async_runtime::RwLock::try_read"), except that the
returned guard references the `RwLock` with an [`Arc`](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc") rather than by
borrowing it. Therefore, the `RwLock` must be wrapped in an `Arc` to
call this method, and the guard will live for the `'static` lifetime,
as it keeps the `RwLock` alive by holding an `Arc`.

##### [§](#examples-9)Examples

```
use std::sync::Arc;
use tokio::sync::RwLock;

#[tokio::main]
async fn main() {
    let lock = Arc::new(RwLock::new(1));
    let c_lock = lock.clone();

    let v = lock.try_read_owned().unwrap();
    assert_eq!(*v, 1);

    tokio::spawn(async move {
        // While main has an active read lock, we acquire one too.
        let n = c_lock.read_owned().await;
        assert_eq!(*n, 1);
    }).await.expect("The spawned task has panicked");

    // Drop the guard when spawned task finishes.
    drop(v);
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#772)

#### pub async fn [write](#method.write)(&self) -> [RwLockWriteGuard](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/rwlock/write_guard/struct.RwLockWriteGuard.html "struct tokio::sync::rwlock::write_guard::RwLockWriteGuard")<'\_, T>

Locks this `RwLock` with exclusive write access, causing the current
task to yield until the lock has been acquired.

The calling task will yield while other writers or readers currently
have access to the lock.

Returns an RAII guard which will drop the write access of this `RwLock`
when dropped.

##### [§](#cancel-safety-2)Cancel safety

This method uses a queue to fairly distribute locks in the order they
were requested. Cancelling a call to `write` makes you lose your place
in the queue.

##### [§](#examples-10)Examples

```
use tokio::sync::RwLock;

#[tokio::main]
async fn main() {
  let lock = RwLock::new(1);

  let mut n = lock.write().await;
  *n = 2;
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#865)

#### pub fn [blocking\_write](#method.blocking_write)(&self) -> [RwLockWriteGuard](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/rwlock/write_guard/struct.RwLockWriteGuard.html "struct tokio::sync::rwlock::write_guard::RwLockWriteGuard")<'\_, T>

Blockingly locks this `RwLock` with exclusive write access.

This method is intended for use cases where you
need to use this rwlock in asynchronous code as well as in synchronous code.

Returns an RAII guard which will drop the write access of this `RwLock` when dropped.

##### [§](#panics-2)Panics

This function panics if called within an asynchronous execution context.

* If you find yourself in an asynchronous execution context and needing
  to call some (synchronous) function which performs one of these
  `blocking_` operations, then consider wrapping that call inside
  [`spawn_blocking()`](struct.TokioHandle.html_method.spawn_blocking.md "method tauri::async_runtime::TokioHandle::spawn_blocking")
  (or [`block_in_place()`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/task/blocking/fn.block_in_place.html "fn tokio::task::blocking::block_in_place")).

##### [§](#examples-11)Examples

```
use std::sync::Arc;
use tokio::{sync::RwLock};

#[tokio::main]
async fn main() {
    let rwlock =  Arc::new(RwLock::new(1));
    let read_lock = rwlock.read().await;

    let blocking_task = tokio::task::spawn_blocking({
        let rwlock = Arc::clone(&rwlock);
        move || {
            // This shall block until the `read_lock` is released.
            let mut write_lock = rwlock.blocking_write();
            *write_lock = 2;
        }
    });

    assert_eq!(*read_lock, 1);
    // Release the last outstanding read lock.
    drop(read_lock);

    // Await the completion of the blocking task.
    blocking_task.await.unwrap();

    // Assert uncontended.
    let read_lock = rwlock.try_read().unwrap();
    assert_eq!(*read_lock, 2);
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#904)

#### pub async fn [write\_owned](#method.write_owned)(self: [Arc](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc")<[RwLock](struct.RwLock.html.md "struct tauri::async_runtime::RwLock")<T>>) -> [OwnedRwLockWriteGuard](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/rwlock/owned_write_guard/struct.OwnedRwLockWriteGuard.html "struct tokio::sync::rwlock::owned_write_guard::OwnedRwLockWriteGuard")<T>

Locks this `RwLock` with exclusive write access, causing the current
task to yield until the lock has been acquired.

The calling task will yield while other writers or readers currently
have access to the lock.

This method is identical to [`RwLock::write`](struct.RwLock.html_method.write.md "method tauri::async_runtime::RwLock::write"), except that the returned
guard references the `RwLock` with an [`Arc`](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc") rather than by borrowing
it. Therefore, the `RwLock` must be wrapped in an `Arc` to call this
method, and the guard will live for the `'static` lifetime, as it keeps
the `RwLock` alive by holding an `Arc`.

Returns an RAII guard which will drop the write access of this `RwLock`
when dropped.

##### [§](#cancel-safety-3)Cancel safety

This method uses a queue to fairly distribute locks in the order they
were requested. Cancelling a call to `write_owned` makes you lose your
place in the queue.

##### [§](#examples-12)Examples

```
use std::sync::Arc;
use tokio::sync::RwLock;

#[tokio::main]
async fn main() {
  let lock = Arc::new(RwLock::new(1));

  let mut n = lock.write_owned().await;
  *n = 2;
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#972)

#### pub fn [try\_write](#method.try_write)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[RwLockWriteGuard](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/rwlock/write_guard/struct.RwLockWriteGuard.html "struct tokio::sync::rwlock::write_guard::RwLockWriteGuard")<'\_, T>, [TryLockError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.TryLockError.html "struct tokio::sync::mutex::TryLockError")>

Attempts to acquire this `RwLock` with exclusive write access.

If the access couldn’t be acquired immediately, returns [`TryLockError`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.TryLockError.html "struct tokio::sync::mutex::TryLockError").
Otherwise, an RAII guard is returned which will release write access
when dropped.

##### [§](#examples-13)Examples

```
use tokio::sync::RwLock;

#[tokio::main]
async fn main() {
    let rw = RwLock::new(1);

    let v = rw.read().await;
    assert_eq!(*v, 1);

    assert!(rw.try_write().is_err());
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#1030)

#### pub fn [try\_write\_owned](#method.try_write_owned)( self: [Arc](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc")<[RwLock](struct.RwLock.html.md "struct tauri::async_runtime::RwLock")<T>>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[OwnedRwLockWriteGuard](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/rwlock/owned_write_guard/struct.OwnedRwLockWriteGuard.html "struct tokio::sync::rwlock::owned_write_guard::OwnedRwLockWriteGuard")<T>, [TryLockError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.TryLockError.html "struct tokio::sync::mutex::TryLockError")>

Attempts to acquire this `RwLock` with exclusive write access.

If the access couldn’t be acquired immediately, returns [`TryLockError`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mutex/struct.TryLockError.html "struct tokio::sync::mutex::TryLockError").
Otherwise, an RAII guard is returned which will release write access
when dropped.

This method is identical to [`RwLock::try_write`](struct.RwLock.html_method.try_write.md "method tauri::async_runtime::RwLock::try_write"), except that the
returned guard references the `RwLock` with an [`Arc`](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc") rather than by
borrowing it. Therefore, the `RwLock` must be wrapped in an `Arc` to
call this method, and the guard will live for the `'static` lifetime,
as it keeps the `RwLock` alive by holding an `Arc`.

##### [§](#examples-14)Examples

```
use std::sync::Arc;
use tokio::sync::RwLock;

#[tokio::main]
async fn main() {
    let rw = Arc::new(RwLock::new(1));

    let v = Arc::clone(&rw).read_owned().await;
    assert_eq!(*v, 1);

    assert!(rw.try_write_owned().is_err());
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#1075)

#### pub fn [get\_mut](#method.get_mut)(&mut self) -> [&mut T](https://doc.rust-lang.org/nightly/std/primitive.reference.html)

Returns a mutable reference to the underlying data.

Since this call borrows the `RwLock` mutably, no actual locking needs to
take place – the mutable borrow statically guarantees no locks exist.

##### [§](#examples-15)Examples

```
use tokio::sync::RwLock;

fn main() {
    let mut lock = RwLock::new(1);

    let n = lock.get_mut();
    *n = 2;
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#1083-1085)

#### pub fn [into\_inner](#method.into_inner)(self) -> T

Consumes the lock, returning the underlying data.

## Trait Implementations[§](#trait-implementations)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#1106-1108)[§](#impl-Debug-for-RwLock%3CT%3E)

### impl<T> [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [RwLock](struct.RwLock.html.md "struct tauri::async_runtime::RwLock")<T> where T: [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#1110)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")>

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#1097-1099)[§](#impl-Default-for-RwLock%3CT%3E)

### impl<T> [Default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html "trait core::default::Default") for [RwLock](struct.RwLock.html.md "struct tauri::async_runtime::RwLock")<T> where T: [Default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html "trait core::default::Default") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#1101)[§](#method.default)

#### fn [default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html#tymethod.default)() -> [RwLock](struct.RwLock.html.md "struct tauri::async_runtime::RwLock")<T>

Returns the “default value” for a type. [Read more](https://doc.rust-lang.org/nightly/core/default/trait.Default.html#tymethod.default)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#1091)[§](#impl-From%3CT%3E-for-RwLock%3CT%3E)

### impl<T> [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<T> for [RwLock](struct.RwLock.html.md "struct tauri::async_runtime::RwLock")<T>

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#1092)[§](#method.from)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(s: T) -> [RwLock](struct.RwLock.html.md "struct tauri::async_runtime::RwLock")<T>

Converts to this type from the input type.

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#149)[§](#impl-Send-for-RwLock%3CT%3E)

### impl<T> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [RwLock](struct.RwLock.html.md "struct tauri::async_runtime::RwLock")<T> where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/rwlock.rs.html#150)[§](#impl-Sync-for-RwLock%3CT%3E)

### impl<T> [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [RwLock](struct.RwLock.html.md "struct tauri::async_runtime::RwLock")<T> where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-RwLock%3CT%3E)

### impl<T> ![Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [RwLock](struct.RwLock.html.md "struct tauri::async_runtime::RwLock")<T>

[§](#impl-RefUnwindSafe-for-RwLock%3CT%3E)

### impl<T> ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [RwLock](struct.RwLock.html.md "struct tauri::async_runtime::RwLock")<T>

[§](#impl-Unpin-for-RwLock%3CT%3E)

### impl<T> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [RwLock](struct.RwLock.html.md "struct tauri::async_runtime::RwLock")<T> where T: [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[§](#impl-UnwindSafe-for-RwLock%3CT%3E)

### impl<T> [UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [RwLock](struct.RwLock.html.md "struct tauri::async_runtime::RwLock")<T> where T: [UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

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