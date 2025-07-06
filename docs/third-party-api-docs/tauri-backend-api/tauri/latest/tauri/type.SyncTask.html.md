# Type Alias SyncTaskCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](../src/tauri/lib.rs.html#189)

```
pub type SyncTask = Box<dyn FnOnce() + Send>;
```

Expand description

A task to run on the main thread.

## Aliased Type[§](#aliased-type)

```
struct SyncTask(/* private fields */);
```

## Implementations

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#244)[§](#impl-Box%3CT%3E)

### impl<T> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#260)

#### pub fn [new](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.new)(x: T) -> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>

Allocates memory on the heap and then places `x` into it.

This doesn’t actually allocate if `T` is zero-sized.

##### [§](#examples)Examples

```
let five = Box::new(5);
```

1.82.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#280)

#### pub fn [new\_uninit](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.new_uninit)() -> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<[MaybeUninit](https://doc.rust-lang.org/nightly/core/mem/maybe_uninit/union.MaybeUninit.html "union core::mem::maybe_uninit::MaybeUninit")<T>>

Constructs a new box with uninitialized contents.

##### [§](#examples-1)Examples

```
let mut five = Box::<u32>::new_uninit();
// Deferred initialization:
five.write(5);
let five = unsafe { five.assume_init() };

assert_eq!(*five, 5)
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#306)

#### pub fn [new\_zeroed](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.new_zeroed)() -> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<[MaybeUninit](https://doc.rust-lang.org/nightly/core/mem/maybe_uninit/union.MaybeUninit.html "union core::mem::maybe_uninit::MaybeUninit")<T>>

🔬This is a nightly-only experimental API. (`new_zeroed_alloc`)

Constructs a new `Box` with uninitialized contents, with the memory
being filled with `0` bytes.

See [`MaybeUninit::zeroed`](https://doc.rust-lang.org/nightly/core/mem/maybe_uninit/union.MaybeUninit.html#method.zeroed "associated function core::mem::maybe_uninit::MaybeUninit::zeroed") for examples of correct and incorrect usage
of this method.

##### [§](#examples-2)Examples

```
#![feature(new_zeroed_alloc)]

let zero = Box::<u32>::new_zeroed();
let zero = unsafe { zero.assume_init() };

assert_eq!(*zero, 0)
```

1.33.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#321)

#### pub fn [pin](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.pin)(x: T) -> [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>>

Constructs a new `Pin<Box<T>>`. If `T` does not implement [`Unpin`](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin"), then
`x` will be pinned in memory and unable to be moved.

Constructing and pinning of the `Box` can also be done in two steps: `Box::pin(x)`
does the same as `Box::into_pin(Box::new(x))`. Consider using
[`into_pin`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.into_pin "associated function alloc::boxed::Box::into_pin") if you already have a `Box<T>`, or if you want to
construct a (pinned) `Box` in a different way than with [`Box::new`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.new "associated function alloc::boxed::Box::new").

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#340)

#### pub fn [try\_new](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.try_new)(x: T) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>, [AllocError](https://doc.rust-lang.org/nightly/core/alloc/struct.AllocError.html "struct core::alloc::AllocError")>

🔬This is a nightly-only experimental API. (`allocator_api`)

Allocates memory on the heap then places `x` into it,
returning an error if the allocation fails

This doesn’t actually allocate if `T` is zero-sized.

##### [§](#examples-3)Examples

```
#![feature(allocator_api)]

let five = Box::try_new(5)?;
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#363)

#### pub fn [try\_new\_uninit](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.try_new_uninit)() -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<[MaybeUninit](https://doc.rust-lang.org/nightly/core/mem/maybe_uninit/union.MaybeUninit.html "union core::mem::maybe_uninit::MaybeUninit")<T>>, [AllocError](https://doc.rust-lang.org/nightly/core/alloc/struct.AllocError.html "struct core::alloc::AllocError")>

🔬This is a nightly-only experimental API. (`allocator_api`)

Constructs a new box with uninitialized contents on the heap,
returning an error if the allocation fails

##### [§](#examples-4)Examples

```
#![feature(allocator_api)]

let mut five = Box::<u32>::try_new_uninit()?;
// Deferred initialization:
five.write(5);
let five = unsafe { five.assume_init() };

assert_eq!(*five, 5);
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#389)

#### pub fn [try\_new\_zeroed](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.try_new_zeroed)() -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<[MaybeUninit](https://doc.rust-lang.org/nightly/core/mem/maybe_uninit/union.MaybeUninit.html "union core::mem::maybe_uninit::MaybeUninit")<T>>, [AllocError](https://doc.rust-lang.org/nightly/core/alloc/struct.AllocError.html "struct core::alloc::AllocError")>

🔬This is a nightly-only experimental API. (`allocator_api`)

Constructs a new `Box` with uninitialized contents, with the memory
being filled with `0` bytes on the heap

See [`MaybeUninit::zeroed`](https://doc.rust-lang.org/nightly/core/mem/maybe_uninit/union.MaybeUninit.html#method.zeroed "associated function core::mem::maybe_uninit::MaybeUninit::zeroed") for examples of correct and incorrect usage
of this method.

##### [§](#examples-5)Examples

```
#![feature(allocator_api)]

let zero = Box::<u32>::try_new_zeroed()?;
let zero = unsafe { zero.assume_init() };

assert_eq!(*zero, 0);
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#998)[§](#impl-Box%3CT%3E-1)

### impl<T> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

1.4.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1044)

#### pub unsafe fn [from\_raw](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.from_raw)(raw: [\*mut T](https://doc.rust-lang.org/nightly/std/primitive.pointer.html)) -> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>

Constructs a box from a raw pointer.

