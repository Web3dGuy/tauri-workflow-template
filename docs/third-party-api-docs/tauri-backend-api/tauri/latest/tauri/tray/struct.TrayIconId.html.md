# Struct TrayIconIdCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#6)

```
pub struct TrayIconId(pub String);
```

Available on **`desktop` and crate feature `tray-icon`** only.

Expand description

An unique id that is associated with a tray icon.

## Tuple Fields[§](#fields)

[§](#structfield.0)`0: String`

## Implementations[§](#implementations)

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#8)[§](#impl-TrayIconId)

### impl [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#10)

#### pub fn [new](#method.new)<S>(id: S) -> [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId") where S: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>,

Create a new tray icon id.

## Trait Implementations[§](#trait-implementations)

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#15)[§](#impl-AsRef%3Cstr%3E-for-TrayIconId)

### impl [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)> for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#16)[§](#method.as_ref)

#### fn [as\_ref](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html#tymethod.as_ref)(&self) -> &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

Converts this type into a shared reference of the (usually inferred) input type.

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#4)[§](#impl-Clone-for-TrayIconId)

### impl [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#4)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

Returns a copy of the value. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#174)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &Self)

Performs copy-assignment from `source`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#4)[§](#impl-Debug-for-TrayIconId)

### impl [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#4)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")>

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#4)[§](#impl-Default-for-TrayIconId)

### impl [Default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html "trait core::default::Default") for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#4)[§](#method.default)

#### fn [default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html#tymethod.default)() -> [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

Returns the “default value” for a type. [Read more](https://doc.rust-lang.org/nightly/core/default/trait.Default.html#tymethod.default)

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#5)[§](#impl-Deserialize%3C'de%3E-for-TrayIconId)

### impl<'de> [Deserialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html "trait serde::de::Deserialize")<'de> for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#5)[§](#method.deserialize)

#### fn [deserialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html#tymethod.deserialize)<\_\_D>( \_\_deserializer: \_\_D, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId"), <\_\_D as [Deserializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html "trait serde::de::Deserializer")<'de>>::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")> where \_\_D: [Deserializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html "trait serde::de::Deserializer")<'de>,

Deserialize this value from the given Serde deserializer. [Read more](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html#tymethod.deserialize)

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#21)[§](#impl-From%3CT%3E-for-TrayIconId)

### impl<T> [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<T> for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId") where T: [ToString](https://doc.rust-lang.org/nightly/alloc/string/trait.ToString.html "trait alloc::string::ToString"),

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#22)[§](#method.from)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(value: T) -> [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

Converts to this type from the input type.

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#27)[§](#impl-FromStr-for-TrayIconId)

### impl [FromStr](https://doc.rust-lang.org/nightly/core/str/traits/trait.FromStr.html "trait core::str::traits::FromStr") for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#28)[§](#associatedtype.Err)

#### type [Err](https://doc.rust-lang.org/nightly/core/str/traits/trait.FromStr.html#associatedtype.Err) = [Infallible](https://doc.rust-lang.org/nightly/core/convert/enum.Infallible.html "enum core::convert::Infallible")

The associated error which can be returned from parsing.

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#30)[§](#method.from_str)

#### fn [from\_str](https://doc.rust-lang.org/nightly/core/str/traits/trait.FromStr.html#tymethod.from_str)(s: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId"), <[TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId") as [FromStr](https://doc.rust-lang.org/nightly/core/str/traits/trait.FromStr.html "trait core::str::traits::FromStr")>::[Err](https://doc.rust-lang.org/nightly/core/str/traits/trait.FromStr.html#associatedtype.Err "type core::str::traits::FromStr::Err")>

Parses a string `s` to return a value of this type. [Read more](https://doc.rust-lang.org/nightly/core/str/traits/trait.FromStr.html#tymethod.from_str)

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#4)[§](#impl-Hash-for-TrayIconId)

### impl [Hash](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html "trait core::hash::Hash") for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#4)[§](#method.hash)

#### fn [hash](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#tymethod.hash)<\_\_H>(&self, state: [&mut \_\_H](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) where \_\_H: [Hasher](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"),

Feeds this value into the given [`Hasher`](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"). [Read more](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#tymethod.hash)

1.3.0 · [Source](https://doc.rust-lang.org/nightly/src/core/hash/mod.rs.html#235-237)[§](#method.hash_slice)

#### fn [hash\_slice](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#method.hash_slice)<H>(data: &[Self], state: [&mut H](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) where H: [Hasher](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Feeds a slice of this type into the given [`Hasher`](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"). [Read more](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#method.hash_slice)

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#4)[§](#impl-Ord-for-TrayIconId)

### impl [Ord](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html "trait core::cmp::Ord") for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#4)[§](#method.cmp)

#### fn [cmp](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#tymethod.cmp)(&self, other: &[TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")) -> [Ordering](https://doc.rust-lang.org/nightly/core/cmp/enum.Ordering.html "enum core::cmp::Ordering")

This method returns an [`Ordering`](https://doc.rust-lang.org/nightly/core/cmp/enum.Ordering.html "enum core::cmp::Ordering") between `self` and `other`. [Read more](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#tymethod.cmp)

1.21.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#1009-1011)[§](#method.max)

#### fn [max](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#method.max)(self, other: Self) -> Self where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Compares and returns the maximum of two values. [Read more](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#method.max)

1.21.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#1048-1050)[§](#method.min)

#### fn [min](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#method.min)(self, other: Self) -> Self where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Compares and returns the minimum of two values. [Read more](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#method.min)

1.50.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#1074-1076)[§](#method.clamp)

#### fn [clamp](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#method.clamp)(self, min: Self, max: Self) -> Self where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Restrict a value to a certain interval. [Read more](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#method.clamp)

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#59)[§](#impl-PartialEq%3C%26String%3E-for-TrayIconId)

### impl [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq")<&[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")> for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#60)[§](#method.eq-5)

#### fn [eq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#tymethod.eq)(&self, other: &&[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `self` and `other` values to be equal, and is used by `==`.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#262)[§](#method.ne-5)

#### fn [ne](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#method.ne)(&self, other: [&Rhs](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `!=`. The default implementation is almost always sufficient,
and should not be overridden without very good reason.

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#65)[§](#impl-PartialEq%3C%26TrayIconId%3E-for-TrayIconId)

### impl [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq")<&[TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")> for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#66)[§](#method.eq-6)

#### fn [eq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#tymethod.eq)(&self, other: &&[TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `self` and `other` values to be equal, and is used by `==`.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#262)[§](#method.ne-6)

#### fn [ne](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#method.ne)(&self, other: [&Rhs](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `!=`. The default implementation is almost always sufficient,
and should not be overridden without very good reason.

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#41)[§](#impl-PartialEq%3C%26str%3E-for-%26TrayIconId)

### impl [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)> for &[TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#42)[§](#method.eq-2)

#### fn [eq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#tymethod.eq)(&self, other: &&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `self` and `other` values to be equal, and is used by `==`.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#262)[§](#method.ne-2)

#### fn [ne](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#method.ne)(&self, other: [&Rhs](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `!=`. The default implementation is almost always sufficient,
and should not be overridden without very good reason.

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#35)[§](#impl-PartialEq%3C%26str%3E-for-TrayIconId)

### impl [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)> for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#36)[§](#method.eq-1)

#### fn [eq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#tymethod.eq)(&self, other: &&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `self` and `other` values to be equal, and is used by `==`.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#262)[§](#method.ne-1)

#### fn [ne](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#method.ne)(&self, other: [&Rhs](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `!=`. The default implementation is almost always sufficient,
and should not be overridden without very good reason.

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#53)[§](#impl-PartialEq%3CString%3E-for-%26TrayIconId)

### impl [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")> for &[TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#54)[§](#method.eq-4)

#### fn [eq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#tymethod.eq)(&self, other: &[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `self` and `other` values to be equal, and is used by `==`.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#262)[§](#method.ne-4)

#### fn [ne](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#method.ne)(&self, other: [&Rhs](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `!=`. The default implementation is almost always sufficient,
and should not be overridden without very good reason.

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#47)[§](#impl-PartialEq%3CString%3E-for-TrayIconId)

### impl [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")> for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#48)[§](#method.eq-3)

#### fn [eq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#tymethod.eq)(&self, other: &[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `self` and `other` values to be equal, and is used by `==`.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#262)[§](#method.ne-3)

#### fn [ne](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#method.ne)(&self, other: [&Rhs](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `!=`. The default implementation is almost always sufficient,
and should not be overridden without very good reason.

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#4)[§](#impl-PartialEq-for-TrayIconId)

### impl [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq") for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#4)[§](#method.eq)

#### fn [eq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#tymethod.eq)(&self, other: &[TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `self` and `other` values to be equal, and is used by `==`.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#262)[§](#method.ne)

#### fn [ne](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#method.ne)(&self, other: [&Rhs](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `!=`. The default implementation is almost always sufficient,
and should not be overridden without very good reason.

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#4)[§](#impl-PartialOrd-for-TrayIconId)

### impl [PartialOrd](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html "trait core::cmp::PartialOrd") for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#4)[§](#method.partial_cmp)

#### fn [partial\_cmp](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#tymethod.partial_cmp)(&self, other: &[TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Ordering](https://doc.rust-lang.org/nightly/core/cmp/enum.Ordering.html "enum core::cmp::Ordering")>

This method returns an ordering between `self` and `other` values if one exists. [Read more](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#tymethod.partial_cmp)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#1382)[§](#method.lt)

#### fn [lt](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#method.lt)(&self, other: [&Rhs](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests less than (for `self` and `other`) and is used by the `<` operator. [Read more](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#method.lt)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#1400)[§](#method.le)

#### fn [le](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#method.le)(&self, other: [&Rhs](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests less than or equal to (for `self` and `other`) and is used by the
`<=` operator. [Read more](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#method.le)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#1418)[§](#method.gt)

#### fn [gt](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#method.gt)(&self, other: [&Rhs](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests greater than (for `self` and `other`) and is used by the `>`
operator. [Read more](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#method.gt)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#1436)[§](#method.ge)

#### fn [ge](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#method.ge)(&self, other: [&Rhs](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests greater than or equal to (for `self` and `other`) and is used by
the `>=` operator. [Read more](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#method.ge)

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#5)[§](#impl-Serialize-for-TrayIconId)

### impl [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize") for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#5)[§](#method.serialize)

#### fn [serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html#tymethod.serialize)<\_\_S>( &self, \_\_serializer: \_\_S, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<<\_\_S as [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer")>::[Ok](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html#associatedtype.Ok "type serde::ser::Serializer::Ok"), <\_\_S as [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer")>::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html#associatedtype.Error "type serde::ser::Serializer::Error")> where \_\_S: [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer"),

Serialize this value into the given Serde serializer. [Read more](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html#tymethod.serialize)

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#4)[§](#impl-Eq-for-TrayIconId)

### impl [Eq](https://doc.rust-lang.org/nightly/core/cmp/trait.Eq.html "trait core::cmp::Eq") for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[Source](https://docs.rs/tray-icon/0.20.0/x86_64-unknown-linux-gnu/src/tray_icon/tray_icon_id.rs.html#4)[§](#impl-StructuralPartialEq-for-TrayIconId)

### impl [StructuralPartialEq](https://doc.rust-lang.org/nightly/core/marker/trait.StructuralPartialEq.html "trait core::marker::StructuralPartialEq") for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-TrayIconId)

### impl [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[§](#impl-RefUnwindSafe-for-TrayIconId)

### impl [RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[§](#impl-Send-for-TrayIconId)

### impl [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[§](#impl-Sync-for-TrayIconId)

### impl [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[§](#impl-Unpin-for-TrayIconId)

### impl [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

[§](#impl-UnwindSafe-for-TrayIconId)

### impl [UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [TrayIconId](struct.TrayIconId.html.md "struct tauri::tray::TrayIconId")

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

[Source](../../src/tauri/ipc/command.rs.html#62-70)[§](#impl-CommandArg%3C'de,+R%3E-for-D)

### impl<'de, D, R> [CommandArg](..\ipc\trait.CommandArg.html.md "trait tauri::ipc::CommandArg")<'de, R> for D where D: [Deserialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html "trait serde::de::Deserialize")<'de>, R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"),

[Source](../../src/tauri/ipc/command.rs.html#63-69)[§](#method.from_command)

#### fn [from\_command](..\ipc\trait.CommandArg.html_tymethod.from_command.md)(command: [CommandItem](..\ipc\struct.CommandItem.html.md "struct tauri::ipc::CommandItem")<'de, R>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<D, [InvokeError](..\ipc\struct.InvokeError.html.md "struct tauri::ipc::InvokeError")>

Derives an instance of `Self` from the [`CommandItem`](..\ipc\struct.CommandItem.html.md "struct tauri::ipc::CommandItem"). [Read more](..\ipc\trait.CommandArg.html_tymethod.from_command.md)

[Source](https://docs.rs/equivalent/1.0.2/x86_64-unknown-linux-gnu/src/equivalent/lib.rs.html#104-107)[§](#impl-Comparable%3CK%3E-for-Q)

### impl<Q, K> [Comparable](https://docs.rs/equivalent/1.0.2/x86_64-unknown-linux-gnu/equivalent/trait.Comparable.html "trait equivalent::Comparable")<K> for Q where Q: [Ord](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html "trait core::cmp::Ord") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), K: [Borrow](https://doc.rust-lang.org/nightly/core/borrow/trait.Borrow.html "trait core::borrow::Borrow")<Q> + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/equivalent/1.0.2/x86_64-unknown-linux-gnu/src/equivalent/lib.rs.html#110)[§](#method.compare)

#### fn [compare](https://docs.rs/equivalent/1.0.2/x86_64-unknown-linux-gnu/equivalent/trait.Comparable.html#tymethod.compare)(&self, key: [&K](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [Ordering](https://doc.rust-lang.org/nightly/core/cmp/enum.Ordering.html "enum core::cmp::Ordering")

Compare self to `key` and return their ordering.

[Source](https://docs.rs/hashbrown/0.15.2/x86_64-unknown-linux-gnu/src/hashbrown/lib.rs.html#159-162)[§](#impl-Equivalent%3CK%3E-for-Q)

### impl<Q, K> [Equivalent](https://docs.rs/hashbrown/0.15.2/x86_64-unknown-linux-gnu/hashbrown/trait.Equivalent.html "trait hashbrown::Equivalent")<K> for Q where Q: [Eq](https://doc.rust-lang.org/nightly/core/cmp/trait.Eq.html "trait core::cmp::Eq") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), K: [Borrow](https://doc.rust-lang.org/nightly/core/borrow/trait.Borrow.html "trait core::borrow::Borrow")<Q> + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/hashbrown/0.15.2/x86_64-unknown-linux-gnu/src/hashbrown/lib.rs.html#164)[§](#method.equivalent)

#### fn [equivalent](https://docs.rs/hashbrown/0.15.2/x86_64-unknown-linux-gnu/hashbrown/trait.Equivalent.html#tymethod.equivalent)(&self, key: [&K](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Checks if this value is equivalent to the given key. [Read more](https://docs.rs/hashbrown/0.15.2/x86_64-unknown-linux-gnu/hashbrown/trait.Equivalent.html#tymethod.equivalent)

[Source](https://docs.rs/equivalent/1.0.2/x86_64-unknown-linux-gnu/src/equivalent/lib.rs.html#82-85)[§](#impl-Equivalent%3CK%3E-for-Q-1)

### impl<Q, K> [Equivalent](https://docs.rs/equivalent/1.0.2/x86_64-unknown-linux-gnu/equivalent/trait.Equivalent.html "trait equivalent::Equivalent")<K> for Q where Q: [Eq](https://doc.rust-lang.org/nightly/core/cmp/trait.Eq.html "trait core::cmp::Eq") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), K: [Borrow](https://doc.rust-lang.org/nightly/core/borrow/trait.Borrow.html "trait core::borrow::Borrow")<Q> + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/equivalent/1.0.2/x86_64-unknown-linux-gnu/src/equivalent/lib.rs.html#88)[§](#method.equivalent-1)

#### fn [equivalent](https://docs.rs/equivalent/1.0.2/x86_64-unknown-linux-gnu/equivalent/trait.Equivalent.html#tymethod.equivalent)(&self, key: [&K](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Compare self to `key` and return `true` if they are equal.

[Source](https://docs.rs/indexmap/2.8.0/x86_64-unknown-linux-gnu/src/indexmap/equivalent.rs.html#18-21)[§](#impl-Equivalent%3CK%3E-for-Q-2)

### impl<Q, K> [Equivalent](https://docs.rs/indexmap/2.8.0/x86_64-unknown-linux-gnu/indexmap/equivalent/trait.Equivalent.html "trait indexmap::equivalent::Equivalent")<K> for Q where Q: [Eq](https://doc.rust-lang.org/nightly/core/cmp/trait.Eq.html "trait core::cmp::Eq") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), K: [Borrow](https://doc.rust-lang.org/nightly/core/borrow/trait.Borrow.html "trait core::borrow::Borrow")<Q> + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/indexmap/2.8.0/x86_64-unknown-linux-gnu/src/indexmap/equivalent.rs.html#24)[§](#method.equivalent-2)

#### fn [equivalent](https://docs.rs/indexmap/2.8.0/x86_64-unknown-linux-gnu/indexmap/equivalent/trait.Equivalent.html#tymethod.equivalent)(&self, key: [&K](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Compare self to `key` and return `true` if they are equal.

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

[Source](../../src/tauri/ipc/mod.rs.html#176-182)[§](#impl-IpcResponse-for-T)

### impl<T> [IpcResponse](..\ipc\trait.IpcResponse.html.md "trait tauri::ipc::IpcResponse") for T where T: [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize"),

[Source](../../src/tauri/ipc/mod.rs.html#177-181)[§](#method.body)

#### fn [body](..\ipc\trait.IpcResponse.html_tymethod.body.md)(self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[InvokeResponseBody](..\ipc\enum.InvokeResponseBody.html.md "enum tauri::ipc::InvokeResponseBody"), [Error](..\enum.Error.html.md "enum tauri::Error")>

Resolve the IPC response body.

[Source](../../src/tauri/ipc/authority.rs.html#77-81)[§](#impl-RuntimeCapability-for-T)

### impl<T> [RuntimeCapability](..\ipc\trait.RuntimeCapability.html.md "trait tauri::ipc::RuntimeCapability") for T where T: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>,

[Source](../../src/tauri/ipc/authority.rs.html#78-80)[§](#method.build)

#### fn [build](..\ipc\trait.RuntimeCapability.html_tymethod.build.md)(self) -> [CapabilityFile](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/acl/capability/enum.CapabilityFile.html "enum tauri_utils::acl::capability::CapabilityFile")

Creates the capability file.

[Source](../../src/tauri/ipc/authority.rs.html#799-804)[§](#impl-ScopeObject-for-T)

### impl<T> [ScopeObject](..\ipc\trait.ScopeObject.html.md "trait tauri::ipc::ScopeObject") for T where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") + [DeserializeOwned](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.DeserializeOwned.html "trait serde::de::DeserializeOwned") + 'static,

[Source](../../src/tauri/ipc/authority.rs.html#800)[§](#associatedtype.Error)

#### type [Error](..\ipc\trait.ScopeObject.html_associatedtype.Error.md) = [Error](https://docs.rs/serde_json/1.0.140/x86_64-unknown-linux-gnu/serde_json/error/struct.Error.html "struct serde_json::error::Error")

The error type.

[Source](../../src/tauri/ipc/authority.rs.html#801-803)[§](#method.deserialize-1)

#### fn [deserialize](..\ipc\trait.ScopeObject.html_tymethod.deserialize.md)<R>( \_app: &[AppHandle](..\struct.AppHandle.html.md "struct tauri::AppHandle")<R>, raw: [Value](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/acl/value/enum.Value.html "enum tauri_utils::acl::value::Value"), ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, <T as [ScopeObject](..\ipc\trait.ScopeObject.html.md "trait tauri::ipc::ScopeObject")>::[Error](..\ipc\trait.ScopeObject.html_associatedtype.Error.md "type tauri::ipc::ScopeObject::Error")> where R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime"),

Deserialize the raw scope value.

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#224-226)[§](#impl-Serialize-for-T)

### impl<T> [Serialize](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serialize.html "trait erased_serde::ser::Serialize") for T where T: [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#228)[§](#method.erased_serialize)

#### fn [erased\_serialize](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serialize.html#tymethod.erased_serialize)(&self, serializer: &mut dyn [Serializer](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html "trait erased_serde::ser::Serializer")) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#236)[§](#method.do_erased_serialize)

#### fn [do\_erased\_serialize](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serialize.html#tymethod.do_erased_serialize)( &self, serializer: &mut dyn [Serializer](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html "trait erased_serde::ser::Serializer"), ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), ErrorImpl>

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

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#810)[§](#associatedtype.Error-2)

#### type [Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error) = [Infallible](https://doc.rust-lang.org/nightly/core/convert/enum.Infallible.html "enum core::convert::Infallible")

The type returned in the event of a conversion error.

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#813)[§](#method.try_from)

#### fn [try\_from](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#tymethod.try_from)(value: U) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, <T as [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<U>>::[Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error "type core::convert::TryFrom::Error")>

Performs the conversion.

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#791-793)[§](#impl-TryInto%3CU%3E-for-T)

### impl<T, U> [TryInto](https://doc.rust-lang.org/nightly/core/convert/trait.TryInto.html "trait core::convert::TryInto")<U> for T where U: [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<T>,

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#795)[§](#associatedtype.Error-1)

#### type [Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryInto.html#associatedtype.Error) = <U as [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<T>>::[Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error "type core::convert::TryFrom::Error")

The type returned in the event of a conversion error.

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#798)[§](#method.try_into)

#### fn [try\_into](https://doc.rust-lang.org/nightly/core/convert/trait.TryInto.html#tymethod.try_into)(self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<U, <U as [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<T>>::[Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error "type core::convert::TryFrom::Error")>

Performs the conversion.

[Source](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/src/serde/de/mod.rs.html#614)[§](#impl-DeserializeOwned-for-T)

### impl<T> [DeserializeOwned](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.DeserializeOwned.html "trait serde::de::DeserializeOwned") for T where T: for<'de> [Deserialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html "trait serde::de::Deserialize")<'de>,

[Source](https://docs.rs/yoke/0.7.5/x86_64-unknown-linux-gnu/src/yoke/erased.rs.html#22)[§](#impl-ErasedDestructor-for-T)

### impl<T> [ErasedDestructor](https://docs.rs/yoke/0.7.5/x86_64-unknown-linux-gnu/yoke/erased/trait.ErasedDestructor.html "trait yoke::erased::ErasedDestructor") for T where T: 'static,

[Source](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/src/icu_provider/any.rs.html#32)[§](#impl-MaybeSendSync-for-T)

### impl<T> [MaybeSendSync](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/any/trait.MaybeSendSync.html "trait icu_provider::any::MaybeSendSync") for T

[Source](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/src/tauri_runtime/lib.rs.html#210)[§](#impl-UserEvent-for-T)

### impl<T> [UserEvent](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.UserEvent.html "trait tauri_runtime::UserEvent") for T where T: [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") + [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + 'static,