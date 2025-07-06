# Function channelCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/sync/mpsc/bounded.rs.html#156)

```
pub fn channel<T>(buffer: usize) -> (Sender<T>, Receiver<T>)
```

Expand description

Creates a bounded mpsc channel for communicating between asynchronous tasks
with backpressure.

The channel will buffer up to the provided number of messages. Once the
buffer is full, attempts to send new messages will wait until a message is
received from the channel. The provided buffer capacity must be at least 1.

All data sent on `Sender` will become available on `Receiver` in the same
order as it was sent.

The `Sender` can be cloned to `send` to the same channel from multiple code
locations. Only one `Receiver` is supported.

If the `Receiver` is disconnected while trying to `send`, the `send` method
will return a `SendError`. Similarly, if `Sender` is disconnected while
trying to `recv`, the `recv` method will return `None`.

## [§](#panics)Panics

Panics if the buffer capacity is 0.

## [§](#examples)Examples

```
use tokio::sync::mpsc;

#[tokio::main]
async fn main() {
    let (tx, mut rx) = mpsc::channel(100);

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