After calling this function, the raw pointer is owned by the
resulting `Box`. Specifically, the `Box` destructor will call
the destructor of `T` and free the allocated memory. For this
to be safe, the memory must have been allocated in accordance
with the [memory layout](https://doc.rust-lang.org/nightly/alloc/boxed/index.html#memory-layout "mod alloc::boxed") used by `Box` .

##### [§](#safety)Safety

This function is unsafe because improper use may lead to
memory problems. For example, a double-free may occur if the
function is called twice on the same raw pointer.

The raw pointer must point to a block of memory allocated by the global allocator.

The safety conditions are described in the [memory layout](https://doc.rust-lang.org/nightly/alloc/boxed/index.html#memory-layout "mod alloc::boxed") section.

##### [§](#examples-1-2)Examples

Recreate a `Box` which was previously converted to a raw pointer
using [`Box::into_raw`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.into_raw "associated function alloc::boxed::Box::into_raw"):

```
let x = Box::new(5);
let ptr = Box::into_raw(x);
let x = unsafe { Box::from_raw(ptr) };
```

Manually create a `Box` from scratch by using the global allocator:

```
use std::alloc::{alloc, Layout};

unsafe {
    let ptr = alloc(Layout::new::<i32>()) as *mut i32;
    // In general .write is required to avoid attempting to destruct
    // the (uninitialized) previous contents of `ptr`, though for this
    // simple example `*ptr = 5` would have worked as well.
    ptr.write(5);
    let x = Box::from_raw(ptr);
}
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1098)

#### pub unsafe fn [from\_non\_null](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.from_non_null)(ptr: [NonNull](https://doc.rust-lang.org/nightly/core/ptr/non_null/struct.NonNull.html "struct core::ptr::non_null::NonNull")<T>) -> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>

🔬This is a nightly-only experimental API. (`box_vec_non_null`)

Constructs a box from a `NonNull` pointer.

After calling this function, the `NonNull` pointer is owned by
the resulting `Box`. Specifically, the `Box` destructor will call
the destructor of `T` and free the allocated memory. For this
to be safe, the memory must have been allocated in accordance
with the [memory layout](https://doc.rust-lang.org/nightly/alloc/boxed/index.html#memory-layout "mod alloc::boxed") used by `Box` .

##### [§](#safety-1)Safety

This function is unsafe because improper use may lead to
memory problems. For example, a double-free may occur if the
function is called twice on the same `NonNull` pointer.

The non-null pointer must point to a block of memory allocated by the global allocator.

The safety conditions are described in the [memory layout](https://doc.rust-lang.org/nightly/alloc/boxed/index.html#memory-layout "mod alloc::boxed") section.

##### [§](#examples-1-2)Examples

Recreate a `Box` which was previously converted to a `NonNull`
pointer using [`Box::into_non_null`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.into_non_null "associated function alloc::boxed::Box::into_non_null"):

```
#![feature(box_vec_non_null)]

let x = Box::new(5);
let non_null = Box::into_non_null(x);
let x = unsafe { Box::from_non_null(non_null) };
```

Manually create a `Box` from scratch by using the global allocator:

```
#![feature(box_vec_non_null)]

use std::alloc::{alloc, Layout};
use std::ptr::NonNull;

unsafe {
    let non_null = NonNull::new(alloc(Layout::new::<i32>()).cast::<i32>())
        .expect("allocation failed");
    // In general .write is required to avoid attempting to destruct
    // the (uninitialized) previous contents of `non_null`.
    non_null.write(5);
    let x = Box::from_non_null(non_null);
}
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1103)[§](#impl-Box%3CT,+A%3E)

### impl<T, A> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"), T: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1153)

#### pub unsafe fn [from\_raw\_in](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.from_raw_in)(raw: [\*mut T](https://doc.rust-lang.org/nightly/std/primitive.pointer.html), alloc: A) -> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>

🔬This is a nightly-only experimental API. (`allocator_api`)

Constructs a box from a raw pointer in the given allocator.

After calling this function, the raw pointer is owned by the
resulting `Box`. Specifically, the `Box` destructor will call
the destructor of `T` and free the allocated memory. For this
to be safe, the memory must have been allocated in accordance
with the [memory layout](https://doc.rust-lang.org/nightly/alloc/boxed/index.html#memory-layout "mod alloc::boxed") used by `Box` .

##### [§](#safety-1-2)Safety

This function is unsafe because improper use may lead to
memory problems. For example, a double-free may occur if the
function is called twice on the same raw pointer.

The raw pointer must point to a block of memory allocated by `alloc`.

##### [§](#examples-1-2)Examples

Recreate a `Box` which was previously converted to a raw pointer
using [`Box::into_raw_with_allocator`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.into_raw_with_allocator "associated function alloc::boxed::Box::into_raw_with_allocator"):

```
#![feature(allocator_api)]

use std::alloc::System;

let x = Box::new_in(5, System);
let (ptr, alloc) = Box::into_raw_with_allocator(x);
let x = unsafe { Box::from_raw_in(ptr, alloc) };
```

Manually create a `Box` from scratch by using the system allocator:

```
#![feature(allocator_api, slice_ptr_get)]

use std::alloc::{Allocator, Layout, System};

unsafe {
    let ptr = System.allocate(Layout::new::<i32>())?.as_mut_ptr() as *mut i32;
    // In general .write is required to avoid attempting to destruct
    // the (uninitialized) previous contents of `ptr`, though for this
    // simple example `*ptr = 5` would have worked as well.
    ptr.write(5);
    let x = Box::from_raw_in(ptr, System);
}
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1206)

#### pub unsafe fn [from\_non\_null\_in](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.from_non_null_in)(raw: [NonNull](https://doc.rust-lang.org/nightly/core/ptr/non_null/struct.NonNull.html "struct core::ptr::non_null::NonNull")<T>, alloc: A) -> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>

🔬This is a nightly-only experimental API. (`allocator_api`)

Constructs a box from a `NonNull` pointer in the given allocator.

After calling this function, the `NonNull` pointer is owned by
the resulting `Box`. Specifically, the `Box` destructor will call
the destructor of `T` and free the allocated memory. For this
to be safe, the memory must have been allocated in accordance
with the [memory layout](https://doc.rust-lang.org/nightly/alloc/boxed/index.html#memory-layout "mod alloc::boxed") used by `Box` .

##### [§](#safety-1-2)Safety

This function is unsafe because improper use may lead to
memory problems. For example, a double-free may occur if the
function is called twice on the same raw pointer.

The non-null pointer must point to a block of memory allocated by `alloc`.

##### [§](#examples-1-2)Examples

Recreate a `Box` which was previously converted to a `NonNull` pointer
using [`Box::into_non_null_with_allocator`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.into_non_null_with_allocator "associated function alloc::boxed::Box::into_non_null_with_allocator"):

```
#![feature(allocator_api, box_vec_non_null)]

use std::alloc::System;

let x = Box::new_in(5, System);
let (non_null, alloc) = Box::into_non_null_with_allocator(x);
let x = unsafe { Box::from_non_null_in(non_null, alloc) };
```

Manually create a `Box` from scratch by using the system allocator:

```
#![feature(allocator_api, box_vec_non_null, slice_ptr_get)]

use std::alloc::{Allocator, Layout, System};

unsafe {
    let non_null = System.allocate(Layout::new::<i32>())?.cast::<i32>();
    // In general .write is required to avoid attempting to destruct
    // the (uninitialized) previous contents of `non_null`.
    non_null.write(5);
    let x = Box::from_non_null_in(non_null, System);
}
```

1.4.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1261)

#### pub fn [into\_raw](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.into_raw)(b: [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>) -> [\*mut T](https://doc.rust-lang.org/nightly/std/primitive.pointer.html)

Consumes the `Box`, returning a wrapped raw pointer.

The pointer will be properly aligned and non-null.

After calling this function, the caller is responsible for the
memory previously managed by the `Box`. In particular, the
caller should properly destroy `T` and release the memory, taking
into account the [memory layout](https://doc.rust-lang.org/nightly/alloc/boxed/index.html#memory-layout "mod alloc::boxed") used by `Box`. The easiest way to
do this is to convert the raw pointer back into a `Box` with the
[`Box::from_raw`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.from_raw "associated function alloc::boxed::Box::from_raw") function, allowing the `Box` destructor to perform
the cleanup.

Note: this is an associated function, which means that you have
to call it as `Box::into_raw(b)` instead of `b.into_raw()`. This
is so that there is no conflict with a method on the inner type.

##### [§](#examples-2-1)Examples

Converting the raw pointer back into a `Box` with [`Box::from_raw`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.from_raw "associated function alloc::boxed::Box::from_raw")
for automatic cleanup:

```
let x = Box::new(String::from("Hello"));
let ptr = Box::into_raw(x);
let x = unsafe { Box::from_raw(ptr) };
```

Manual cleanup by explicitly running the destructor and deallocating
the memory:

```
use std::alloc::{dealloc, Layout};
use std::ptr;

let x = Box::new(String::from("Hello"));
let ptr = Box::into_raw(x);
unsafe {
    ptr::drop_in_place(ptr);
    dealloc(ptr as *mut u8, Layout::new::<String>());
}
```

Note: This is equivalent to the following:

```
let x = Box::new(String::from("Hello"));
let ptr = Box::into_raw(x);
unsafe {
    drop(Box::from_raw(ptr));
}
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1321)

#### pub fn [into\_non\_null](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.into_non_null)(b: [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>) -> [NonNull](https://doc.rust-lang.org/nightly/core/ptr/non_null/struct.NonNull.html "struct core::ptr::non_null::NonNull")<T>

🔬This is a nightly-only experimental API. (`box_vec_non_null`)

Consumes the `Box`, returning a wrapped `NonNull` pointer.

The pointer will be properly aligned.

After calling this function, the caller is responsible for the
memory previously managed by the `Box`. In particular, the
caller should properly destroy `T` and release the memory, taking
into account the [memory layout](https://doc.rust-lang.org/nightly/alloc/boxed/index.html#memory-layout "mod alloc::boxed") used by `Box`. The easiest way to
do this is to convert the `NonNull` pointer back into a `Box` with the
[`Box::from_non_null`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.from_non_null "associated function alloc::boxed::Box::from_non_null") function, allowing the `Box` destructor to
perform the cleanup.

Note: this is an associated function, which means that you have
to call it as `Box::into_non_null(b)` instead of `b.into_non_null()`.
This is so that there is no conflict with a method on the inner type.

##### [§](#examples-3-1)Examples

Converting the `NonNull` pointer back into a `Box` with [`Box::from_non_null`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.from_non_null "associated function alloc::boxed::Box::from_non_null")
for automatic cleanup:

```
#![feature(box_vec_non_null)]

let x = Box::new(String::from("Hello"));
let non_null = Box::into_non_null(x);
let x = unsafe { Box::from_non_null(non_null) };
```

Manual cleanup by explicitly running the destructor and deallocating
the memory:

```
#![feature(box_vec_non_null)]

use std::alloc::{dealloc, Layout};

let x = Box::new(String::from("Hello"));
let non_null = Box::into_non_null(x);
unsafe {
    non_null.drop_in_place();
    dealloc(non_null.as_ptr().cast::<u8>(), Layout::new::<String>());
}
```

Note: This is equivalent to the following:

```
#![feature(box_vec_non_null)]

let x = Box::new(String::from("Hello"));
let non_null = Box::into_non_null(x);
unsafe {
    drop(Box::from_non_null(non_null));
}
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1375)

#### pub fn [into\_raw\_with\_allocator](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.into_raw_with_allocator)(b: [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>) -> ([\*mut T](https://doc.rust-lang.org/nightly/std/primitive.pointer.html), A)

🔬This is a nightly-only experimental API. (`allocator_api`)

Consumes the `Box`, returning a wrapped raw pointer and the allocator.

The pointer will be properly aligned and non-null.

After calling this function, the caller is responsible for the
memory previously managed by the `Box`. In particular, the
caller should properly destroy `T` and release the memory, taking
into account the [memory layout](https://doc.rust-lang.org/nightly/alloc/boxed/index.html#memory-layout "mod alloc::boxed") used by `Box`. The easiest way to
do this is to convert the raw pointer back into a `Box` with the
[`Box::from_raw_in`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.from_raw_in "associated function alloc::boxed::Box::from_raw_in") function, allowing the `Box` destructor to perform
the cleanup.

Note: this is an associated function, which means that you have
to call it as `Box::into_raw_with_allocator(b)` instead of `b.into_raw_with_allocator()`. This
is so that there is no conflict with a method on the inner type.

##### [§](#examples-4-1)Examples

Converting the raw pointer back into a `Box` with [`Box::from_raw_in`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.from_raw_in "associated function alloc::boxed::Box::from_raw_in")
for automatic cleanup:

```
#![feature(allocator_api)]

use std::alloc::System;

let x = Box::new_in(String::from("Hello"), System);
let (ptr, alloc) = Box::into_raw_with_allocator(x);
let x = unsafe { Box::from_raw_in(ptr, alloc) };
```

Manual cleanup by explicitly running the destructor and deallocating
the memory:

```
#![feature(allocator_api)]

use std::alloc::{Allocator, Layout, System};
use std::ptr::{self, NonNull};

let x = Box::new_in(String::from("Hello"), System);
let (ptr, alloc) = Box::into_raw_with_allocator(x);
unsafe {
    ptr::drop_in_place(ptr);
    let non_null = NonNull::new_unchecked(ptr);
    alloc.deallocate(non_null.cast(), Layout::new::<String>());
}
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1436)

#### pub fn [into\_non\_null\_with\_allocator](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.into_non_null_with_allocator)(b: [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>) -> ([NonNull](https://doc.rust-lang.org/nightly/core/ptr/non_null/struct.NonNull.html "struct core::ptr::non_null::NonNull")<T>, A)

🔬This is a nightly-only experimental API. (`allocator_api`)

Consumes the `Box`, returning a wrapped `NonNull` pointer and the allocator.

The pointer will be properly aligned.

After calling this function, the caller is responsible for the
memory previously managed by the `Box`. In particular, the
caller should properly destroy `T` and release the memory, taking
into account the [memory layout](https://doc.rust-lang.org/nightly/alloc/boxed/index.html#memory-layout "mod alloc::boxed") used by `Box`. The easiest way to
do this is to convert the `NonNull` pointer back into a `Box` with the
[`Box::from_non_null_in`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.from_non_null_in "associated function alloc::boxed::Box::from_non_null_in") function, allowing the `Box` destructor to
perform the cleanup.

Note: this is an associated function, which means that you have
to call it as `Box::into_non_null_with_allocator(b)` instead of
`b.into_non_null_with_allocator()`. This is so that there is no
conflict with a method on the inner type.

##### [§](#examples-5-1)Examples

Converting the `NonNull` pointer back into a `Box` with
[`Box::from_non_null_in`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.from_non_null_in "associated function alloc::boxed::Box::from_non_null_in") for automatic cleanup:

```
#![feature(allocator_api, box_vec_non_null)]

use std::alloc::System;

let x = Box::new_in(String::from("Hello"), System);
let (non_null, alloc) = Box::into_non_null_with_allocator(x);
let x = unsafe { Box::from_non_null_in(non_null, alloc) };
```

Manual cleanup by explicitly running the destructor and deallocating
the memory:

```
#![feature(allocator_api, box_vec_non_null)]

use std::alloc::{Allocator, Layout, System};

let x = Box::new_in(String::from("Hello"), System);
let (non_null, alloc) = Box::into_non_null_with_allocator(x);
unsafe {
    non_null.drop_in_place();
    alloc.deallocate(non_null.cast::<u8>(), Layout::new::<String>());
}
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1490)

#### pub fn [as\_mut\_ptr](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.as_mut_ptr)(b: &mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>) -> [\*mut T](https://doc.rust-lang.org/nightly/std/primitive.pointer.html)

🔬This is a nightly-only experimental API. (`box_as_ptr`)

Returns a raw mutable pointer to the `Box`’s contents.

The caller must ensure that the `Box` outlives the pointer this
function returns, or else it will end up dangling.

This method guarantees that for the purpose of the aliasing model, this method
does not materialize a reference to the underlying memory, and thus the returned pointer
will remain valid when mixed with other calls to [`as_ptr`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.as_ptr "associated function alloc::boxed::Box::as_ptr") and [`as_mut_ptr`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.as_mut_ptr "associated function alloc::boxed::Box::as_mut_ptr").
Note that calling other methods that materialize references to the memory
may still invalidate this pointer.
See the example below for how this guarantee can be used.

##### [§](#examples-6)Examples

Due to the aliasing guarantee, the following code is legal:

```
#![feature(box_as_ptr)]

unsafe {
    let mut b = Box::new(0);
    let ptr1 = Box::as_mut_ptr(&mut b);
    ptr1.write(1);
    let ptr2 = Box::as_mut_ptr(&mut b);
    ptr2.write(2);
    // Notably, the write to `ptr2` did *not* invalidate `ptr1`:
    ptr1.write(3);
}
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1539)

#### pub fn [as\_ptr](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.as_ptr)(b: &[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>) -> [\*const T](https://doc.rust-lang.org/nightly/std/primitive.pointer.html)

🔬This is a nightly-only experimental API. (`box_as_ptr`)

Returns a raw pointer to the `Box`’s contents.

The caller must ensure that the `Box` outlives the pointer this
function returns, or else it will end up dangling.

The caller must also ensure that the memory the pointer (non-transitively) points to
is never written to (except inside an `UnsafeCell`) using this pointer or any pointer
derived from it. If you need to mutate the contents of the `Box`, use [`as_mut_ptr`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.as_mut_ptr "associated function alloc::boxed::Box::as_mut_ptr").

This method guarantees that for the purpose of the aliasing model, this method
does not materialize a reference to the underlying memory, and thus the returned pointer
will remain valid when mixed with other calls to [`as_ptr`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.as_ptr "associated function alloc::boxed::Box::as_ptr") and [`as_mut_ptr`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.as_mut_ptr "associated function alloc::boxed::Box::as_mut_ptr").
Note that calling other methods that materialize mutable references to the memory,
as well as writing to this memory, may still invalidate this pointer.
See the example below for how this guarantee can be used.

##### [§](#examples-7)Examples

Due to the aliasing guarantee, the following code is legal:

```
#![feature(box_as_ptr)]

unsafe {
    let mut v = Box::new(0);
    let ptr1 = Box::as_ptr(&v);
    let ptr2 = Box::as_mut_ptr(&mut v);
    let _val = ptr2.read();
    // No write to this memory has happened yet, so `ptr1` is still valid.
    let _val = ptr1.read();
    // However, once we do a write...
    ptr2.write(1);
    // ... `ptr1` is no longer valid.
    // This would be UB: let _val = ptr1.read();
}
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1552)

#### pub fn [allocator](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.allocator)(b: &[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>) -> [&A](https://doc.rust-lang.org/nightly/std/primitive.reference.html)

🔬This is a nightly-only experimental API. (`allocator_api`)

Returns a reference to the underlying allocator.

Note: this is an associated function, which means that you have
to call it as `Box::allocator(&b)` instead of `b.allocator()`. This
is so that there is no conflict with a method on the inner type.

1.26.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1601-1603)

#### pub fn [leak](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.leak)<'a>(b: [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>) -> [&'a mut T](https://doc.rust-lang.org/nightly/std/primitive.reference.html) where A: 'a,

Consumes and leaks the `Box`, returning a mutable reference,
`&'a mut T`.

Note that the type `T` must outlive the chosen lifetime `'a`. If the type
has only static references, or none at all, then this may be chosen to be
`'static`.

This function is mainly useful for data that lives for the remainder of
the program’s life. Dropping the returned reference will cause a memory
leak. If this is not acceptable, the reference should first be wrapped
with the [`Box::from_raw`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.from_raw "associated function alloc::boxed::Box::from_raw") function producing a `Box`. This `Box` can
then be dropped which will properly destroy `T` and release the
allocated memory.

Note: this is an associated function, which means that you have
to call it as `Box::leak(b)` instead of `b.leak()`. This
is so that there is no conflict with a method on the inner type.

##### [§](#examples-8)Examples

Simple usage:

```
let x = Box::new(41);
let static_ref: &'static mut usize = Box::leak(x);
*static_ref += 1;
assert_eq!(*static_ref, 42);
```

Unsized data:

```
let x = vec![1, 2, 3].into_boxed_slice();
let static_ref = Box::leak(x);
static_ref[0] = 4;
assert_eq!(*static_ref, [4, 2, 3]);
```

1.63.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1639-1641)

#### pub fn [into\_pin](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.into_pin)(boxed: [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>) -> [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>> where A: 'static,

Converts a `Box<T>` into a `Pin<Box<T>>`. If `T` does not implement [`Unpin`](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin"), then
`*boxed` will be pinned in memory and unable to be moved.

This conversion does not allocate on the heap and happens in place.

This is also available via [`From`](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From").

Constructing and pinning a `Box` with `Box::into_pin(Box::new(x))`
can also be written more concisely using `Box::pin(x)`.
This `into_pin` method is useful if you already have a `Box<T>`, or you are
constructing a (pinned) `Box` in a different way than with [`Box::new`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.new "associated function alloc::boxed::Box::new").

##### [§](#notes)Notes

It’s not recommended that crates add an impl like `From<Box<T>> for Pin<T>`,
as it’ll introduce an ambiguity when calling `Pin::from`.
A demonstration of such a poor impl is shown below.

[ⓘ](# "This example deliberately fails to compile")

```
struct Foo; // A type defined in this crate.
impl From<Box<()>> for Pin<Foo> {
    fn from(_: Box<()>) -> Pin<Foo> {
        Pin::new(Foo)
    }
}

let foo = Box::new(());
let bar = Pin::from(foo);
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#394)[§](#impl-Box%3CT,+A%3E-1)

### impl<T, A> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#412-414)

#### pub fn [new\_in](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.new_in)(x: T, alloc: A) -> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

🔬This is a nightly-only experimental API. (`allocator_api`)

Allocates memory in the given allocator then places `x` into it.

This doesn’t actually allocate if `T` is zero-sized.

##### [§](#examples-1-2)Examples

```
#![feature(allocator_api)]

use std::alloc::System;

let five = Box::new_in(5, System);
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#438-440)

#### pub fn [try\_new\_in](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.try_new_in)(x: T, alloc: A) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>, [AllocError](https://doc.rust-lang.org/nightly/core/alloc/struct.AllocError.html "struct core::alloc::AllocError")> where A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

🔬This is a nightly-only experimental API. (`allocator_api`)

Allocates memory in the given allocator then places `x` into it,
returning an error if the allocation fails

This doesn’t actually allocate if `T` is zero-sized.

##### [§](#examples-1-2)Examples

```
#![feature(allocator_api)]

use std::alloc::System;

let five = Box::try_new_in(5, System)?;
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#467-469)

#### pub fn [new\_uninit\_in](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.new_uninit_in)(alloc: A) -> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<[MaybeUninit](https://doc.rust-lang.org/nightly/core/mem/maybe_uninit/union.MaybeUninit.html "union core::mem::maybe_uninit::MaybeUninit")<T>, A> where A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

🔬This is a nightly-only experimental API. (`allocator_api`)

Constructs a new box with uninitialized contents in the provided allocator.

##### [§](#examples-2-1)Examples

```
#![feature(allocator_api)]

use std::alloc::System;

let mut five = Box::<u32, _>::new_uninit_in(System);
// Deferred initialization:
five.write(5);
let five = unsafe { five.assume_init() };

assert_eq!(*five, 5)
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#500-502)

#### pub fn [try\_new\_uninit\_in](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.try_new_uninit_in)(alloc: A) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<[MaybeUninit](https://doc.rust-lang.org/nightly/core/mem/maybe_uninit/union.MaybeUninit.html "union core::mem::maybe_uninit::MaybeUninit")<T>, A>, [AllocError](https://doc.rust-lang.org/nightly/core/alloc/struct.AllocError.html "struct core::alloc::AllocError")> where A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

🔬This is a nightly-only experimental API. (`allocator_api`)

Constructs a new box with uninitialized contents in the provided allocator,
returning an error if the allocation fails

##### [§](#examples-3-1)Examples

```
#![feature(allocator_api)]

use std::alloc::System;

let mut five = Box::<u32, _>::try_new_uninit_in(System)?;
// Deferred initialization:
five.write(5);
let five = unsafe { five.assume_init() };

assert_eq!(*five, 5);
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#537-539)

#### pub fn [new\_zeroed\_in](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.new_zeroed_in)(alloc: A) -> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<[MaybeUninit](https://doc.rust-lang.org/nightly/core/mem/maybe_uninit/union.MaybeUninit.html "union core::mem::maybe_uninit::MaybeUninit")<T>, A> where A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

🔬This is a nightly-only experimental API. (`allocator_api`)

Constructs a new `Box` with uninitialized contents, with the memory
being filled with `0` bytes in the provided allocator.

See [`MaybeUninit::zeroed`](https://doc.rust-lang.org/nightly/core/mem/maybe_uninit/union.MaybeUninit.html#method.zeroed "associated function core::mem::maybe_uninit::MaybeUninit::zeroed") for examples of correct and incorrect usage
of this method.

##### [§](#examples-4-1)Examples

```
#![feature(allocator_api)]

use std::alloc::System;

let zero = Box::<u32, _>::new_zeroed_in(System);
let zero = unsafe { zero.assume_init() };

assert_eq!(*zero, 0)
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#574-576)

#### pub fn [try\_new\_zeroed\_in](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.try_new_zeroed_in)(alloc: A) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<[MaybeUninit](https://doc.rust-lang.org/nightly/core/mem/maybe_uninit/union.MaybeUninit.html "union core::mem::maybe_uninit::MaybeUninit")<T>, A>, [AllocError](https://doc.rust-lang.org/nightly/core/alloc/struct.AllocError.html "struct core::alloc::AllocError")> where A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

🔬This is a nightly-only experimental API. (`allocator_api`)

Constructs a new `Box` with uninitialized contents, with the memory
being filled with `0` bytes in the provided allocator,
returning an error if the allocation fails,

See [`MaybeUninit::zeroed`](https://doc.rust-lang.org/nightly/core/mem/maybe_uninit/union.MaybeUninit.html#method.zeroed "associated function core::mem::maybe_uninit::MaybeUninit::zeroed") for examples of correct and incorrect usage
of this method.

##### [§](#examples-5-1)Examples

```
#![feature(allocator_api)]

use std::alloc::System;

let zero = Box::<u32, _>::try_new_zeroed_in(System)?;
let zero = unsafe { zero.assume_init() };

assert_eq!(*zero, 0);
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#598-600)

#### pub fn [pin\_in](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.pin_in)(x: T, alloc: A) -> [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>> where A: 'static + [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

🔬This is a nightly-only experimental API. (`allocator_api`)

Constructs a new `Pin<Box<T, A>>`. If `T` does not implement [`Unpin`](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin"), then
`x` will be pinned in memory and unable to be moved.

Constructing and pinning of the `Box` can also be done in two steps: `Box::pin_in(x, alloc)`
does the same as `Box::into_pin(Box::new_in(x, alloc))`. Consider using
[`into_pin`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.into_pin "associated function alloc::boxed::Box::into_pin") if you already have a `Box<T, A>`, or if you want to
construct a (pinned) `Box` in a different way than with [`Box::new_in`](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#method.new_in "associated function alloc::boxed::Box::new_in").

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#609)

#### pub fn [into\_boxed\_slice](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.into_boxed_slice)(boxed: [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>) -> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<[[T]](https://doc.rust-lang.org/nightly/std/primitive.slice.html), A>

🔬This is a nightly-only experimental API. (`box_into_boxed_slice`)

Converts a `Box<T>` into a `Box<[T]>`

This conversion does not allocate on the heap and happens in place.

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#627)

#### pub fn [into\_inner](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html#tymethod.into_inner)(boxed: [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>) -> T

🔬This is a nightly-only experimental API. (`box_into_inner`)

Consumes the `Box`, returning the wrapped value.

##### [§](#examples-6-1)Examples

```
#![feature(box_into_inner)]

let c = Box::new(5);

assert_eq!(Box::into_inner(c), 5);
```

## Trait Implementations

[Source](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/src/icu_provider/any.rs.html#359)[§](#impl-AnyProvider-for-Box%3CT%3E)

### impl<T> [AnyProvider](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/any/trait.AnyProvider.html "trait icu_provider::any::AnyProvider") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [AnyProvider](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/any/trait.AnyProvider.html "trait icu_provider::any::AnyProvider") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/src/icu_provider/any.rs.html#361)[§](#method.load_any)

#### fn [load\_any](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/any/trait.AnyProvider.html#tymethod.load_any)( &self, key: [DataKey](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/key/struct.DataKey.html "struct icu_provider::key::DataKey"), req: [DataRequest](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/request/struct.DataRequest.html "struct icu_provider::request::DataRequest")<'\_>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[AnyResponse](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/any/struct.AnyResponse.html "struct icu_provider::any::AnyResponse"), [DataError](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/error/struct.DataError.html "struct icu_provider::error::DataError")>

Loads an [`AnyPayload`](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/any/struct.AnyPayload.html "struct icu_provider::any::AnyPayload") according to the key and request.

1.64.0 · [Source](https://doc.rust-lang.org/nightly/src/std/os/fd/owned.rs.html#450)[§](#impl-AsFd-for-Box%3CT%3E)

### impl<T> [AsFd](https://doc.rust-lang.org/nightly/std/os/fd/owned/trait.AsFd.html "trait std::os::fd::owned::AsFd") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [AsFd](https://doc.rust-lang.org/nightly/std/os/fd/owned/trait.AsFd.html "trait std::os::fd::owned::AsFd") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/std/os/fd/owned.rs.html#452)[§](#method.as_fd)

#### fn [as\_fd](https://doc.rust-lang.org/nightly/std/os/fd/owned/trait.AsFd.html#tymethod.as_fd)(&self) -> [BorrowedFd](https://doc.rust-lang.org/nightly/std/os/fd/owned/struct.BorrowedFd.html "struct std::os::fd::owned::BorrowedFd")<'\_>

Borrows the file descriptor. [Read more](https://doc.rust-lang.org/nightly/std/os/fd/owned/trait.AsFd.html#tymethod.as_fd)

1.5.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2047)[§](#impl-AsMut%3CT%3E-for-Box%3CT,+A%3E)

### impl<T, A> [AsMut](https://doc.rust-lang.org/nightly/core/convert/trait.AsMut.html "trait core::convert::AsMut")<T> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"), T: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2048)[§](#method.as_mut)

#### fn [as\_mut](https://doc.rust-lang.org/nightly/core/convert/trait.AsMut.html#tymethod.as_mut)(&mut self) -> [&mut T](https://doc.rust-lang.org/nightly/std/primitive.reference.html)

Converts this type into a mutable reference of the (usually inferred) input type.

1.63.0 · [Source](https://doc.rust-lang.org/nightly/src/std/os/fd/raw.rs.html#281)[§](#impl-AsRawFd-for-Box%3CT%3E)

### impl<T> [AsRawFd](https://doc.rust-lang.org/nightly/std/os/fd/raw/trait.AsRawFd.html "trait std::os::fd::raw::AsRawFd") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [AsRawFd](https://doc.rust-lang.org/nightly/std/os/fd/raw/trait.AsRawFd.html "trait std::os::fd::raw::AsRawFd"),

[Source](https://doc.rust-lang.org/nightly/src/std/os/fd/raw.rs.html#283)[§](#method.as_raw_fd)

#### fn [as\_raw\_fd](https://doc.rust-lang.org/nightly/std/os/fd/raw/trait.AsRawFd.html#tymethod.as_raw_fd)(&self) -> [i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html)

Extracts the raw file descriptor. [Read more](https://doc.rust-lang.org/nightly/std/os/fd/raw/trait.AsRawFd.html#tymethod.as_raw_fd)

1.5.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2040)[§](#impl-AsRef%3CT%3E-for-Box%3CT,+A%3E)

### impl<T, A> [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<T> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"), T: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2041)[§](#method.as_ref)

#### fn [as\_ref](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html#tymethod.as_ref)(&self) -> [&T](https://doc.rust-lang.org/nightly/std/primitive.reference.html)

Converts this type into a shared reference of the (usually inferred) input type.

[Source](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/src/futures_io/lib.rs.html#521)[§](#impl-AsyncBufRead-for-Box%3CT%3E)

### impl<T> [AsyncBufRead](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncBufRead.html "trait futures_io::if_std::AsyncBufRead") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [AsyncBufRead](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncBufRead.html "trait futures_io::if_std::AsyncBufRead") + [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/src/futures_io/lib.rs.html#522)[§](#method.poll_fill_buf)

#### fn [poll\_fill\_buf](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncBufRead.html#tymethod.poll_fill_buf)( self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>>, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>, ) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<&[[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)], [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>>

Attempt to return the contents of the internal buffer, filling it with more data
from the inner reader if it is empty. [Read more](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncBufRead.html#tymethod.poll_fill_buf)

[Source](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/src/futures_io/lib.rs.html#522)[§](#method.consume)

#### fn [consume](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncBufRead.html#tymethod.consume)(self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>>, amt: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html))

Tells this buffer that `amt` bytes have been consumed from the buffer,
so they should no longer be returned in calls to [`poll_read`](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncRead.html#tymethod.poll_read "method futures_io::if_std::AsyncRead::poll_read"). [Read more](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncBufRead.html#tymethod.consume)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/io/async_buf_read.rs.html#77)[§](#impl-AsyncBufRead-for-Box%3CT%3E-1)

### impl<T> [AsyncBufRead](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_buf_read/trait.AsyncBufRead.html "trait tokio::io::async_buf_read::AsyncBufRead") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [AsyncBufRead](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_buf_read/trait.AsyncBufRead.html "trait tokio::io::async_buf_read::AsyncBufRead") + [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/io/async_buf_read.rs.html#78)[§](#method.poll_fill_buf-1)

#### fn [poll\_fill\_buf](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_buf_read/trait.AsyncBufRead.html#tymethod.poll_fill_buf)( self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>>, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>, ) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<&[[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)], [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>>

Attempts to return the contents of the internal buffer, filling it with more data
from the inner reader if it is empty. [Read more](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_buf_read/trait.AsyncBufRead.html#tymethod.poll_fill_buf)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/io/async_buf_read.rs.html#78)[§](#method.consume-1)

#### fn [consume](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_buf_read/trait.AsyncBufRead.html#tymethod.consume)(self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>>, amt: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html))

Tells this buffer that `amt` bytes have been consumed from the buffer,
so they should no longer be returned in calls to [`poll_read`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_read/trait.AsyncRead.html#tymethod.poll_read "method tokio::io::async_read::AsyncRead::poll_read"). [Read more](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_buf_read/trait.AsyncBufRead.html#tymethod.consume)

1.85.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2007)[§](#impl-AsyncFn%3CArgs%3E-for-Box%3CF,+A%3E)

### impl<Args, F, A> [AsyncFn](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFn.html "trait core::ops::async_function::AsyncFn")<Args> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<F, A> where Args: [Tuple](https://doc.rust-lang.org/nightly/core/marker/trait.Tuple.html "trait core::marker::Tuple"), F: [AsyncFn](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFn.html "trait core::ops::async_function::AsyncFn")<Args> + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2008)[§](#method.async_call)

#### extern "rust-call" fn [async\_call](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFn.html#tymethod.async_call)( &self, args: Args, ) -> <[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<F, A> as [AsyncFnMut](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnMut.html "trait core::ops::async_function::AsyncFnMut")<Args>>::[CallRefFuture](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnMut.html#associatedtype.CallRefFuture "type core::ops::async_function::AsyncFnMut::CallRefFuture")<'\_>

🔬This is a nightly-only experimental API. (`async_fn_traits`)

Call the [`AsyncFn`](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFn.html "trait core::ops::async_function::AsyncFn"), returning a future which may borrow from the called closure.

1.85.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1995)[§](#impl-AsyncFnMut%3CArgs%3E-for-Box%3CF,+A%3E)

### impl<Args, F, A> [AsyncFnMut](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnMut.html "trait core::ops::async_function::AsyncFnMut")<Args> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<F, A> where Args: [Tuple](https://doc.rust-lang.org/nightly/core/marker/trait.Tuple.html "trait core::marker::Tuple"), F: [AsyncFnMut](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnMut.html "trait core::ops::async_function::AsyncFnMut")<Args> + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1996)[§](#associatedtype.CallRefFuture)

#### type [CallRefFuture](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnMut.html#associatedtype.CallRefFuture)<'a> = <F as [AsyncFnMut](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnMut.html "trait core::ops::async_function::AsyncFnMut")<Args>>::[CallRefFuture](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnMut.html#associatedtype.CallRefFuture "type core::ops::async_function::AsyncFnMut::CallRefFuture")<'a> where [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<F, A>: 'a

🔬This is a nightly-only experimental API. (`async_fn_traits`)

Future returned by [`AsyncFnMut::async_call_mut`](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnMut.html#tymethod.async_call_mut "method core::ops::async_function::AsyncFnMut::async_call_mut") and [`AsyncFn::async_call`](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFn.html#tymethod.async_call "method core::ops::async_function::AsyncFn::async_call").

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2001)[§](#method.async_call_mut)

#### extern "rust-call" fn [async\_call\_mut](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnMut.html#tymethod.async_call_mut)( &mut self, args: Args, ) -> <[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<F, A> as [AsyncFnMut](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnMut.html "trait core::ops::async_function::AsyncFnMut")<Args>>::[CallRefFuture](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnMut.html#associatedtype.CallRefFuture "type core::ops::async_function::AsyncFnMut::CallRefFuture")<'\_>

🔬This is a nightly-only experimental API. (`async_fn_traits`)

Call the [`AsyncFnMut`](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnMut.html "trait core::ops::async_function::AsyncFnMut"), returning a future which may borrow from the called closure.

1.85.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1985)[§](#impl-AsyncFnOnce%3CArgs%3E-for-Box%3CF,+A%3E)

### impl<Args, F, A> [AsyncFnOnce](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnOnce.html "trait core::ops::async_function::AsyncFnOnce")<Args> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<F, A> where Args: [Tuple](https://doc.rust-lang.org/nightly/core/marker/trait.Tuple.html "trait core::marker::Tuple"), F: [AsyncFnOnce](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnOnce.html "trait core::ops::async_function::AsyncFnOnce")<Args> + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1986)[§](#associatedtype.Output)

#### type [Output](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnOnce.html#associatedtype.Output) = <F as [AsyncFnOnce](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnOnce.html "trait core::ops::async_function::AsyncFnOnce")<Args>>::[Output](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnOnce.html#associatedtype.Output "type core::ops::async_function::AsyncFnOnce::Output")

🔬This is a nightly-only experimental API. (`async_fn_traits`)

Output type of the called closure’s future.

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1987)[§](#associatedtype.CallOnceFuture)

#### type [CallOnceFuture](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnOnce.html#associatedtype.CallOnceFuture) = <F as [AsyncFnOnce](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnOnce.html "trait core::ops::async_function::AsyncFnOnce")<Args>>::[CallOnceFuture](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnOnce.html#associatedtype.CallOnceFuture "type core::ops::async_function::AsyncFnOnce::CallOnceFuture")

🔬This is a nightly-only experimental API. (`async_fn_traits`)

Future returned by [`AsyncFnOnce::async_call_once`](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnOnce.html#tymethod.async_call_once "method core::ops::async_function::AsyncFnOnce::async_call_once").

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1989)[§](#method.async_call_once)

#### extern "rust-call" fn [async\_call\_once](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnOnce.html#tymethod.async_call_once)( self, args: Args, ) -> <[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<F, A> as [AsyncFnOnce](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnOnce.html "trait core::ops::async_function::AsyncFnOnce")<Args>>::[CallOnceFuture](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnOnce.html#associatedtype.CallOnceFuture "type core::ops::async_function::AsyncFnOnce::CallOnceFuture")

🔬This is a nightly-only experimental API. (`async_fn_traits`)

Call the [`AsyncFnOnce`](https://doc.rust-lang.org/nightly/core/ops/async_function/trait.AsyncFnOnce.html "trait core::ops::async_function::AsyncFnOnce"), returning a future which may move out of the called closure.

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed/iter.rs.html#83)[§](#impl-AsyncIterator-for-Box%3CS%3E)

### impl<S> [AsyncIterator](https://doc.rust-lang.org/nightly/core/async_iter/async_iter/trait.AsyncIterator.html "trait core::async_iter::async_iter::AsyncIterator") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<S> where S: [AsyncIterator](https://doc.rust-lang.org/nightly/core/async_iter/async_iter/trait.AsyncIterator.html "trait core::async_iter::async_iter::AsyncIterator") + [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed/iter.rs.html#84)[§](#associatedtype.Item)

#### type [Item](https://doc.rust-lang.org/nightly/core/async_iter/async_iter/trait.AsyncIterator.html#associatedtype.Item) = <S as [AsyncIterator](https://doc.rust-lang.org/nightly/core/async_iter/async_iter/trait.AsyncIterator.html "trait core::async_iter::async_iter::AsyncIterator")>::[Item](https://doc.rust-lang.org/nightly/core/async_iter/async_iter/trait.AsyncIterator.html#associatedtype.Item "type core::async_iter::async_iter::AsyncIterator::Item")

🔬This is a nightly-only experimental API. (`async_iterator`)

The type of items yielded by the async iterator.

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed/iter.rs.html#86)[§](#method.poll_next)

#### fn [poll\_next](https://doc.rust-lang.org/nightly/core/async_iter/async_iter/trait.AsyncIterator.html#tymethod.poll_next)( self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<S>>, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>, ) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<<[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<S> as [AsyncIterator](https://doc.rust-lang.org/nightly/core/async_iter/async_iter/trait.AsyncIterator.html "trait core::async_iter::async_iter::AsyncIterator")>::[Item](https://doc.rust-lang.org/nightly/core/async_iter/async_iter/trait.AsyncIterator.html#associatedtype.Item "type core::async_iter::async_iter::AsyncIterator::Item")>>

🔬This is a nightly-only experimental API. (`async_iterator`)

Attempts to pull out the next value of this async iterator, registering the
current task for wakeup if the value is not yet available, and returning
`None` if the async iterator is exhausted. [Read more](https://doc.rust-lang.org/nightly/core/async_iter/async_iter/trait.AsyncIterator.html#tymethod.poll_next)

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed/iter.rs.html#90)[§](#method.size_hint)

#### fn [size\_hint](https://doc.rust-lang.org/nightly/core/async_iter/async_iter/trait.AsyncIterator.html#method.size_hint)(&self) -> ([usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)>)

🔬This is a nightly-only experimental API. (`async_iterator`)

Returns the bounds on the remaining length of the async iterator. [Read more](https://doc.rust-lang.org/nightly/core/async_iter/async_iter/trait.AsyncIterator.html#method.size_hint)

[Source](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/src/futures_io/lib.rs.html#323)[§](#impl-AsyncRead-for-Box%3CT%3E)

### impl<T> [AsyncRead](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncRead.html "trait futures_io::if_std::AsyncRead") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [AsyncRead](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncRead.html "trait futures_io::if_std::AsyncRead") + [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/src/futures_io/lib.rs.html#324)[§](#method.poll_read)

#### fn [poll\_read](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncRead.html#tymethod.poll_read)( self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>>, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>, buf: &mut [[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)], ) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>>

Attempt to read from the `AsyncRead` into `buf`. [Read more](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncRead.html#tymethod.poll_read)

[Source](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/src/futures_io/lib.rs.html#324)[§](#method.poll_read_vectored)

#### fn [poll\_read\_vectored](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncRead.html#method.poll_read_vectored)( self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>>, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>, bufs: &mut [[IoSliceMut](https://doc.rust-lang.org/nightly/std/io/struct.IoSliceMut.html "struct std::io::IoSliceMut")<'\_>], ) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>>

Attempt to read from the `AsyncRead` into `bufs` using vectored
IO operations. [Read more](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncRead.html#method.poll_read_vectored)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/io/async_read.rs.html#73)[§](#impl-AsyncRead-for-Box%3CT%3E-1)

### impl<T> [AsyncRead](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_read/trait.AsyncRead.html "trait tokio::io::async_read::AsyncRead") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [AsyncRead](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_read/trait.AsyncRead.html "trait tokio::io::async_read::AsyncRead") + [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/io/async_read.rs.html#74)[§](#method.poll_read-1)

#### fn [poll\_read](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_read/trait.AsyncRead.html#tymethod.poll_read)( self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>>, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>, buf: &mut [ReadBuf](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/read_buf/struct.ReadBuf.html "struct tokio::io::read_buf::ReadBuf")<'\_>, ) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>>

Attempts to read from the `AsyncRead` into `buf`. [Read more](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_read/trait.AsyncRead.html#tymethod.poll_read)

[Source](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/src/futures_io/lib.rs.html#487)[§](#impl-AsyncSeek-for-Box%3CT%3E)

### impl<T> [AsyncSeek](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncSeek.html "trait futures_io::if_std::AsyncSeek") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [AsyncSeek](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncSeek.html "trait futures_io::if_std::AsyncSeek") + [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/src/futures_io/lib.rs.html#488)[§](#method.poll_seek)

#### fn [poll\_seek](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncSeek.html#tymethod.poll_seek)( self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>>, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>, pos: [SeekFrom](https://doc.rust-lang.org/nightly/std/io/enum.SeekFrom.html "enum std::io::SeekFrom"), ) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>>

Attempt to seek to an offset, in bytes, in a stream. [Read more](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncSeek.html#tymethod.poll_seek)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/io/async_seek.rs.html#61)[§](#impl-AsyncSeek-for-Box%3CT%3E-1)

### impl<T> [AsyncSeek](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_seek/trait.AsyncSeek.html "trait tokio::io::async_seek::AsyncSeek") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [AsyncSeek](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_seek/trait.AsyncSeek.html "trait tokio::io::async_seek::AsyncSeek") + [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/io/async_seek.rs.html#62)[§](#method.start_seek)

#### fn [start\_seek](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_seek/trait.AsyncSeek.html#tymethod.start_seek)(self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>>, pos: [SeekFrom](https://doc.rust-lang.org/nightly/std/io/enum.SeekFrom.html "enum std::io::SeekFrom")) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

Attempts to seek to an offset, in bytes, in a stream. [Read more](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_seek/trait.AsyncSeek.html#tymethod.start_seek)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/io/async_seek.rs.html#62)[§](#method.poll_complete)

#### fn [poll\_complete](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_seek/trait.AsyncSeek.html#tymethod.poll_complete)( self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>>, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>, ) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>>

Waits for a seek operation to complete. [Read more](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_seek/trait.AsyncSeek.html#tymethod.poll_complete)

[Source](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/src/futures_io/lib.rs.html#405)[§](#impl-AsyncWrite-for-Box%3CT%3E)

### impl<T> [AsyncWrite](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncWrite.html "trait futures_io::if_std::AsyncWrite") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [AsyncWrite](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncWrite.html "trait futures_io::if_std::AsyncWrite") + [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/src/futures_io/lib.rs.html#406)[§](#method.poll_write)

#### fn [poll\_write](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncWrite.html#tymethod.poll_write)( self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>>, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>, buf: &[[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)], ) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>>

Attempt to write bytes from `buf` into the object. [Read more](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncWrite.html#tymethod.poll_write)

[Source](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/src/futures_io/lib.rs.html#406)[§](#method.poll_write_vectored)

#### fn [poll\_write\_vectored](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncWrite.html#method.poll_write_vectored)( self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>>, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>, bufs: &[[IoSlice](https://doc.rust-lang.org/nightly/std/io/struct.IoSlice.html "struct std::io::IoSlice")<'\_>], ) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>>

Attempt to write bytes from `bufs` into the object using vectored
IO operations. [Read more](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncWrite.html#method.poll_write_vectored)

[Source](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/src/futures_io/lib.rs.html#406)[§](#method.poll_flush)

#### fn [poll\_flush](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncWrite.html#tymethod.poll_flush)( self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>>, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>, ) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>>

Attempt to flush the object, ensuring that any buffered data reach
their destination. [Read more](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncWrite.html#tymethod.poll_flush)

[Source](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/src/futures_io/lib.rs.html#406)[§](#method.poll_close)

#### fn [poll\_close](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncWrite.html#tymethod.poll_close)( self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>>, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>, ) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>>

Attempt to close the object. [Read more](https://docs.rs/futures-io/0.3.31/x86_64-unknown-linux-gnu/futures_io/if_std/trait.AsyncWrite.html#tymethod.poll_close)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/io/async_write.rs.html#217)[§](#impl-AsyncWrite-for-Box%3CT%3E-1)

### impl<T> [AsyncWrite](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_write/trait.AsyncWrite.html "trait tokio::io::async_write::AsyncWrite") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [AsyncWrite](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_write/trait.AsyncWrite.html "trait tokio::io::async_write::AsyncWrite") + [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/io/async_write.rs.html#218)[§](#method.poll_write-1)

#### fn [poll\_write](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_write/trait.AsyncWrite.html#tymethod.poll_write)( self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>>, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>, buf: &[[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)], ) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>>

Attempt to write bytes from `buf` into the object. [Read more](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_write/trait.AsyncWrite.html#tymethod.poll_write)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/io/async_write.rs.html#218)[§](#method.poll_write_vectored-1)

#### fn [poll\_write\_vectored](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_write/trait.AsyncWrite.html#method.poll_write_vectored)( self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>>, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>, bufs: &[[IoSlice](https://doc.rust-lang.org/nightly/std/io/struct.IoSlice.html "struct std::io::IoSlice")<'\_>], ) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>>

Like [`poll_write`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_write/trait.AsyncWrite.html#tymethod.poll_write "method tokio::io::async_write::AsyncWrite::poll_write"), except that it writes from a slice of buffers. [Read more](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_write/trait.AsyncWrite.html#method.poll_write_vectored)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/io/async_write.rs.html#218)[§](#method.is_write_vectored)

#### fn [is\_write\_vectored](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_write/trait.AsyncWrite.html#method.is_write_vectored)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Determines if this writer has an efficient [`poll_write_vectored`](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_write/trait.AsyncWrite.html#method.poll_write_vectored "method tokio::io::async_write::AsyncWrite::poll_write_vectored")
implementation. [Read more](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_write/trait.AsyncWrite.html#method.is_write_vectored)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/io/async_write.rs.html#218)[§](#method.poll_flush-1)

#### fn [poll\_flush](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_write/trait.AsyncWrite.html#tymethod.poll_flush)( self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>>, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>, ) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>>

Attempts to flush the object, ensuring that any buffered data reach
their destination. [Read more](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_write/trait.AsyncWrite.html#tymethod.poll_flush)

[Source](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/src/tokio/io/async_write.rs.html#218)[§](#method.poll_shutdown)

#### fn [poll\_shutdown](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_write/trait.AsyncWrite.html#tymethod.poll_shutdown)( self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>>, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>, ) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>>

Initiates or attempts to shut down this writer, returning success when
the I/O connection has completely shut down. [Read more](https://docs.rs/tokio/1.44.1/x86_64-unknown-linux-gnu/tokio/io/async_write/trait.AsyncWrite.html#tymethod.poll_shutdown)

1.1.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2026)[§](#impl-Borrow%3CT%3E-for-Box%3CT,+A%3E)

### impl<T, A> [Borrow](https://doc.rust-lang.org/nightly/core/borrow/trait.Borrow.html "trait core::borrow::Borrow")<T> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"), T: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2027)[§](#method.borrow)

#### fn [borrow](https://doc.rust-lang.org/nightly/core/borrow/trait.Borrow.html#tymethod.borrow)(&self) -> [&T](https://doc.rust-lang.org/nightly/std/primitive.reference.html)

Immutably borrows from an owned value. [Read more](https://doc.rust-lang.org/nightly/core/borrow/trait.Borrow.html#tymethod.borrow)

1.1.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2033)[§](#impl-BorrowMut%3CT%3E-for-Box%3CT,+A%3E)

### impl<T, A> [BorrowMut](https://doc.rust-lang.org/nightly/core/borrow/trait.BorrowMut.html "trait core::borrow::BorrowMut")<T> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"), T: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2034)[§](#method.borrow_mut)

#### fn [borrow\_mut](https://doc.rust-lang.org/nightly/core/borrow/trait.BorrowMut.html#tymethod.borrow_mut)(&mut self) -> [&mut T](https://doc.rust-lang.org/nightly/std/primitive.reference.html)

Mutably borrows from an owned value. [Read more](https://doc.rust-lang.org/nightly/core/borrow/trait.BorrowMut.html#tymethod.borrow_mut)

[Source](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/src/icu_provider/data_provider.rs.html#171-174)[§](#impl-BoundDataProvider%3CM%3E-for-Box%3CP%3E)

### impl<M, P> [BoundDataProvider](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/data_provider/trait.BoundDataProvider.html "trait icu_provider::data_provider::BoundDataProvider")<M> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<P> where M: [DataMarker](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/marker/trait.DataMarker.html "trait icu_provider::marker::DataMarker"), P: [BoundDataProvider](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/data_provider/trait.BoundDataProvider.html "trait icu_provider::data_provider::BoundDataProvider")<M> + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/src/icu_provider/data_provider.rs.html#177)[§](#method.load_bound)

#### fn [load\_bound](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/data_provider/trait.BoundDataProvider.html#tymethod.load_bound)(&self, req: [DataRequest](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/request/struct.DataRequest.html "struct icu_provider::request::DataRequest")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[DataResponse](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/response/struct.DataResponse.html "struct icu_provider::response::DataResponse")<M>, [DataError](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/error/struct.DataError.html "struct icu_provider::error::DataError")>

Query the provider for data, returning the result. [Read more](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/data_provider/trait.BoundDataProvider.html#tymethod.load_bound)

[Source](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/src/icu_provider/data_provider.rs.html#181)[§](#method.bound_key)

#### fn [bound\_key](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/data_provider/trait.BoundDataProvider.html#tymethod.bound_key)(&self) -> [DataKey](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/key/struct.DataKey.html "struct icu_provider::key::DataKey")

Returns the [`DataKey`](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/key/struct.DataKey.html "struct icu_provider::key::DataKey") that this provider uses for loading data.

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2885)[§](#impl-Buf-for-Box%3CT%3E)

### impl<T> [Buf](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html "trait bytes::buf::buf_impl::Buf") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [Buf](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html "trait bytes::buf::buf_impl::Buf") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.remaining)

#### fn [remaining](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#tymethod.remaining)(&self) -> [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)

Returns the number of bytes between the current position and the end of
the buffer. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#tymethod.remaining)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.chunk)

#### fn [chunk](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#tymethod.chunk)(&self) -> &[[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)] [ⓘ](#)

Returns a slice starting at the current position and of length between 0
and `Buf::remaining()`. Note that this *can* return a shorter slice (this
allows non-continuous internal representation). [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#tymethod.chunk)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.chunks_vectored)

#### fn [chunks\_vectored](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.chunks_vectored)<'b>(&'b self, dst: &mut [[IoSlice](https://doc.rust-lang.org/nightly/std/io/struct.IoSlice.html "struct std::io::IoSlice")<'b>]) -> [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)

Available on **crate feature `std`** only.

Fills `dst` with potentially multiple slices starting at `self`’s
current position. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.chunks_vectored)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.advance)

#### fn [advance](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#tymethod.advance)(&mut self, cnt: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html))

Advance the internal cursor of the Buf [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#tymethod.advance)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.has_remaining)

#### fn [has\_remaining](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.has_remaining)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Returns true if there are any more bytes to consume [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.has_remaining)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.copy_to_slice)

#### fn [copy\_to\_slice](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.copy_to_slice)(&mut self, dst: &mut [[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)])

Copies bytes from `self` into `dst`. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.copy_to_slice)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_u8)

#### fn [get\_u8](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u8)(&mut self) -> [u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)

Gets an unsigned 8 bit integer from `self`. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u8)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_i8)

#### fn [get\_i8](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i8)(&mut self) -> [i8](https://doc.rust-lang.org/nightly/std/primitive.i8.html)

Gets a signed 8 bit integer from `self`. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i8)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_u16)

#### fn [get\_u16](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u16)(&mut self) -> [u16](https://doc.rust-lang.org/nightly/std/primitive.u16.html)

Gets an unsigned 16 bit integer from `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u16)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_u16_le)

#### fn [get\_u16\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u16_le)(&mut self) -> [u16](https://doc.rust-lang.org/nightly/std/primitive.u16.html)

Gets an unsigned 16 bit integer from `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u16_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_u16_ne)

#### fn [get\_u16\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u16_ne)(&mut self) -> [u16](https://doc.rust-lang.org/nightly/std/primitive.u16.html)

Gets an unsigned 16 bit integer from `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u16_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_i16)

#### fn [get\_i16](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i16)(&mut self) -> [i16](https://doc.rust-lang.org/nightly/std/primitive.i16.html)

Gets a signed 16 bit integer from `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i16)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_i16_le)

#### fn [get\_i16\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i16_le)(&mut self) -> [i16](https://doc.rust-lang.org/nightly/std/primitive.i16.html)

Gets a signed 16 bit integer from `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i16_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_i16_ne)

#### fn [get\_i16\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i16_ne)(&mut self) -> [i16](https://doc.rust-lang.org/nightly/std/primitive.i16.html)

Gets a signed 16 bit integer from `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i16_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_u32)

#### fn [get\_u32](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u32)(&mut self) -> [u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html)

Gets an unsigned 32 bit integer from `self` in the big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u32)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_u32_le)

#### fn [get\_u32\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u32_le)(&mut self) -> [u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html)

Gets an unsigned 32 bit integer from `self` in the little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u32_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_u32_ne)

#### fn [get\_u32\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u32_ne)(&mut self) -> [u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html)

Gets an unsigned 32 bit integer from `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u32_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_i32)

