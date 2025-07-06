# Struct EffectsBuilderCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/window/mod.rs.html#2230)

```
pub struct EffectsBuilder(/* private fields */);
```

Expand description

The [`WindowEffectsConfig`](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowEffectsConfig.html "struct tauri_utils::config::WindowEffectsConfig") object builder

## Implementations[§](#implementations)

[Source](../../src/tauri/window/mod.rs.html#2231-2275)[§](#impl-EffectsBuilder)

### impl [EffectsBuilder](struct.EffectsBuilder.html.md "struct tauri::window::EffectsBuilder")

[Source](../../src/tauri/window/mod.rs.html#2233-2235)

#### pub fn [new](#method.new)() -> Self

Create a new [`WindowEffectsConfig`](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowEffectsConfig.html "struct tauri_utils::config::WindowEffectsConfig") builder

[Source](../../src/tauri/window/mod.rs.html#2238-2241)

#### pub fn [effect](#method.effect)(self, effect: [Effect](enum.Effect.html.md "enum tauri::window::Effect")) -> Self

Adds effect to the [`WindowEffectsConfig`](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowEffectsConfig.html "struct tauri_utils::config::WindowEffectsConfig") `effects` field

[Source](../../src/tauri/window/mod.rs.html#2244-2247)

#### pub fn [effects](#method.effects)<I: [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator")<Item = [Effect](enum.Effect.html.md "enum tauri::window::Effect")>>(self, effects: I) -> Self

Adds effects to the [`WindowEffectsConfig`](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowEffectsConfig.html "struct tauri_utils::config::WindowEffectsConfig") `effects` field

[Source](../../src/tauri/window/mod.rs.html#2250-2253)

#### pub fn [clear\_effects](#method.clear_effects)(self) -> Self

Clears the [`WindowEffectsConfig`](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowEffectsConfig.html "struct tauri_utils::config::WindowEffectsConfig") `effects` field

[Source](../../src/tauri/window/mod.rs.html#2256-2259)

#### pub fn [state](#method.state)(self, state: [EffectState](enum.EffectState.html.md "enum tauri::window::EffectState")) -> Self

Sets `state` field for the [`WindowEffectsConfig`](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowEffectsConfig.html "struct tauri_utils::config::WindowEffectsConfig") **macOS Only**

[Source](../../src/tauri/window/mod.rs.html#2261-2264)

#### pub fn [radius](#method.radius)(self, radius: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> Self

Sets `radius` field fo the [`WindowEffectsConfig`](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowEffectsConfig.html "struct tauri_utils::config::WindowEffectsConfig") **macOS Only**

[Source](../../src/tauri/window/mod.rs.html#2266-2269)

#### pub fn [color](#method.color)(self, color: [Color](..\webview\struct.Color.html.md "struct tauri::webview::Color")) -> Self

Sets `color` field fo the [`WindowEffectsConfig`](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowEffectsConfig.html "struct tauri_utils::config::WindowEffectsConfig") **Windows Only**

[Source](../../src/tauri/window/mod.rs.html#2272-2274)

#### pub fn [build](#method.build)(self) -> [WindowEffectsConfig](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowEffectsConfig.html "struct tauri_utils::config::WindowEffectsConfig")

Builds a [`WindowEffectsConfig`](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowEffectsConfig.html "struct tauri_utils::config::WindowEffectsConfig")

## Trait Implementations[§](#trait-implementations)

[Source](../../src/tauri/window/mod.rs.html#2229)[§](#impl-Default-for-EffectsBuilder)

### impl [Default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html "trait core::default::Default") for [EffectsBuilder](struct.EffectsBuilder.html.md "struct tauri::window::EffectsBuilder")

[Source](../../src/tauri/window/mod.rs.html#2229)[§](#method.default)

#### fn [default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html#tymethod.default)() -> [EffectsBuilder](struct.EffectsBuilder.html.md "struct tauri::window::EffectsBuilder")

Returns the “default value” for a type. [Read more](https://doc.rust-lang.org/nightly/core/default/trait.Default.html#tymethod.default)

[Source](../../src/tauri/window/mod.rs.html#2277-2281)[§](#impl-From%3CWindowEffectsConfig%3E-for-EffectsBuilder)

### impl [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[WindowEffectsConfig](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowEffectsConfig.html "struct tauri_utils::config::WindowEffectsConfig")> for [EffectsBuilder](struct.EffectsBuilder.html.md "struct tauri::window::EffectsBuilder")

[Source](../../src/tauri/window/mod.rs.html#2278-2280)[§](#method.from)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(value: [WindowEffectsConfig](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/config/struct.WindowEffectsConfig.html "struct tauri_utils::config::WindowEffectsConfig")) -> Self

Converts to this type from the input type.

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-EffectsBuilder)

### impl [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [EffectsBuilder](struct.EffectsBuilder.html.md "struct tauri::window::EffectsBuilder")

[§](#impl-RefUnwindSafe-for-EffectsBuilder)

### impl [RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [EffectsBuilder](struct.EffectsBuilder.html.md "struct tauri::window::EffectsBuilder")

[§](#impl-Send-for-EffectsBuilder)

### impl [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [EffectsBuilder](struct.EffectsBuilder.html.md "struct tauri::window::EffectsBuilder")

[§](#impl-Sync-for-EffectsBuilder)

### impl [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [EffectsBuilder](struct.EffectsBuilder.html.md "struct tauri::window::EffectsBuilder")

[§](#impl-Unpin-for-EffectsBuilder)

### impl [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [EffectsBuilder](struct.EffectsBuilder.html.md "struct tauri::window::EffectsBuilder")

[§](#impl-UnwindSafe-for-EffectsBuilder)

### impl [UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [EffectsBuilder](struct.EffectsBuilder.html.md "struct tauri::window::EffectsBuilder")

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