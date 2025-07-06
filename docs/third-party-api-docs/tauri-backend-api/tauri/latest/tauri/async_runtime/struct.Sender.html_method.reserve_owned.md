# Struct SenderCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#22)

```
pub struct Sender<T> { /* private fields */ }
```

Expand description

Sends values to the associated `Receiver`.

Instances are created by the [`channel`](fn.channel.html.md "fn tauri::async_runtime::channel") function.

To convert the `Sender` into a `Sink` or use it in a poll function, you can
use the [`PollSender`](https://docs.rs/tokio-util/latest/tokio_util/sync/struct.PollSender.html) utility.

## Implementations[§](#implementations)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#746)[§](#impl-Sender%3CT%3E)

### impl<T> [Sender](struct.Sender.html.md "struct tauri::async_runtime::Sender")<T>

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#810)

#### pub async fn [send](#method.send)(&self, value: T) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [SendError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/error/struct.SendError.html "struct tokio::sync::mpsc::error::SendError")<T>>

Sends a value, waiting until there is capacity.

A successful send occurs when it is determined that the other end of the
channel has not hung up already. An unsuccessful send would be one where
the corresponding receiver has already been closed. Note that a return
value of `Err` means that the data will never be received, but a return
value of `Ok` does not mean that the data will be received. It is
possible for the corresponding receiver to hang up immediately after
this function returns `Ok`.

##### [§](#errors)Errors

If the receive half of the channel is closed, either due to [`close`](struct.Receiver.html_method.close.md "method tauri::async_runtime::Receiver::close")
being called or the [`Receiver`](struct.Receiver.html.md "struct tauri::async_runtime::Receiver") handle dropping, the function returns
an error. The error includes the value passed to `send`.

##### [§](#cancel-safety)Cancel safety

If `send` is used as the event in a [`tokio::select!`](crate::select)
statement and some other branch completes first, then it is guaranteed
that the message was not sent. **However, in that case, the message
is dropped and will be lost.**

To avoid losing messages, use [`reserve`](struct.Sender.html_method.reserve.md "method tauri::async_runtime::Sender::reserve") to reserve
capacity, then use the returned [`Permit`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.Permit.html "struct tokio::sync::mpsc::bounded::Permit") to send the message.

This channel uses a queue to ensure that calls to `send` and `reserve`
complete in the order they were requested. Cancelling a call to
`send` makes you lose your place in the queue.

##### [§](#examples)Examples

In the following example, each call to `send` will block until the
previously sent value was received.

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    let (tx, mut rx) = mpsc::channel(1);

    tokio::spawn(async move {
        for i in 0..10 {
            if let Err(_) = tx.send(i).await {
                println!("receiver dropped");
                return;
            }
        }
    });

    while let Some(i) = rx.recv().await {
        println!("got = {}", i);
    }
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#856)

#### pub async fn [closed](#method.closed)(&self)

Completes when the receiver has dropped.

This allows the producers to get notified when interest in the produced
values is canceled and immediately stop doing work.

##### [§](#cancel-safety-1)Cancel safety

This method is cancel safe. Once the channel is closed, it stays closed
forever and all future calls to `closed` will return immediately.

##### [§](#examples-1)Examples

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    let (tx1, rx) = mpsc::channel::<()>(1);
    let tx2 = tx1.clone();
    let tx3 = tx1.clone();
    let tx4 = tx1.clone();
    let tx5 = tx1.clone();
    tokio::spawn(async move {
        drop(rx);
    });

    futures::join!(
        tx1.closed(),
        tx2.closed(),
        tx3.closed(),
        tx4.closed(),
        tx5.closed()
    );
    println!("Receiver dropped");
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#918)

#### pub fn [try\_send](#method.try_send)(&self, message: T) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [TrySendError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/error/enum.TrySendError.html "enum tokio::sync::mpsc::error::TrySendError")<T>>

Attempts to immediately send a message on this `Sender`

This method differs from [`send`](struct.Sender.html_method.send.md "method tauri::async_runtime::Sender::send") by returning immediately if the channel’s
buffer is full or no receiver is waiting to acquire some data. Compared
with [`send`](struct.Sender.html_method.send.md "method tauri::async_runtime::Sender::send"), this function has two failure cases instead of one (one for
disconnection, one for a full buffer).

##### [§](#errors-1)Errors

If the channel capacity has been reached, i.e., the channel has `n`
buffered values where `n` is the argument passed to [`channel`](fn.channel.html.md "fn tauri::async_runtime::channel"), then an
error is returned.

If the receive half of the channel is closed, either due to [`close`](struct.Receiver.html_method.close.md "method tauri::async_runtime::Receiver::close")
being called or the [`Receiver`](struct.Receiver.html.md "struct tauri::async_runtime::Receiver") handle dropping, the function returns
an error. The error includes the value passed to `send`.

##### [§](#examples-2)Examples

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    // Create a channel with buffer size 1
    let (tx1, mut rx) = mpsc::channel(1);
    let tx2 = tx1.clone();

    tokio::spawn(async move {
        tx1.send(1).await.unwrap();
        tx1.send(2).await.unwrap();
        // task waits until the receiver receives a value.
    });

    tokio::spawn(async move {
        // This will return an error and send
        // no message if the buffer is full
        let _ = tx2.try_send(3);
    });

    let mut msg;
    msg = rx.recv().await.unwrap();
    println!("message {} received", msg);

    msg = rx.recv().await.unwrap();
    println!("message {} received", msg);

    // Third message may have never been sent
    match rx.recv().await {
        Some(msg) => println!("message {} received", msg),
        None => println!("the third message was never sent"),
    }
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#1037)

#### pub fn [blocking\_send](#method.blocking_send)(&self, value: T) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [SendError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/error/struct.SendError.html "struct tokio::sync::mpsc::error::SendError")<T>>

Blocking send to call outside of asynchronous contexts.

This method is intended for use cases where you are sending from
synchronous code to asynchronous code, and will work even if the
receiver is not using [`blocking_recv`](struct.Receiver.html_method.blocking_recv.md "method tauri::async_runtime::Receiver::blocking_recv") to receive the message.

##### [§](#panics)Panics

This function panics if called within an asynchronous execution
context.

##### [§](#examples-3)Examples

```
use std::thread;
use tokio::runtime::Runtime;
use tokio::sync::mpsc;

fn main() {
    let (tx, mut rx) = mpsc::channel::<u8>(1);

    let sync_code = thread::spawn(move || {
        tx.blocking_send(10).unwrap();
    });

    Runtime::new().unwrap().block_on(async move {
        assert_eq!(Some(10), rx.recv().await);
    });
    sync_code.join().unwrap()
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#1059)

#### pub fn [is\_closed](#method.is_closed)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Checks if the channel has been closed. This happens when the
[`Receiver`](struct.Receiver.html.md "struct tauri::async_runtime::Receiver") is dropped, or when the [`Receiver::close`](struct.Receiver.html_method.close.md "method tauri::async_runtime::Receiver::close") method is
called.

```
let (tx, rx) = tokio::sync::mpsc::channel::<()>(42);
assert!(!tx.is_closed());

let tx2 = tx.clone();
assert!(!tx2.is_closed());

drop(rx);
assert!(tx.is_closed());
assert!(tx2.is_closed());
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#1107)

#### pub async fn [reserve](#method.reserve)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Permit](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.Permit.html "struct tokio::sync::mpsc::bounded::Permit")<'\_, T>, [SendError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/error/struct.SendError.html "struct tokio::sync::mpsc::error::SendError")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>>

Waits for channel capacity. Once capacity to send one message is
available, it is reserved for the caller.

If the channel is full, the function waits for the number of unreceived
messages to become less than the channel capacity. Capacity to send one
message is reserved for the caller. A [`Permit`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.Permit.html "struct tokio::sync::mpsc::bounded::Permit") is returned to track
the reserved capacity. The [`send`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.Permit.html#method.send "method tokio::sync::mpsc::bounded::Permit::send") function on [`Permit`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.Permit.html "struct tokio::sync::mpsc::bounded::Permit") consumes the
reserved capacity.

Dropping [`Permit`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.Permit.html "struct tokio::sync::mpsc::bounded::Permit") without sending a message releases the capacity back
to the channel.

##### [§](#cancel-safety-2)Cancel safety

This channel uses a queue to ensure that calls to `send` and `reserve`
complete in the order they were requested. Cancelling a call to
`reserve` makes you lose your place in the queue.

##### [§](#examples-4)Examples

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    let (tx, mut rx) = mpsc::channel(1);

    // Reserve capacity
    let permit = tx.reserve().await.unwrap();

    // Trying to send directly on the `tx` will fail due to no
    // available capacity.
    assert!(tx.try_send(123).is_err());

    // Sending on the permit succeeds
    permit.send(456);

    // The value sent on the permit is received
    assert_eq!(rx.recv().await.unwrap(), 456);
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#1168)

#### pub async fn [reserve\_many](#method.reserve_many)( &self, n: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[PermitIterator](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.PermitIterator.html "struct tokio::sync::mpsc::bounded::PermitIterator")<'\_, T>, [SendError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/error/struct.SendError.html "struct tokio::sync::mpsc::error::SendError")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>>

Waits for channel capacity. Once capacity to send `n` messages is
available, it is reserved for the caller.

If the channel is full or if there are fewer than `n` permits available, the function waits
for the number of unreceived messages to become `n` less than the channel capacity.
Capacity to send `n` message is then reserved for the caller.

A [`PermitIterator`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.PermitIterator.html "struct tokio::sync::mpsc::bounded::PermitIterator") is returned to track the reserved capacity.
You can call this [`Iterator`](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator") until it is exhausted to
get a [`Permit`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.Permit.html "struct tokio::sync::mpsc::bounded::Permit") and then call [`Permit::send`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.Permit.html#method.send "method tokio::sync::mpsc::bounded::Permit::send"). This function is similar to
[`try_reserve_many`](struct.Sender.html_method.try_reserve_many.md "method tauri::async_runtime::Sender::try_reserve_many") except it awaits for the slots to become available.

If the channel is closed, the function returns a [`SendError`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/error/struct.SendError.html "struct tokio::sync::mpsc::error::SendError").

Dropping [`PermitIterator`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.PermitIterator.html "struct tokio::sync::mpsc::bounded::PermitIterator") without consuming it entirely releases the remaining
permits back to the channel.

##### [§](#cancel-safety-3)Cancel safety

This channel uses a queue to ensure that calls to `send` and `reserve_many`
complete in the order they were requested. Cancelling a call to
`reserve_many` makes you lose your place in the queue.

##### [§](#examples-5)Examples

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    let (tx, mut rx) = mpsc::channel(2);

    // Reserve capacity
    let mut permit = tx.reserve_many(2).await.unwrap();

    // Trying to send directly on the `tx` will fail due to no
    // available capacity.
    assert!(tx.try_send(123).is_err());

    // Sending with the permit iterator succeeds
    permit.next().unwrap().send(456);
    permit.next().unwrap().send(457);

    // The iterator should now be exhausted
    assert!(permit.next().is_none());

    // The value sent on the permit is received
    assert_eq!(rx.recv().await.unwrap(), 456);
    assert_eq!(rx.recv().await.unwrap(), 457);
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#1256)

#### pub async fn [reserve\_owned](#method.reserve_owned)(self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[OwnedPermit](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.OwnedPermit.html "struct tokio::sync::mpsc::bounded::OwnedPermit")<T>, [SendError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/error/struct.SendError.html "struct tokio::sync::mpsc::error::SendError")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>>

Waits for channel capacity, moving the `Sender` and returning an owned
permit. Once capacity to send one message is available, it is reserved
for the caller.

This moves the sender *by value*, and returns an owned permit that can
be used to send a message into the channel. Unlike [`Sender::reserve`](struct.Sender.html_method.reserve.md "method tauri::async_runtime::Sender::reserve"),
this method may be used in cases where the permit must be valid for the
`'static` lifetime. `Sender`s may be cloned cheaply (`Sender::clone` is
essentially a reference count increment, comparable to [`Arc::clone`](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html#method.clone "method alloc::sync::Arc::clone")),
so when multiple [`OwnedPermit`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.OwnedPermit.html "struct tokio::sync::mpsc::bounded::OwnedPermit")s are needed or the `Sender` cannot be
moved, it can be cloned prior to calling `reserve_owned`.

If the channel is full, the function waits for the number of unreceived
messages to become less than the channel capacity. Capacity to send one
message is reserved for the caller. An [`OwnedPermit`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.OwnedPermit.html "struct tokio::sync::mpsc::bounded::OwnedPermit") is returned to
track the reserved capacity. The [`send`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.OwnedPermit.html#method.send "method tokio::sync::mpsc::bounded::OwnedPermit::send") function on [`OwnedPermit`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.OwnedPermit.html "struct tokio::sync::mpsc::bounded::OwnedPermit")
consumes the reserved capacity.

Dropping the [`OwnedPermit`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.OwnedPermit.html "struct tokio::sync::mpsc::bounded::OwnedPermit") without sending a message releases the
capacity back to the channel.

##### [§](#cancel-safety-4)Cancel safety

This channel uses a queue to ensure that calls to `send` and `reserve`
complete in the order they were requested. Cancelling a call to
`reserve_owned` makes you lose your place in the queue.

##### [§](#examples-6)Examples

Sending a message using an [`OwnedPermit`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.OwnedPermit.html "struct tokio::sync::mpsc::bounded::OwnedPermit"):

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    let (tx, mut rx) = mpsc::channel(1);

    // Reserve capacity, moving the sender.
    let permit = tx.reserve_owned().await.unwrap();

    // Send a message, consuming the permit and returning
    // the moved sender.
    let tx = permit.send(123);

    // The value sent on the permit is received.
    assert_eq!(rx.recv().await.unwrap(), 123);

    // The sender can now be used again.
    tx.send(456).await.unwrap();
}
```

When multiple [`OwnedPermit`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.OwnedPermit.html "struct tokio::sync::mpsc::bounded::OwnedPermit")s are needed, or the sender cannot be moved
by value, it can be inexpensively cloned before calling `reserve_owned`:

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    let (tx, mut rx) = mpsc::channel(1);

    // Clone the sender and reserve capacity.
    let permit = tx.clone().reserve_owned().await.unwrap();

    // Trying to send directly on the `tx` will fail due to no
    // available capacity.
    assert!(tx.try_send(123).is_err());

    // Sending on the permit succeeds.
    permit.send(456);

    // The value sent on the permit is received
    assert_eq!(rx.recv().await.unwrap(), 456);
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#1318)

#### pub fn [try\_reserve](#method.try_reserve)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Permit](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.Permit.html "struct tokio::sync::mpsc::bounded::Permit")<'\_, T>, [TrySendError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/error/enum.TrySendError.html "enum tokio::sync::mpsc::error::TrySendError")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>>

Tries to acquire a slot in the channel without waiting for the slot to become
available.

If the channel is full this function will return [`TrySendError`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/error/enum.TrySendError.html "enum tokio::sync::mpsc::error::TrySendError"), otherwise
if there is a slot available it will return a [`Permit`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.Permit.html "struct tokio::sync::mpsc::bounded::Permit") that will then allow you
to [`send`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.Permit.html#method.send "method tokio::sync::mpsc::bounded::Permit::send") on the channel with a guaranteed slot. This function is similar to
[`reserve`](struct.Sender.html_method.reserve.md "method tauri::async_runtime::Sender::reserve") except it does not await for the slot to become available.

Dropping [`Permit`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.Permit.html "struct tokio::sync::mpsc::bounded::Permit") without sending a message releases the capacity back
to the channel.

##### [§](#examples-7)Examples

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    let (tx, mut rx) = mpsc::channel(1);

    // Reserve capacity
    let permit = tx.try_reserve().unwrap();

    // Trying to send directly on the `tx` will fail due to no
    // available capacity.
    assert!(tx.try_send(123).is_err());

    // Trying to reserve an additional slot on the `tx` will
    // fail because there is no capacity.
    assert!(tx.try_reserve().is_err());

    // Sending on the permit succeeds
    permit.send(456);

    // The value sent on the permit is received
    assert_eq!(rx.recv().await.unwrap(), 456);

}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#1396)

#### pub fn [try\_reserve\_many](#method.try_reserve_many)( &self, n: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[PermitIterator](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.PermitIterator.html "struct tokio::sync::mpsc::bounded::PermitIterator")<'\_, T>, [TrySendError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/error/enum.TrySendError.html "enum tokio::sync::mpsc::error::TrySendError")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>>

Tries to acquire `n` slots in the channel without waiting for the slot to become
available.

A [`PermitIterator`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.PermitIterator.html "struct tokio::sync::mpsc::bounded::PermitIterator") is returned to track the reserved capacity.
You can call this [`Iterator`](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator") until it is exhausted to
get a [`Permit`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.Permit.html "struct tokio::sync::mpsc::bounded::Permit") and then call [`Permit::send`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.Permit.html#method.send "method tokio::sync::mpsc::bounded::Permit::send"). This function is similar to
[`reserve_many`](struct.Sender.html_method.reserve_many.md "method tauri::async_runtime::Sender::reserve_many") except it does not await for the slots to become available.

If there are fewer than `n` permits available on the channel, then
this function will return a [`TrySendError::Full`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/error/enum.TrySendError.html#variant.Full "variant tokio::sync::mpsc::error::TrySendError::Full"). If the channel is closed
this function will return a [`TrySendError::Closed`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/error/enum.TrySendError.html#variant.Closed "variant tokio::sync::mpsc::error::TrySendError::Closed").

Dropping [`PermitIterator`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.PermitIterator.html "struct tokio::sync::mpsc::bounded::PermitIterator") without consuming it entirely releases the remaining
permits back to the channel.

##### [§](#examples-8)Examples

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    let (tx, mut rx) = mpsc::channel(2);

    // Reserve capacity
    let mut permit = tx.try_reserve_many(2).unwrap();

    // Trying to send directly on the `tx` will fail due to no
    // available capacity.
    assert!(tx.try_send(123).is_err());

    // Trying to reserve an additional slot on the `tx` will
    // fail because there is no capacity.
    assert!(tx.try_reserve().is_err());

    // Sending with the permit iterator succeeds
    permit.next().unwrap().send(456);
    permit.next().unwrap().send(457);

    // The iterator should now be exhausted
    assert!(permit.next().is_none());

    // The value sent on the permit is received
    assert_eq!(rx.recv().await.unwrap(), 456);
    assert_eq!(rx.recv().await.unwrap(), 457);

    // Trying to call try_reserve_many with 0 will return an empty iterator
    let mut permit = tx.try_reserve_many(0).unwrap();
    assert!(permit.next().is_none());

    // Trying to call try_reserve_many with a number greater than the channel
    // capacity will return an error
    let permit = tx.try_reserve_many(3);
    assert!(permit.is_err());

    // Trying to call try_reserve_many on a closed channel will return an error
    drop(rx);
    let permit = tx.try_reserve_many(1);
    assert!(permit.is_err());

    let permit = tx.try_reserve_many(0);
    assert!(permit.is_err());
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#1468)

#### pub fn [try\_reserve\_owned](#method.try_reserve_owned)( self, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[OwnedPermit](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.OwnedPermit.html "struct tokio::sync::mpsc::bounded::OwnedPermit")<T>, [TrySendError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/error/enum.TrySendError.html "enum tokio::sync::mpsc::error::TrySendError")<[Sender](struct.Sender.html.md "struct tauri::async_runtime::Sender")<T>>>

Tries to acquire a slot in the channel without waiting for the slot to become
available, returning an owned permit.

This moves the sender *by value*, and returns an owned permit that can
be used to send a message into the channel. Unlike [`Sender::try_reserve`](struct.Sender.html_method.try_reserve.md "method tauri::async_runtime::Sender::try_reserve"),
this method may be used in cases where the permit must be valid for the
`'static` lifetime. `Sender`s may be cloned cheaply (`Sender::clone` is
essentially a reference count increment, comparable to [`Arc::clone`](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html#method.clone "method alloc::sync::Arc::clone")),
so when multiple [`OwnedPermit`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.OwnedPermit.html "struct tokio::sync::mpsc::bounded::OwnedPermit")s are needed or the `Sender` cannot be
moved, it can be cloned prior to calling `try_reserve_owned`.

If the channel is full this function will return a [`TrySendError`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/error/enum.TrySendError.html "enum tokio::sync::mpsc::error::TrySendError").
Since the sender is taken by value, the `TrySendError` returned in this
case contains the sender, so that it may be used again. Otherwise, if
there is a slot available, this method will return an [`OwnedPermit`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.OwnedPermit.html "struct tokio::sync::mpsc::bounded::OwnedPermit")
that can then be used to [`send`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.OwnedPermit.html#method.send "method tokio::sync::mpsc::bounded::OwnedPermit::send") on the channel with a guaranteed slot.
This function is similar to [`reserve_owned`](struct.Sender.html_method.reserve_owned.md "method tauri::async_runtime::Sender::reserve_owned") except it does not await
for the slot to become available.

Dropping the [`OwnedPermit`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.OwnedPermit.html "struct tokio::sync::mpsc::bounded::OwnedPermit") without sending a message releases the capacity back
to the channel.

##### [§](#examples-9)Examples

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    let (tx, mut rx) = mpsc::channel(1);

    // Reserve capacity
    let permit = tx.clone().try_reserve_owned().unwrap();

    // Trying to send directly on the `tx` will fail due to no
    // available capacity.
    assert!(tx.try_send(123).is_err());

    // Trying to reserve an additional slot on the `tx` will
    // fail because there is no capacity.
    assert!(tx.try_reserve().is_err());

    // Sending on the permit succeeds
    permit.send(456);

    // The value sent on the permit is received
    assert_eq!(rx.recv().await.unwrap(), 456);

}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#1492)

#### pub fn [same\_channel](#method.same_channel)(&self, other: &[Sender](struct.Sender.html.md "struct tauri::async_runtime::Sender")<T>) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Returns `true` if senders belong to the same channel.

##### [§](#examples-10)Examples

```
let (tx, rx) = tokio::sync::mpsc::channel::<()>(1);
let  tx2 = tx.clone();
assert!(tx.same_channel(&tx2));

let (tx3, rx3) = tokio::sync::mpsc::channel::<()>(1);
assert!(!tx3.same_channel(&tx2));
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#1529)

#### pub fn [capacity](#method.capacity)(&self) -> [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)

Returns the current capacity of the channel.

The capacity goes down when sending a value by calling [`send`](struct.Sender.html_method.send.md "method tauri::async_runtime::Sender::send") or by reserving capacity
with [`reserve`](struct.Sender.html_method.reserve.md "method tauri::async_runtime::Sender::reserve"). The capacity goes up when values are received by the [`Receiver`](struct.Receiver.html.md "struct tauri::async_runtime::Receiver").
This is distinct from [`max_capacity`](struct.Sender.html_method.max_capacity.md "method tauri::async_runtime::Sender::max_capacity"), which always returns buffer capacity initially
specified when calling [`channel`](fn.channel.html.md "fn tauri::async_runtime::channel")

##### [§](#examples-11)Examples

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    let (tx, mut rx) = mpsc::channel::<()>(5);

    assert_eq!(tx.capacity(), 5);

    // Making a reservation drops the capacity by one.
    let permit = tx.reserve().await.unwrap();
    assert_eq!(tx.capacity(), 4);

    // Sending and receiving a value increases the capacity by one.
    permit.send(());
    rx.recv().await.unwrap();
    assert_eq!(tx.capacity(), 5);
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#1538)

#### pub fn [downgrade](#method.downgrade)(&self) -> [WeakSender](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.WeakSender.html "struct tokio::sync::mpsc::bounded::WeakSender")<T>

Converts the `Sender` to a [`WeakSender`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.WeakSender.html "struct tokio::sync::mpsc::bounded::WeakSender") that does not count
towards RAII semantics, i.e. if all `Sender` instances of the
channel were dropped and only `WeakSender` instances remain,
the channel is closed.

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#1576)

#### pub fn [max\_capacity](#method.max_capacity)(&self) -> [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)

Returns the maximum buffer capacity of the channel.

The maximum capacity is the buffer capacity initially specified when calling
[`channel`](fn.channel.html.md "fn tauri::async_runtime::channel"). This is distinct from [`capacity`](struct.Sender.html_method.capacity.md "method tauri::async_runtime::Sender::capacity"), which returns the *current*
available buffer capacity: as messages are sent and received, the
value returned by [`capacity`](struct.Sender.html_method.capacity.md "method tauri::async_runtime::Sender::capacity") will go up or down, whereas the value
returned by [`max_capacity`](struct.Sender.html_method.max_capacity.md "method tauri::async_runtime::Sender::max_capacity") will remain constant.

##### [§](#examples-12)Examples

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    let (tx, _rx) = mpsc::channel::<()>(5);

    // both max capacity and capacity are the same at first
    assert_eq!(tx.max_capacity(), 5);
    assert_eq!(tx.capacity(), 5);

    // Making a reservation doesn't change the max capacity.
    let permit = tx.reserve().await.unwrap();
    assert_eq!(tx.max_capacity(), 5);
    // but drops the capacity by one
    assert_eq!(tx.capacity(), 4);
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#1581)

#### pub fn [strong\_count](#method.strong_count)(&self) -> [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)

Returns the number of [`Sender`](struct.Sender.html.md "struct tauri::async_runtime::Sender") handles.

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#1586)

#### pub fn [weak\_count](#method.weak_count)(&self) -> [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)

Returns the number of [`WeakSender`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.WeakSender.html "struct tokio::sync::mpsc::bounded::WeakSender") handles.

## Trait Implementations[§](#trait-implementations)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#1591)[§](#impl-Clone-for-Sender%3CT%3E)

### impl<T> [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [Sender](struct.Sender.html.md "struct tauri::async_runtime::Sender")<T>

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#1592)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> [Sender](struct.Sender.html.md "struct tauri::async_runtime::Sender")<T>

Returns a copy of the value. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#174)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &Self)

Performs copy-assignment from `source`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#1599)[§](#impl-Debug-for-Sender%3CT%3E)

### impl<T> [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [Sender](struct.Sender.html.md "struct tauri::async_runtime::Sender")<T>

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#1600)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, fmt: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")>

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-Sender%3CT%3E)

### impl<T> [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [Sender](struct.Sender.html.md "struct tauri::async_runtime::Sender")<T>

[§](#impl-RefUnwindSafe-for-Sender%3CT%3E)

### impl<T> [RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [Sender](struct.Sender.html.md "struct tauri::async_runtime::Sender")<T>

[§](#impl-Send-for-Sender%3CT%3E)

### impl<T> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [Sender](struct.Sender.html.md "struct tauri::async_runtime::Sender")<T> where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send"),

[§](#impl-Sync-for-Sender%3CT%3E)

### impl<T> [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [Sender](struct.Sender.html.md "struct tauri::async_runtime::Sender")<T> where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send"),

[§](#impl-Unpin-for-Sender%3CT%3E)

### impl<T> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [Sender](struct.Sender.html.md "struct tauri::async_runtime::Sender")<T>

[§](#impl-UnwindSafe-for-Sender%3CT%3E)

### impl<T> [UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [Sender](struct.Sender.html.md "struct tauri::async_runtime::Sender")<T>

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