#### fn [get\_i32](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i32)(&mut self) -> [i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html)

Gets a signed 32 bit integer from `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i32)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_i32_le)

#### fn [get\_i32\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i32_le)(&mut self) -> [i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html)

Gets a signed 32 bit integer from `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i32_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_i32_ne)

#### fn [get\_i32\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i32_ne)(&mut self) -> [i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html)

Gets a signed 32 bit integer from `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i32_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_u64)

#### fn [get\_u64](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u64)(&mut self) -> [u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html)

Gets an unsigned 64 bit integer from `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u64)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_u64_le)

#### fn [get\_u64\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u64_le)(&mut self) -> [u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html)

Gets an unsigned 64 bit integer from `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u64_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_u64_ne)

#### fn [get\_u64\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u64_ne)(&mut self) -> [u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html)

Gets an unsigned 64 bit integer from `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u64_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_i64)

#### fn [get\_i64](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i64)(&mut self) -> [i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html)

Gets a signed 64 bit integer from `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i64)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_i64_le)

#### fn [get\_i64\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i64_le)(&mut self) -> [i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html)

Gets a signed 64 bit integer from `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i64_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_i64_ne)

#### fn [get\_i64\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i64_ne)(&mut self) -> [i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html)

Gets a signed 64 bit integer from `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i64_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_u128)

#### fn [get\_u128](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u128)(&mut self) -> [u128](https://doc.rust-lang.org/nightly/std/primitive.u128.html)

Gets an unsigned 128 bit integer from `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u128)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_u128_le)

#### fn [get\_u128\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u128_le)(&mut self) -> [u128](https://doc.rust-lang.org/nightly/std/primitive.u128.html)

Gets an unsigned 128 bit integer from `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u128_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_u128_ne)

#### fn [get\_u128\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u128_ne)(&mut self) -> [u128](https://doc.rust-lang.org/nightly/std/primitive.u128.html)

Gets an unsigned 128 bit integer from `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_u128_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_i128)

#### fn [get\_i128](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i128)(&mut self) -> [i128](https://doc.rust-lang.org/nightly/std/primitive.i128.html)

Gets a signed 128 bit integer from `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i128)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_i128_le)

#### fn [get\_i128\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i128_le)(&mut self) -> [i128](https://doc.rust-lang.org/nightly/std/primitive.i128.html)

Gets a signed 128 bit integer from `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i128_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_i128_ne)

#### fn [get\_i128\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i128_ne)(&mut self) -> [i128](https://doc.rust-lang.org/nightly/std/primitive.i128.html)

Gets a signed 128 bit integer from `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_i128_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_uint)

#### fn [get\_uint](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_uint)(&mut self, nbytes: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html)

Gets an unsigned n-byte integer from `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_uint)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_uint_le)

#### fn [get\_uint\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_uint_le)(&mut self, nbytes: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html)

Gets an unsigned n-byte integer from `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_uint_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_uint_ne)

#### fn [get\_uint\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_uint_ne)(&mut self, nbytes: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html)

Gets an unsigned n-byte integer from `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_uint_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_int)

#### fn [get\_int](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_int)(&mut self, nbytes: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html)

Gets a signed n-byte integer from `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_int)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_int_le)

#### fn [get\_int\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_int_le)(&mut self, nbytes: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html)

Gets a signed n-byte integer from `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_int_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_int_ne)

#### fn [get\_int\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_int_ne)(&mut self, nbytes: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html)

Gets a signed n-byte integer from `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_int_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_f32)

#### fn [get\_f32](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_f32)(&mut self) -> [f32](https://doc.rust-lang.org/nightly/std/primitive.f32.html)

Gets an IEEE754 single-precision (4 bytes) floating point number from
`self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_f32)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_f32_le)

#### fn [get\_f32\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_f32_le)(&mut self) -> [f32](https://doc.rust-lang.org/nightly/std/primitive.f32.html)

Gets an IEEE754 single-precision (4 bytes) floating point number from
`self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_f32_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_f32_ne)

#### fn [get\_f32\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_f32_ne)(&mut self) -> [f32](https://doc.rust-lang.org/nightly/std/primitive.f32.html)

Gets an IEEE754 single-precision (4 bytes) floating point number from
`self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_f32_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_f64)

#### fn [get\_f64](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_f64)(&mut self) -> [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)

Gets an IEEE754 double-precision (8 bytes) floating point number from
`self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_f64)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_f64_le)

#### fn [get\_f64\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_f64_le)(&mut self) -> [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)

Gets an IEEE754 double-precision (8 bytes) floating point number from
`self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_f64_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.get_f64_ne)

#### fn [get\_f64\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_f64_ne)(&mut self) -> [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)

Gets an IEEE754 double-precision (8 bytes) floating point number from
`self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.get_f64_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_copy_to_slice)

#### fn [try\_copy\_to\_slice](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_copy_to_slice)(&mut self, dst: &mut [[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)]) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Copies bytes from `self` into `dst`. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_copy_to_slice)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_u8)

#### fn [try\_get\_u8](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u8)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an unsigned 8 bit integer from `self`. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u8)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_i8)

#### fn [try\_get\_i8](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i8)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[i8](https://doc.rust-lang.org/nightly/std/primitive.i8.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets a signed 8 bit integer from `self`. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i8)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_u16)

#### fn [try\_get\_u16](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u16)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[u16](https://doc.rust-lang.org/nightly/std/primitive.u16.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an unsigned 16 bit integer from `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u16)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_u16_le)

#### fn [try\_get\_u16\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u16_le)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[u16](https://doc.rust-lang.org/nightly/std/primitive.u16.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an unsigned 16 bit integer from `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u16_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_u16_ne)

#### fn [try\_get\_u16\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u16_ne)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[u16](https://doc.rust-lang.org/nightly/std/primitive.u16.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an unsigned 16 bit integer from `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u16_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_i16)

#### fn [try\_get\_i16](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i16)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[i16](https://doc.rust-lang.org/nightly/std/primitive.i16.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets a signed 16 bit integer from `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i16)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_i16_le)

#### fn [try\_get\_i16\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i16_le)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[i16](https://doc.rust-lang.org/nightly/std/primitive.i16.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an signed 16 bit integer from `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i16_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_i16_ne)

#### fn [try\_get\_i16\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i16_ne)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[i16](https://doc.rust-lang.org/nightly/std/primitive.i16.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets a signed 16 bit integer from `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i16_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_u32)

#### fn [try\_get\_u32](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u32)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an unsigned 32 bit integer from `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u32)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_u32_le)

#### fn [try\_get\_u32\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u32_le)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an unsigned 32 bit integer from `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u32_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_u32_ne)

#### fn [try\_get\_u32\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u32_ne)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an unsigned 32 bit integer from `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u32_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_i32)

#### fn [try\_get\_i32](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i32)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets a signed 32 bit integer from `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i32)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_i32_le)

#### fn [try\_get\_i32\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i32_le)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets a signed 32 bit integer from `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i32_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_i32_ne)

#### fn [try\_get\_i32\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i32_ne)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets a signed 32 bit integer from `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i32_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_u64)

#### fn [try\_get\_u64](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u64)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an unsigned 64 bit integer from `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u64)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_u64_le)

#### fn [try\_get\_u64\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u64_le)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an unsigned 64 bit integer from `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u64_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_u64_ne)

#### fn [try\_get\_u64\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u64_ne)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an unsigned 64 bit integer from `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u64_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_i64)

#### fn [try\_get\_i64](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i64)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets a signed 64 bit integer from `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i64)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_i64_le)

#### fn [try\_get\_i64\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i64_le)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets a signed 64 bit integer from `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i64_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_i64_ne)

#### fn [try\_get\_i64\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i64_ne)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets a signed 64 bit integer from `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i64_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_u128)

#### fn [try\_get\_u128](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u128)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[u128](https://doc.rust-lang.org/nightly/std/primitive.u128.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an unsigned 128 bit integer from `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u128)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_u128_le)

#### fn [try\_get\_u128\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u128_le)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[u128](https://doc.rust-lang.org/nightly/std/primitive.u128.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an unsigned 128 bit integer from `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u128_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_u128_ne)

#### fn [try\_get\_u128\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u128_ne)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[u128](https://doc.rust-lang.org/nightly/std/primitive.u128.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an unsigned 128 bit integer from `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_u128_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_i128)

#### fn [try\_get\_i128](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i128)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[i128](https://doc.rust-lang.org/nightly/std/primitive.i128.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets a signed 128 bit integer from `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i128)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_i128_le)

#### fn [try\_get\_i128\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i128_le)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[i128](https://doc.rust-lang.org/nightly/std/primitive.i128.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets a signed 128 bit integer from `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i128_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_i128_ne)

#### fn [try\_get\_i128\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i128_ne)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[i128](https://doc.rust-lang.org/nightly/std/primitive.i128.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets a signed 128 bit integer from `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_i128_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_uint)

#### fn [try\_get\_uint](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_uint)(&mut self, nbytes: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an unsigned n-byte integer from `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_uint)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_uint_le)

#### fn [try\_get\_uint\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_uint_le)(&mut self, nbytes: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an unsigned n-byte integer from `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_uint_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_uint_ne)

#### fn [try\_get\_uint\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_uint_ne)(&mut self, nbytes: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an unsigned n-byte integer from `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_uint_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_int)

#### fn [try\_get\_int](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_int)(&mut self, nbytes: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets a signed n-byte integer from `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_int)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_int_le)

#### fn [try\_get\_int\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_int_le)(&mut self, nbytes: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets a signed n-byte integer from `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_int_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_int_ne)

#### fn [try\_get\_int\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_int_ne)(&mut self, nbytes: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets a signed n-byte integer from `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_int_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_f32)

#### fn [try\_get\_f32](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_f32)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[f32](https://doc.rust-lang.org/nightly/std/primitive.f32.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an IEEE754 single-precision (4 bytes) floating point number from
`self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_f32)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_f32_le)

#### fn [try\_get\_f32\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_f32_le)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[f32](https://doc.rust-lang.org/nightly/std/primitive.f32.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an IEEE754 single-precision (4 bytes) floating point number from
`self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_f32_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_f32_ne)

#### fn [try\_get\_f32\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_f32_ne)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[f32](https://doc.rust-lang.org/nightly/std/primitive.f32.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an IEEE754 single-precision (4 bytes) floating point number from
`self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_f32_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_f64)

#### fn [try\_get\_f64](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_f64)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an IEEE754 double-precision (8 bytes) floating point number from
`self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_f64)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_f64_le)

