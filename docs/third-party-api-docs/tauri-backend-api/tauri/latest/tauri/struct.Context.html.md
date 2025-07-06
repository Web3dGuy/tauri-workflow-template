# Struct ContextCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](../src/tauri/lib.rs.html#378-392)

```
pub struct Context<R: Runtime = Wry> {
    pub assets: Box<dyn Assets<R>>,
    /* private fields */
}
```

Expand description

User supplied data required inside of a Tauri application.

## [§](#stability)Stability

This is the output of the [`generate_context`](macro.generate_context.html.md "macro tauri::generate_context") macro, and is not considered part of the stable API.
Unless you know what you are doing and are prepared for this type to have breaking changes, do not create it yourself.

## Fields[§](#fields)

[§](#structfield.assets)`assets: Box<dyn Assets<R>>`

Asset provider.

## Implementations[§](#implementations)

[Source](../src/tauri/lib.rs.html#411-529)[§](#impl-Context%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Context](struct.Context.html.md "struct tauri::Context")<R>

[Source](../src/tauri/lib.rs.html#414-416)

#### pub fn [config](#method.config)(&self) -> &[Config](struct.Config.html.md "struct tauri::Config")

The config the application was prepared with.

[Source](../src/tauri/lib.rs.html#420-422)

#### pub fn [config\_mut](#method.config_mut)(&mut self) -> &mut [Config](struct.Config.html.md "struct tauri::Config")

A mutable reference to the config the application was prepared with.

[Source](../src/tauri/lib.rs.html#426-428)

#### pub fn [assets](#method.assets)(&self) -> &dyn [Assets](trait.Assets.html.md "trait tauri::Assets")<R>

The assets to be served directly by Tauri.

[Source](../src/tauri/lib.rs.html#432-434)

#### pub fn [set\_assets](#method.set_assets)(&mut self, assets: [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<dyn [Assets](trait.Assets.html.md "trait tauri::Assets")<R>>) -> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<dyn [Assets](trait.Assets.html.md "trait tauri::Assets")<R>>

Replace the [`Assets`](trait.Assets.html.md "trait tauri::Assets") implementation and returns the previous value so you can use it as a fallback if desired.

[Source](../src/tauri/lib.rs.html#438-440)

#### pub fn [default\_window\_icon](#method.default_window_icon)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[Image](image\struct.Image.html.md "struct tauri::image::Image")<'\_>>

The default window icon Tauri should use when creating windows.

[Source](../src/tauri/lib.rs.html#444-446)

#### pub fn [set\_default\_window\_icon](#method.set_default_window_icon)(&mut self, icon: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Image](image\struct.Image.html.md "struct tauri::image::Image")<'static>>)

Set the default window icon Tauri should use when creating windows.

[Source](../src/tauri/lib.rs.html#452-454)

#### pub fn [tray\_icon](#method.tray_icon)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[Image](image\struct.Image.html.md "struct tauri::image::Image")<'\_>>

Available on **`desktop` and crate feature `tray-icon`** only.

The icon to use on the tray icon.

[Source](../src/tauri/lib.rs.html#460-462)

#### pub fn [set\_tray\_icon](#method.set_tray_icon)(&mut self, icon: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Image](image\struct.Image.html.md "struct tauri::image::Image")<'static>>)

Available on **`desktop` and crate feature `tray-icon`** only.

Set the icon to use on the tray icon.

[Source](../src/tauri/lib.rs.html#466-468)

#### pub fn [package\_info](#method.package_info)(&self) -> &[PackageInfo](struct.PackageInfo.html.md "struct tauri::PackageInfo")

Package information.

[Source](../src/tauri/lib.rs.html#472-474)

#### pub fn [package\_info\_mut](#method.package_info_mut)(&mut self) -> &mut [PackageInfo](struct.PackageInfo.html.md "struct tauri::PackageInfo")

A mutable reference to the package information.

[Source](../src/tauri/lib.rs.html#478-480)

#### pub fn [pattern](#method.pattern)(&self) -> &[Pattern](enum.Pattern.html.md "enum tauri::Pattern")

The application pattern.

[Source](../src/tauri/lib.rs.html#496-520)

#### pub fn [new](#method.new)( config: [Config](struct.Config.html.md "struct tauri::Config"), assets: [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<dyn [Assets](trait.Assets.html.md "trait tauri::Assets")<R>>, default\_window\_icon: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Image](image\struct.Image.html.md "struct tauri::image::Image")<'static>>, app\_icon: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)>>, package\_info: [PackageInfo](struct.PackageInfo.html.md "struct tauri::PackageInfo"), pattern: [Pattern](enum.Pattern.html.md "enum tauri::Pattern"), runtime\_authority: [RuntimeAuthority](ipc\struct.RuntimeAuthority.html.md "struct tauri::ipc::RuntimeAuthority"), plugin\_global\_api\_scripts: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&'static [&'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)]>, ) -> Self

Create a new [`Context`](struct.Context.html.md "struct tauri::Context") from the minimal required items.

## Trait Implementations[§](#trait-implementations)

[Source](../src/tauri/lib.rs.html#394-409)[§](#impl-Debug-for-Context%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [Context](struct.Context.html.md "struct tauri::Context")<R>

[Source](../src/tauri/lib.rs.html#395-408)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/fmt/type.Result.html "type core::fmt::Result")

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-Context%3CR%3E)

### impl<R = [Wry](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.Wry.html "struct tauri_runtime_wry::Wry")<[EventLoopMessage](enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>> ![Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [Context](struct.Context.html.md "struct tauri::Context")<R>

[§](#impl-RefUnwindSafe-for-Context%3CR%3E)

### impl<R = [Wry](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.Wry.html "struct tauri_runtime_wry::Wry")<[EventLoopMessage](enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>> ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [Context](struct.Context.html.md "struct tauri::Context")<R>

[§](#impl-Send-for-Context%3CR%3E)

### impl<R> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [Context](struct.Context.html.md "struct tauri::Context")<R>

[§](#impl-Sync-for-Context%3CR%3E)

### impl<R> [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [Context](struct.Context.html.md "struct tauri::Context")<R>

[§](#impl-Unpin-for-Context%3CR%3E)

### impl<R> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [Context](struct.Context.html.md "struct tauri::Context")<R>

[§](#impl-UnwindSafe-for-Context%3CR%3E)

### impl<R = [Wry](https://docs.rs/tauri-runtime-wry/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime_wry/struct.Wry.html "struct tauri_runtime_wry::Wry")<[EventLoopMessage](enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>> ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [Context](struct.Context.html.md "struct tauri::Context")<R>

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