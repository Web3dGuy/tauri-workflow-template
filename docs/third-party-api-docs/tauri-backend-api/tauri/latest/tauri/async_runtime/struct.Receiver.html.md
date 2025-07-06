# Struct ReceiverCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#106)

```
pub struct Receiver<T> { /* private fields */ }
```

Expand description

Receives values from the associated `Sender`.

Instances are created by the [`channel`](fn.channel.html.md "fn tauri::async_runtime::channel") function.

This receiver can be turned into a `Stream` using [`ReceiverStream`](https://docs.rs/tokio-stream/0.1/tokio_stream/wrappers/struct.ReceiverStream.html).

## Implementations[§](#implementations)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#178)[§](#impl-Receiver%3CT%3E)

### impl<T> [Receiver](struct.Receiver.html.md "struct tauri::async_runtime::Receiver")<T>

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#240)

#### pub async fn [recv](#method.recv)(&mut self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<T>

Receives the next value for this receiver.

This method returns `None` if the channel has been closed and there are
no remaining messages in the channel’s buffer. This indicates that no
further values can ever be received from this `Receiver`. The channel is
closed when all senders have been dropped, or when [`close`](struct.Receiver.html_method.close.md "method tauri::async_runtime::Receiver::close") is called.

If there are no messages in the channel’s buffer, but the channel has
not yet been closed, this method will sleep until a message is sent or
the channel is closed. Note that if [`close`](struct.Receiver.html_method.close.md "method tauri::async_runtime::Receiver::close") is called, but there are
still outstanding [`Permits`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.Permit.html "struct tokio::sync::mpsc::bounded::Permit") from before it was closed, the channel is
not considered closed by `recv` until the permits are released.

##### [§](#cancel-safety)Cancel safety

This method is cancel safe. If `recv` is used as the event in a
[`tokio::select!`](crate::select) statement and some other branch
completes first, it is guaranteed that no messages were received on this
channel.

##### [§](#examples)Examples

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    let (tx, mut rx) = mpsc::channel(100);

    tokio::spawn(async move {
        tx.send("hello").await.unwrap();
    });

    assert_eq!(Some("hello"), rx.recv().await);
    assert_eq!(None, rx.recv().await);
}
```

Values are buffered:

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    let (tx, mut rx) = mpsc::channel(100);

    tx.send("hello").await.unwrap();
    tx.send("world").await.unwrap();

    assert_eq!(Some("hello"), rx.recv().await);
    assert_eq!(Some("world"), rx.recv().await);
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#316)

#### pub async fn [recv\_many](#method.recv_many)(&mut self, buffer: &mut [Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<T>, limit: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)

Receives the next values for this receiver and extends `buffer`.

This method extends `buffer` by no more than a fixed number of values
as specified by `limit`. If `limit` is zero, the function immediately
returns `0`. The return value is the number of values added to `buffer`.

For `limit > 0`, if there are no messages in the channel’s queue, but
the channel has not yet been closed, this method will sleep until a
message is sent or the channel is closed. Note that if [`close`](struct.Receiver.html_method.close.md "method tauri::async_runtime::Receiver::close") is
called, but there are still outstanding [`Permits`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.Permit.html "struct tokio::sync::mpsc::bounded::Permit") from before it was
closed, the channel is not considered closed by `recv_many` until the
permits are released.

For non-zero values of `limit`, this method will never return `0` unless
the channel has been closed and there are no remaining messages in the
channel’s queue. This indicates that no further values can ever be
received from this `Receiver`. The channel is closed when all senders
have been dropped, or when [`close`](struct.Receiver.html_method.close.md "method tauri::async_runtime::Receiver::close") is called.

The capacity of `buffer` is increased as needed.

##### [§](#cancel-safety-1)Cancel safety

This method is cancel safe. If `recv_many` is used as the event in a
[`tokio::select!`](crate::select) statement and some other branch
completes first, it is guaranteed that no messages were received on this
channel.

##### [§](#examples-1)Examples

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    let mut buffer: Vec<&str> = Vec::with_capacity(2);
    let limit = 2;
    let (tx, mut rx) = mpsc::channel(100);
    let tx2 = tx.clone();
    tx2.send("first").await.unwrap();
    tx2.send("second").await.unwrap();
    tx2.send("third").await.unwrap();

    // Call `recv_many` to receive up to `limit` (2) values.
    assert_eq!(2, rx.recv_many(&mut buffer, limit).await);
    assert_eq!(vec!["first", "second"], buffer);

    // If the buffer is full, the next call to `recv_many`
    // reserves additional capacity.
    assert_eq!(1, rx.recv_many(&mut buffer, 1).await);

    tokio::spawn(async move {
        tx.send("fourth").await.unwrap();
    });

    // 'tx' is dropped, but `recv_many`
    // is guaranteed not to return 0 as the channel
    // is not yet closed.
    assert_eq!(1, rx.recv_many(&mut buffer, 1).await);
    assert_eq!(vec!["first", "second", "third", "fourth"], buffer);

    // Once the last sender is dropped, the channel is
    // closed and `recv_many` returns 0, capacity unchanged.
    drop(tx2);
    assert_eq!(0, rx.recv_many(&mut buffer, limit).await);
    assert_eq!(vec!["first", "second", "third", "fourth"], buffer);
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#361)

#### pub fn [try\_recv](#method.try_recv)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, [TryRecvError](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/error/enum.TryRecvError.html "enum tokio::sync::mpsc::error::TryRecvError")>

Tries to receive the next value for this receiver.

This method returns the [`Empty`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/error/enum.TryRecvError.html#variant.Empty "variant tokio::sync::mpsc::error::TryRecvError::Empty") error if the channel is currently
empty, but there are still outstanding [senders](struct.Sender.html.md "struct tauri::async_runtime::Sender") or [permits](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.Permit.html "struct tokio::sync::mpsc::bounded::Permit").

This method returns the [`Disconnected`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/error/enum.TryRecvError.html#variant.Disconnected "variant tokio::sync::mpsc::error::TryRecvError::Disconnected") error if the channel is
currently empty, and there are no outstanding [senders](struct.Sender.html.md "struct tauri::async_runtime::Sender") or [permits](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.Permit.html "struct tokio::sync::mpsc::bounded::Permit").

Unlike the [`poll_recv`](struct.Receiver.html_method.poll_recv.md "method tauri::async_runtime::Receiver::poll_recv") method, this method will never return an
[`Empty`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/error/enum.TryRecvError.html#variant.Empty "variant tokio::sync::mpsc::error::TryRecvError::Empty") error spuriously.

##### [§](#examples-2)Examples

```
use tokio::sync::mpsc;
use tokio::sync::mpsc::error::TryRecvError;