#### fn [try\_get\_f64\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_f64_le)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an IEEE754 double-precision (8 bytes) floating point number from
`self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_f64_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.try_get_f64_ne)

#### fn [try\_get\_f64\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_f64_ne)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html), [TryGetError](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/struct.TryGetError.html "struct bytes::TryGetError")>

Gets an IEEE754 double-precision (8 bytes) floating point number from
`self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.try_get_f64_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2886)[§](#method.copy_to_bytes)

#### fn [copy\_to\_bytes](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.copy_to_bytes)(&mut self, len: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [Bytes](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/bytes/struct.Bytes.html "struct bytes::bytes::Bytes")

Consumes `len` bytes inside self and returns new instance of `Bytes`
with this data. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.copy_to_bytes)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2394-2396)[§](#method.take)

#### fn [take](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.take)(self, limit: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [Take](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/take/struct.Take.html "struct bytes::buf::take::Take")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Creates an adaptor which will read at most `limit` bytes from `self`. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.take)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2416-2418)[§](#method.chain)

#### fn [chain](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.chain)<U>(self, next: U) -> [Chain](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/chain/struct.Chain.html "struct bytes::buf::chain::Chain")<Self, U> where U: [Buf](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html "trait bytes::buf::buf_impl::Buf"), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Creates an adaptor which will chain this buffer with another. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.chain)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_impl.rs.html#2448-2450)[§](#method.reader)

#### fn [reader](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.reader)(self) -> [Reader](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/reader/struct.Reader.html "struct bytes::buf::reader::Reader")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Available on **crate feature `std`** only.

Creates an adaptor which implements the `Read` trait for `self`. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html#method.reader)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1481)[§](#impl-BufMut-for-Box%3CT%3E)

### impl<T> [BufMut](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html "trait bytes::buf::buf_mut::BufMut") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [BufMut](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html "trait bytes::buf::buf_mut::BufMut") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.remaining_mut)

#### fn [remaining\_mut](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#tymethod.remaining_mut)(&self) -> [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)

Returns the number of bytes that can be written from the current
position until the end of the buffer is reached. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#tymethod.remaining_mut)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.chunk_mut)

#### fn [chunk\_mut](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#tymethod.chunk_mut)(&mut self) -> &mut [UninitSlice](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/uninit_slice/struct.UninitSlice.html "struct bytes::buf::uninit_slice::UninitSlice")

Returns a mutable slice starting at the current BufMut position and of
length between 0 and `BufMut::remaining_mut()`. Note that this *can* be shorter than the
whole remainder of the buffer (this allows non-continuous implementation). [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#tymethod.chunk_mut)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.advance_mut)

#### unsafe fn [advance\_mut](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#tymethod.advance_mut)(&mut self, cnt: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html))

Advance the internal cursor of the BufMut [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#tymethod.advance_mut)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.put_slice)

#### fn [put\_slice](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_slice)(&mut self, src: &[[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)])

Transfer bytes into `self` from `src` and advance the cursor by the
number of bytes written. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_slice)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.put_u8)

#### fn [put\_u8](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u8)(&mut self, n: [u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html))

Writes an unsigned 8 bit integer to `self`. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u8)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.put_i8)

#### fn [put\_i8](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i8)(&mut self, n: [i8](https://doc.rust-lang.org/nightly/std/primitive.i8.html))

Writes a signed 8 bit integer to `self`. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i8)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.put_u16)

#### fn [put\_u16](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u16)(&mut self, n: [u16](https://doc.rust-lang.org/nightly/std/primitive.u16.html))

Writes an unsigned 16 bit integer to `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u16)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.put_u16_le)

#### fn [put\_u16\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u16_le)(&mut self, n: [u16](https://doc.rust-lang.org/nightly/std/primitive.u16.html))

Writes an unsigned 16 bit integer to `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u16_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.put_u16_ne)

#### fn [put\_u16\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u16_ne)(&mut self, n: [u16](https://doc.rust-lang.org/nightly/std/primitive.u16.html))

Writes an unsigned 16 bit integer to `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u16_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.put_i16)

#### fn [put\_i16](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i16)(&mut self, n: [i16](https://doc.rust-lang.org/nightly/std/primitive.i16.html))

Writes a signed 16 bit integer to `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i16)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.put_i16_le)

#### fn [put\_i16\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i16_le)(&mut self, n: [i16](https://doc.rust-lang.org/nightly/std/primitive.i16.html))

Writes a signed 16 bit integer to `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i16_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.put_i16_ne)

#### fn [put\_i16\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i16_ne)(&mut self, n: [i16](https://doc.rust-lang.org/nightly/std/primitive.i16.html))

Writes a signed 16 bit integer to `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i16_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.put_u32)

#### fn [put\_u32](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u32)(&mut self, n: [u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html))

Writes an unsigned 32 bit integer to `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u32)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.put_u32_le)

#### fn [put\_u32\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u32_le)(&mut self, n: [u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html))

Writes an unsigned 32 bit integer to `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u32_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.put_u32_ne)

#### fn [put\_u32\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u32_ne)(&mut self, n: [u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html))

Writes an unsigned 32 bit integer to `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u32_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.put_i32)

#### fn [put\_i32](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i32)(&mut self, n: [i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html))

Writes a signed 32 bit integer to `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i32)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.put_i32_le)

#### fn [put\_i32\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i32_le)(&mut self, n: [i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html))

Writes a signed 32 bit integer to `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i32_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.put_i32_ne)

#### fn [put\_i32\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i32_ne)(&mut self, n: [i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html))

Writes a signed 32 bit integer to `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i32_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.put_u64)

#### fn [put\_u64](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u64)(&mut self, n: [u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html))

Writes an unsigned 64 bit integer to `self` in the big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u64)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.put_u64_le)

#### fn [put\_u64\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u64_le)(&mut self, n: [u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html))

Writes an unsigned 64 bit integer to `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u64_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.put_u64_ne)

#### fn [put\_u64\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u64_ne)(&mut self, n: [u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html))

Writes an unsigned 64 bit integer to `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u64_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.put_i64)

#### fn [put\_i64](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i64)(&mut self, n: [i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html))

Writes a signed 64 bit integer to `self` in the big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i64)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.put_i64_le)

#### fn [put\_i64\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i64_le)(&mut self, n: [i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html))

Writes a signed 64 bit integer to `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i64_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1482)[§](#method.put_i64_ne)

#### fn [put\_i64\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i64_ne)(&mut self, n: [i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html))

Writes a signed 64 bit integer to `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i64_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#128)[§](#method.has_remaining_mut)

#### fn [has\_remaining\_mut](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.has_remaining_mut)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Returns true if there is space in `self` for more bytes. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.has_remaining_mut)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#202-204)[§](#method.put)

#### fn [put](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put)<T>(&mut self, src: T) where T: [Buf](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_impl/trait.Buf.html "trait bytes::buf::buf_impl::Buf"), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Transfer bytes into `self` from `src` and advance the cursor by the
number of bytes written. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#292)[§](#method.put_bytes)

#### fn [put\_bytes](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_bytes)(&mut self, val: [u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html), cnt: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html))

Put `cnt` bytes `val` into `self`. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_bytes)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#816)[§](#method.put_u128)

#### fn [put\_u128](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u128)(&mut self, n: [u128](https://doc.rust-lang.org/nightly/std/primitive.u128.html))

Writes an unsigned 128 bit integer to `self` in the big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u128)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#839)[§](#method.put_u128_le)

#### fn [put\_u128\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u128_le)(&mut self, n: [u128](https://doc.rust-lang.org/nightly/std/primitive.u128.html))

Writes an unsigned 128 bit integer to `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u128_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#866)[§](#method.put_u128_ne)

#### fn [put\_u128\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u128_ne)(&mut self, n: [u128](https://doc.rust-lang.org/nightly/std/primitive.u128.html))

Writes an unsigned 128 bit integer to `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_u128_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#889)[§](#method.put_i128)

#### fn [put\_i128](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i128)(&mut self, n: [i128](https://doc.rust-lang.org/nightly/std/primitive.i128.html))

Writes a signed 128 bit integer to `self` in the big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i128)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#912)[§](#method.put_i128_le)

#### fn [put\_i128\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i128_le)(&mut self, n: [i128](https://doc.rust-lang.org/nightly/std/primitive.i128.html))

Writes a signed 128 bit integer to `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i128_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#939)[§](#method.put_i128_ne)

#### fn [put\_i128\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i128_ne)(&mut self, n: [i128](https://doc.rust-lang.org/nightly/std/primitive.i128.html))

Writes a signed 128 bit integer to `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_i128_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#962)[§](#method.put_uint)

#### fn [put\_uint](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_uint)(&mut self, n: [u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html), nbytes: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html))

Writes an unsigned n-byte integer to `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_uint)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#990)[§](#method.put_uint_le)

#### fn [put\_uint\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_uint_le)(&mut self, n: [u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html), nbytes: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html))

Writes an unsigned n-byte integer to `self` in the little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_uint_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1023)[§](#method.put_uint_ne)

#### fn [put\_uint\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_uint_ne)(&mut self, n: [u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html), nbytes: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html))

Writes an unsigned n-byte integer to `self` in the native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_uint_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1050)[§](#method.put_int)

#### fn [put\_int](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_int)(&mut self, n: [i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html), nbytes: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html))

Writes low `nbytes` of a signed integer to `self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_int)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1078)[§](#method.put_int_le)

#### fn [put\_int\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_int_le)(&mut self, n: [i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html), nbytes: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html))

Writes low `nbytes` of a signed integer to `self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_int_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1111)[§](#method.put_int_ne)

#### fn [put\_int\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_int_ne)(&mut self, n: [i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html), nbytes: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html))

Writes low `nbytes` of a signed integer to `self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_int_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1139)[§](#method.put_f32)

#### fn [put\_f32](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_f32)(&mut self, n: [f32](https://doc.rust-lang.org/nightly/std/primitive.f32.html))

Writes an IEEE754 single-precision (4 bytes) floating point number to
`self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_f32)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1163)[§](#method.put_f32_le)

#### fn [put\_f32\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_f32_le)(&mut self, n: [f32](https://doc.rust-lang.org/nightly/std/primitive.f32.html))

Writes an IEEE754 single-precision (4 bytes) floating point number to
`self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_f32_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1191)[§](#method.put_f32_ne)

#### fn [put\_f32\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_f32_ne)(&mut self, n: [f32](https://doc.rust-lang.org/nightly/std/primitive.f32.html))

Writes an IEEE754 single-precision (4 bytes) floating point number to
`self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_f32_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1215)[§](#method.put_f64)

#### fn [put\_f64](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_f64)(&mut self, n: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html))

Writes an IEEE754 double-precision (8 bytes) floating point number to
`self` in big-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_f64)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1239)[§](#method.put_f64_le)

#### fn [put\_f64\_le](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_f64_le)(&mut self, n: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html))

Writes an IEEE754 double-precision (8 bytes) floating point number to
`self` in little-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_f64_le)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1267)[§](#method.put_f64_ne)

#### fn [put\_f64\_ne](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_f64_ne)(&mut self, n: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html))

Writes an IEEE754 double-precision (8 bytes) floating point number to
`self` in native-endian byte order. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.put_f64_ne)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1285-1287)[§](#method.limit)

#### fn [limit](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.limit)(self, limit: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [Limit](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/limit/struct.Limit.html "struct bytes::buf::limit::Limit")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Creates an adaptor which can write at most `limit` bytes to `self`. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.limit)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1317-1319)[§](#method.writer)

#### fn [writer](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.writer)(self) -> [Writer](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/writer/struct.Writer.html "struct bytes::buf::writer::Writer")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Available on **crate feature `std`** only.

Creates an adaptor which implements the `Write` trait for `self`. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.writer)

[Source](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/src/bytes/buf/buf_mut.rs.html#1345-1347)[§](#method.chain_mut)

#### fn [chain\_mut](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.chain_mut)<U>(self, next: U) -> [Chain](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/chain/struct.Chain.html "struct bytes::buf::chain::Chain")<Self, U> where U: [BufMut](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html "trait bytes::buf::buf_mut::BufMut"), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Creates an adapter which will chain this buffer with another. [Read more](https://docs.rs/bytes/1.10.1/x86_64-unknown-linux-gnu/bytes/buf/buf_mut/trait.BufMut.html#method.chain_mut)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#258)[§](#impl-BufRead-for-Box%3CB%3E)

### impl<B> [BufRead](https://doc.rust-lang.org/nightly/std/io/trait.BufRead.html "trait std::io::BufRead") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<B> where B: [BufRead](https://doc.rust-lang.org/nightly/std/io/trait.BufRead.html "trait std::io::BufRead") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#260)[§](#method.fill_buf)

#### fn [fill\_buf](https://doc.rust-lang.org/nightly/std/io/trait.BufRead.html#tymethod.fill_buf)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<&[[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)], [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

Returns the contents of the internal buffer, filling it with more data, via `Read` methods, if empty. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.BufRead.html#tymethod.fill_buf)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#265)[§](#method.consume-1)

#### fn [consume](https://doc.rust-lang.org/nightly/std/io/trait.BufRead.html#tymethod.consume)(&mut self, amt: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html))

Marks the given `amount` of additional bytes from the internal buffer as having been read.
Subsequent calls to `read` only return bytes that have not been marked as read. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.BufRead.html#tymethod.consume)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#270)[§](#method.has_data_left)

#### fn [has\_data\_left](https://doc.rust-lang.org/nightly/std/io/trait.BufRead.html#method.has_data_left)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

🔬This is a nightly-only experimental API. (`buf_read_has_data_left`)

Checks if there is any data left to be `read`. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.BufRead.html#method.has_data_left)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#275)[§](#method.read_until)

#### fn [read\_until](https://doc.rust-lang.org/nightly/std/io/trait.BufRead.html#method.read_until)(&mut self, byte: [u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html), buf: &mut [Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

Reads all bytes into `buf` until the delimiter `byte` or EOF is reached. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.BufRead.html#method.read_until)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#280)[§](#method.skip_until)

#### fn [skip\_until](https://doc.rust-lang.org/nightly/std/io/trait.BufRead.html#method.skip_until)(&mut self, byte: [u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

Skips all bytes until the delimiter `byte` or EOF is reached. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.BufRead.html#method.skip_until)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#285)[§](#method.read_line)

#### fn [read\_line](https://doc.rust-lang.org/nightly/std/io/trait.BufRead.html#method.read_line)(&mut self, buf: &mut [String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

Reads all bytes until a newline (the `0xA` byte) is reached, and append
them to the provided `String` buffer. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.BufRead.html#method.read_line)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/std/io/mod.rs.html#2576-2578)[§](#method.split)

#### fn [split](https://doc.rust-lang.org/nightly/std/io/trait.BufRead.html#method.split)(self, byte: [u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)) -> [Split](https://doc.rust-lang.org/nightly/std/io/struct.Split.html "struct std::io::Split")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Returns an iterator over the contents of this reader split on the byte
`byte`. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.BufRead.html#method.split)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/std/io/mod.rs.html#2613-2615)[§](#method.lines)

#### fn [lines](https://doc.rust-lang.org/nightly/std/io/trait.BufRead.html#method.lines)(self) -> [Lines](https://doc.rust-lang.org/nightly/std/io/struct.Lines.html "struct std::io::Lines")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Returns an iterator over the lines of this reader. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.BufRead.html#method.lines)

[Source](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/src/icu_provider/buf.rs.html#107)[§](#impl-BufferProvider-for-Box%3CT%3E)

### impl<T> [BufferProvider](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/buf/trait.BufferProvider.html "trait icu_provider::buf::BufferProvider") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [BufferProvider](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/buf/trait.BufferProvider.html "trait icu_provider::buf::BufferProvider") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/src/icu_provider/buf.rs.html#109-113)[§](#method.load_buffer)

#### fn [load\_buffer](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/buf/trait.BufferProvider.html#tymethod.load_buffer)( &self, key: [DataKey](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/key/struct.DataKey.html "struct icu_provider::key::DataKey"), req: [DataRequest](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/request/struct.DataRequest.html "struct icu_provider::request::DataRequest")<'\_>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[DataResponse](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/response/struct.DataResponse.html "struct icu_provider::response::DataResponse")<[BufferMarker](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/buf/struct.BufferMarker.html "struct icu_provider::buf::BufferMarker")>, [DataError](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/error/struct.DataError.html "struct icu_provider::error::DataError")>

Loads a [`DataPayload`](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/response/struct.DataPayload.html "struct icu_provider::response::DataPayload")`<`[`BufferMarker`](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/buf/struct.BufferMarker.html "struct icu_provider::buf::BufferMarker")`>` according to the key and request.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1716)[§](#impl-Clone-for-Box%3CT,+A%3E)

### impl<T, A> [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where T: [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator") + [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1732)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>

Returns a new box with a `clone()` of this box’s contents.

##### [§](#examples-1-2)Examples

```
let x = Box::new(5);
let y = x.clone();

// The value is the same
assert_eq!(x, y);

// But they are unique objects
assert_ne!(&*x as *const i32, &*y as *const i32);
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1759)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>)

Copies `source`’s contents into `self` without creating a new allocation.

##### [§](#examples-1-2)Examples

