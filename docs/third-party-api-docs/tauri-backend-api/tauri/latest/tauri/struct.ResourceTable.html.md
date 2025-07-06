# Struct ResourceTableCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](../src/tauri/resources/mod.rs.html#75-77)

```
pub struct ResourceTable { /* private fields */ }
```

Expand description

Map-like data structure storing Tauri’s resources (equivalent to file
descriptors).

Provides basic methods for element access. A resource can be of any type.
Different types of resources can be stored in the same map, and provided
with a name for description.

Each resource is identified through a *resource ID (rid)*, which acts as
the key in the map.

## Implementations[§](#implementations)

[Source](../src/tauri/resources/mod.rs.html#79-222)[§](#impl-ResourceTable)

### impl [ResourceTable](struct.ResourceTable.html.md "struct tauri::ResourceTable")

[Source](../src/tauri/resources/mod.rs.html#92-94)

#### pub fn [add](#method.add)<T: [Resource](trait.Resource.html.md "trait tauri::Resource")>(&mut self, resource: T) -> [ResourceId](type.ResourceId.html.md "type tauri::ResourceId")

Inserts resource into the resource table, which takes ownership of it.

The resource type is erased at runtime and must be statically known
when retrieving it through `get()`.

Returns a unique resource ID, which acts as a key for this resource.

[Source](../src/tauri/resources/mod.rs.html#102-105)

#### pub fn [add\_arc](#method.add_arc)<T: [Resource](trait.Resource.html.md "trait tauri::Resource")>(&mut self, resource: [Arc](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc")<T>) -> [ResourceId](type.ResourceId.html.md "type tauri::ResourceId")

Inserts a `Arc`-wrapped resource into the resource table.

The resource type is erased at runtime and must be statically known
when retrieving it through `get()`.

Returns a unique resource ID, which acts as a key for this resource.

[Source](../src/tauri/resources/mod.rs.html#113-122)

#### pub fn [add\_arc\_dyn](#method.add_arc_dyn)(&mut self, resource: [Arc](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc")<dyn [Resource](trait.Resource.html.md "trait tauri::Resource")>) -> [ResourceId](type.ResourceId.html.md "type tauri::ResourceId")

Inserts a `Arc`-wrapped resource into the resource table.

The resource type is erased at runtime and must be statically known
when retrieving it through `get()`.

Returns a unique resource ID, which acts as a key for this resource.

[Source](../src/tauri/resources/mod.rs.html#125-127)

#### pub fn [has](#method.has)(&self, rid: [ResourceId](type.ResourceId.html.md "type tauri::ResourceId")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Returns true if any resource with the given `rid` exists.

[Source](../src/tauri/resources/mod.rs.html#132-139)

#### pub fn [get](#method.get)<T: [Resource](trait.Resource.html.md "trait tauri::Resource")>(&self, rid: [ResourceId](type.ResourceId.html.md "type tauri::ResourceId")) -> [Result](type.Result.html.md "type tauri::Result")<[Arc](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc")<T>>

Returns a reference counted pointer to the resource of type `T` with the
given `rid`. If `rid` is not present or has a type different than `T`,
this function returns [`Error::BadResourceId`](enum.Error.html_variant.BadResourceId.md "variant tauri::Error::BadResourceId").

[Source](../src/tauri/resources/mod.rs.html#143-149)

#### pub fn [get\_any](#method.get_any)(&self, rid: [ResourceId](type.ResourceId.html.md "type tauri::ResourceId")) -> [Result](type.Result.html.md "type tauri::Result")<[Arc](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc")<dyn [Resource](trait.Resource.html.md "trait tauri::Resource")>>

Returns a reference counted pointer to the resource of the given `rid`.
If `rid` is not present, this function returns [`Error::BadResourceId`].

[Source](../src/tauri/resources/mod.rs.html#154-159)

#### pub fn [replace](#method.replace)<T: [Resource](trait.Resource.html.md "trait tauri::Resource")>(&mut self, rid: [ResourceId](type.ResourceId.html.md "type tauri::ResourceId"), resource: T)

Replaces a resource with a new resource.

Panics if the resource does not exist.

[Source](../src/tauri/resources/mod.rs.html#171-175)

#### pub fn [take](#method.take)<T: [Resource](trait.Resource.html.md "trait tauri::Resource")>(&mut self, rid: [ResourceId](type.ResourceId.html.md "type tauri::ResourceId")) -> [Result](type.Result.html.md "type tauri::Result")<[Arc](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc")<T>>

Removes a resource of type `T` from the resource table and returns it.
If a resource with the given `rid` exists but its type does not match `T`,
it is not removed from the resource table. Note that the resource’s
`close()` method is *not* called.

Also note that there might be a case where
the returned `Arc<T>` is referenced by other variables. That is, we cannot
assume that `Arc::strong_count(&returned_arc)` is always equal to 1 on success.
In particular, be really careful when you want to extract the inner value of
type `T` from `Arc<T>`.

[Source](../src/tauri/resources/mod.rs.html#185-190)

#### pub fn [take\_any](#method.take_any)(&mut self, rid: [ResourceId](type.ResourceId.html.md "type tauri::ResourceId")) -> [Result](type.Result.html.md "type tauri::Result")<[Arc](https://doc.rust-lang.org/nightly/alloc/sync/struct.Arc.html "struct alloc::sync::Arc")<dyn [Resource](trait.Resource.html.md "trait tauri::Resource")>>

Removes a resource from the resource table and returns it. Note that the
resource’s `close()` method is *not* called.

Also note that there might be a
case where the returned `Arc<T>` is referenced by other variables. That is,
we cannot assume that `Arc::strong_count(&returned_arc)` is always equal to 1
on success. In particular, be really careful when you want to extract the
inner value of type `T` from `Arc<T>`.

[Source](../src/tauri/resources/mod.rs.html#196-201)

#### pub fn [names](#method.names)(&self) -> impl [Iterator](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator")<Item = ([ResourceId](type.ResourceId.html.md "type tauri::ResourceId"), [Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'\_, [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>)>

Returns an iterator that yields a `(id, name)` pair for every resource
that’s currently in the resource table. This can be used for debugging
purposes. Note that the order in
which items appear is not specified.

[Source](../src/tauri/resources/mod.rs.html#209-215)

#### pub fn [close](#method.close)(&mut self, rid: [ResourceId](type.ResourceId.html.md "type tauri::ResourceId")) -> [Result](type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Removes the resource with the given `rid` from the resource table. If the
only reference to this resource existed in the resource table, this will
cause the resource to be dropped. However, since resources are reference
counted, therefore pending ops are not automatically cancelled. A resource
may implement the `close()` method to perform clean-ups such as canceling
ops.

## Trait Implementations[§](#trait-implementations)

[Source](../src/tauri/resources/mod.rs.html#74)[§](#impl-Default-for-ResourceTable)

### impl [Default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html "trait core::default::Default") for [ResourceTable](struct.ResourceTable.html.md "struct tauri::ResourceTable")

[Source](../src/tauri/resources/mod.rs.html#74)[§](#method.default)

#### fn [default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html#tymethod.default)() -> [ResourceTable](struct.ResourceTable.html.md "struct tauri::ResourceTable")

Returns the “default value” for a type. [Read more](https://doc.rust-lang.org/nightly/core/default/trait.Default.html#tymethod.default)

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-ResourceTable)

### impl [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [ResourceTable](struct.ResourceTable.html.md "struct tauri::ResourceTable")

[§](#impl-RefUnwindSafe-for-ResourceTable)

### impl ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [ResourceTable](struct.ResourceTable.html.md "struct tauri::ResourceTable")

[§](#impl-Send-for-ResourceTable)

### impl [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [ResourceTable](struct.ResourceTable.html.md "struct tauri::ResourceTable")

[§](#impl-Sync-for-ResourceTable)

### impl [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [ResourceTable](struct.ResourceTable.html.md "struct tauri::ResourceTable")

[§](#impl-Unpin-for-ResourceTable)

### impl [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [ResourceTable](struct.ResourceTable.html.md "struct tauri::ResourceTable")

[§](#impl-UnwindSafe-for-ResourceTable)

### impl ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [ResourceTable](struct.ResourceTable.html.md "struct tauri::ResourceTable")

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