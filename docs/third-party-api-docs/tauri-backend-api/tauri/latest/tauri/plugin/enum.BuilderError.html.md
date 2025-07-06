# Enum BuilderErrorCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/plugin.rs.html#161-165)

```

#[non_exhaustive]

pub enum BuilderError {
    ReservedName(String),
}
```

Expand description

Errors that can happen during [`Builder`](struct.Builder.html.md "struct tauri::plugin::Builder").

## Variants (Non-exhaustive)[§](#variants)

This enum is marked as non-exhaustive

Non-exhaustive enums could have additional variants added in future. Therefore, when matching against variants of non-exhaustive enums, an extra wildcard arm must be added to account for any future variants.

[§](#variant.ReservedName)

### ReservedName([String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"))

Plugin attempted to use a reserved name.

## Trait Implementations[§](#trait-implementations)

[Source](../../src/tauri/plugin.rs.html#159)[§](#impl-Clone-for-BuilderError)

### impl [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [BuilderError](enum.BuilderError.html.md "enum tauri::plugin::BuilderError")

[Source](../../src/tauri/plugin.rs.html#159)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> [BuilderError](enum.BuilderError.html.md "enum tauri::plugin::BuilderError")

Returns a copy of the value. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#174)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &Self)

Performs copy-assignment from `source`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)

[Source](../../src/tauri/plugin.rs.html#159)[§](#impl-Debug-for-BuilderError)

### impl [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [BuilderError](enum.BuilderError.html.md "enum tauri::plugin::BuilderError")

[Source](../../src/tauri/plugin.rs.html#159)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/fmt/type.Result.html "type core::fmt::Result")

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](../../src/tauri/plugin.rs.html#159)[§](#impl-Display-for-BuilderError)

### impl [Display](https://doc.rust-lang.org/nightly/core/fmt/trait.Display.html "trait core::fmt::Display") for [BuilderError](enum.BuilderError.html.md "enum tauri::plugin::BuilderError")

[Source](../../src/tauri/plugin.rs.html#159)[§](#method.fmt-1)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Display.html#tymethod.fmt)(&self, \_\_formatter: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/fmt/type.Result.html "type core::fmt::Result")

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Display.html#tymethod.fmt)

[Source](../../src/tauri/plugin.rs.html#159)[§](#impl-Error-for-BuilderError)

### impl [Error](https://doc.rust-lang.org/nightly/core/error/trait.Error.html "trait core::error::Error") for [BuilderError](enum.BuilderError.html.md "enum tauri::plugin::BuilderError")

1.30.0 · [Source](https://doc.rust-lang.org/nightly/src/core/error.rs.html#105)[§](#method.source)

#### fn [source](https://doc.rust-lang.org/nightly/core/error/trait.Error.html#method.source)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&(dyn [Error](https://doc.rust-lang.org/nightly/core/error/trait.Error.html "trait core::error::Error") + 'static)>

Returns the lower-level source of this error, if any. [Read more](https://doc.rust-lang.org/nightly/core/error/trait.Error.html#method.source)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/error.rs.html#131)[§](#method.description)

#### fn [description](https://doc.rust-lang.org/nightly/core/error/trait.Error.html#method.description)(&self) -> &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

👎Deprecated since 1.42.0: use the Display impl or to\_string()

[Read more](https://doc.rust-lang.org/nightly/core/error/trait.Error.html#method.description)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/error.rs.html#141)[§](#method.cause)

#### fn [cause](https://doc.rust-lang.org/nightly/core/error/trait.Error.html#method.cause)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&dyn [Error](https://doc.rust-lang.org/nightly/core/error/trait.Error.html "trait core::error::Error")>

👎Deprecated since 1.33.0: replaced by Error::source, which can support downcasting

[Source](https://doc.rust-lang.org/nightly/src/core/error.rs.html#204)[§](#method.provide)

#### fn [provide](https://doc.rust-lang.org/nightly/core/error/trait.Error.html#method.provide)<'a>(&'a self, request: &mut [Request](https://doc.rust-lang.org/nightly/core/error/struct.Request.html "struct core::error::Request")<'a>)

🔬This is a nightly-only experimental API. (`error_generic_member_access`)

Provides type-based access to context intended for error reports. [Read more](https://doc.rust-lang.org/nightly/core/error/trait.Error.html#method.provide)

[Source](../../src/tauri/plugin.rs.html#159)[§](#impl-Hash-for-BuilderError)

### impl [Hash](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html "trait core::hash::Hash") for [BuilderError](enum.BuilderError.html.md "enum tauri::plugin::BuilderError")

[Source](../../src/tauri/plugin.rs.html#159)[§](#method.hash)

#### fn [hash](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#tymethod.hash)<\_\_H: [Hasher](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher")>(&self, state: [&mut \_\_H](https://doc.rust-lang.org/nightly/std/primitive.reference.html))

Feeds this value into the given [`Hasher`](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"). [Read more](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#tymethod.hash)

1.3.0 · [Source](https://doc.rust-lang.org/nightly/src/core/hash/mod.rs.html#235-237)[§](#method.hash_slice)

#### fn [hash\_slice](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#method.hash_slice)<H>(data: &[Self], state: [&mut H](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) where H: [Hasher](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Feeds a slice of this type into the given [`Hasher`](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"). [Read more](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#method.hash_slice)

[Source](../../src/tauri/plugin.rs.html#159)[§](#impl-PartialEq-for-BuilderError)

### impl [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq") for [BuilderError](enum.BuilderError.html.md "enum tauri::plugin::BuilderError")

[Source](../../src/tauri/plugin.rs.html#159)[§](#method.eq)

#### fn [eq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#tymethod.eq)(&self, other: &[BuilderError](enum.BuilderError.html.md "enum tauri::plugin::BuilderError")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `self` and `other` values to be equal, and is used by `==`.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#262)[§](#method.ne)

#### fn [ne](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#method.ne)(&self, other: [&Rhs](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `!=`. The default implementation is almost always sufficient,
and should not be overridden without very good reason.

[Source](../../src/tauri/plugin.rs.html#159)[§](#impl-StructuralPartialEq-for-BuilderError)

### impl [StructuralPartialEq](https://doc.rust-lang.org/nightly/core/marker/trait.StructuralPartialEq.html "trait core::marker::StructuralPartialEq") for [BuilderError](enum.BuilderError.html.md "enum tauri::plugin::BuilderError")

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-BuilderError)

### impl [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [BuilderError](enum.BuilderError.html.md "enum tauri::plugin::BuilderError")

[§](#impl-RefUnwindSafe-for-BuilderError)

### impl [RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [BuilderError](enum.BuilderError.html.md "enum tauri::plugin::BuilderError")

[§](#impl-Send-for-BuilderError)

### impl [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [BuilderError](enum.BuilderError.html.md "enum tauri::plugin::BuilderError")

[§](#impl-Sync-for-BuilderError)

### impl [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [BuilderError](enum.BuilderError.html.md "enum tauri::plugin::BuilderError")

[§](#impl-Unpin-for-BuilderError)

### impl [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [BuilderError](enum.BuilderError.html.md "enum tauri::plugin::BuilderError")

[§](#impl-UnwindSafe-for-BuilderError)

### impl [UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [BuilderError](enum.BuilderError.html.md "enum tauri::plugin::BuilderError")

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

[Source](https://doc.rust-lang.org/nightly/src/alloc/string.rs.html#2744)[§](#impl-ToString-for-T)

### impl<T> [ToString](https://doc.rust-lang.org/nightly/alloc/string/trait.ToString.html "trait alloc::string::ToString") for T where T: [Display](https://doc.rust-lang.org/nightly/core/fmt/trait.Display.html "trait core::fmt::Display") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/string.rs.html#2746)[§](#method.to_string)

#### fn [to\_string](https://doc.rust-lang.org/nightly/alloc/string/trait.ToString.html#tymethod.to_string)(&self) -> [String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")

Converts the given value to a `String`. [Read more](https://doc.rust-lang.org/nightly/alloc/string/trait.ToString.html#tymethod.to_string)

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