```
let x = Box::new(5);
let mut y = Box::new(10);
let yp: *const i32 = &*y;

y.clone_from(&x);

// The value is the same
assert_eq!(x, y);

// And no allocation occurred
assert_eq!(yp, &*y);
```

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2079)[§](#impl-Coroutine%3CR%3E-for-Box%3CG,+A%3E)

### impl<G, R, A> [Coroutine](https://doc.rust-lang.org/nightly/core/ops/coroutine/trait.Coroutine.html "trait core::ops::coroutine::Coroutine")<R> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<G, A> where G: [Coroutine](https://doc.rust-lang.org/nightly/core/ops/coroutine/trait.Coroutine.html "trait core::ops::coroutine::Coroutine")<R> + [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2080)[§](#associatedtype.Yield)

#### type [Yield](https://doc.rust-lang.org/nightly/core/ops/coroutine/trait.Coroutine.html#associatedtype.Yield) = <G as [Coroutine](https://doc.rust-lang.org/nightly/core/ops/coroutine/trait.Coroutine.html "trait core::ops::coroutine::Coroutine")<R>>::[Yield](https://doc.rust-lang.org/nightly/core/ops/coroutine/trait.Coroutine.html#associatedtype.Yield "type core::ops::coroutine::Coroutine::Yield")

🔬This is a nightly-only experimental API. (`coroutine_trait`)

The type of value this coroutine yields. [Read more](https://doc.rust-lang.org/nightly/core/ops/coroutine/trait.Coroutine.html#associatedtype.Yield)

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2081)[§](#associatedtype.Return)

#### type [Return](https://doc.rust-lang.org/nightly/core/ops/coroutine/trait.Coroutine.html#associatedtype.Return) = <G as [Coroutine](https://doc.rust-lang.org/nightly/core/ops/coroutine/trait.Coroutine.html "trait core::ops::coroutine::Coroutine")<R>>::[Return](https://doc.rust-lang.org/nightly/core/ops/coroutine/trait.Coroutine.html#associatedtype.Return "type core::ops::coroutine::Coroutine::Return")

🔬This is a nightly-only experimental API. (`coroutine_trait`)

The type of value this coroutine returns. [Read more](https://doc.rust-lang.org/nightly/core/ops/coroutine/trait.Coroutine.html#associatedtype.Return)

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2083)[§](#method.resume)

#### fn [resume](https://doc.rust-lang.org/nightly/core/ops/coroutine/trait.Coroutine.html#tymethod.resume)( self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<G, A>>, arg: R, ) -> [CoroutineState](https://doc.rust-lang.org/nightly/core/ops/coroutine/enum.CoroutineState.html "enum core::ops::coroutine::CoroutineState")<<[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<G, A> as [Coroutine](https://doc.rust-lang.org/nightly/core/ops/coroutine/trait.Coroutine.html "trait core::ops::coroutine::Coroutine")<R>>::[Yield](https://doc.rust-lang.org/nightly/core/ops/coroutine/trait.Coroutine.html#associatedtype.Yield "type core::ops::coroutine::Coroutine::Yield"), <[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<G, A> as [Coroutine](https://doc.rust-lang.org/nightly/core/ops/coroutine/trait.Coroutine.html "trait core::ops::coroutine::Coroutine")<R>>::[Return](https://doc.rust-lang.org/nightly/core/ops/coroutine/trait.Coroutine.html#associatedtype.Return "type core::ops::coroutine::Coroutine::Return")>

🔬This is a nightly-only experimental API. (`coroutine_trait`)

Resumes the execution of this coroutine. [Read more](https://doc.rust-lang.org/nightly/core/ops/coroutine/trait.Coroutine.html#tymethod.resume)

[Source](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/src/icu_provider/data_provider.rs.html#37-40)[§](#impl-DataProvider%3CM%3E-for-Box%3CP%3E)

### impl<M, P> [DataProvider](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/data_provider/trait.DataProvider.html "trait icu_provider::data_provider::DataProvider")<M> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<P> where M: [KeyedDataMarker](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/marker/trait.KeyedDataMarker.html "trait icu_provider::marker::KeyedDataMarker"), P: [DataProvider](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/data_provider/trait.DataProvider.html "trait icu_provider::data_provider::DataProvider")<M> + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/src/icu_provider/data_provider.rs.html#43)[§](#method.load)

#### fn [load](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/data_provider/trait.DataProvider.html#tymethod.load)(&self, req: [DataRequest](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/request/struct.DataRequest.html "struct icu_provider::request::DataRequest")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[DataResponse](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/response/struct.DataResponse.html "struct icu_provider::response::DataResponse")<M>, [DataError](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/error/struct.DataError.html "struct icu_provider::error::DataError")>

Query the provider for data, returning the result. [Read more](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/data_provider/trait.DataProvider.html#tymethod.load)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1923)[§](#impl-Debug-for-Box%3CT,+A%3E)

### impl<T, A> [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where T: [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1924)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")>

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1669)[§](#impl-Default-for-Box%3CT%3E)

### impl<T> [Default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html "trait core::default::Default") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [Default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html "trait core::default::Default"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1672)[§](#method.default)

#### fn [default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html#tymethod.default)() -> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>

Creates a `Box<T>`, with the `Default` value for T.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1940)[§](#impl-Deref-for-Box%3CT,+A%3E)

### impl<T, A> [Deref](https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html "trait core::ops::deref::Deref") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"), T: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1941)[§](#associatedtype.Target)

#### type [Target](https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html#associatedtype.Target) = T

The resulting type after dereferencing.

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1943)[§](#method.deref)

#### fn [deref](https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html#tymethod.deref)(&self) -> [&T](https://doc.rust-lang.org/nightly/std/primitive.reference.html)

Dereferences the value.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1949)[§](#impl-DerefMut-for-Box%3CT,+A%3E)

### impl<T, A> [DerefMut](https://doc.rust-lang.org/nightly/core/ops/deref/trait.DerefMut.html "trait core::ops::deref::DerefMut") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"), T: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1950)[§](#method.deref_mut)

#### fn [deref\_mut](https://doc.rust-lang.org/nightly/core/ops/deref/trait.DerefMut.html#tymethod.deref_mut)(&mut self) -> [&mut T](https://doc.rust-lang.org/nightly/std/primitive.reference.html)

Mutably dereferences the value.

[Source](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/src/serde/de/impls.rs.html#1965-1969)[§](#impl-Deserialize%3C'de%3E-for-Box%3CT%3E)

### impl<'de, T> [Deserialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html "trait serde::de::Deserialize")<'de> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [Deserialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html "trait serde::de::Deserialize")<'de>,

Available on **crate features `std` or `alloc`** only.

[Source](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/src/serde/de/impls.rs.html#1965-1969)[§](#method.deserialize)

#### fn [deserialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html#tymethod.deserialize)<D>( deserializer: D, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>, <D as [Deserializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html "trait serde::de::Deserializer")<'de>>::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")> where D: [Deserializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html "trait serde::de::Deserializer")<'de>,

Deserialize this value from the given Serde deserializer. [Read more](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html#tymethod.deserialize)

[Source](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/src/serde_with/de/impls.rs.html#146-148)[§](#impl-DeserializeAs%3C'de,+Box%3CT%3E%3E-for-Box%3CU%3E)

### impl<'de, T, U> [DeserializeAs](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/serde_with/de/trait.DeserializeAs.html "trait serde_with::de::DeserializeAs")<'de, [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<U> where U: [DeserializeAs](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/serde_with/de/trait.DeserializeAs.html "trait serde_with::de::DeserializeAs")<'de, T>,

[Source](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/src/serde_with/de/impls.rs.html#150-152)[§](#method.deserialize_as)

#### fn [deserialize\_as](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/serde_with/de/trait.DeserializeAs.html#tymethod.deserialize_as)<D>( deserializer: D, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>, <D as [Deserializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html "trait serde::de::Deserializer")<'de>>::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")> where D: [Deserializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html "trait serde::de::Deserializer")<'de>,

Deserialize this value from the given Serde deserializer.

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#impl-Deserializer%3C'de%3E-for-Box%3CT%3E)

### impl<'de, T> [Deserializer](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html "trait erased_serde::de::Deserializer")<'de> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [Deserializer](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html "trait erased_serde::de::Deserializer")<'de> + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_any)

#### fn [erased\_deserialize\_any](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_any)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_bool)

#### fn [erased\_deserialize\_bool](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_bool)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_i8)

#### fn [erased\_deserialize\_i8](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_i8)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_i16)

#### fn [erased\_deserialize\_i16](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_i16)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_i32)

#### fn [erased\_deserialize\_i32](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_i32)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_i64)

#### fn [erased\_deserialize\_i64](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_i64)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_i128)

#### fn [erased\_deserialize\_i128](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_i128)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_u8)

#### fn [erased\_deserialize\_u8](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_u8)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_u16)

#### fn [erased\_deserialize\_u16](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_u16)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_u32)

#### fn [erased\_deserialize\_u32](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_u32)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_u64)

#### fn [erased\_deserialize\_u64](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_u64)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_u128)

#### fn [erased\_deserialize\_u128](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_u128)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_f32)

#### fn [erased\_deserialize\_f32](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_f32)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_f64)

#### fn [erased\_deserialize\_f64](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_f64)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_char)

#### fn [erased\_deserialize\_char](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_char)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_str)

#### fn [erased\_deserialize\_str](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_str)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_string)

#### fn [erased\_deserialize\_string](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_string)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_bytes)

#### fn [erased\_deserialize\_bytes](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_bytes)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_byte_buf)

#### fn [erased\_deserialize\_byte\_buf](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_byte_buf)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_option)

#### fn [erased\_deserialize\_option](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_option)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_unit)

#### fn [erased\_deserialize\_unit](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_unit)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_unit_struct)

#### fn [erased\_deserialize\_unit\_struct](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_unit_struct)( &mut self, name: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_newtype_struct)

#### fn [erased\_deserialize\_newtype\_struct](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_newtype_struct)( &mut self, name: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_seq)

#### fn [erased\_deserialize\_seq](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_seq)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_tuple)

#### fn [erased\_deserialize\_tuple](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_tuple)( &mut self, len: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_tuple_struct)

#### fn [erased\_deserialize\_tuple\_struct](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_tuple_struct)( &mut self, name: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), len: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_map)

#### fn [erased\_deserialize\_map](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_map)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_struct)

#### fn [erased\_deserialize\_struct](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_struct)( &mut self, name: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), fields: &'static [&'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)], visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_identifier)

#### fn [erased\_deserialize\_identifier](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_identifier)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_enum)

#### fn [erased\_deserialize\_enum](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_enum)( &mut self, name: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), variants: &'static [&'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)], visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_deserialize_ignored_any)

#### fn [erased\_deserialize\_ignored\_any](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_deserialize_ignored_any)( &mut self, visitor: &mut dyn Visitor<'de>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<Out, [Error](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/error/struct.Error.html "struct erased_serde::error::Error")>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/de.rs.html#1575)[§](#method.erased_is_human_readable)

#### fn [erased\_is\_human\_readable](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/de/trait.Deserializer.html#tymethod.erased_is_human_readable)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1916)[§](#impl-Display-for-Box%3CT,+A%3E)

### impl<T, A> [Display](https://doc.rust-lang.org/nightly/core/fmt/trait.Display.html "trait core::fmt::Display") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where T: [Display](https://doc.rust-lang.org/nightly/core/fmt/trait.Display.html "trait core::fmt::Display") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1917)[§](#method.fmt-1)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Display.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")>

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Display.html#tymethod.fmt)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed/iter.rs.html#61)[§](#impl-DoubleEndedIterator-for-Box%3CI,+A%3E)

### impl<I, A> [DoubleEndedIterator](https://doc.rust-lang.org/nightly/core/iter/traits/double_ended/trait.DoubleEndedIterator.html "trait core::iter::traits::double_ended::DoubleEndedIterator") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<I, A> where I: [DoubleEndedIterator](https://doc.rust-lang.org/nightly/core/iter/traits/double_ended/trait.DoubleEndedIterator.html "trait core::iter::traits::double_ended::DoubleEndedIterator") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed/iter.rs.html#62)[§](#method.next_back)

#### fn [next\_back](https://doc.rust-lang.org/nightly/core/iter/traits/double_ended/trait.DoubleEndedIterator.html#tymethod.next_back)(&mut self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<<I as [Iterator](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator")>::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")>

Removes and returns an element from the end of the iterator. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/double_ended/trait.DoubleEndedIterator.html#tymethod.next_back)

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed/iter.rs.html#65)[§](#method.nth_back)

#### fn [nth\_back](https://doc.rust-lang.org/nightly/core/iter/traits/double_ended/trait.DoubleEndedIterator.html#method.nth_back)(&mut self, n: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<<I as [Iterator](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator")>::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")>

Returns the `n`th element from the end of the iterator. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/double_ended/trait.DoubleEndedIterator.html#method.nth_back)

[Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/double_ended.rs.html#138)[§](#method.advance_back_by)

#### fn [advance\_back\_by](https://doc.rust-lang.org/nightly/core/iter/traits/double_ended/trait.DoubleEndedIterator.html#method.advance_back_by)(&mut self, n: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [NonZero](https://doc.rust-lang.org/nightly/core/num/nonzero/struct.NonZero.html "struct core::num::nonzero::NonZero")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)>>

🔬This is a nightly-only experimental API. (`iter_advance_by`)

Advances the iterator from the back by `n` elements. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/double_ended/trait.DoubleEndedIterator.html#method.advance_back_by)

1.27.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/double_ended.rs.html#230-234)[§](#method.try_rfold)

#### fn [try\_rfold](https://doc.rust-lang.org/nightly/core/iter/traits/double_ended/trait.DoubleEndedIterator.html#method.try_rfold)<B, F, R>(&mut self, init: B, f: F) -> R where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(B, Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> R, R: [Try](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html "trait core::ops::try_trait::Try")<Output = B>,

This is the reverse version of [`Iterator::try_fold()`](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.try_fold "method core::iter::traits::iterator::Iterator::try_fold"): it takes
elements starting from the back of the iterator. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/double_ended/trait.DoubleEndedIterator.html#method.try_rfold)

1.27.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/double_ended.rs.html#301-304)[§](#method.rfold)

#### fn [rfold](https://doc.rust-lang.org/nightly/core/iter/traits/double_ended/trait.DoubleEndedIterator.html#method.rfold)<B, F>(self, init: B, f: F) -> B where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(B, Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> B,

An iterator method that reduces the iterator’s elements to a single,
final value, starting from the back. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/double_ended/trait.DoubleEndedIterator.html#method.rfold)

1.27.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/double_ended.rs.html#356-359)[§](#method.rfind)

#### fn [rfind](https://doc.rust-lang.org/nightly/core/iter/traits/double_ended/trait.DoubleEndedIterator.html#method.rfind)<P>(&mut self, predicate: P) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), P: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(&Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html),

Searches for an element of an iterator from the back that satisfies a predicate. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/double_ended/trait.DoubleEndedIterator.html#method.rfind)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1651)[§](#impl-Drop-for-Box%3CT,+A%3E)

### impl<T, A> [Drop](https://doc.rust-lang.org/nightly/core/ops/drop/trait.Drop.html "trait core::ops::drop::Drop") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"), T: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1653)[§](#method.drop)

#### fn [drop](https://doc.rust-lang.org/nightly/core/ops/drop/trait.Drop.html#tymethod.drop)(&mut self)

Executes the destructor for this type. [Read more](https://doc.rust-lang.org/nightly/core/ops/drop/trait.Drop.html#tymethod.drop)

[Source](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/src/icu_provider/data_provider.rs.html#99-102)[§](#impl-DynamicDataProvider%3CM%3E-for-Box%3CP%3E)

### impl<M, P> [DynamicDataProvider](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/data_provider/trait.DynamicDataProvider.html "trait icu_provider::data_provider::DynamicDataProvider")<M> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<P> where M: [DataMarker](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/marker/trait.DataMarker.html "trait icu_provider::marker::DataMarker"), P: [DynamicDataProvider](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/data_provider/trait.DynamicDataProvider.html "trait icu_provider::data_provider::DynamicDataProvider")<M> + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/src/icu_provider/data_provider.rs.html#105)[§](#method.load_data)

#### fn [load\_data](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/data_provider/trait.DynamicDataProvider.html#tymethod.load_data)( &self, key: [DataKey](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/key/struct.DataKey.html "struct icu_provider::key::DataKey"), req: [DataRequest](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/request/struct.DataRequest.html "struct icu_provider::request::DataRequest")<'\_>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[DataResponse](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/response/struct.DataResponse.html "struct icu_provider::response::DataResponse")<M>, [DataError](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/error/struct.DataError.html "struct icu_provider::error::DataError")>

Query the provider for data, returning the result. [Read more](https://docs.rs/icu_provider/1.5.0/x86_64-unknown-linux-gnu/icu_provider/data_provider/trait.DynamicDataProvider.html#tymethod.load_data)

[Source](https://docs.rs/zerovec/0.10.4/x86_64-unknown-linux-gnu/src/zerovec/ule/encode.rs.html#120)[§](#impl-EncodeAsVarULE%3CT%3E-for-Box%3CT%3E)

### impl<T> [EncodeAsVarULE](https://docs.rs/zerovec/0.10.4/x86_64-unknown-linux-gnu/zerovec/ule/encode/trait.EncodeAsVarULE.html "trait zerovec::ule::encode::EncodeAsVarULE")<T> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [VarULE](https://docs.rs/zerovec/0.10.4/x86_64-unknown-linux-gnu/zerovec/ule/trait.VarULE.html "trait zerovec::ule::VarULE") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/zerovec/0.10.4/x86_64-unknown-linux-gnu/src/zerovec/ule/encode.rs.html#121)[§](#method.encode_var_ule_as_slices)

#### fn [encode\_var\_ule\_as\_slices](https://docs.rs/zerovec/0.10.4/x86_64-unknown-linux-gnu/zerovec/ule/encode/trait.EncodeAsVarULE.html#tymethod.encode_var_ule_as_slices)<R>(&self, cb: impl [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(&[&[[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)]]) -> R) -> R

Calls `cb` with a piecewise list of byte slices that when concatenated
produce the memory pattern of the corresponding instance of `T`. [Read more](https://docs.rs/zerovec/0.10.4/x86_64-unknown-linux-gnu/zerovec/ule/encode/trait.EncodeAsVarULE.html#tymethod.encode_var_ule_as_slices)

[Source](https://docs.rs/zerovec/0.10.4/x86_64-unknown-linux-gnu/src/zerovec/ule/encode.rs.html#63)[§](#method.encode_var_ule_len)

#### fn [encode\_var\_ule\_len](https://docs.rs/zerovec/0.10.4/x86_64-unknown-linux-gnu/zerovec/ule/encode/trait.EncodeAsVarULE.html#method.encode_var_ule_len)(&self) -> [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)

Return the length, in bytes, of the corresponding [`VarULE`](https://docs.rs/zerovec/0.10.4/x86_64-unknown-linux-gnu/zerovec/ule/trait.VarULE.html "trait zerovec::ule::VarULE") type

[Source](https://docs.rs/zerovec/0.10.4/x86_64-unknown-linux-gnu/src/zerovec/ule/encode.rs.html#69)[§](#method.encode_var_ule_write)

#### fn [encode\_var\_ule\_write](https://docs.rs/zerovec/0.10.4/x86_64-unknown-linux-gnu/zerovec/ule/encode/trait.EncodeAsVarULE.html#method.encode_var_ule_write)(&self, dst: &mut [[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)])

Write the corresponding [`VarULE`](https://docs.rs/zerovec/0.10.4/x86_64-unknown-linux-gnu/zerovec/ule/trait.VarULE.html "trait zerovec::ule::VarULE") type to the `dst` buffer. `dst` should
be the size of [`Self::encode_var_ule_len()`](https://docs.rs/zerovec/0.10.4/x86_64-unknown-linux-gnu/zerovec/ule/encode/trait.EncodeAsVarULE.html#method.encode_var_ule_len "method zerovec::ule::encode::EncodeAsVarULE::encode_var_ule_len::encode_var_ule_len")

1.8.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2111)[§](#impl-Error-for-Box%3CE%3E)

### impl<E> [Error](https://doc.rust-lang.org/nightly/core/error/trait.Error.html "trait core::error::Error") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<E> where E: [Error](https://doc.rust-lang.org/nightly/core/error/trait.Error.html "trait core::error::Error"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2113)[§](#method.description)

#### fn [description](https://doc.rust-lang.org/nightly/core/error/trait.Error.html#method.description)(&self) -> &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

👎Deprecated since 1.42.0: use the Display impl or to\_string()

[Read more](https://doc.rust-lang.org/nightly/core/error/trait.Error.html#method.description)

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2118)[§](#method.cause)

#### fn [cause](https://doc.rust-lang.org/nightly/core/error/trait.Error.html#method.cause)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&dyn [Error](https://doc.rust-lang.org/nightly/core/error/trait.Error.html "trait core::error::Error")>

👎Deprecated since 1.33.0: replaced by Error::source, which can support downcasting

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2122)[§](#method.source)

#### fn [source](https://doc.rust-lang.org/nightly/core/error/trait.Error.html#method.source)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&(dyn [Error](https://doc.rust-lang.org/nightly/core/error/trait.Error.html "trait core::error::Error") + 'static)>

Returns the lower-level source of this error, if any. [Read more](https://doc.rust-lang.org/nightly/core/error/trait.Error.html#method.source)

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2126)[§](#method.provide)

#### fn [provide](https://doc.rust-lang.org/nightly/core/error/trait.Error.html#method.provide)<'b>(&'b self, request: &mut [Request](https://doc.rust-lang.org/nightly/core/error/struct.Request.html "struct core::error::Request")<'b>)

🔬This is a nightly-only experimental API. (`error_generic_member_access`)

Provides type-based access to context intended for error reports. [Read more](https://doc.rust-lang.org/nightly/core/error/trait.Error.html#method.provide)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed/iter.rs.html#70)[§](#impl-ExactSizeIterator-for-Box%3CI,+A%3E)

### impl<I, A> [ExactSizeIterator](https://doc.rust-lang.org/nightly/core/iter/traits/exact_size/trait.ExactSizeIterator.html "trait core::iter::traits::exact_size::ExactSizeIterator") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<I, A> where I: [ExactSizeIterator](https://doc.rust-lang.org/nightly/core/iter/traits/exact_size/trait.ExactSizeIterator.html "trait core::iter::traits::exact_size::ExactSizeIterator") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed/iter.rs.html#71)[§](#method.len)

#### fn [len](https://doc.rust-lang.org/nightly/core/iter/traits/exact_size/trait.ExactSizeIterator.html#method.len)(&self) -> [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)

Returns the exact remaining length of the iterator. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/exact_size/trait.ExactSizeIterator.html#method.len)

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed/iter.rs.html#74)[§](#method.is_empty)

#### fn [is\_empty](https://doc.rust-lang.org/nightly/core/iter/traits/exact_size/trait.ExactSizeIterator.html#method.is_empty)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

🔬This is a nightly-only experimental API. (`exact_size_is_empty`)

Returns `true` if the iterator is empty. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/exact_size/trait.ExactSizeIterator.html#method.is_empty)

1.35.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1978)[§](#impl-Fn%3CArgs%3E-for-Box%3CF,+A%3E)

### impl<Args, F, A> [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")<Args> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<F, A> where Args: [Tuple](https://doc.rust-lang.org/nightly/core/marker/trait.Tuple.html "trait core::marker::Tuple"), F: [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")<Args> + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1979)[§](#method.call)

#### extern "rust-call" fn [call](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html#tymethod.call)( &self, args: Args, ) -> <[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<F, A> as [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")<Args>>::[Output](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html#associatedtype.Output "type core::ops::function::FnOnce::Output")

🔬This is a nightly-only experimental API. (`fn_traits`)

Performs the call operation.

1.35.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1971)[§](#impl-FnMut%3CArgs%3E-for-Box%3CF,+A%3E)

### impl<Args, F, A> [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")<Args> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<F, A> where Args: [Tuple](https://doc.rust-lang.org/nightly/core/marker/trait.Tuple.html "trait core::marker::Tuple"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")<Args> + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1972)[§](#method.call_mut)

#### extern "rust-call" fn [call\_mut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html#tymethod.call_mut)( &mut self, args: Args, ) -> <[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<F, A> as [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")<Args>>::[Output](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html#associatedtype.Output "type core::ops::function::FnOnce::Output")

🔬This is a nightly-only experimental API. (`fn_traits`)

Performs the call operation.

1.35.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1962)[§](#impl-FnOnce%3CArgs%3E-for-Box%3CF,+A%3E)

### impl<Args, F, A> [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")<Args> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<F, A> where Args: [Tuple](https://doc.rust-lang.org/nightly/core/marker/trait.Tuple.html "trait core::marker::Tuple"), F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")<Args> + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1963)[§](#associatedtype.Output-1)

#### type [Output](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html#associatedtype.Output) = <F as [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")<Args>>::[Output](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html#associatedtype.Output "type core::ops::function::FnOnce::Output")

The returned type after the call operator is used.

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1965)[§](#method.call_once)

#### extern "rust-call" fn [call\_once](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html#tymethod.call_once)( self, args: Args, ) -> <[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<F, A> as [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")<Args>>::[Output](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html#associatedtype.Output "type core::ops::function::FnOnce::Output")

🔬This is a nightly-only experimental API. (`fn_traits`)

Performs the call operation.

1.6.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed/convert.rs.html#23)[§](#impl-From%3CT%3E-for-Box%3CT%3E)

### impl<T> [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<T> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed/convert.rs.html#37)[§](#method.from)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(t: T) -> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>

Converts a `T` into a `Box<T>`

The conversion allocates on the heap and moves `t`
from the stack into it.

##### [§](#examples-1)Examples

```
let x = 5;
let boxed = Box::new(5);

assert_eq!(Box::from(x), boxed);
```

[Source](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/src/futures_core/future.rs.html#101)[§](#impl-FusedFuture-for-Box%3CF%3E)

### impl<F> [FusedFuture](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.FusedFuture.html "trait futures_core::future::FusedFuture") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<F> where F: [FusedFuture](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.FusedFuture.html "trait futures_core::future::FusedFuture") + [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/src/futures_core/future.rs.html#102)[§](#method.is_terminated)

#### fn [is\_terminated](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/future/trait.FusedFuture.html#tymethod.is_terminated)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Returns `true` if the underlying future should no longer be polled.

[Source](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/src/futures_core/stream.rs.html#240)[§](#impl-FusedStream-for-Box%3CS%3E)

### impl<S> [FusedStream](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/stream/trait.FusedStream.html "trait futures_core::stream::FusedStream") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<S> where S: [FusedStream](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/stream/trait.FusedStream.html "trait futures_core::stream::FusedStream") + [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/src/futures_core/stream.rs.html#241)[§](#method.is_terminated-1)

#### fn [is\_terminated](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/stream/trait.FusedStream.html#tymethod.is_terminated)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Returns `true` if the stream should no longer be polled.

1.36.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2102)[§](#impl-Future-for-Box%3CF,+A%3E)

### impl<F, A> [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<F, A> where F: [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future") + [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2103)[§](#associatedtype.Output-1)

#### type [Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output) = <F as [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future")>::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output")

The type of value produced on completion.

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2105)[§](#method.poll)

#### fn [poll](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#tymethod.poll)( self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<F, A>>, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>, ) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<<[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<F, A> as [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future")>::[Output](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#associatedtype.Output "type core::future::future::Future::Output")>

Attempts to resolve the future to a final value, registering
the current task for wakeup if the value is not yet available. [Read more](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html#tymethod.poll)

[Source](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/src/raw_window_handle/borrowed.rs.html#52)[§](#impl-HasDisplayHandle-for-Box%3CH%3E)

### impl<H> [HasDisplayHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/trait.HasDisplayHandle.html "trait raw_window_handle::borrowed::HasDisplayHandle") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<H> where H: [HasDisplayHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/trait.HasDisplayHandle.html "trait raw_window_handle::borrowed::HasDisplayHandle") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Available on **crate feature `alloc`** only.

[Source](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/src/raw_window_handle/borrowed.rs.html#53)[§](#method.display_handle)

#### fn [display\_handle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/trait.HasDisplayHandle.html#tymethod.display_handle)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[DisplayHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/struct.DisplayHandle.html "struct raw_window_handle::borrowed::DisplayHandle")<'\_>, [HandleError](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/enum.HandleError.html "enum raw_window_handle::HandleError")>

Get a handle to the display controller of the windowing system.

[Source](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/src/raw_window_handle/borrowed.rs.html#180)[§](#impl-HasWindowHandle-for-Box%3CH%3E)

### impl<H> [HasWindowHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/trait.HasWindowHandle.html "trait raw_window_handle::borrowed::HasWindowHandle") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<H> where H: [HasWindowHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/trait.HasWindowHandle.html "trait raw_window_handle::borrowed::HasWindowHandle") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Available on **crate feature `alloc`** only.

[Source](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/src/raw_window_handle/borrowed.rs.html#181)[§](#method.window_handle)

#### fn [window\_handle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/trait.HasWindowHandle.html#tymethod.window_handle)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[WindowHandle](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/borrowed/struct.WindowHandle.html "struct raw_window_handle::borrowed::WindowHandle")<'\_>, [HandleError](https://docs.rs/raw-window-handle/0.6.2/x86_64-unknown-linux-gnu/raw_window_handle/enum.HandleError.html "enum raw_window_handle::HandleError")>

Get a handle to the window.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1857)[§](#impl-Hash-for-Box%3CT,+A%3E)

### impl<T, A> [Hash](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html "trait core::hash::Hash") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where T: [Hash](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html "trait core::hash::Hash") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1858)[§](#method.hash)

#### fn [hash](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#tymethod.hash)<H>(&self, state: [&mut H](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) where H: [Hasher](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"),

Feeds this value into the given [`Hasher`](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"). [Read more](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#tymethod.hash)

1.3.0 · [Source](https://doc.rust-lang.org/nightly/src/core/hash/mod.rs.html#235-237)[§](#method.hash_slice)

#### fn [hash\_slice](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#method.hash_slice)<H>(data: &[Self], state: [&mut H](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) where H: [Hasher](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Feeds a slice of this type into the given [`Hasher`](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"). [Read more](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#method.hash_slice)

1.22.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1864)[§](#impl-Hasher-for-Box%3CT,+A%3E)

### impl<T, A> [Hasher](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where T: [Hasher](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1865)[§](#method.finish)

#### fn [finish](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html#tymethod.finish)(&self) -> [u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html)

Returns the hash value for the values written so far. [Read more](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html#tymethod.finish)

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1868)[§](#method.write)

#### fn [write](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html#tymethod.write)(&mut self, bytes: &[[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)])

Writes some data into this `Hasher`. [Read more](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html#tymethod.write)

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1871)[§](#method.write_u8)

#### fn [write\_u8](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html#method.write_u8)(&mut self, i: [u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html))

Writes a single `u8` into this hasher.

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1874)[§](#method.write_u16)

#### fn [write\_u16](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html#method.write_u16)(&mut self, i: [u16](https://doc.rust-lang.org/nightly/std/primitive.u16.html))

Writes a single `u16` into this hasher.

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1877)[§](#method.write_u32)

#### fn [write\_u32](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html#method.write_u32)(&mut self, i: [u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html))

Writes a single `u32` into this hasher.

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1880)[§](#method.write_u64)

#### fn [write\_u64](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html#method.write_u64)(&mut self, i: [u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html))

Writes a single `u64` into this hasher.

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1883)[§](#method.write_u128)

#### fn [write\_u128](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html#method.write_u128)(&mut self, i: [u128](https://doc.rust-lang.org/nightly/std/primitive.u128.html))

Writes a single `u128` into this hasher.

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1886)[§](#method.write_usize)

#### fn [write\_usize](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html#method.write_usize)(&mut self, i: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html))

Writes a single `usize` into this hasher.

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1889)[§](#method.write_i8)

#### fn [write\_i8](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html#method.write_i8)(&mut self, i: [i8](https://doc.rust-lang.org/nightly/std/primitive.i8.html))

Writes a single `i8` into this hasher.

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1892)[§](#method.write_i16)

#### fn [write\_i16](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html#method.write_i16)(&mut self, i: [i16](https://doc.rust-lang.org/nightly/std/primitive.i16.html))

Writes a single `i16` into this hasher.

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1895)[§](#method.write_i32)

#### fn [write\_i32](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html#method.write_i32)(&mut self, i: [i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html))

Writes a single `i32` into this hasher.

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1898)[§](#method.write_i64)

#### fn [write\_i64](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html#method.write_i64)(&mut self, i: [i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html))

Writes a single `i64` into this hasher.

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1901)[§](#method.write_i128)

#### fn [write\_i128](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html#method.write_i128)(&mut self, i: [i128](https://doc.rust-lang.org/nightly/std/primitive.i128.html))

Writes a single `i128` into this hasher.

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1904)[§](#method.write_isize)

#### fn [write\_isize](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html#method.write_isize)(&mut self, i: [isize](https://doc.rust-lang.org/nightly/std/primitive.isize.html))

Writes a single `isize` into this hasher.

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1907)[§](#method.write_length_prefix)

#### fn [write\_length\_prefix](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html#method.write_length_prefix)(&mut self, len: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html))

🔬This is a nightly-only experimental API. (`hasher_prefixfree_extras`)

Writes a length prefix into this hasher, as part of being prefix-free. [Read more](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html#method.write_length_prefix)

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1910)[§](#method.write_str)

#### fn [write\_str](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html#method.write_str)(&mut self, s: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html))

🔬This is a nightly-only experimental API. (`hasher_prefixfree_extras`)

Writes a single `str` into this hasher. [Read more](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html#method.write_str)

[Source](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/src/image/image.rs.html#736)[§](#impl-ImageDecoder-for-Box%3CT%3E)

### impl<T> [ImageDecoder](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/image/trait.ImageDecoder.html "trait image::image::ImageDecoder") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [ImageDecoder](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/image/trait.ImageDecoder.html "trait image::image::ImageDecoder") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/src/image/image.rs.html#737)[§](#method.dimensions)

#### fn [dimensions](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/image/trait.ImageDecoder.html#tymethod.dimensions)(&self) -> ([u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html), [u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html))

Returns a tuple containing the width and height of the image

[Source](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/src/image/image.rs.html#740)[§](#method.color_type)

#### fn [color\_type](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/image/trait.ImageDecoder.html#tymethod.color_type)(&self) -> [ColorType](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/color/enum.ColorType.html "enum image::color::ColorType")

Returns the color type of the image data produced by this decoder

[Source](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/src/image/image.rs.html#743)[§](#method.original_color_type)

#### fn [original\_color\_type](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/image/trait.ImageDecoder.html#method.original_color_type)(&self) -> [ExtendedColorType](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/color/enum.ExtendedColorType.html "enum image::color::ExtendedColorType")

Returns the color type of the image file before decoding

[Source](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/src/image/image.rs.html#746)[§](#method.icc_profile)

#### fn [icc\_profile](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/image/trait.ImageDecoder.html#method.icc_profile)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)>>, [ImageError](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/error/enum.ImageError.html "enum image::error::ImageError")>

Returns the ICC color profile embedded in the image, or `Ok(None)` if the image does not have one. [Read more](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/image/trait.ImageDecoder.html#method.icc_profile)

[Source](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/src/image/image.rs.html#749)[§](#method.exif_metadata)

#### fn [exif\_metadata](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/image/trait.ImageDecoder.html#method.exif_metadata)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)>>, [ImageError](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/error/enum.ImageError.html "enum image::error::ImageError")>

Returns the raw [Exif](https://en.wikipedia.org/wiki/Exif) chunk, if it is present.
A third-party crate such as [`kamadak-exif`](https://docs.rs/kamadak-exif/) is required to actually parse it. [Read more](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/image/trait.ImageDecoder.html#method.exif_metadata)

[Source](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/src/image/image.rs.html#752)[§](#method.total_bytes)

#### fn [total\_bytes](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/image/trait.ImageDecoder.html#method.total_bytes)(&self) -> [u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html)

Returns the total number of bytes in the decoded image. [Read more](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/image/trait.ImageDecoder.html#method.total_bytes)

[Source](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/src/image/image.rs.html#755-757)[§](#method.read_image)

#### fn [read\_image](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/image/trait.ImageDecoder.html#tymethod.read_image)(self, buf: &mut [[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)]) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [ImageError](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/error/enum.ImageError.html "enum image::error::ImageError")> where [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Returns all the bytes in the image. [Read more](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/image/trait.ImageDecoder.html#tymethod.read_image)

[Source](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/src/image/image.rs.html#761)[§](#method.read_image_boxed)

#### fn [read\_image\_boxed](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/image/trait.ImageDecoder.html#tymethod.read_image_boxed)(self: [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>>, buf: &mut [[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)]) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [ImageError](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/error/enum.ImageError.html "enum image::error::ImageError")>

Use `read_image` instead; this method is an implementation detail needed so the trait can
be object safe. [Read more](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/image/trait.ImageDecoder.html#tymethod.read_image_boxed)

[Source](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/src/image/image.rs.html#764)[§](#method.set_limits)

#### fn [set\_limits](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/image/trait.ImageDecoder.html#method.set_limits)(&mut self, limits: [Limits](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/image_reader/struct.Limits.html "struct image::image_reader::Limits")) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [ImageError](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/error/enum.ImageError.html "enum image::error::ImageError")>

Set the decoder to have the specified limits. See [`Limits`](.././io/struct.Limits.html) for the different kinds of
limits that is possible to set. [Read more](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/image/trait.ImageDecoder.html#method.set_limits)

[Source](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/src/image/image.rs.html#660)[§](#method.orientation)

#### fn [orientation](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/image/trait.ImageDecoder.html#method.orientation)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Orientation](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/metadata/enum.Orientation.html "enum image::metadata::Orientation"), [ImageError](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/error/enum.ImageError.html "enum image::error::ImageError")>

Returns the orientation of the image. [Read more](https://docs.rs/image/0.25.6/x86_64-unknown-linux-gnu/image/image/trait.ImageDecoder.html#method.orientation)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed/iter.rs.html#18)[§](#impl-Iterator-for-Box%3CI,+A%3E)

### impl<I, A> [Iterator](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<I, A> where I: [Iterator](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed/iter.rs.html#19)[§](#associatedtype.Item-1)

#### type [Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item) = <I as [Iterator](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator")>::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")

The type of the elements being iterated over.

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed/iter.rs.html#20)[§](#method.next)

#### fn [next](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#tymethod.next)(&mut self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<<I as [Iterator](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator")>::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")>

Advances the iterator and returns the next value. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#tymethod.next)

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed/iter.rs.html#23)[§](#method.size_hint-1)

#### fn [size\_hint](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.size_hint)(&self) -> ([usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)>)

Returns the bounds on the remaining length of the iterator. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.size_hint)

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed/iter.rs.html#26)[§](#method.nth)

#### fn [nth](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.nth)(&mut self, n: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<<I as [Iterator](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator")>::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")>

Returns the `n`th element of the iterator. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.nth)

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed/iter.rs.html#29)[§](#method.last)

#### fn [last](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.last)(self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<<I as [Iterator](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator")>::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")>

Consumes the iterator, returning the last element. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.last)

[Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#109-113)[§](#method.next_chunk)

#### fn [next\_chunk](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.next_chunk)<const N: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)>( &mut self, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"); [N](https://doc.rust-lang.org/nightly/std/primitive.array.html)], [IntoIter](https://doc.rust-lang.org/nightly/core/array/iter/struct.IntoIter.html "struct core::array::iter::IntoIter")<Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"), N>> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

🔬This is a nightly-only experimental API. (`iter_next_chunk`)

Advances the iterator and returns an array containing the next `N` values. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.next_chunk)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#221-223)[§](#method.count)

#### fn [count](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.count)(self) -> [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html) where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Consumes the iterator, counting the number of iterations and returning it. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.count)

[Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#296)[§](#method.advance_by)

#### fn [advance\_by](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.advance_by)(&mut self, n: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [NonZero](https://doc.rust-lang.org/nightly/core/num/nonzero/struct.NonZero.html "struct core::num::nonzero::NonZero")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)>>

🔬This is a nightly-only experimental API. (`iter_advance_by`)

Advances the iterator by `n` elements. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.advance_by)

1.28.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#397-399)[§](#method.step_by)

#### fn [step\_by](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.step_by)(self, step: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [StepBy](https://doc.rust-lang.org/nightly/core/iter/adapters/step_by/struct.StepBy.html "struct core::iter::adapters::step_by::StepBy")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Creates an iterator starting at the same point, but stepping by
the given amount at each iteration. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.step_by)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#468-471)[§](#method.chain-1)

#### fn [chain](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.chain)<U>(self, other: U) -> [Chain](https://doc.rust-lang.org/nightly/core/iter/adapters/chain/struct.Chain.html "struct core::iter::adapters::chain::Chain")<Self, <U as [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator")>::[IntoIter](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html#associatedtype.IntoIter "type core::iter::traits::collect::IntoIterator::IntoIter")> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), U: [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator")<Item = Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")>,

Takes two iterators and creates a new iterator over both in sequence. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.chain)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#586-589)[§](#method.zip)

#### fn [zip](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.zip)<U>(self, other: U) -> [Zip](https://doc.rust-lang.org/nightly/core/iter/adapters/zip/struct.Zip.html "struct core::iter::adapters::zip::Zip")<Self, <U as [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator")>::[IntoIter](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html#associatedtype.IntoIter "type core::iter::traits::collect::IntoIterator::IntoIter")> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), U: [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator"),

‘Zips up’ two iterators into a single iterator of pairs. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.zip)

[Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#628-631)[§](#method.intersperse)

#### fn [intersperse](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.intersperse)(self, separator: Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> [Intersperse](https://doc.rust-lang.org/nightly/core/iter/adapters/intersperse/struct.Intersperse.html "struct core::iter::adapters::intersperse::Intersperse")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"): [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone"),

🔬This is a nightly-only experimental API. (`iter_intersperse`)

Creates a new iterator which places a copy of `separator` between adjacent
items of the original iterator. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.intersperse)

[Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#686-689)[§](#method.intersperse_with)

#### fn [intersperse\_with](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.intersperse_with)<G>(self, separator: G) -> [IntersperseWith](https://doc.rust-lang.org/nightly/core/iter/adapters/intersperse/struct.IntersperseWith.html "struct core::iter::adapters::intersperse::IntersperseWith")<Self, G> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), G: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")() -> Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"),

🔬This is a nightly-only experimental API. (`iter_intersperse`)

Creates a new iterator which places an item generated by `separator`
between adjacent items of the original iterator. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.intersperse_with)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#745-748)[§](#method.map)

#### fn [map](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.map)<B, F>(self, f: F) -> [Map](https://doc.rust-lang.org/nightly/core/iter/adapters/map/struct.Map.html "struct core::iter::adapters::map::Map")<Self, F> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> B,

Takes a closure and creates an iterator which calls that closure on each
element. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.map)

1.21.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#790-793)[§](#method.for_each)

#### fn [for\_each](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.for_each)<F>(self, f: F) where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")),

Calls a closure on each element of an iterator. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.for_each)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#866-869)[§](#method.filter)

#### fn [filter](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.filter)<P>(self, predicate: P) -> [Filter](https://doc.rust-lang.org/nightly/core/iter/adapters/filter/struct.Filter.html "struct core::iter::adapters::filter::Filter")<Self, P> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), P: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(&Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html),

Creates an iterator which uses a closure to determine if an element
should be yielded. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.filter)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#911-914)[§](#method.filter_map)

#### fn [filter\_map](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.filter_map)<B, F>(self, f: F) -> [FilterMap](https://doc.rust-lang.org/nightly/core/iter/adapters/filter_map/struct.FilterMap.html "struct core::iter::adapters::filter_map::FilterMap")<Self, F> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<B>,

Creates an iterator that both filters and maps. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.filter_map)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#958-960)[§](#method.enumerate)

#### fn [enumerate](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.enumerate)(self) -> [Enumerate](https://doc.rust-lang.org/nightly/core/iter/adapters/enumerate/struct.Enumerate.html "struct core::iter::adapters::enumerate::Enumerate")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Creates an iterator which gives the current iteration count as well as
the next value. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.enumerate)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#1029-1031)[§](#method.peekable)

#### fn [peekable](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.peekable)(self) -> [Peekable](https://doc.rust-lang.org/nightly/core/iter/adapters/peekable/struct.Peekable.html "struct core::iter::adapters::peekable::Peekable")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Creates an iterator which can use the [`peek`](https://doc.rust-lang.org/nightly/core/iter/adapters/peekable/struct.Peekable.html#method.peek "method core::iter::adapters::peekable::Peekable::peek") and [`peek_mut`](https://doc.rust-lang.org/nightly/core/iter/adapters/peekable/struct.Peekable.html#method.peek_mut "method core::iter::adapters::peekable::Peekable::peek_mut") methods
to look at the next element of the iterator without consuming it. See
their documentation for more information. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.peekable)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#1094-1097)[§](#method.skip_while)

#### fn [skip\_while](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.skip_while)<P>(self, predicate: P) -> [SkipWhile](https://doc.rust-lang.org/nightly/core/iter/adapters/skip_while/struct.SkipWhile.html "struct core::iter::adapters::skip_while::SkipWhile")<Self, P> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), P: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(&Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html),

Creates an iterator that [`skip`](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.skip "method core::iter::traits::iterator::Iterator::skip")s elements based on a predicate. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.skip_while)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#1175-1178)[§](#method.take_while)

#### fn [take\_while](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.take_while)<P>(self, predicate: P) -> [TakeWhile](https://doc.rust-lang.org/nightly/core/iter/adapters/take_while/struct.TakeWhile.html "struct core::iter::adapters::take_while::TakeWhile")<Self, P> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), P: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(&Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html),

Creates an iterator that yields elements based on a predicate. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.take_while)

1.57.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#1263-1266)[§](#method.map_while)

#### fn [map\_while](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.map_while)<B, P>(self, predicate: P) -> [MapWhile](https://doc.rust-lang.org/nightly/core/iter/adapters/map_while/struct.MapWhile.html "struct core::iter::adapters::map_while::MapWhile")<Self, P> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), P: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<B>,

Creates an iterator that both yields elements based on a predicate and maps. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.map_while)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#1292-1294)[§](#method.skip)

#### fn [skip](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.skip)(self, n: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [Skip](https://doc.rust-lang.org/nightly/core/iter/adapters/skip/struct.Skip.html "struct core::iter::adapters::skip::Skip")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Creates an iterator that skips the first `n` elements. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.skip)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#1345-1347)[§](#method.take-1)

#### fn [take](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.take)(self, n: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)) -> [Take](https://doc.rust-lang.org/nightly/core/iter/adapters/take/struct.Take.html "struct core::iter::adapters::take::Take")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Creates an iterator that yields the first `n` elements, or fewer
if the underlying iterator ends sooner. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.take)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#1392-1395)[§](#method.scan)

#### fn [scan](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.scan)<St, B, F>(self, initial\_state: St, f: F) -> [Scan](https://doc.rust-lang.org/nightly/core/iter/adapters/scan/struct.Scan.html "struct core::iter::adapters::scan::Scan")<Self, St, F> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")([&mut St](https://doc.rust-lang.org/nightly/std/primitive.reference.html), Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<B>,

An iterator adapter which, like [`fold`](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.fold "method core::iter::traits::iterator::Iterator::fold"), holds internal state, but
unlike [`fold`](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.fold "method core::iter::traits::iterator::Iterator::fold"), produces a new iterator. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.scan)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#1430-1434)[§](#method.flat_map)

#### fn [flat\_map](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.flat_map)<U, F>(self, f: F) -> [FlatMap](https://doc.rust-lang.org/nightly/core/iter/adapters/flatten/struct.FlatMap.html "struct core::iter::adapters::flatten::FlatMap")<Self, U, F> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), U: [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> U,

Creates an iterator that works like map, but flattens nested structure. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.flat_map)

1.29.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#1514-1517)[§](#method.flatten)

#### fn [flatten](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.flatten)(self) -> [Flatten](https://doc.rust-lang.org/nightly/core/iter/adapters/flatten/struct.Flatten.html "struct core::iter::adapters::flatten::Flatten")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"): [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator"),

Creates an iterator that flattens nested structure. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.flatten)

[Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#1670-1673)[§](#method.map_windows)

#### fn [map\_windows](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.map_windows)<F, R, const N: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)>(self, f: F) -> [MapWindows](https://doc.rust-lang.org/nightly/core/iter/adapters/map_windows/struct.MapWindows.html "struct core::iter::adapters::map_windows::MapWindows")<Self, F, N> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(&[Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"); [N](https://doc.rust-lang.org/nightly/std/primitive.array.html)]) -> R,

🔬This is a nightly-only experimental API. (`iter_map_windows`)

Calls the given function `f` for each contiguous window of size `N` over
`self` and returns an iterator over the outputs of `f`. Like [`slice::windows()`](https://doc.rust-lang.org/nightly/std/primitive.slice.html#method.windows "method slice::windows"),
the windows during mapping overlap as well. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.map_windows)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#1732-1734)[§](#method.fuse)

#### fn [fuse](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.fuse)(self) -> [Fuse](https://doc.rust-lang.org/nightly/core/iter/adapters/fuse/struct.Fuse.html "struct core::iter::adapters::fuse::Fuse")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Creates an iterator which ends after the first [`None`](https://doc.rust-lang.org/nightly/core/option/enum.Option.html#variant.None "variant core::option::Option::None"). [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.fuse)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#1816-1819)[§](#method.inspect)

#### fn [inspect](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.inspect)<F>(self, f: F) -> [Inspect](https://doc.rust-lang.org/nightly/core/iter/adapters/inspect/struct.Inspect.html "struct core::iter::adapters::inspect::Inspect")<Self, F> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(&Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")),

Does something with each element of an iterator, passing the value on. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.inspect)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#1853-1855)[§](#method.by_ref)

#### fn [by\_ref](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.by_ref)(&mut self) -> &mut Self where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Creates a “by reference” adapter for this instance of `Iterator`. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.by_ref)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#1972-1974)[§](#method.collect)

#### fn [collect](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.collect)<B>(self) -> B where B: [FromIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.FromIterator.html "trait core::iter::traits::collect::FromIterator")<Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")>, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Transforms an iterator into a collection. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.collect)

[Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#2059-2063)[§](#method.try_collect)

#### fn [try\_collect](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.try_collect)<B>( &mut self, ) -> <<Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item") as [Try](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html "trait core::ops::try_trait::Try")>::[Residual](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html#associatedtype.Residual "type core::ops::try_trait::Try::Residual") as [Residual](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Residual.html "trait core::ops::try_trait::Residual")<B>>::[TryType](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Residual.html#associatedtype.TryType "type core::ops::try_trait::Residual::TryType") where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"): [Try](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html "trait core::ops::try_trait::Try"), <Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item") as [Try](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html "trait core::ops::try_trait::Try")>::[Residual](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html#associatedtype.Residual "type core::ops::try_trait::Try::Residual"): [Residual](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Residual.html "trait core::ops::try_trait::Residual")<B>, B: [FromIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.FromIterator.html "trait core::iter::traits::collect::FromIterator")<<Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item") as [Try](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html "trait core::ops::try_trait::Try")>::[Output](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html#associatedtype.Output "type core::ops::try_trait::Try::Output")>,

🔬This is a nightly-only experimental API. (`iterator_try_collect`)

Fallibly transforms an iterator into a collection, short circuiting if
a failure is encountered. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.try_collect)

[Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#2131-2133)[§](#method.collect_into)

#### fn [collect\_into](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.collect_into)<E>(self, collection: [&mut E](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [&mut E](https://doc.rust-lang.org/nightly/std/primitive.reference.html) where E: [Extend](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.Extend.html "trait core::iter::traits::collect::Extend")<Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")>, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

🔬This is a nightly-only experimental API. (`iter_collect_into`)

Collects all the items from an iterator into a collection. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.collect_into)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#2163-2167)[§](#method.partition)

#### fn [partition](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.partition)<B, F>(self, f: F) -> [(B, B)](https://doc.rust-lang.org/nightly/std/primitive.tuple.html) where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), B: [Default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html "trait core::default::Default") + [Extend](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.Extend.html "trait core::iter::traits::collect::Extend")<Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")>, F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(&Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html),

Consumes an iterator, creating two collections from it. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.partition)

[Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#2225-2228)[§](#method.partition_in_place)

#### fn [partition\_in\_place](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.partition_in_place)<'a, T, P>(self, predicate: P) -> [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html) where T: 'a, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized") + [DoubleEndedIterator](https://doc.rust-lang.org/nightly/core/iter/traits/double_ended/trait.DoubleEndedIterator.html "trait core::iter::traits::double_ended::DoubleEndedIterator")<Item = [&'a mut T](https://doc.rust-lang.org/nightly/std/primitive.reference.html)>, P: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")([&T](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html),

🔬This is a nightly-only experimental API. (`iter_partition_in_place`)

Reorders the elements of this iterator *in-place* according to the given predicate,
such that all those that return `true` precede all those that return `false`.
Returns the number of `true` elements found. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.partition_in_place)

[Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#2282-2285)[§](#method.is_partitioned)

#### fn [is\_partitioned](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.is_partitioned)<P>(self, predicate: P) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), P: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html),

🔬This is a nightly-only experimental API. (`iter_is_partitioned`)

Checks if the elements of this iterator are partitioned according to the given predicate,
such that all those that return `true` precede all those that return `false`. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.is_partitioned)

1.27.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#2376-2380)[§](#method.try_fold)

#### fn [try\_fold](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.try_fold)<B, F, R>(&mut self, init: B, f: F) -> R where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(B, Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> R, R: [Try](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html "trait core::ops::try_trait::Try")<Output = B>,

An iterator method that applies a function as long as it returns
successfully, producing a single, final value. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.try_fold)

1.27.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#2434-2438)[§](#method.try_for_each)

#### fn [try\_for\_each](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.try_for_each)<F, R>(&mut self, f: F) -> R where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> R, R: [Try](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html "trait core::ops::try_trait::Try")<Output = [()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>,

An iterator method that applies a fallible function to each item in the
iterator, stopping at the first error and returning that error. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.try_for_each)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#2553-2556)[§](#method.fold)

#### fn [fold](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.fold)<B, F>(self, init: B, f: F) -> B where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(B, Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> B,

Folds every element into an accumulator by applying an operation,
returning the final result. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.fold)

1.51.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#2590-2593)[§](#method.reduce)

#### fn [reduce](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.reduce)<F>(self, f: F) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"), Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"),

Reduces the elements to a single one, by repeatedly applying a reducing
operation. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.reduce)

[Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#2661-2667)[§](#method.try_reduce)

#### fn [try\_reduce](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.try_reduce)<R>( &mut self, f: impl [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"), Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> R, ) -> <<R as [Try](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html "trait core::ops::try_trait::Try")>::[Residual](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html#associatedtype.Residual "type core::ops::try_trait::Try::Residual") as [Residual](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Residual.html "trait core::ops::try_trait::Residual")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<<R as [Try](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html "trait core::ops::try_trait::Try")>::[Output](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html#associatedtype.Output "type core::ops::try_trait::Try::Output")>>>::[TryType](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Residual.html#associatedtype.TryType "type core::ops::try_trait::Residual::TryType") where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), R: [Try](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html "trait core::ops::try_trait::Try")<Output = Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")>, <R as [Try](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html "trait core::ops::try_trait::Try")>::[Residual](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html#associatedtype.Residual "type core::ops::try_trait::Try::Residual"): [Residual](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Residual.html "trait core::ops::try_trait::Residual")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")>>,

🔬This is a nightly-only experimental API. (`iterator_try_reduce`)

Reduces the elements to a single one by repeatedly applying a reducing operation. If the
closure returns a failure, the failure is propagated back to the caller immediately. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.try_reduce)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#2719-2722)[§](#method.all)

#### fn [all](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.all)<F>(&mut self, f: F) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html),

Tests if every element of the iterator matches a predicate. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.all)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#2772-2775)[§](#method.any)

#### fn [any](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.any)<F>(&mut self, f: F) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html),

Tests if any element of the iterator matches a predicate. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.any)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#2835-2838)[§](#method.find)

#### fn [find](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.find)<P>(&mut self, predicate: P) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), P: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(&Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html),

Searches for an element of an iterator that satisfies a predicate. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.find)

1.30.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#2866-2869)[§](#method.find_map)

#### fn [find\_map](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.find_map)<B, F>(&mut self, f: F) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<B> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<B>,

Applies function to the elements of iterator and returns
the first non-none result. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.find_map)

[Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#2924-2930)[§](#method.try_find)

#### fn [try\_find](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.try_find)<R>( &mut self, f: impl [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(&Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> R, ) -> <<R as [Try](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html "trait core::ops::try_trait::Try")>::[Residual](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html#associatedtype.Residual "type core::ops::try_trait::Try::Residual") as [Residual](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Residual.html "trait core::ops::try_trait::Residual")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")>>>::[TryType](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Residual.html#associatedtype.TryType "type core::ops::try_trait::Residual::TryType") where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), R: [Try](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html "trait core::ops::try_trait::Try")<Output = [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>, <R as [Try](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html "trait core::ops::try_trait::Try")>::[Residual](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html#associatedtype.Residual "type core::ops::try_trait::Try::Residual"): [Residual](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Residual.html "trait core::ops::try_trait::Residual")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")>>,

🔬This is a nightly-only experimental API. (`try_find`)

Applies function to the elements of iterator and returns
the first true result or the first error. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.try_find)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3007-3010)[§](#method.position)

#### fn [position](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.position)<P>(&mut self, predicate: P) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), P: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html),

Searches for an element in an iterator, returning its index. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.position)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3072-3075)[§](#method.rposition)

#### fn [rposition](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.rposition)<P>(&mut self, predicate: P) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)> where P: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized") + [ExactSizeIterator](https://doc.rust-lang.org/nightly/core/iter/traits/exact_size/trait.ExactSizeIterator.html "trait core::iter::traits::exact_size::ExactSizeIterator") + [DoubleEndedIterator](https://doc.rust-lang.org/nightly/core/iter/traits/double_ended/trait.DoubleEndedIterator.html "trait core::iter::traits::double_ended::DoubleEndedIterator"),

Searches for an element in an iterator from the right, returning its
index. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.rposition)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3121-3124)[§](#method.max)

#### fn [max](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.max)(self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"): [Ord](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html "trait core::cmp::Ord"),

Returns the maximum element of an iterator. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.max)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3157-3160)[§](#method.min)

#### fn [min](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.min)(self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"): [Ord](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html "trait core::cmp::Ord"),

Returns the minimum element of an iterator. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.min)

1.6.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3179-3182)[§](#method.max_by_key)

#### fn [max\_by\_key](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.max_by_key)<B, F>(self, f: F) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")> where B: [Ord](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html "trait core::cmp::Ord"), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(&Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> B,

Returns the element that gives the maximum value from the
specified function. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.max_by_key)

1.15.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3212-3215)[§](#method.max_by)

#### fn [max\_by](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.max_by)<F>(self, compare: F) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(&Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"), &Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> [Ordering](https://doc.rust-lang.org/nightly/core/cmp/enum.Ordering.html "enum core::cmp::Ordering"),

Returns the element that gives the maximum value with respect to the
specified comparison function. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.max_by)

1.6.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3239-3242)[§](#method.min_by_key)

#### fn [min\_by\_key](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.min_by_key)<B, F>(self, f: F) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")> where B: [Ord](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html "trait core::cmp::Ord"), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(&Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> B,

Returns the element that gives the minimum value from the
specified function. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.min_by_key)

1.15.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3272-3275)[§](#method.min_by)

#### fn [min\_by](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.min_by)<F>(self, compare: F) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(&Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"), &Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> [Ordering](https://doc.rust-lang.org/nightly/core/cmp/enum.Ordering.html "enum core::cmp::Ordering"),

Returns the element that gives the minimum value with respect to the
specified comparison function. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.min_by)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3309-3311)[§](#method.rev)

#### fn [rev](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.rev)(self) -> [Rev](https://doc.rust-lang.org/nightly/core/iter/adapters/rev/struct.Rev.html "struct core::iter::adapters::rev::Rev")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized") + [DoubleEndedIterator](https://doc.rust-lang.org/nightly/core/iter/traits/double_ended/trait.DoubleEndedIterator.html "trait core::iter::traits::double_ended::DoubleEndedIterator"),

Reverses an iterator’s direction. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.rev)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3345-3349)[§](#method.unzip)

#### fn [unzip](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.unzip)<A, B, FromA, FromB>(self) -> [(FromA, FromB)](https://doc.rust-lang.org/nightly/std/primitive.tuple.html) where FromA: [Default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html "trait core::default::Default") + [Extend](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.Extend.html "trait core::iter::traits::collect::Extend")<A>, FromB: [Default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html "trait core::default::Default") + [Extend](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.Extend.html "trait core::iter::traits::collect::Extend")<B>, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized") + [Iterator](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator")<Item = [(A, B)](https://doc.rust-lang.org/nightly/std/primitive.tuple.html)>,

Converts an iterator of pairs into a pair of containers. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.unzip)

1.36.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3376-3379)[§](#method.copied)

#### fn [copied](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.copied)<'a, T>(self) -> [Copied](https://doc.rust-lang.org/nightly/core/iter/adapters/copied/struct.Copied.html "struct core::iter::adapters::copied::Copied")<Self> where T: 'a + [Copy](https://doc.rust-lang.org/nightly/core/marker/trait.Copy.html "trait core::marker::Copy"), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized") + [Iterator](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator")<Item = [&'a T](https://doc.rust-lang.org/nightly/std/primitive.reference.html)>,

Creates an iterator which copies all of its elements. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.copied)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3424-3427)[§](#method.cloned)

#### fn [cloned](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.cloned)<'a, T>(self) -> [Cloned](https://doc.rust-lang.org/nightly/core/iter/adapters/cloned/struct.Cloned.html "struct core::iter::adapters::cloned::Cloned")<Self> where T: 'a + [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone"), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized") + [Iterator](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator")<Item = [&'a T](https://doc.rust-lang.org/nightly/std/primitive.reference.html)>,

Creates an iterator which [`clone`](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone "method core::clone::Clone::clone")s all of its elements. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.cloned)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3456-3458)[§](#method.cycle)

#### fn [cycle](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.cycle)(self) -> [Cycle](https://doc.rust-lang.org/nightly/core/iter/adapters/cycle/struct.Cycle.html "struct core::iter::adapters::cycle::Cycle")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized") + [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone"),

Repeats an iterator endlessly. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.cycle)

[Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3499-3501)[§](#method.array_chunks)

#### fn [array\_chunks](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.array_chunks)<const N: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)>(self) -> [ArrayChunks](https://doc.rust-lang.org/nightly/core/iter/adapters/array_chunks/struct.ArrayChunks.html "struct core::iter::adapters::array_chunks::ArrayChunks")<Self, N> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

🔬This is a nightly-only experimental API. (`iter_array_chunks`)

Returns an iterator over `N` elements of the iterator at a time. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.array_chunks)

1.11.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3535-3538)[§](#method.sum)

#### fn [sum](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.sum)<S>(self) -> S where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), S: [Sum](https://doc.rust-lang.org/nightly/core/iter/traits/accum/trait.Sum.html "trait core::iter::traits::accum::Sum")<Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")>,

Sums the elements of an iterator. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.sum)

1.11.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3567-3570)[§](#method.product)

#### fn [product](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.product)<P>(self) -> P where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), P: [Product](https://doc.rust-lang.org/nightly/core/iter/traits/accum/trait.Product.html "trait core::iter::traits::accum::Product")<Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")>,

Iterates over the entire iterator, multiplying all the elements [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.product)

1.5.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3588-3592)[§](#method.cmp)

#### fn [cmp](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.cmp)<I>(self, other: I) -> [Ordering](https://doc.rust-lang.org/nightly/core/cmp/enum.Ordering.html "enum core::cmp::Ordering") where I: [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator")<Item = Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")>, Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"): [Ord](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html "trait core::cmp::Ord"), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Lexicographically](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#lexicographical-comparison "trait core::cmp::Ord") compares the elements of this [`Iterator`](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator") with those
of another. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.cmp)

[Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3615-3619)[§](#method.cmp_by)

#### fn [cmp\_by](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.cmp_by)<I, F>(self, other: I, cmp: F) -> [Ordering](https://doc.rust-lang.org/nightly/core/cmp/enum.Ordering.html "enum core::cmp::Ordering") where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), I: [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"), <I as [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator")>::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html#associatedtype.Item "type core::iter::traits::collect::IntoIterator::Item")) -> [Ordering](https://doc.rust-lang.org/nightly/core/cmp/enum.Ordering.html "enum core::cmp::Ordering"),

🔬This is a nightly-only experimental API. (`iter_order_by`)

[Lexicographically](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#lexicographical-comparison "trait core::cmp::Ord") compares the elements of this [`Iterator`](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator") with those
of another with respect to the specified comparison function. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.cmp_by)

1.5.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3671-3675)[§](#method.partial_cmp)

#### fn [partial\_cmp](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.partial_cmp)<I>(self, other: I) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Ordering](https://doc.rust-lang.org/nightly/core/cmp/enum.Ordering.html "enum core::cmp::Ordering")> where I: [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator"), Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"): [PartialOrd](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html "trait core::cmp::PartialOrd")<<I as [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator")>::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html#associatedtype.Item "type core::iter::traits::collect::IntoIterator::Item")>, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Lexicographically](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#lexicographical-comparison "trait core::cmp::Ord") compares the [`PartialOrd`](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html "trait core::cmp::PartialOrd") elements of
this [`Iterator`](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator") with those of another. The comparison works like short-circuit
evaluation, returning a result without comparing the remaining elements.
As soon as an order can be determined, the evaluation stops and a result is returned. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.partial_cmp)

[Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3707-3711)[§](#method.partial_cmp_by)

#### fn [partial\_cmp\_by](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.partial_cmp_by)<I, F>(self, other: I, partial\_cmp: F) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Ordering](https://doc.rust-lang.org/nightly/core/cmp/enum.Ordering.html "enum core::cmp::Ordering")> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), I: [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"), <I as [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator")>::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html#associatedtype.Item "type core::iter::traits::collect::IntoIterator::Item")) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Ordering](https://doc.rust-lang.org/nightly/core/cmp/enum.Ordering.html "enum core::cmp::Ordering")>,

🔬This is a nightly-only experimental API. (`iter_order_by`)

[Lexicographically](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#lexicographical-comparison "trait core::cmp::Ord") compares the elements of this [`Iterator`](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator") with those
of another with respect to the specified comparison function. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.partial_cmp_by)

1.5.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3740-3744)[§](#method.eq)

#### fn [eq](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.eq)<I>(self, other: I) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) where I: [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator"), Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"): [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq")<<I as [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator")>::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html#associatedtype.Item "type core::iter::traits::collect::IntoIterator::Item")>, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Determines if the elements of this [`Iterator`](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator") are equal to those of
another. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.eq)

[Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3763-3767)[§](#method.eq_by)

#### fn [eq\_by](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.eq_by)<I, F>(self, other: I, eq: F) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), I: [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"), <I as [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator")>::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html#associatedtype.Item "type core::iter::traits::collect::IntoIterator::Item")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html),

🔬This is a nightly-only experimental API. (`iter_order_by`)

Determines if the elements of this [`Iterator`](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator") are equal to those of
another with respect to the specified equality function. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.eq_by)

1.5.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3795-3799)[§](#method.ne)

#### fn [ne](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.ne)<I>(self, other: I) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) where I: [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator"), Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"): [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq")<<I as [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator")>::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html#associatedtype.Item "type core::iter::traits::collect::IntoIterator::Item")>, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Determines if the elements of this [`Iterator`](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator") are not equal to those of
another. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.ne)

1.5.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3816-3820)[§](#method.lt)

#### fn [lt](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.lt)<I>(self, other: I) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) where I: [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator"), Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"): [PartialOrd](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html "trait core::cmp::PartialOrd")<<I as [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator")>::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html#associatedtype.Item "type core::iter::traits::collect::IntoIterator::Item")>, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Determines if the elements of this [`Iterator`](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator") are [lexicographically](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#lexicographical-comparison "trait core::cmp::Ord")
less than those of another. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.lt)

1.5.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3837-3841)[§](#method.le)

#### fn [le](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.le)<I>(self, other: I) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) where I: [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator"), Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"): [PartialOrd](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html "trait core::cmp::PartialOrd")<<I as [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator")>::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html#associatedtype.Item "type core::iter::traits::collect::IntoIterator::Item")>, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Determines if the elements of this [`Iterator`](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator") are [lexicographically](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#lexicographical-comparison "trait core::cmp::Ord")
less or equal to those of another. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.le)

1.5.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3858-3862)[§](#method.gt)

#### fn [gt](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.gt)<I>(self, other: I) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) where I: [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator"), Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"): [PartialOrd](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html "trait core::cmp::PartialOrd")<<I as [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator")>::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html#associatedtype.Item "type core::iter::traits::collect::IntoIterator::Item")>, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Determines if the elements of this [`Iterator`](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator") are [lexicographically](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#lexicographical-comparison "trait core::cmp::Ord")
greater than those of another. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.gt)

1.5.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3879-3883)[§](#method.ge)

#### fn [ge](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.ge)<I>(self, other: I) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) where I: [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator"), Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"): [PartialOrd](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html "trait core::cmp::PartialOrd")<<I as [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator")>::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html#associatedtype.Item "type core::iter::traits::collect::IntoIterator::Item")>, Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Determines if the elements of this [`Iterator`](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator") are [lexicographically](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#lexicographical-comparison "trait core::cmp::Ord")
greater than or equal to those of another. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.ge)

1.82.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3908-3911)[§](#method.is_sorted)

#### fn [is\_sorted](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.is_sorted)(self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"): [PartialOrd](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html "trait core::cmp::PartialOrd"),

Checks if the elements of this iterator are sorted. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.is_sorted)

1.82.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3934-3937)[§](#method.is_sorted_by)

#### fn [is\_sorted\_by](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.is_sorted_by)<F>(self, compare: F) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(&Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item"), &Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html),

Checks if the elements of this iterator are sorted using the given comparator function. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.is_sorted_by)

1.82.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/iterator.rs.html#3978-3982)[§](#method.is_sorted_by_key)

#### fn [is\_sorted\_by\_key](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.is_sorted_by_key)<F, K>(self, f: F) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), F: [FnMut](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnMut.html "trait core::ops::function::FnMut")(Self::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#associatedtype.Item "type core::iter::traits::iterator::Iterator::Item")) -> K, K: [PartialOrd](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html "trait core::cmp::PartialOrd"),

Checks if the elements of this iterator are sorted using the given key extraction
function. [Read more](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html#method.is_sorted_by_key)

[Source](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/src/futures_task/spawn.rs.html#141)[§](#impl-LocalSpawn-for-Box%3CSp%3E)

### impl<Sp> [LocalSpawn](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/spawn/trait.LocalSpawn.html "trait futures_task::spawn::LocalSpawn") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<Sp> where Sp: [LocalSpawn](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/spawn/trait.LocalSpawn.html "trait futures_task::spawn::LocalSpawn") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/src/futures_task/spawn.rs.html#142)[§](#method.spawn_local_obj)

#### fn [spawn\_local\_obj](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/spawn/trait.LocalSpawn.html#tymethod.spawn_local_obj)( &self, future: [LocalFutureObj](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/future_obj/struct.LocalFutureObj.html "struct futures_task::future_obj::LocalFutureObj")<'static, [()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [SpawnError](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/spawn/struct.SpawnError.html "struct futures_task::spawn::SpawnError")>

Spawns a future that will be run to completion. [Read more](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/spawn/trait.LocalSpawn.html#tymethod.spawn_local_obj)

[Source](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/src/futures_task/spawn.rs.html#146)[§](#method.status_local)

#### fn [status\_local](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/spawn/trait.LocalSpawn.html#method.status_local)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [SpawnError](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/spawn/struct.SpawnError.html "struct futures_task::spawn::SpawnError")>

Determines whether the executor is able to spawn new tasks. [Read more](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/spawn/trait.LocalSpawn.html#method.status_local)

[Source](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/src/specta/type/impls.rs.html#17)[§](#impl-NamedType-for-Box%3CT%3E)

### impl<T> [NamedType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.NamedType.html "trait specta::type::NamedType") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [NamedType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.NamedType.html "trait specta::type::NamedType"),

[Source](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/src/specta/type/impls.rs.html#17)[§](#method.sid)

#### fn [sid](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.NamedType.html#tymethod.sid)() -> [SpectaID](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/specta_id/struct.SpectaID.html "struct specta::specta_id::SpectaID")

[Source](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/src/specta/type/impls.rs.html#17)[§](#method.named_data_type)

#### fn [named\_data\_type](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.NamedType.html#tymethod.named_data_type)( type\_map: &mut [TypeCollection](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type_collection/struct.TypeCollection.html "struct specta::type_collection::TypeCollection"), generics: &[[DataType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/enum.DataType.html "enum specta::datatype::DataType")], ) -> [NamedDataType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/named/struct.NamedDataType.html "struct specta::datatype::named::NamedDataType")

this is equivalent to [Type::inline](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.Type.html#tymethod.inline "associated function specta::type::Type::inline") but returns a [NamedDataType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/named/struct.NamedDataType.html "struct specta::datatype::named::NamedDataType") instead.

[Source](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/src/specta/type/impls.rs.html#17)[§](#method.definition_named_data_type)

#### fn [definition\_named\_data\_type](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.NamedType.html#tymethod.definition_named_data_type)(type\_map: &mut [TypeCollection](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type_collection/struct.TypeCollection.html "struct specta::type_collection::TypeCollection")) -> [NamedDataType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/named/struct.NamedDataType.html "struct specta::datatype::named::NamedDataType")

this is equivalent to [Type::definition] but returns a [NamedDataType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/named/struct.NamedDataType.html "struct specta::datatype::named::NamedDataType") instead.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1846)[§](#impl-Ord-for-Box%3CT,+A%3E)

### impl<T, A> [Ord](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html "trait core::cmp::Ord") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where T: [Ord](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html "trait core::cmp::Ord") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1848)[§](#method.cmp-1)

#### fn [cmp](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#tymethod.cmp)(&self, other: &[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>) -> [Ordering](https://doc.rust-lang.org/nightly/core/cmp/enum.Ordering.html "enum core::cmp::Ordering")

This method returns an [`Ordering`](https://doc.rust-lang.org/nightly/core/cmp/enum.Ordering.html "enum core::cmp::Ordering") between `self` and `other`. [Read more](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#tymethod.cmp)

1.21.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#1009-1011)[§](#method.max-1)

#### fn [max](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#method.max)(self, other: Self) -> Self where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Compares and returns the maximum of two values. [Read more](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#method.max)

1.21.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#1048-1050)[§](#method.min-1)

#### fn [min](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#method.min)(self, other: Self) -> Self where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Compares and returns the minimum of two values. [Read more](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#method.min)

1.50.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#1074-1076)[§](#method.clamp)

#### fn [clamp](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#method.clamp)(self, min: Self, max: Self) -> Self where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Restrict a value to a certain interval. [Read more](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#method.clamp)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1810)[§](#impl-PartialEq-for-Box%3CT,+A%3E)

### impl<T, A> [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where T: [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1812)[§](#method.eq-1)

#### fn [eq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#tymethod.eq)(&self, other: &[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `self` and `other` values to be equal, and is used by `==`.

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1816)[§](#method.ne-1)

#### fn [ne](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#method.ne)(&self, other: &[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `!=`. The default implementation is almost always sufficient,
and should not be overridden without very good reason.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1822)[§](#impl-PartialOrd-for-Box%3CT,+A%3E)

### impl<T, A> [PartialOrd](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html "trait core::cmp::PartialOrd") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where T: [PartialOrd](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html "trait core::cmp::PartialOrd") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1824)[§](#method.partial_cmp-1)

#### fn [partial\_cmp](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#tymethod.partial_cmp)(&self, other: &[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Ordering](https://doc.rust-lang.org/nightly/core/cmp/enum.Ordering.html "enum core::cmp::Ordering")>

This method returns an ordering between `self` and `other` values if one exists. [Read more](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#tymethod.partial_cmp)

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1828)[§](#method.lt-1)

#### fn [lt](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#method.lt)(&self, other: &[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests less than (for `self` and `other`) and is used by the `<` operator. [Read more](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#method.lt)

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1832)[§](#method.le-1)

#### fn [le](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#method.le)(&self, other: &[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests less than or equal to (for `self` and `other`) and is used by the
`<=` operator. [Read more](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#method.le)

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1836)[§](#method.ge-1)

#### fn [ge](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#method.ge)(&self, other: &[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests greater than or equal to (for `self` and `other`) and is used by
the `>=` operator. [Read more](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#method.ge)

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1840)[§](#method.gt-1)

#### fn [gt](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#method.gt)(&self, other: &[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A>) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests greater than (for `self` and `other`) and is used by the `>`
operator. [Read more](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#method.gt)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1930)[§](#impl-Pointer-for-Box%3CT,+A%3E)

### impl<T, A> [Pointer](https://doc.rust-lang.org/nightly/core/fmt/trait.Pointer.html "trait core::fmt::Pointer") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"), T: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1931)[§](#method.fmt-1)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Pointer.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")>

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Pointer.html#tymethod.fmt)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#152)[§](#impl-Read-for-Box%3CR%3E)

### impl<R> [Read](https://doc.rust-lang.org/nightly/std/io/trait.Read.html "trait std::io::Read") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<R> where R: [Read](https://doc.rust-lang.org/nightly/std/io/trait.Read.html "trait std::io::Read") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#154)[§](#method.read)

#### fn [read](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#tymethod.read)(&mut self, buf: &mut [[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)]) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

Pull some bytes from this source into the specified buffer, returning
how many bytes were read. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#tymethod.read)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#159)[§](#method.read_buf)

#### fn [read\_buf](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.read_buf)(&mut self, cursor: [BorrowedCursor](https://doc.rust-lang.org/nightly/core/io/borrowed_buf/struct.BorrowedCursor.html "struct core::io::borrowed_buf::BorrowedCursor")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

🔬This is a nightly-only experimental API. (`read_buf`)

Pull some bytes from this source into the specified buffer. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.read_buf)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#164)[§](#method.read_vectored)

#### fn [read\_vectored](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.read_vectored)(&mut self, bufs: &mut [[IoSliceMut](https://doc.rust-lang.org/nightly/std/io/struct.IoSliceMut.html "struct std::io::IoSliceMut")<'\_>]) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

Like `read`, except that it reads into a slice of buffers. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.read_vectored)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#169)[§](#method.is_read_vectored)

#### fn [is\_read\_vectored](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.is_read_vectored)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

🔬This is a nightly-only experimental API. (`can_vector`)

Determines if this `Read`er has an efficient `read_vectored`
implementation. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.is_read_vectored)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#174)[§](#method.read_to_end)

#### fn [read\_to\_end](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.read_to_end)(&mut self, buf: &mut [Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

Reads all bytes until EOF in this source, placing them into `buf`. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.read_to_end)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#179)[§](#method.read_to_string)

#### fn [read\_to\_string](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.read_to_string)(&mut self, buf: &mut [String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

Reads all bytes until EOF in this source, appending them to `buf`. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.read_to_string)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#184)[§](#method.read_exact)

#### fn [read\_exact](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.read_exact)(&mut self, buf: &mut [[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)]) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

Reads the exact number of bytes required to fill `buf`. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.read_exact)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#189)[§](#method.read_buf_exact)

#### fn [read\_buf\_exact](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.read_buf_exact)(&mut self, cursor: [BorrowedCursor](https://doc.rust-lang.org/nightly/core/io/borrowed_buf/struct.BorrowedCursor.html "struct core::io::borrowed_buf::BorrowedCursor")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

🔬This is a nightly-only experimental API. (`read_buf`)

Reads the exact number of bytes required to fill `cursor`. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.read_buf_exact)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/std/io/mod.rs.html#1093-1095)[§](#method.by_ref-1)

#### fn [by\_ref](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.by_ref)(&mut self) -> &mut Self where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Creates a “by reference” adaptor for this instance of `Read`. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.by_ref)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/std/io/mod.rs.html#1136-1138)[§](#method.bytes)

#### fn [bytes](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.bytes)(self) -> [Bytes](https://doc.rust-lang.org/nightly/std/io/struct.Bytes.html "struct std::io::Bytes")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Transforms this `Read` instance to an [`Iterator`](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator") over its bytes. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.bytes)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/std/io/mod.rs.html#1174-1176)[§](#method.chain-1)

#### fn [chain](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.chain)<R>(self, next: R) -> [Chain](https://doc.rust-lang.org/nightly/std/io/struct.Chain.html "struct std::io::Chain")<Self, R> where R: [Read](https://doc.rust-lang.org/nightly/std/io/trait.Read.html "trait std::io::Read"), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Creates an adapter which will chain this stream with another. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.chain)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/std/io/mod.rs.html#1213-1215)[§](#method.take-1)

#### fn [take](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.take)(self, limit: [u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html)) -> [Take](https://doc.rust-lang.org/nightly/std/io/struct.Take.html "struct std::io::Take")<Self> where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Creates an adapter which will read at most `limit` bytes from it. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Read.html#method.take)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#231)[§](#impl-Seek-for-Box%3CS%3E)

### impl<S> [Seek](https://doc.rust-lang.org/nightly/std/io/trait.Seek.html "trait std::io::Seek") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<S> where S: [Seek](https://doc.rust-lang.org/nightly/std/io/trait.Seek.html "trait std::io::Seek") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#233)[§](#method.seek)

#### fn [seek](https://doc.rust-lang.org/nightly/std/io/trait.Seek.html#tymethod.seek)(&mut self, pos: [SeekFrom](https://doc.rust-lang.org/nightly/std/io/enum.SeekFrom.html "enum std::io::SeekFrom")) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

Seek to an offset, in bytes, in a stream. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Seek.html#tymethod.seek)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#238)[§](#method.rewind)

#### fn [rewind](https://doc.rust-lang.org/nightly/std/io/trait.Seek.html#method.rewind)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

Rewind to the beginning of a stream. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Seek.html#method.rewind)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#243)[§](#method.stream_len)

#### fn [stream\_len](https://doc.rust-lang.org/nightly/std/io/trait.Seek.html#method.stream_len)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

🔬This is a nightly-only experimental API. (`seek_stream_len`)

Returns the length of this stream (in bytes). [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Seek.html#method.stream_len)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#248)[§](#method.stream_position)

#### fn [stream\_position](https://doc.rust-lang.org/nightly/std/io/trait.Seek.html#method.stream_position)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

Returns the current seek position from the start of the stream. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Seek.html#method.stream_position)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#253)[§](#method.seek_relative)

#### fn [seek\_relative](https://doc.rust-lang.org/nightly/std/io/trait.Seek.html#method.seek_relative)(&mut self, offset: [i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html)) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

Seeks relative to the current position. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Seek.html#method.seek_relative)

[Source](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/src/serde/ser/impls.rs.html#535-539)[§](#impl-Serialize-for-Box%3CT%3E)

### impl<T> [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Available on **crate features `std` or `alloc`** only.

[Source](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/src/serde/ser/impls.rs.html#535-539)[§](#method.serialize)

#### fn [serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html#tymethod.serialize)<S>( &self, serializer: S, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<<S as [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer")>::[Ok](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html#associatedtype.Ok "type serde::ser::Serializer::Ok"), <S as [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer")>::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html#associatedtype.Error "type serde::ser::Serializer::Error")> where S: [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer"),

Serialize this value into the given Serde serializer. [Read more](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html#tymethod.serialize)

[Source](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/src/serde_with/ser/impls.rs.html#144-146)[§](#impl-SerializeAs%3CBox%3CT%3E%3E-for-Box%3CU%3E)

### impl<T, U> [SerializeAs](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/serde_with/ser/trait.SerializeAs.html "trait serde_with::ser::SerializeAs")<[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<U> where U: [SerializeAs](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/serde_with/ser/trait.SerializeAs.html "trait serde_with::ser::SerializeAs")<T>,

[Source](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/src/serde_with/ser/impls.rs.html#148-150)[§](#method.serialize_as)

#### fn [serialize\_as](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/serde_with/ser/trait.SerializeAs.html#tymethod.serialize_as)<S>( source: &[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>, serializer: S, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<<S as [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer")>::[Ok](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html#associatedtype.Ok "type serde::ser::Serializer::Ok"), <S as [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer")>::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html#associatedtype.Error "type serde::ser::Serializer::Error")> where S: [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer"),

Serialize this value into the given Serde serializer.

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#impl-Serializer-for-Box%3CT%3E)

### impl<T> [Serializer](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html "trait erased_serde::ser::Serializer") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [Serializer](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html "trait erased_serde::ser::Serializer") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_bool)

#### fn [erased\_serialize\_bool](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_bool)(&mut self, v: [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html))

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_i8)

#### fn [erased\_serialize\_i8](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_i8)(&mut self, v: [i8](https://doc.rust-lang.org/nightly/std/primitive.i8.html))

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_i16)

#### fn [erased\_serialize\_i16](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_i16)(&mut self, v: [i16](https://doc.rust-lang.org/nightly/std/primitive.i16.html))

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_i32)

#### fn [erased\_serialize\_i32](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_i32)(&mut self, v: [i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html))

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_i64)

#### fn [erased\_serialize\_i64](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_i64)(&mut self, v: [i64](https://doc.rust-lang.org/nightly/std/primitive.i64.html))

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_i128)

#### fn [erased\_serialize\_i128](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_i128)(&mut self, v: [i128](https://doc.rust-lang.org/nightly/std/primitive.i128.html))

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_u8)

#### fn [erased\_serialize\_u8](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_u8)(&mut self, v: [u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html))

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_u16)

#### fn [erased\_serialize\_u16](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_u16)(&mut self, v: [u16](https://doc.rust-lang.org/nightly/std/primitive.u16.html))

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_u32)

#### fn [erased\_serialize\_u32](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_u32)(&mut self, v: [u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html))

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_u64)

#### fn [erased\_serialize\_u64](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_u64)(&mut self, v: [u64](https://doc.rust-lang.org/nightly/std/primitive.u64.html))

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_u128)

#### fn [erased\_serialize\_u128](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_u128)(&mut self, v: [u128](https://doc.rust-lang.org/nightly/std/primitive.u128.html))

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_f32)

#### fn [erased\_serialize\_f32](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_f32)(&mut self, v: [f32](https://doc.rust-lang.org/nightly/std/primitive.f32.html))

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_f64)

#### fn [erased\_serialize\_f64](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_f64)(&mut self, v: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html))

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_char)

#### fn [erased\_serialize\_char](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_char)(&mut self, v: [char](https://doc.rust-lang.org/nightly/std/primitive.char.html))

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_str)

#### fn [erased\_serialize\_str](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_str)(&mut self, v: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html))

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_bytes)

#### fn [erased\_serialize\_bytes](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_bytes)(&mut self, v: &[[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)])

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_none)

#### fn [erased\_serialize\_none](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_none)(&mut self)

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_some)

#### fn [erased\_serialize\_some](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_some)(&mut self, value: &dyn [Serialize](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serialize.html "trait erased_serde::ser::Serialize"))

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_unit)

#### fn [erased\_serialize\_unit](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_unit)(&mut self)

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_unit_struct)

#### fn [erased\_serialize\_unit\_struct](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_unit_struct)(&mut self, name: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html))

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_unit_variant)

#### fn [erased\_serialize\_unit\_variant](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_unit_variant)( &mut self, name: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), variant\_index: [u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html), variant: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), )

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_newtype_struct)

