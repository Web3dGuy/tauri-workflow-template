# Enum JoinHandleCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/async_runtime.rs.html#133-136)

```
pub enum JoinHandle<T> {
    Tokio(TokioJoinHandle<T>),
}
```

Expand description

An owned permission to join on a task (await its termination).

## Variants[§](#variants)

[§](#variant.Tokio)

### Tokio([TokioJoinHandle](struct.TokioJoinHandle.html.md "struct tauri::async_runtime::TokioJoinHandle")<T>)

The tokio JoinHandle.

## Implementations[§](#implementations)

[Source](../../src/tauri/async_runtime.rs.html#138-155)[§](#impl-JoinHandle%3CT%3E)

### impl<T> [JoinHandle](enum.JoinHandle.html.md "enum tauri::async_runtime::JoinHandle")<T>

[Source](../../src/tauri/async_runtime.rs.html#140-143)

#### pub fn [inner](#method.inner)(&self) -> &[TokioJoinHandle](struct.TokioJoinHandle.html.md "struct tauri::async_runtime::TokioJoinHandle")<T> [ⓘ](#)

Gets a reference to the [`TokioJoinHandle`](struct.TokioJoinHandle.html.md "struct tauri::async_runtime::TokioJoinHandle").

[Source](../../src/tauri/async_runtime.rs.html#150-154)

#### pub fn [abort](#method.abort)(&self)

Abort the task associated with the handle.

Awaiting a cancelled task might complete as usual if the task was
already completed at the time it was cancelled, but most likely it
will fail with a cancelled `JoinError`.

## Trait Implementations[§](#trait-implementations)

[Source](../../src/tauri/async_runtime.rs.html#132)[§](#impl-Debug-for-JoinHandle%3CT%3E)

### impl<T: [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug")> [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [JoinHandle](enum.JoinHandle.html.md "enum tauri::async_runtime::JoinHandle")<T>

[Source](../../src/tauri/async_runtime.rs.html#132)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/fmt/type.Result.html "type core::fmt::Result")

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](../../src/tauri/async_runtime.rs.html#157-164)[§](#impl-Future-for-JoinHandle%3CT%3E)

### impl<T> [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future") for [JoinHandle](enum.JoinHandle.html.md "enum tauri::async_runtime::JoinHandle")<T>

[Source](../../src/tauri/async_runtime.rs.html#158)[§](#associatedtype.Output)

#### type [Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output) = [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, [Error](..\enum.Error.html.md "enum tauri::Error")>

The type of value produced on completion.

[Source](../../src/tauri/async_runtime.rs.html#159-163)[§](#method.poll)

#### fn [poll](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#tymethod.poll)(self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut Self>, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<Self::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output")>

Attempts to resolve the future to a final value, registering
the current task for wakeup if the value is not yet available. [Read more](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#tymethod.poll)

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-JoinHandle%3CT%3E)

### impl<T> [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [JoinHandle](enum.JoinHandle.html.md "enum tauri::async_runtime::JoinHandle")<T>

[§](#impl-RefUnwindSafe-for-JoinHandle%3CT%3E)

### impl<T> [RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [JoinHandle](enum.JoinHandle.html.md "enum tauri::async_runtime::JoinHandle")<T>

[§](#impl-Send-for-JoinHandle%3CT%3E)

### impl<T> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [JoinHandle](enum.JoinHandle.html.md "enum tauri::async_runtime::JoinHandle")<T> where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send"),

[§](#impl-Sync-for-JoinHandle%3CT%3E)

### impl<T> [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [JoinHandle](enum.JoinHandle.html.md "enum tauri::async_runtime::JoinHandle")<T> where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send"),

[§](#impl-Unpin-for-JoinHandle%3CT%3E)

### impl<T> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [JoinHandle](enum.JoinHandle.html.md "enum tauri::async_runtime::JoinHandle")<T>

[§](#impl-UnwindSafe-for-JoinHandle%3CT%3E)

### impl<T> [UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [JoinHandle](enum.JoinHandle.html.md "enum tauri::async_runtime::JoinHandle")<T>

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

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/future/mod.rs.html#119)[§](#impl-FutureExt-for-T)

### impl<T> [FutureExt](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html "trait futures_util::future::future::FutureExt") for T where T: [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/future/mod.rs.html#146-149)[§](#method.map)

#### fn [map](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.map)<U, F>(self, f: F) -> [Map](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/struct.Map.html "struct futures_util::future::future::Map")<Self, F> where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(Self::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output")) -> U, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Map this future’s output to a different type, returning a new future of
the resulting type. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.map)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/future/mod.rs.html#159-162)[§](#method.map_into)

#### fn [map\_into](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.map_into)<U>(self) -> [MapInto](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/struct.MapInto.html "struct futures_util::future::future::MapInto")<Self, U> where Self::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output"): [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<U>, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Map this future’s output to a different type, returning a new future of
the resulting type. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.map_into)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/future/mod.rs.html#191-195)[§](#method.then)

#### fn [then](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.then)<Fut, F>(self, f: F) -> [Then](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/struct.Then.html "struct futures_util::future::future::Then")<Self, Fut, F> where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(Self::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output")) -> Fut, Fut: [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future"), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Chain on a computation for when a future finished, passing the result of
the future to the provided closure `f`. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.then)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/future/mod.rs.html#222-225)[§](#method.left_future)

#### fn [left\_future](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.left_future)<B>(self) -> [Either](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/either/enum.Either.html "enum futures_util::future::either::Either")<Self, B> where B: [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future")<Output = Self::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output")>, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Wrap this future in an `Either` future, making it the left-hand variant
of that `Either`. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.left_future)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/future/mod.rs.html#252-255)[§](#method.right_future)

#### fn [right\_future](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.right_future)<A>(self) -> [Either](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/either/enum.Either.html "enum futures_util::future::either::Either")<A, Self> where A: [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future")<Output = Self::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output")>, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Wrap this future in an `Either` future, making it the right-hand variant
of that `Either`. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.right_future)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/future/mod.rs.html#278-280)[§](#method.into_stream)

#### fn [into\_stream](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.into_stream)(self) -> [IntoStream](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/struct.IntoStream.html "struct futures_util::future::future::IntoStream")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Convert this future into a single element stream. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.into_stream)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/future/mod.rs.html#307-310)[§](#method.flatten)

#### fn [flatten](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.flatten)(self) -> [Flatten](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/struct.Flatten.html "struct futures_util::future::future::Flatten")<Self> where Self::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output"): [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future"), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Flatten the execution of this future when the output of this
future is itself another future. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.flatten)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/future/mod.rs.html#341-344)[§](#method.flatten_stream)

#### fn [flatten\_stream](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.flatten_stream)(self) -> [FlattenStream](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/struct.FlattenStream.html "struct futures_util::future::future::FlattenStream")<Self> where Self::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output"): [Stream](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/stream/trait.Stream.html "trait futures_core::stream::Stream"), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Flatten the execution of this future when the successful result of this
future is a stream. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.flatten_stream)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/future/mod.rs.html#365-367)[§](#method.fuse)

#### fn [fuse](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.fuse)(self) -> [Fuse](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/fuse/struct.Fuse.html "struct futures_util::future::future::fuse::Fuse")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Fuse a future such that `poll` will never again be called once it has
completed. This method can be used to turn any `Future` into a
`FusedFuture`. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.fuse)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/future/mod.rs.html#391-394)[§](#method.inspect)

#### fn [inspect](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.inspect)<F>(self, f: F) -> [Inspect](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/struct.Inspect.html "struct futures_util::future::future::Inspect")<Self, F> where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(&Self::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output")), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Do something with the output of a future before passing it on. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.inspect)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/future/mod.rs.html#431-433)[§](#method.catch_unwind)

#### fn [catch\_unwind](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.catch_unwind)(self) -> [CatchUnwind](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/catch_unwind/struct.CatchUnwind.html "struct futures_util::future::future::catch_unwind::CatchUnwind")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized") + [UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe"),

Catches unwinding panics while polling the future. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.catch_unwind)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/future/mod.rs.html#482-485)[§](#method.shared)

#### fn [shared](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.shared)(self) -> [Shared](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/shared/struct.Shared.html "struct futures_util::future::future::shared::Shared")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), Self::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output"): [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone"),

Create a cloneable handle to this future where all handles will resolve
to the same result. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.shared)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/future/mod.rs.html#514-516)[§](#method.boxed)

#### fn [boxed](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.boxed)<'a>(self) -> [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<dyn [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future")<Output = Self::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output")> + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'a>> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized") + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'a,

Wrap the future in a Box, pinning it. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.boxed)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/future/mod.rs.html#528-530)[§](#method.boxed_local)

#### fn [boxed\_local](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.boxed_local)<'a>(self) -> [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<dyn [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future")<Output = Self::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output")> + 'a>> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized") + 'a,

Wrap the future in a Box, pinning it. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.boxed_local)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/future/mod.rs.html#537-539)[§](#method.unit_error)

#### fn [unit\_error](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.unit_error)(self) -> [UnitError](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/struct.UnitError.html "struct futures_util::future::future::UnitError")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Turns a [`Future<Output = T>`](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future") into a
[`TryFuture<Ok = T, Error = ()`>](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html "trait futures_core::future::TryFuture").

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/future/mod.rs.html#546-548)[§](#method.never_error)

#### fn [never\_error](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.never_error)(self) -> [NeverError](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/struct.NeverError.html "struct futures_util::future::future::NeverError")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Turns a [`Future<Output = T>`](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future") into a
[`TryFuture<Ok = T, Error = Never`>](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html "trait futures_core::future::TryFuture").

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/future/mod.rs.html#554-556)[§](#method.poll_unpin)

#### fn [poll\_unpin](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.poll_unpin)(&mut self, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<Self::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output")> where Self: [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin"),

A convenience for calling `Future::poll` on `Unpin` future types.

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/future/mod.rs.html#592-594)[§](#method.now_or_never)

#### fn [now\_or\_never](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.now_or_never)(self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<Self::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output")> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Evaluates and consumes the future, returning the resulting output if
the future is ready after the first call to `Future::poll`. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/future/trait.FutureExt.html#method.now_or_never)

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#750-752)[§](#impl-Into%3CU%3E-for-T)

### impl<T, U> [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<U> for T where U: [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<T>,

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#760)[§](#method.into)

#### fn [into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html#tymethod.into)(self) -> U

Calls `U::from(self)`.

That is, this conversion is whatever the implementation of
`From<T> for U` chooses to do.

[Source](https://doc.rust-lang.org/nightly/src/core/future/into_future.rs.html#138)[§](#impl-IntoFuture-for-F)

### impl<F> [IntoFuture](https://doc.rust-lang.org/nightly/core/future/into_future/trait.IntoFuture.html "trait core::future::into_future::IntoFuture") for F where F: [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future"),

[Source](https://doc.rust-lang.org/nightly/src/core/future/into_future.rs.html#139)[§](#associatedtype.Output-1)

#### type [Output](https://doc.rust-lang.org/nightly/core/future/into_future/trait.IntoFuture.html#associatedtype.Output) = <F as [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future")>::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output")

The output that the future will produce on completion.

[Source](https://doc.rust-lang.org/nightly/src/core/future/into_future.rs.html#140)[§](#associatedtype.IntoFuture)

#### type [IntoFuture](https://doc.rust-lang.org/nightly/core/future/into_future/trait.IntoFuture.html#associatedtype.IntoFuture) = F

Which kind of future are we turning this into?

[Source](https://doc.rust-lang.org/nightly/src/core/future/into_future.rs.html#142)[§](#method.into_future)

#### fn [into\_future](https://doc.rust-lang.org/nightly/core/future/into_future/trait.IntoFuture.html#tymethod.into_future)(self) -> <F as [IntoFuture](https://doc.rust-lang.org/nightly/core/future/into_future/trait.IntoFuture.html "trait core::future::into_future::IntoFuture")>::[IntoFuture](https://doc.rust-lang.org/nightly/core/future/into_future/trait.IntoFuture.html#associatedtype.IntoFuture "type core::future::into_future::IntoFuture::IntoFuture")

Creates a future from a value. [Read more](https://doc.rust-lang.org/nightly/core/future/into_future/trait.IntoFuture.html#tymethod.into_future)

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#806-808)[§](#impl-TryFrom%3CU%3E-for-T)

### impl<T, U> [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<U> for T where U: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<T>,

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#810)[§](#associatedtype.Error-1)

#### type [Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error) = [Infallible](https://doc.rust-lang.org/nightly/core/convert/enum.Infallible.html "enum core::convert::Infallible")

The type returned in the event of a conversion error.

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#813)[§](#method.try_from)

#### fn [try\_from](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#tymethod.try_from)(value: U) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, <T as [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<U>>::[Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error "type core::convert::TryFrom::Error")>

Performs the conversion.

[Source](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/src/futures_core/future.rs.html#83-85)[§](#impl-TryFuture-for-F)

### impl<F, T, E> [TryFuture](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html "trait futures_core::future::TryFuture") for F where F: [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future")<Output = [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E>> + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/src/futures_core/future.rs.html#87)[§](#associatedtype.Ok)

#### type [Ok](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Ok) = T

The type of successful values yielded by this future

[Source](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/src/futures_core/future.rs.html#88)[§](#associatedtype.Error-2)

#### type [Error](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Error) = E

The type of failures yielded by this future

[Source](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/src/futures_core/future.rs.html#91)[§](#method.try_poll)

#### fn [try\_poll](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#tymethod.try_poll)( self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<[&mut F](https://doc.rust-lang.org/nightly/std/primitive.reference.html)>, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>, ) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<<F as [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future")>::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output")>

Poll this `TryFuture` as if it were a `Future`. [Read more](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#tymethod.try_poll)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/try_future/mod.rs.html#134)[§](#impl-TryFutureExt-for-Fut)

### impl<Fut> [TryFutureExt](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html "trait futures_util::future::try_future::TryFutureExt") for Fut where Fut: [TryFuture](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html "trait futures_core::future::TryFuture") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/try_future/mod.rs.html#217-220)[§](#method.map_ok)

#### fn [map\_ok](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.map_ok)<T, F>(self, f: F) -> [MapOk](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/struct.MapOk.html "struct futures_util::future::try_future::MapOk")<Self, F> where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(Self::[Ok](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Ok "type futures_core::future::TryFuture::Ok")) -> T, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Maps this future’s success value to a different value. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.map_ok)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/try_future/mod.rs.html#257-261)[§](#method.map_ok_or_else)

#### fn [map\_ok\_or\_else](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.map_ok_or_else)<T, E, F>(self, e: E, f: F) -> [MapOkOrElse](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/struct.MapOkOrElse.html "struct futures_util::future::try_future::MapOkOrElse")<Self, F, E> where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(Self::[Ok](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Ok "type futures_core::future::TryFuture::Ok")) -> T, E: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(Self::[Error](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Error "type futures_core::future::TryFuture::Error")) -> T, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Maps this future’s success value to a different value, and permits for error handling resulting in the same type. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.map_ok_or_else)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/try_future/mod.rs.html#308-311)[§](#method.map_err)

#### fn [map\_err](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.map_err)<E, F>(self, f: F) -> [MapErr](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/struct.MapErr.html "struct futures_util::future::try_future::MapErr")<Self, F> where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(Self::[Error](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Error "type futures_core::future::TryFuture::Error")) -> E, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Maps this future’s error value to a different value. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.map_err)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/try_future/mod.rs.html#341-344)[§](#method.err_into)

#### fn [err\_into](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.err_into)<E>(self) -> [ErrInto](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/struct.ErrInto.html "struct futures_util::future::try_future::ErrInto")<Self, E> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), Self::[Error](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Error "type futures_core::future::TryFuture::Error"): [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<E>,

Maps this future’s [`Error`](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Error "associated type futures_core::future::TryFuture::Error") to a new error type
using the [`Into`](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into") trait. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.err_into)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/try_future/mod.rs.html#351-354)[§](#method.ok_into)

#### fn [ok\_into](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.ok_into)<U>(self) -> [OkInto](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/struct.OkInto.html "struct futures_util::future::try_future::OkInto")<Self, U> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), Self::[Ok](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Ok "type futures_core::future::TryFuture::Ok"): [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<U>,

Maps this future’s [`Ok`](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Ok "associated type futures_core::future::TryFuture::Ok") to a new type
using the [`Into`](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into") trait.

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/try_future/mod.rs.html#395-399)[§](#method.and_then)

#### fn [and\_then](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.and_then)<Fut, F>(self, f: F) -> [AndThen](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/struct.AndThen.html "struct futures_util::future::try_future::AndThen")<Self, Fut, F> where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(Self::[Ok](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Ok "type futures_core::future::TryFuture::Ok")) -> Fut, Fut: [TryFuture](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html "trait futures_core::future::TryFuture")<Error = Self::[Error](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Error "type futures_core::future::TryFuture::Error")>, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Executes another future after this one resolves successfully. The
success value is passed to a closure to create this subsequent future. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.and_then)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/try_future/mod.rs.html#440-444)[§](#method.or_else)

#### fn [or\_else](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.or_else)<Fut, F>(self, f: F) -> [OrElse](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/struct.OrElse.html "struct futures_util::future::try_future::OrElse")<Self, Fut, F> where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(Self::[Error](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Error "type futures_core::future::TryFuture::Error")) -> Fut, Fut: [TryFuture](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html "trait futures_core::future::TryFuture")<Ok = Self::[Ok](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Ok "type futures_core::future::TryFuture::Ok")>, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Executes another future if this one resolves to an error. The
error value is passed to a closure to create this subsequent future. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.or_else)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/try_future/mod.rs.html#467-470)[§](#method.inspect_ok)

#### fn [inspect\_ok](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.inspect_ok)<F>(self, f: F) -> [InspectOk](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/struct.InspectOk.html "struct futures_util::future::try_future::InspectOk")<Self, F> where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(&Self::[Ok](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Ok "type futures_core::future::TryFuture::Ok")), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Do something with the success value of a future before passing it on. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.inspect_ok)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/try_future/mod.rs.html#493-496)[§](#method.inspect_err)

#### fn [inspect\_err](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.inspect_err)<F>(self, f: F) -> [InspectErr](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/struct.InspectErr.html "struct futures_util::future::try_future::InspectErr")<Self, F> where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(&Self::[Error](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Error "type futures_core::future::TryFuture::Error")), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Do something with the error value of a future before passing it on. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.inspect_err)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/try_future/mod.rs.html#505-508)[§](#method.try_flatten)

#### fn [try\_flatten](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.try_flatten)(self) -> [TryFlatten](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/struct.TryFlatten.html "struct futures_util::future::try_future::TryFlatten")<Self, Self::[Ok](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Ok "type futures_core::future::TryFuture::Ok")> where Self::[Ok](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Ok "type futures_core::future::TryFuture::Ok"): [TryFuture](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html "trait futures_core::future::TryFuture")<Error = Self::[Error](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Error "type futures_core::future::TryFuture::Error")>, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Flatten the execution of this future when the successful result of this
future is another future. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.try_flatten)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/try_future/mod.rs.html#538-541)[§](#method.try_flatten_stream)

#### fn [try\_flatten\_stream](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.try_flatten_stream)(self) -> [TryFlattenStream](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/struct.TryFlattenStream.html "struct futures_util::future::try_future::TryFlattenStream")<Self> where Self::[Ok](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Ok "type futures_core::future::TryFuture::Ok"): [TryStream](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/stream/trait.TryStream.html "trait futures_core::stream::TryStream")<Error = Self::[Error](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Error "type futures_core::future::TryFuture::Error")>, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Flatten the execution of this future when the successful result of this
future is a stream. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.try_flatten_stream)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/try_future/mod.rs.html#570-573)[§](#method.unwrap_or_else)

#### fn [unwrap\_or\_else](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.unwrap_or_else)<F>(self, f: F) -> [UnwrapOrElse](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/struct.UnwrapOrElse.html "struct futures_util::future::try_future::UnwrapOrElse")<Self, F> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(Self::[Error](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Error "type futures_core::future::TryFuture::Error")) -> Self::[Ok](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Ok "type futures_core::future::TryFuture::Ok"),

Unwraps this future’s output, producing a future with this future’s
[`Ok`](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Ok "associated type futures_core::future::TryFuture::Ok") type as its
[`Output`](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "associated type core::future::future::Future::Output") type. [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.unwrap_or_else)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/try_future/mod.rs.html#610-612)[§](#method.into_future-1)

#### fn [into\_future](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.into_future)(self) -> [IntoFuture](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/into_future/struct.IntoFuture.html "struct futures_util::future::try_future::into_future::IntoFuture")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Wraps a [`TryFuture`](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html "trait futures_core::future::TryFuture") into a type that implements
[`Future`](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future"). [Read more](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.into_future)

[Source](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/src/futures_util/future/try_future/mod.rs.html#619-621)[§](#method.try_poll_unpin)

#### fn [try\_poll\_unpin](https://docs.rs/futures-util/0.3.31/x86_64-unknown-linux-gnu/futures_util/future/try_future/trait.TryFutureExt.html#method.try_poll_unpin)( &mut self, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>, ) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Self::[Ok](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Ok "type futures_core::future::TryFuture::Ok"), Self::[Error](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#associatedtype.Error "type futures_core::future::TryFuture::Error")>> where Self: [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin"),

A convenience method for calling [`TryFuture::try_poll`](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.TryFuture.html#tymethod.try_poll "method futures_core::future::TryFuture::try_poll") on [`Unpin`](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin")
future types.

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

{"&TokioJoinHandle<T>":"<h3>Notable traits for <code><a class=\"struct\" href=\"struct.TokioJoinHandle.html\" title=\"struct tauri::async\_runtime::TokioJoinHandle\">JoinHandle</a>&lt;T&gt;</code></h3><pre><code><div class=\"where\">impl&lt;T&gt; <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html\" title=\"trait core::future::future::Future\">Future</a> for <a class=\"struct\" href=\"struct.TokioJoinHandle.html\" title=\"struct tauri::async\_runtime::TokioJoinHandle\">JoinHandle</a>&lt;T&gt;</div><div class=\"where\"> type <a href=\"https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output\" class=\"associatedtype\">Output</a> = <a class=\"enum\" href=\"https://doc.rust-lang.org/nightly/core/result/enum.Result.html\" title=\"enum core::result::Result\">Result</a>&lt;T, <a class=\"struct\" href=\"https://docs.rs/tokio/1.44.1/x86\_64-unknown-linux-gnu/tokio/runtime/task/error/struct.JoinError.html\" title=\"struct tokio::runtime::task::error::JoinError\">JoinError</a>&gt;;</div>"}