#[tokio::main]
async fn main() {
    let (tx, mut rx) = mpsc::channel(100);

    tx.send("hello").await.unwrap();

    assert_eq!(Ok("hello"), rx.try_recv());
    assert_eq!(Err(TryRecvError::Empty), rx.try_recv());

    tx.send("hello").await.unwrap();
    // Drop the last sender, closing the channel.
    drop(tx);

    assert_eq!(Ok("hello"), rx.try_recv());
    assert_eq!(Err(TryRecvError::Disconnected), rx.try_recv());
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#418)

#### pub fn [blocking\_recv](#method.blocking_recv)(&mut self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<T>

Blocking receive to call outside of asynchronous contexts.

This method returns `None` if the channel has been closed and there are
no remaining messages in the channel’s buffer. This indicates that no
further values can ever be received from this `Receiver`. The channel is
closed when all senders have been dropped, or when [`close`](struct.Receiver.html_method.close.md "method tauri::async_runtime::Receiver::close") is called.

If there are no messages in the channel’s buffer, but the channel has
not yet been closed, this method will block until a message is sent or
the channel is closed.

This method is intended for use cases where you are sending from
asynchronous code to synchronous code, and will work even if the sender
is not using [`blocking_send`](struct.Sender.html_method.blocking_send.md "method tauri::async_runtime::Sender::blocking_send") to send the message.

Note that if [`close`](struct.Receiver.html_method.close.md "method tauri::async_runtime::Receiver::close") is called, but there are still outstanding
[`Permits`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.Permit.html "struct tokio::sync::mpsc::bounded::Permit") from before it was closed, the channel is not considered
closed by `blocking_recv` until the permits are released.

##### [§](#panics)Panics

This function panics if called within an asynchronous execution
context.

##### [§](#examples-3)Examples

```
use std::thread;
use tokio::runtime::Runtime;
use tokio::sync::mpsc;

fn main() {
    let (tx, mut rx) = mpsc::channel::<u8>(10);

    let sync_code = thread::spawn(move || {
        assert_eq!(Some(10), rx.blocking_recv());
    });

    Runtime::new()
        .unwrap()
        .block_on(async move {
            let _ = tx.send(10).await;
        });
    sync_code.join().unwrap()
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#428)

#### pub fn [blocking\_recv\_many](#method.blocking_recv_many)(&mut self, buffer: &mut [Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<T>, limit: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)

Variant of [`Self::recv_many`](struct.Receiver.html_method.recv_many.md "method tauri::async_runtime::Receiver::recv_many") for blocking contexts.

The same conditions as in [`Self::blocking_recv`](struct.Receiver.html_method.blocking_recv.md "method tauri::async_runtime::Receiver::blocking_recv") apply.

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#472)

#### pub fn [close](#method.close)(&mut self)

Closes the receiving half of a channel without dropping it.

This prevents any further messages from being sent on the channel while
still enabling the receiver to drain messages that are buffered. Any
outstanding [`Permit`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.Permit.html "struct tokio::sync::mpsc::bounded::Permit") values will still be able to send messages.

To guarantee that no messages are dropped, after calling `close()`,
`recv()` must be called until `None` is returned. If there are
outstanding [`Permit`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.Permit.html "struct tokio::sync::mpsc::bounded::Permit") or [`OwnedPermit`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.OwnedPermit.html "struct tokio::sync::mpsc::bounded::OwnedPermit") values, the `recv` method will
not return `None` until those are released.

##### [§](#examples-4)Examples

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    let (tx, mut rx) = mpsc::channel(20);

    tokio::spawn(async move {
        let mut i = 0;
        while let Ok(permit) = tx.reserve().await {
            permit.send(i);
            i += 1;
        }
    });

    rx.close();

    while let Some(msg) = rx.recv().await {
        println!("got {}", msg);
    }

    // Channel closed and no messages are lost.
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#498)

#### pub fn [is\_closed](#method.is_closed)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Checks if a channel is closed.

This method returns `true` if the channel has been closed. The channel is closed
when all [`Sender`](struct.Sender.html.md "struct tauri::async_runtime::Sender") have been dropped, or when [`Receiver::close`](struct.Receiver.html_method.close.md "method tauri::async_runtime::Receiver::close") is called.

##### [§](#examples-5)Examples

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    let (_tx, mut rx) = mpsc::channel::<()>(10);
    assert!(!rx.is_closed());

    rx.close();

    assert!(rx.is_closed());
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#520)

#### pub fn [is\_empty](#method.is_empty)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Checks if a channel is empty.

This method returns `true` if the channel has no messages.

##### [§](#examples-6)Examples

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    let (tx, rx) = mpsc::channel(10);
    assert!(rx.is_empty());

    tx.send(0).await.unwrap();
    assert!(!rx.is_empty());
}

```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#539)

#### pub fn [len](#method.len)(&self) -> [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)

Returns the number of messages in the channel.

##### [§](#examples-7)Examples

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    let (tx, rx) = mpsc::channel(10);
    assert_eq!(0, rx.len());

    tx.send(0).await.unwrap();
    assert_eq!(1, rx.len());
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#585)

#### pub fn [capacity](#method.capacity)(&self) -> [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)

Returns the current capacity of the channel.

The capacity goes down when the sender sends a value by calling [`Sender::send`](struct.Sender.html_method.send.md "method tauri::async_runtime::Sender::send") or by reserving
capacity with [`Sender::reserve`](struct.Sender.html_method.reserve.md "method tauri::async_runtime::Sender::reserve"). The capacity goes up when values are received.
This is distinct from [`max_capacity`](struct.Receiver.html_method.max_capacity.md "method tauri::async_runtime::Receiver::max_capacity"), which always returns buffer capacity initially
specified when calling [`channel`](fn.channel.html.md "fn tauri::async_runtime::channel").

##### [§](#examples-8)Examples

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    let (tx, mut rx) = mpsc::channel::<()>(5);

    assert_eq!(rx.capacity(), 5);

    // Making a reservation drops the capacity by one.
    let permit = tx.reserve().await.unwrap();
    assert_eq!(rx.capacity(), 4);
    assert_eq!(rx.len(), 0);

    // Sending and receiving a value increases the capacity by one.
    permit.send(());
    assert_eq!(rx.len(), 1);
    rx.recv().await.unwrap();
    assert_eq!(rx.capacity(), 5);

    // Directly sending a message drops the capacity by one.
    tx.send(()).await.unwrap();
    assert_eq!(rx.capacity(), 4);
    assert_eq!(rx.len(), 1);

    // Receiving the message increases the capacity by one.
    rx.recv().await.unwrap();
    assert_eq!(rx.capacity(), 5);
    assert_eq!(rx.len(), 0);
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#619)

#### pub fn [max\_capacity](#method.max_capacity)(&self) -> [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)

Returns the maximum buffer capacity of the channel.

The maximum capacity is the buffer capacity initially specified when calling
[`channel`](fn.channel.html.md "fn tauri::async_runtime::channel"). This is distinct from [`capacity`](struct.Receiver.html_method.capacity.md "method tauri::async_runtime::Receiver::capacity"), which returns the *current*
available buffer capacity: as messages are sent and received, the value
returned by [`capacity`](struct.Receiver.html_method.capacity.md "method tauri::async_runtime::Receiver::capacity") will go up or down, whereas the value
returned by [`max_capacity`](struct.Receiver.html_method.max_capacity.md "method tauri::async_runtime::Receiver::max_capacity") will remain constant.

##### [§](#examples-9)Examples

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    let (tx, rx) = mpsc::channel::<()>(5);

    // both max capacity and capacity are the same at first
    assert_eq!(rx.max_capacity(), 5);
    assert_eq!(rx.capacity(), 5);

    // Making a reservation doesn't change the max capacity.
    let permit = tx.reserve().await.unwrap();
    assert_eq!(rx.max_capacity(), 5);
    // but drops the capacity by one
    assert_eq!(rx.capacity(), 4);
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#644)

#### pub fn [poll\_recv](#method.poll_recv)(&mut self, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<T>>

Polls to receive the next message on this channel.

This method returns:

* `Poll::Pending` if no messages are available but the channel is not
  closed, or if a spurious failure happens.
* `Poll::Ready(Some(message))` if a message is available.
* `Poll::Ready(None)` if the channel has been closed and all messages
  sent before it was closed have been received.

When the method returns `Poll::Pending`, the `Waker` in the provided
`Context` is scheduled to receive a wakeup when a message is sent on any
receiver, or when the channel is closed. Note that on multiple calls to
`poll_recv` or `poll_recv_many`, only the `Waker` from the `Context`
passed to the most recent call is scheduled to receive a wakeup.

If this method returns `Poll::Pending` due to a spurious failure, then
the `Waker` will be notified when the situation causing the spurious
failure has been resolved. Note that receiving such a wakeup does not
guarantee that the next call will succeed — it could fail with another
spurious failure.

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#716-721)

#### pub fn [poll\_recv\_many](#method.poll_recv_many)( &mut self, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>, buffer: &mut [Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<T>, limit: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), ) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)>

Polls to receive multiple messages on this channel, extending the provided buffer.

This method returns:

* `Poll::Pending` if no messages are available but the channel is not closed, or if a
  spurious failure happens.
* `Poll::Ready(count)` where `count` is the number of messages successfully received and
  stored in `buffer`. This can be less than, or equal to, `limit`.
* `Poll::Ready(0)` if `limit` is set to zero or when the channel is closed.

When the method returns `Poll::Pending`, the `Waker` in the provided
`Context` is scheduled to receive a wakeup when a message is sent on any
receiver, or when the channel is closed. Note that on multiple calls to
`poll_recv` or `poll_recv_many`, only the `Waker` from the `Context`
passed to the most recent call is scheduled to receive a wakeup.

Note that this method does not guarantee that exactly `limit` messages
are received. Rather, if at least one message is available, it returns
as many messages as it can up to the given limit. This method returns
zero only if the channel is closed (or if `limit` is zero).

##### [§](#examples-10)Examples

```
use std::task::{Context, Poll};
use std::pin::Pin;
use tokio::sync::mpsc;
use futures::Future;

struct MyReceiverFuture<'a> {
    receiver: mpsc::Receiver<i32>,
    buffer: &'a mut Vec<i32>,
    limit: usize,
}

impl<'a> Future for MyReceiverFuture<'a> {
    type Output = usize; // Number of messages received

    fn poll(mut self: Pin<&mut Self>, cx: &mut Context<'_>) -> Poll<Self::Output> {
        let MyReceiverFuture { receiver, buffer, limit } = &mut *self;

        // Now `receiver` and `buffer` are mutable references, and `limit` is copied
        match receiver.poll_recv_many(cx, *buffer, *limit) {
            Poll::Pending => Poll::Pending,
            Poll::Ready(count) => Poll::Ready(count),
        }
    }
}

#[tokio::main]
async fn main() {
    let (tx, rx) = mpsc::channel(32);
    let mut buffer = Vec::new();

    let my_receiver_future = MyReceiverFuture {
        receiver: rx,
        buffer: &mut buffer,
        limit: 3,
    };

    for i in 0..10 {
        tx.send(i).await.unwrap();
    }

    let count = my_receiver_future.await;
    assert_eq!(count, 3);
    assert_eq!(buffer, vec![0,1,2])
}
```

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#726)

#### pub fn [sender\_strong\_count](#method.sender_strong_count)(&self) -> [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)

Returns the number of [`Sender`](struct.Sender.html.md "struct tauri::async_runtime::Sender") handles.

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#731)

#### pub fn [sender\_weak\_count](#method.sender_weak_count)(&self) -> [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)

Returns the number of [`WeakSender`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/sync/mpsc/bounded/struct.WeakSender.html "struct tokio::sync::mpsc::bounded::WeakSender") handles.

## Trait Implementations[§](#trait-implementations)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#736)[§](#impl-Debug-for-Receiver%3CT%3E)

### impl<T> [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [Receiver](struct.Receiver.html.md "struct tauri::async_runtime::Receiver")<T>

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#737)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, fmt: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")>

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#744)[§](#impl-Unpin-for-Receiver%3CT%3E)

### impl<T> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [Receiver](struct.Receiver.html.md "struct tauri::async_runtime::Receiver")<T>

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-Receiver%3CT%3E)

### impl<T> [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [Receiver](struct.Receiver.html.md "struct tauri::async_runtime::Receiver")<T>

[§](#impl-RefUnwindSafe-for-Receiver%3CT%3E)

### impl<T> [RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [Receiver](struct.Receiver.html.md "struct tauri::async_runtime::Receiver")<T>

[§](#impl-Send-for-Receiver%3CT%3E)

### impl<T> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [Receiver](struct.Receiver.html.md "struct tauri::async_runtime::Receiver")<T> where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send"),

[§](#impl-Sync-for-Receiver%3CT%3E)

### impl<T> [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [Receiver](struct.Receiver.html.md "struct tauri::async_runtime::Receiver")<T> where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send"),

[§](#impl-UnwindSafe-for-Receiver%3CT%3E)

### impl<T> [UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [Receiver](struct.Receiver.html.md "struct tauri::async_runtime::Receiver")<T>

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