#### fn [erased\_serialize\_newtype\_struct](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_newtype_struct)( &mut self, name: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), value: &dyn [Serialize](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serialize.html "trait erased_serde::ser::Serialize"), )

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_newtype_variant)

#### fn [erased\_serialize\_newtype\_variant](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_newtype_variant)( &mut self, name: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), variant\_index: [u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html), variant: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), value: &dyn [Serialize](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serialize.html "trait erased_serde::ser::Serialize"), )

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_seq)

#### fn [erased\_serialize\_seq](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_seq)( &mut self, len: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<&mut dyn SerializeSeq, ErrorImpl>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_tuple)

#### fn [erased\_serialize\_tuple](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_tuple)( &mut self, len: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<&mut dyn SerializeTuple, ErrorImpl>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_tuple_struct)

#### fn [erased\_serialize\_tuple\_struct](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_tuple_struct)( &mut self, name: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), len: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<&mut dyn SerializeTupleStruct, ErrorImpl>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_tuple_variant)

#### fn [erased\_serialize\_tuple\_variant](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_tuple_variant)( &mut self, name: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), variant\_index: [u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html), variant: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), len: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<&mut dyn SerializeTupleVariant, ErrorImpl>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_map)

#### fn [erased\_serialize\_map](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_map)( &mut self, len: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<&mut dyn SerializeMap, ErrorImpl>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_struct)

#### fn [erased\_serialize\_struct](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_struct)( &mut self, name: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), len: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<&mut dyn SerializeStruct, ErrorImpl>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_serialize_struct_variant)

#### fn [erased\_serialize\_struct\_variant](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_serialize_struct_variant)( &mut self, name: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), variant\_index: [u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html), variant: &'static [str](https://doc.rust-lang.org/nightly/std/primitive.str.html), len: [usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<&mut dyn SerializeStructVariant, ErrorImpl>

[Source](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/src/erased_serde/ser.rs.html#1484)[§](#method.erased_is_human_readable-1)

#### fn [erased\_is\_human\_readable](https://docs.rs/erased-serde/0.4.6/x86_64-unknown-linux-gnu/erased_serde/ser/trait.Serializer.html#tymethod.erased_is_human_readable)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

[Source](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/src/futures_task/spawn.rs.html#131)[§](#impl-Spawn-for-Box%3CSp%3E)

### impl<Sp> [Spawn](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/spawn/trait.Spawn.html "trait futures_task::spawn::Spawn") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<Sp> where Sp: [Spawn](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/spawn/trait.Spawn.html "trait futures_task::spawn::Spawn") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/src/futures_task/spawn.rs.html#132)[§](#method.spawn_obj)

#### fn [spawn\_obj](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/spawn/trait.Spawn.html#tymethod.spawn_obj)(&self, future: [FutureObj](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/future_obj/struct.FutureObj.html "struct futures_task::future_obj::FutureObj")<'static, [()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [SpawnError](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/spawn/struct.SpawnError.html "struct futures_task::spawn::SpawnError")>

Spawns a future that will be run to completion. [Read more](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/spawn/trait.Spawn.html#tymethod.spawn_obj)

[Source](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/src/futures_task/spawn.rs.html#136)[§](#method.status)

#### fn [status](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/spawn/trait.Spawn.html#method.status)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [SpawnError](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/spawn/struct.SpawnError.html "struct futures_task::spawn::SpawnError")>

Determines whether the executor is able to spawn new tasks. [Read more](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/spawn/trait.Spawn.html#method.status)

[Source](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/src/futures_core/stream.rs.html#215)[§](#impl-Stream-for-Box%3CS%3E)

### impl<S> [Stream](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/stream/trait.Stream.html "trait futures_core::stream::Stream") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<S> where S: [Stream](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/stream/trait.Stream.html "trait futures_core::stream::Stream") + [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/src/futures_core/stream.rs.html#216)[§](#associatedtype.Item-1)

#### type [Item](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/stream/trait.Stream.html#associatedtype.Item) = <S as [Stream](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/stream/trait.Stream.html "trait futures_core::stream::Stream")>::[Item](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/stream/trait.Stream.html#associatedtype.Item "type futures_core::stream::Stream::Item")

Values yielded by the stream.

[Source](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/src/futures_core/stream.rs.html#218)[§](#method.poll_next-1)

#### fn [poll\_next](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/stream/trait.Stream.html#tymethod.poll_next)( self: [Pin](https://doc.rust-lang.org/nightly/core/pin/struct.Pin.html "struct core::pin::Pin")<&mut [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<S>>, cx: &mut [Context](https://doc.rust-lang.org/nightly/core/task/wake/struct.Context.html "struct core::task::wake::Context")<'\_>, ) -> [Poll](https://doc.rust-lang.org/nightly/core/task/poll/enum.Poll.html "enum core::task::poll::Poll")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<<[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<S> as [Stream](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/stream/trait.Stream.html "trait futures_core::stream::Stream")>::[Item](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/stream/trait.Stream.html#associatedtype.Item "type futures_core::stream::Stream::Item")>>

Attempt to pull out the next value of this stream, registering the
current task for wakeup if the value is not yet available, and returning
`None` if the stream is exhausted. [Read more](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/stream/trait.Stream.html#tymethod.poll_next)

[Source](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/src/futures_core/stream.rs.html#222)[§](#method.size_hint-1)

#### fn [size\_hint](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/stream/trait.Stream.html#method.size_hint)(&self) -> ([usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html)>)

Returns the bounds on the remaining length of the stream. [Read more](https://docs.rs/futures-core/0.3.31/x86_64-unknown-linux-gnu/futures_core/stream/trait.Stream.html#method.size_hint)

[Source](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/src/specta/type/impls.rs.html#17)[§](#impl-Type-for-Box%3CT%3E)

### impl<T> [Type](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.Type.html "trait specta::type::Type") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [Type](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.Type.html "trait specta::type::Type"),

[Source](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/src/specta/type/impls.rs.html#17)[§](#method.inline)

#### fn [inline](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.Type.html#tymethod.inline)(type\_map: &mut [TypeCollection](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type_collection/struct.TypeCollection.html "struct specta::type_collection::TypeCollection"), generics: [Generics](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/enum.Generics.html "enum specta::type::Generics")<'\_>) -> [DataType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/enum.DataType.html "enum specta::datatype::DataType")

Returns the definition of a type using the provided generics. [Read more](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.Type.html#tymethod.inline)

[Source](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/src/specta/type/impls.rs.html#17)[§](#method.reference)

#### fn [reference](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.Type.html#method.reference)(type\_map: &mut [TypeCollection](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type_collection/struct.TypeCollection.html "struct specta::type_collection::TypeCollection"), generics: &[[DataType](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/enum.DataType.html "enum specta::datatype::DataType")]) -> [Reference](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/datatype/reference/struct.Reference.html "struct specta::datatype::reference::Reference")

Generates a datatype corresponding to a reference to this type,
as determined by its category. Getting a reference to a type implies that
it should belong in the type map (since it has to be referenced from somewhere),
so the output of [`definition`](../crate::Type::definition) will be put into the type map.

[Source](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/src/futures_task/future_obj.rs.html#219-221)[§](#impl-UnsafeFutureObj%3C'a,+T%3E-for-Box%3CF%3E)

### impl<'a, T, F> [UnsafeFutureObj](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/future_obj/trait.UnsafeFutureObj.html "trait futures_task::future_obj::UnsafeFutureObj")<'a, T> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<F> where F: [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future")<Output = T> + 'a,

[Source](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/src/futures_task/future_obj.rs.html#223)[§](#method.into_raw-1)

#### fn [into\_raw](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/future_obj/trait.UnsafeFutureObj.html#tymethod.into_raw)(self) -> [\*mut](https://doc.rust-lang.org/nightly/std/primitive.pointer.html) dyn [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future")<Output = T> + 'a

Convert an owned instance into a (conceptually owned) fat pointer. [Read more](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/future_obj/trait.UnsafeFutureObj.html#tymethod.into_raw)

[Source](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/src/futures_task/future_obj.rs.html#227)[§](#method.drop-1)

#### unsafe fn [drop](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/future_obj/trait.UnsafeFutureObj.html#tymethod.drop)(ptr: [\*mut](https://doc.rust-lang.org/nightly/std/primitive.pointer.html) dyn [Future](https://doc.rust-lang.org/nightly/core/future/future/trait.Future.html "trait core::future::future::Future")<Output = T> + 'a)

Drops the future represented by the given fat pointer. [Read more](https://docs.rs/futures-task/0.3.31/x86_64-unknown-linux-gnu/futures_task/future_obj/trait.UnsafeFutureObj.html#tymethod.drop)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#194)[§](#impl-Write-for-Box%3CW%3E)

### impl<W> [Write](https://doc.rust-lang.org/nightly/std/io/trait.Write.html "trait std::io::Write") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<W> where W: [Write](https://doc.rust-lang.org/nightly/std/io/trait.Write.html "trait std::io::Write") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#196)[§](#method.write-1)

#### fn [write](https://doc.rust-lang.org/nightly/std/io/trait.Write.html#tymethod.write)(&mut self, buf: &[[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)]) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

Writes a buffer into this writer, returning how many bytes were written. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Write.html#tymethod.write)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#201)[§](#method.write_vectored)

#### fn [write\_vectored](https://doc.rust-lang.org/nightly/std/io/trait.Write.html#method.write_vectored)(&mut self, bufs: &[[IoSlice](https://doc.rust-lang.org/nightly/std/io/struct.IoSlice.html "struct std::io::IoSlice")<'\_>]) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[usize](https://doc.rust-lang.org/nightly/std/primitive.usize.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

Like [`write`](https://doc.rust-lang.org/nightly/std/io/trait.Write.html#tymethod.write "method std::io::Write::write"), except that it writes from a slice of buffers. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Write.html#method.write_vectored)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#206)[§](#method.is_write_vectored-1)

#### fn [is\_write\_vectored](https://doc.rust-lang.org/nightly/std/io/trait.Write.html#method.is_write_vectored)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

🔬This is a nightly-only experimental API. (`can_vector`)

Determines if this `Write`r has an efficient [`write_vectored`](https://doc.rust-lang.org/nightly/std/io/trait.Write.html#method.write_vectored "method std::io::Write::write_vectored")
implementation. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Write.html#method.is_write_vectored)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#211)[§](#method.flush)

#### fn [flush](https://doc.rust-lang.org/nightly/std/io/trait.Write.html#tymethod.flush)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

Flushes this output stream, ensuring that all intermediately buffered
contents reach their destination. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Write.html#tymethod.flush)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#216)[§](#method.write_all)

#### fn [write\_all](https://doc.rust-lang.org/nightly/std/io/trait.Write.html#method.write_all)(&mut self, buf: &[[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)]) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

Attempts to write an entire buffer into this writer. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Write.html#method.write_all)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#221)[§](#method.write_all_vectored)

#### fn [write\_all\_vectored](https://doc.rust-lang.org/nightly/std/io/trait.Write.html#method.write_all_vectored)(&mut self, bufs: &mut [[IoSlice](https://doc.rust-lang.org/nightly/std/io/struct.IoSlice.html "struct std::io::IoSlice")<'\_>]) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

🔬This is a nightly-only experimental API. (`write_all_vectored`)

Attempts to write multiple buffers into this writer. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Write.html#method.write_all_vectored)

[Source](https://doc.rust-lang.org/nightly/src/std/io/impls.rs.html#226)[§](#method.write_fmt)

#### fn [write\_fmt](https://doc.rust-lang.org/nightly/std/io/trait.Write.html#method.write_fmt)(&mut self, fmt: [Arguments](https://doc.rust-lang.org/nightly/core/fmt/struct.Arguments.html "struct core::fmt::Arguments")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

Writes a formatted string into this writer, returning any error
encountered. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Write.html#method.write_fmt)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/std/io/mod.rs.html#1940-1942)[§](#method.by_ref-1)

#### fn [by\_ref](https://doc.rust-lang.org/nightly/std/io/trait.Write.html#method.by_ref)(&mut self) -> &mut Self where Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Creates a “by reference” adapter for this instance of `Write`. [Read more](https://doc.rust-lang.org/nightly/std/io/trait.Write.html#method.by_ref)

[Source](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/src/writeable/impls.rs.html#230)[§](#impl-Writeable-for-Box%3CT%3E)

### impl<'a, T> [Writeable](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/trait.Writeable.html "trait writeable::Writeable") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [Writeable](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/trait.Writeable.html "trait writeable::Writeable") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/src/writeable/impls.rs.html#230)[§](#method.write_to)

#### fn [write\_to](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/trait.Writeable.html#method.write_to)<W>(&self, sink: [&mut W](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")> where W: [Write](https://doc.rust-lang.org/nightly/core/fmt/trait.Write.html "trait core::fmt::Write") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Writes a string to the given sink. Errors from the sink are bubbled up.
The default implementation delegates to `write_to_parts`, and discards any
`Part` annotations.

[Source](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/src/writeable/impls.rs.html#230)[§](#method.write_to_parts)

#### fn [write\_to\_parts](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/trait.Writeable.html#method.write_to_parts)<W>(&self, sink: [&mut W](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")> where W: [PartsWrite](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/trait.PartsWrite.html "trait writeable::PartsWrite") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Write bytes and `Part` annotations to the given sink. Errors from the
sink are bubbled up. The default implementation delegates to `write_to`,
and doesn’t produce any `Part` annotations.

[Source](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/src/writeable/impls.rs.html#230)[§](#method.writeable_length_hint)

#### fn [writeable\_length\_hint](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/trait.Writeable.html#method.writeable_length_hint)(&self) -> [LengthHint](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/struct.LengthHint.html "struct writeable::LengthHint")

Returns a hint for the number of UTF-8 bytes that will be written to the sink. [Read more](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/trait.Writeable.html#method.writeable_length_hint)

[Source](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/src/writeable/impls.rs.html#230)[§](#method.write_to_string)

#### fn [write\_to\_string](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/trait.Writeable.html#method.write_to_string)(&self) -> [Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'\_, [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>

Creates a new `String` with the data from this `Writeable`. Like `ToString`,
but smaller and faster. [Read more](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/trait.Writeable.html#method.write_to_string)

[Source](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/src/writeable/impls.rs.html#230)[§](#method.writeable_cmp_bytes)

#### fn [writeable\_cmp\_bytes](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/trait.Writeable.html#method.writeable_cmp_bytes)(&self, other: &[[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)]) -> [Ordering](https://doc.rust-lang.org/nightly/core/cmp/enum.Ordering.html "enum core::cmp::Ordering")

Compares the contents of this `Writeable` to the given bytes
without allocating a String to hold the `Writeable` contents. [Read more](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/trait.Writeable.html#method.writeable_cmp_bytes)

[Source](https://docs.rs/yoke/0.7.5/x86_64-unknown-linux-gnu/src/yoke/cartable_ptr.rs.html#154)[§](#impl-CartablePointerLike-for-Box%3CT%3E)

### impl<T> [CartablePointerLike](https://docs.rs/yoke/0.7.5/x86_64-unknown-linux-gnu/yoke/cartable_ptr/trait.CartablePointerLike.html "trait yoke::cartable_ptr::CartablePointerLike") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2014)[§](#impl-CoerceUnsized%3CBox%3CU,+A%3E%3E-for-Box%3CT,+A%3E)

### impl<T, U, A> [CoerceUnsized](https://doc.rust-lang.org/nightly/core/ops/unsize/trait.CoerceUnsized.html "trait core::ops::unsize::CoerceUnsized")<[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<U, A>> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where T: [Unsize](https://doc.rust-lang.org/nightly/core/marker/trait.Unsize.html "trait core::marker::Unsize")<U> + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"), U: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1956)[§](#impl-DerefPure-for-Box%3CT,+A%3E)

### impl<T, A> [DerefPure](https://doc.rust-lang.org/nightly/core/ops/deref/trait.DerefPure.html "trait core::ops::deref::DerefPure") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"), T: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2023)[§](#impl-DispatchFromDyn%3CBox%3CU%3E%3E-for-Box%3CT%3E)

### impl<T, U> [DispatchFromDyn](https://doc.rust-lang.org/nightly/core/ops/unsize/trait.DispatchFromDyn.html "trait core::ops::unsize::DispatchFromDyn")<[Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<U>> for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [Unsize](https://doc.rust-lang.org/nightly/core/marker/trait.Unsize.html "trait core::marker::Unsize")<U> + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), U: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#1854)[§](#impl-Eq-for-Box%3CT,+A%3E)

### impl<T, A> [Eq](https://doc.rust-lang.org/nightly/core/cmp/trait.Eq.html "trait core::cmp::Eq") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where T: [Eq](https://doc.rust-lang.org/nightly/core/cmp/trait.Eq.html "trait core::cmp::Eq") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

[Source](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/src/specta/type/impls.rs.html#17)[§](#impl-Flatten-for-Box%3CT%3E)

### impl<T> [Flatten](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.Flatten.html "trait specta::type::Flatten") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: [Flatten](https://docs.rs/specta/2.0.0-rc.22/x86_64-unknown-linux-gnu/specta/type/trait.Flatten.html "trait specta::type::Flatten"),

1.26.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed/iter.rs.html#80)[§](#impl-FusedIterator-for-Box%3CI,+A%3E)

### impl<I, A> [FusedIterator](https://doc.rust-lang.org/nightly/core/iter/traits/marker/trait.FusedIterator.html "trait core::iter::traits::marker::FusedIterator") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<I, A> where I: [FusedIterator](https://doc.rust-lang.org/nightly/core/iter/traits/marker/trait.FusedIterator.html "trait core::iter::traits::marker::FusedIterator") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"), A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2017)[§](#impl-PinCoerceUnsized-for-Box%3CT,+A%3E)

### impl<T, A> [PinCoerceUnsized](https://doc.rust-lang.org/nightly/core/pin/trait.PinCoerceUnsized.html "trait core::pin::PinCoerceUnsized") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"), T: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2132)[§](#impl-PointerLike-for-Box%3CT%3E)

### impl<T> [PointerLike](https://doc.rust-lang.org/nightly/core/marker/trait.PointerLike.html "trait core::marker::PointerLike") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T>

[Source](https://docs.rs/stable_deref_trait/1.2.0/x86_64-unknown-linux-gnu/src/stable_deref_trait/lib.rs.html#157)[§](#impl-StableDeref-for-Box%3CT%3E)

### impl<T> [StableDeref](https://docs.rs/stable_deref_trait/1.2.0/x86_64-unknown-linux-gnu/stable_deref_trait/trait.StableDeref.html "trait stable_deref_trait::StableDeref") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

1.33.0 · [Source](https://doc.rust-lang.org/nightly/src/alloc/boxed.rs.html#2076)[§](#impl-Unpin-for-Box%3CT,+A%3E)

### impl<T, A> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T, A> where A: [Allocator](https://doc.rust-lang.org/nightly/core/alloc/trait.Allocator.html "trait core::alloc::Allocator"), T: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://docs.rs/bytemuck/1.22.0/x86_64-unknown-linux-gnu/src/bytemuck/zeroable_in_option.rs.html#35)[§](#impl-ZeroableInOption-for-Box%3CT%3E)

### impl<T> [ZeroableInOption](https://docs.rs/bytemuck/1.22.0/x86_64-unknown-linux-gnu/bytemuck/zeroable_in_option/trait.ZeroableInOption.html "trait bytemuck::zeroable_in_option::ZeroableInOption") for [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<T> where T: ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),