# Type Alias ResultCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](../src/tauri/error.rs.html#178)

```
pub type Result<T> = Result<T, Error>;
```

Expand description

`Result<T, ::tauri::Error>`

## Aliased Type[§](#aliased-type)

```
enum Result<T> {
    Ok(T),
    Err(Error),
}
```

## Variants[§](#variants)

[§](#variant.Ok)1.0.0

### Ok(T)

Contains the success value

[§](#variant.Err)1.0.0

### Err([Error](enum.Error.html.md "enum tauri::Error"))

Contains the error value

## Implementations

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1530)[§](#impl-Result%3C%26T,+E%3E)

### impl<T, E> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[&T](https://doc.rust-lang.org/nightly/std/primitive.reference.html), E>

1.59.0 (const: 1.83.0) · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1547-1549)

#### pub const fn [copied](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.copied)(self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where T: [Copy](https://doc.rust-lang.org/nightly/core/marker/trait.Copy.html "trait core::marker::Copy"),

Maps a `Result<&T, E>` to a `Result<T, E>` by copying the contents of the
`Ok` part.

##### [§](#examples-1-2)Examples

```
let val = 12;
let x: Result<&i32, i32> = Ok(&val);
assert_eq!(x, Ok(&12));
let copied = x.copied();
assert_eq!(copied, Ok(12));
```

1.59.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1573-1575)

#### pub fn [cloned](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.cloned)(self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where T: [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone"),

Maps a `Result<&T, E>` to a `Result<T, E>` by cloning the contents of the
`Ok` part.

##### [§](#examples-1-2)Examples

```
let val = 12;
let x: Result<&i32, i32> = Ok(&val);
assert_eq!(x, Ok(&12));
let cloned = x.cloned();
assert_eq!(cloned, Ok(12));
```

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1581)[§](#impl-Result%3C%26mut+T,+E%3E)

### impl<T, E> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[&mut T](https://doc.rust-lang.org/nightly/std/primitive.reference.html), E>

1.59.0 (const: 1.83.0) · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1598-1600)

#### pub const fn [copied](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.copied)(self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where T: [Copy](https://doc.rust-lang.org/nightly/core/marker/trait.Copy.html "trait core::marker::Copy"),

Maps a `Result<&mut T, E>` to a `Result<T, E>` by copying the contents of the
`Ok` part.

##### [§](#examples-1-2)Examples

```
let mut val = 12;
let x: Result<&mut i32, i32> = Ok(&mut val);
assert_eq!(x, Ok(&mut 12));
let copied = x.copied();
assert_eq!(copied, Ok(12));
```

1.59.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1624-1626)

#### pub fn [cloned](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.cloned)(self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where T: [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone"),

Maps a `Result<&mut T, E>` to a `Result<T, E>` by cloning the contents of the
`Ok` part.

##### [§](#examples-1-2)Examples

```
let mut val = 12;
let x: Result<&mut i32, i32> = Ok(&mut val);
assert_eq!(x, Ok(&mut 12));
let cloned = x.cloned();
assert_eq!(cloned, Ok(12));
```

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1632)[§](#impl-Result%3COption%3CT%3E,+E%3E)

### impl<T, E> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<T>, E>

1.33.0 (const: 1.83.0) · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1652)

#### pub const fn [transpose](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.transpose)(self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E>>

Transposes a `Result` of an `Option` into an `Option` of a `Result`.

`Ok(None)` will be mapped to `None`.
`Ok(Some(_))` and `Err(_)` will be mapped to `Some(Ok(_))` and `Some(Err(_))`.

##### [§](#examples-1)Examples

```
#[derive(Debug, Eq, PartialEq)]
struct SomeErr;

let x: Result<Option<i32>, SomeErr> = Ok(Some(5));
let y: Option<Result<i32, SomeErr>> = Some(Ok(5));
assert_eq!(x.transpose(), y);
```

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1661)[§](#impl-Result%3CResult%3CT,+E%3E,+E%3E)

### impl<T, E> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E>, E>

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1689)

#### pub const fn [flatten](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.flatten)(self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E>

🔬This is a nightly-only experimental API. (`result_flattening`)

Converts from `Result<Result<T, E>, E>` to `Result<T, E>`

##### [§](#examples-1)Examples

```
#![feature(result_flattening)]
let x: Result<Result<&'static str, u32>, u32> = Ok(Ok("hello"));
assert_eq!(Ok("hello"), x.flatten());

let x: Result<Result<&'static str, u32>, u32> = Ok(Err(6));
assert_eq!(Err(6), x.flatten());

let x: Result<Result<&'static str, u32>, u32> = Err(6);
assert_eq!(Err(6), x.flatten());
```

Flattening only removes one level of nesting at a time:

```
#![feature(result_flattening)]
let x: Result<Result<Result<&'static str, u32>, u32>, u32> = Ok(Ok(Ok("hello")));
assert_eq!(Ok(Ok("hello")), x.flatten());
assert_eq!(Ok("hello"), x.flatten().flatten());
```

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#544)[§](#impl-Result%3CT,+E%3E)

### impl<T, E> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E>

1.0.0 (const: 1.48.0) · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#564)

#### pub const fn [is\_ok](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.is_ok)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Returns `true` if the result is [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok").

##### [§](#examples-1-2)Examples

```
let x: Result<i32, &str> = Ok(-3);
assert_eq!(x.is_ok(), true);

let x: Result<i32, &str> = Err("Some error message");
assert_eq!(x.is_ok(), false);
```

1.70.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#585)

#### pub fn [is\_ok\_and](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.is_ok_and)(self, f: impl [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(T) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Returns `true` if the result is [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok") and the value inside of it matches a predicate.

##### [§](#examples-1-2)Examples

```
let x: Result<u32, &str> = Ok(2);
assert_eq!(x.is_ok_and(|x| x > 1), true);

let x: Result<u32, &str> = Ok(0);
assert_eq!(x.is_ok_and(|x| x > 1), false);

let x: Result<u32, &str> = Err("hey");
assert_eq!(x.is_ok_and(|x| x > 1), false);
```

1.0.0 (const: 1.48.0) · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#607)

#### pub const fn [is\_err](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.is_err)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Returns `true` if the result is [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err").

##### [§](#examples-2)Examples

```
let x: Result<i32, &str> = Ok(-3);
assert_eq!(x.is_err(), false);

let x: Result<i32, &str> = Err("Some error message");
assert_eq!(x.is_err(), true);
```

1.70.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#630)

#### pub fn [is\_err\_and](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.is_err_and)(self, f: impl [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(E) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Returns `true` if the result is [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err") and the value inside of it matches a predicate.

##### [§](#examples-3)Examples

```
use std::io::{Error, ErrorKind};

let x: Result<u32, Error> = Err(Error::new(ErrorKind::NotFound, "!"));
assert_eq!(x.is_err_and(|x| x.kind() == ErrorKind::NotFound), true);

let x: Result<u32, Error> = Err(Error::new(ErrorKind::PermissionDenied, "!"));
assert_eq!(x.is_err_and(|x| x.kind() == ErrorKind::NotFound), false);

let x: Result<u32, Error> = Ok(123);
assert_eq!(x.is_err_and(|x| x.kind() == ErrorKind::NotFound), false);
```

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#658)

#### pub fn [ok](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.ok)(self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<T>

Converts from `Result<T, E>` to [`Option<T>`](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option").

Converts `self` into an [`Option<T>`](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option"), consuming `self`,
and discarding the error, if any.

##### [§](#examples-4)Examples

```
let x: Result<u32, &str> = Ok(2);
assert_eq!(x.ok(), Some(2));

let x: Result<u32, &str> = Err("Nothing here");
assert_eq!(x.ok(), None);
```

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#681)

#### pub fn [err](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.err)(self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<E>

Converts from `Result<T, E>` to [`Option<E>`](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option").

Converts `self` into an [`Option<E>`](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option"), consuming `self`,
and discarding the success value, if any.

##### [§](#examples-5)Examples

```
let x: Result<u32, &str> = Ok(2);
assert_eq!(x.err(), None);

let x: Result<u32, &str> = Err("Nothing here");
assert_eq!(x.err(), Some("Nothing here"));
```

1.0.0 (const: 1.48.0) · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#709)

#### pub const fn [as\_ref](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.as_ref)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[&T](https://doc.rust-lang.org/nightly/std/primitive.reference.html), [&E](https://doc.rust-lang.org/nightly/std/primitive.reference.html)>

Converts from `&Result<T, E>` to `Result<&T, &E>`.

Produces a new `Result`, containing a reference
into the original, leaving the original in place.

##### [§](#examples-6)Examples

```
let x: Result<u32, &str> = Ok(2);
assert_eq!(x.as_ref(), Ok(&2));

let x: Result<u32, &str> = Err("Error");
assert_eq!(x.as_ref(), Err(&"Error"));
```

1.0.0 (const: 1.83.0) · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#739)

#### pub const fn [as\_mut](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.as_mut)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[&mut T](https://doc.rust-lang.org/nightly/std/primitive.reference.html), [&mut E](https://doc.rust-lang.org/nightly/std/primitive.reference.html)>

Converts from `&mut Result<T, E>` to `Result<&mut T, &mut E>`.

##### [§](#examples-7)Examples

```
fn mutate(r: &mut Result<i32, i32>) {
    match r.as_mut() {
        Ok(v) => *v = 42,
        Err(e) => *e = 0,
    }
}

let mut x: Result<i32, i32> = Ok(2);
mutate(&mut x);
assert_eq!(x.unwrap(), 42);

let mut x: Result<i32, i32> = Err(13);
mutate(&mut x);
assert_eq!(x.unwrap_err(), 0);
```

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#771)

#### pub fn [map](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.map)<U, F>(self, op: F) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<U, E> where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(T) -> U,

Maps a `Result<T, E>` to `Result<U, E>` by applying a function to a
contained [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok") value, leaving an [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err") value untouched.

This function can be used to compose the results of two functions.

##### [§](#examples-8)Examples

Print the numbers on each line of a string multiplied by two.

```
let line = "1\n2\n3\n4\n";

for num in line.lines() {
    match num.parse::<i32>().map(|i| i * 2) {
        Ok(n) => println!("{n}"),
        Err(..) => {}
    }
}
```

1.41.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#799)

#### pub fn [map\_or](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.map_or)<U, F>(self, default: U, f: F) -> U where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(T) -> U,

Returns the provided default (if [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err")), or
applies a function to the contained value (if [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok")).

Arguments passed to `map_or` are eagerly evaluated; if you are passing
the result of a function call, it is recommended to use [`map_or_else`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#method.map_or_else "method core::result::Result::map_or_else"),
which is lazily evaluated.

##### [§](#examples-9)Examples

```
let x: Result<_, &str> = Ok("foo");
assert_eq!(x.map_or(42, |v| v.len()), 3);

let x: Result<&str, _> = Err("bar");
assert_eq!(x.map_or(42, |v| v.len()), 42);
```

1.41.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#826)

#### pub fn [map\_or\_else](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.map_or_else)<U, D, F>(self, default: D, f: F) -> U where D: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(E) -> U, F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(T) -> U,

Maps a `Result<T, E>` to `U` by applying fallback function `default` to
a contained [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err") value, or function `f` to a contained [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok") value.

This function can be used to unpack a successful result
while handling an error.

##### [§](#examples-10)Examples

```
let k = 21;

let x : Result<_, &str> = Ok("foo");
assert_eq!(x.map_or_else(|e| k * 2, |v| v.len()), 3);

let x : Result<&str, _> = Err("bar");
assert_eq!(x.map_or_else(|e| k * 2, |v| v.len()), 42);
```

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#853)

#### pub fn [map\_err](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.map_err)<F, O>(self, op: O) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, F> where O: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(E) -> F,

Maps a `Result<T, E>` to `Result<T, F>` by applying a function to a
contained [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err") value, leaving an [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok") value untouched.

This function can be used to pass through a successful result while handling
an error.

##### [§](#examples-11)Examples

```
fn stringify(x: u32) -> String { format!("error code: {x}") }

let x: Result<u32, u32> = Ok(2);
assert_eq!(x.map_err(stringify), Ok(2));

let x: Result<u32, u32> = Err(13);
assert_eq!(x.map_err(stringify), Err("error code: 13".to_string()));
```

1.76.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#875)

#### pub fn [inspect](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.inspect)<F>(self, f: F) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")([&T](https://doc.rust-lang.org/nightly/std/primitive.reference.html)),

Calls a function with a reference to the contained value if [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok").

Returns the original result.

##### [§](#examples-12)Examples

```
let x: u8 = "4"
    .parse::<u8>()
    .inspect(|x| println!("original: {x}"))
    .map(|x| x.pow(3))
    .expect("failed to parse number");
```

1.76.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#899)

#### pub fn [inspect\_err](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.inspect_err)<F>(self, f: F) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")([&E](https://doc.rust-lang.org/nightly/std/primitive.reference.html)),

Calls a function with a reference to the contained value if [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err").

Returns the original result.

##### [§](#examples-13)Examples

```
use std::{fs, io};

fn read() -> io::Result<String> {
    fs::read_to_string("address.txt")
        .inspect_err(|e| eprintln!("failed to read file: {e}"))
}
```

1.47.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#925-927)

#### pub fn [as\_deref](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.as_deref)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<&<T as [Deref](https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html "trait core::ops::deref::Deref")>::[Target](https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html#associatedtype.Target "type core::ops::deref::Deref::Target"), [&E](https://doc.rust-lang.org/nightly/std/primitive.reference.html)> where T: [Deref](https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html "trait core::ops::deref::Deref"),

Converts from `Result<T, E>` (or `&Result<T, E>`) to `Result<&<T as Deref>::Target, &E>`.

Coerces the [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok") variant of the original [`Result`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result") via [`Deref`](https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html "trait core::ops::deref::Deref")
and returns the new [`Result`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result").

##### [§](#examples-14)Examples

```
let x: Result<String, u32> = Ok("hello".to_string());
let y: Result<&str, &u32> = Ok("hello");
assert_eq!(x.as_deref(), y);

let x: Result<String, u32> = Err(42);
let y: Result<&str, &u32> = Err(&42);
assert_eq!(x.as_deref(), y);
```

1.47.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#952-954)

#### pub fn [as\_deref\_mut](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.as_deref_mut)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<&mut <T as [Deref](https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html "trait core::ops::deref::Deref")>::[Target](https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html#associatedtype.Target "type core::ops::deref::Deref::Target"), [&mut E](https://doc.rust-lang.org/nightly/std/primitive.reference.html)> where T: [DerefMut](https://doc.rust-lang.org/nightly/core/ops/deref/trait.DerefMut.html "trait core::ops::deref::DerefMut"),

Converts from `Result<T, E>` (or `&mut Result<T, E>`) to `Result<&mut <T as DerefMut>::Target, &mut E>`.

Coerces the [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok") variant of the original [`Result`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result") via [`DerefMut`](https://doc.rust-lang.org/nightly/core/ops/deref/trait.DerefMut.html "trait core::ops::deref::DerefMut")
and returns the new [`Result`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result").

##### [§](#examples-15)Examples

```
let mut s = "HELLO".to_string();
let mut x: Result<String, u32> = Ok("hello".to_string());
let y: Result<&mut str, &mut u32> = Ok(&mut s);
assert_eq!(x.as_deref_mut().map(|x| { x.make_ascii_uppercase(); x }), y);

let mut i = 42;
let mut x: Result<String, u32> = Err(42);
let y: Result<&mut str, &mut u32> = Err(&mut i);
assert_eq!(x.as_deref_mut().map(|x| { x.make_ascii_uppercase(); x }), y);
```

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#978)

#### pub fn [iter](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.iter)(&self) -> [Iter](https://doc.rust-lang.org/nightly/core/result/struct.Iter.html "struct core::result::Iter")<'\_, T>

Returns an iterator over the possibly contained value.

The iterator yields one value if the result is [`Result::Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok"), otherwise none.

##### [§](#examples-16)Examples

```
let x: Result<u32, &str> = Ok(7);
assert_eq!(x.iter().next(), Some(&7));

let x: Result<u32, &str> = Err("nothing!");
assert_eq!(x.iter().next(), None);
```

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1001)

#### pub fn [iter\_mut](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.iter_mut)(&mut self) -> [IterMut](https://doc.rust-lang.org/nightly/core/result/struct.IterMut.html "struct core::result::IterMut")<'\_, T>

Returns a mutable iterator over the possibly contained value.

The iterator yields one value if the result is [`Result::Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok"), otherwise none.

##### [§](#examples-17)Examples

```
let mut x: Result<u32, &str> = Ok(7);
match x.iter_mut().next() {
    Some(v) => *v = 40,
    None => {},
}
assert_eq!(x, Ok(40));

let mut x: Result<u32, &str> = Err("nothing!");
assert_eq!(x.iter_mut().next(), None);
```

1.4.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1055-1057)

#### pub fn [expect](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.expect)(self, msg: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> T where E: [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug"),

Returns the contained [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok") value, consuming the `self` value.

Because this function may panic, its use is generally discouraged.
Instead, prefer to use pattern matching and handle the [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err")
case explicitly, or call [`unwrap_or`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#method.unwrap_or "method core::result::Result::unwrap_or"), [`unwrap_or_else`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#method.unwrap_or_else "method core::result::Result::unwrap_or_else"), or
[`unwrap_or_default`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#method.unwrap_or_default "method core::result::Result::unwrap_or_default").

##### [§](#panics)Panics

Panics if the value is an [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err"), with a panic message including the
passed message, and the content of the [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err").

##### [§](#examples-18)Examples

[ⓘ](# "This example panics")

```
let x: Result<u32, &str> = Err("emergency failure");
x.expect("Testing expect"); // panics with `Testing expect: emergency failure`
```

##### [§](#recommended-message-style)Recommended Message Style

We recommend that `expect` messages are used to describe the reason you
*expect* the `Result` should be `Ok`.

[ⓘ](# "This example panics")

```
let path = std::env::var("IMPORTANT_PATH")
    .expect("env variable `IMPORTANT_PATH` should be set by `wrapper_script.sh`");
```

**Hint**: If you’re having trouble remembering how to phrase expect
error messages remember to focus on the word “should” as in “env
variable should be set by blah” or “the given binary should be available
and executable by the current user”.

For more detail on expect message styles and the reasoning behind our recommendation please
refer to the section on [“Common Message
Styles”](../../../std/error/index.html#common-message-styles) in the
[`std::error`](../../../std/error/index.html) module docs.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1103-1105)

#### pub fn [unwrap](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.unwrap)(self) -> T where E: [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug"),

Returns the contained [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok") value, consuming the `self` value.

Because this function may panic, its use is generally discouraged.
Panics are meant for unrecoverable errors, and
[may abort the entire program](https://doc.rust-lang.org/book/ch09-01-unrecoverable-errors-with-panic.html).

Instead, prefer to use [the `?` (try) operator](https://doc.rust-lang.org/book/ch09-02-recoverable-errors-with-result.html#a-shortcut-for-propagating-errors-the--operator), or pattern matching
to handle the [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err") case explicitly, or call [`unwrap_or`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#method.unwrap_or "method core::result::Result::unwrap_or"),
[`unwrap_or_else`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#method.unwrap_or_else "method core::result::Result::unwrap_or_else"), or [`unwrap_or_default`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#method.unwrap_or_default "method core::result::Result::unwrap_or_default").

##### [§](#panics-1)Panics

Panics if the value is an [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err"), with a panic message provided by the
[`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err")’s value.

##### [§](#examples-19)Examples

Basic usage:

```
let x: Result<u32, &str> = Ok(2);
assert_eq!(x.unwrap(), 2);
```

[ⓘ](# "This example panics")

```
let x: Result<u32, &str> = Err("emergency failure");
x.unwrap(); // panics with `emergency failure`
```

1.16.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1140-1142)

#### pub fn [unwrap\_or\_default](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.unwrap_or_default)(self) -> T where T: [Default](https://doc.rust-lang.org/nightly/core/default/trait.Default.html "trait core::default::Default"),

Returns the contained [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok") value or a default

Consumes the `self` argument then, if [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok"), returns the contained
value, otherwise if [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err"), returns the default value for that
type.

##### [§](#examples-20)Examples

Converts a string to an integer, turning poorly-formed strings
into 0 (the default value for integers). [`parse`](https://doc.rust-lang.org/nightly/std/primitive.str.html#method.parse "method str::parse") converts
a string to any other type that implements [`FromStr`](https://doc.rust-lang.org/nightly/core/str/traits/trait.FromStr.html "trait core::str::traits::FromStr"), returning an
[`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err") on error.

```
let good_year_from_input = "1909";
let bad_year_from_input = "190blarg";
let good_year = good_year_from_input.parse().unwrap_or_default();
let bad_year = bad_year_from_input.parse().unwrap_or_default();

assert_eq!(1909, good_year);
assert_eq!(0, bad_year);
```

1.17.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1167-1169)

#### pub fn [expect\_err](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.expect_err)(self, msg: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> E where T: [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug"),

Returns the contained [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err") value, consuming the `self` value.

##### [§](#panics-2)Panics

Panics if the value is an [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok"), with a panic message including the
passed message, and the content of the [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok").

##### [§](#examples-21)Examples

[ⓘ](# "This example panics")

```
let x: Result<u32, &str> = Ok(10);
x.expect_err("Testing expect_err"); // panics with `Testing expect_err: 10`
```

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1198-1200)

#### pub fn [unwrap\_err](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.unwrap_err)(self) -> E where T: [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug"),

Returns the contained [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err") value, consuming the `self` value.

##### [§](#panics-3)Panics

Panics if the value is an [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok"), with a custom panic message provided
by the [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok")’s value.

##### [§](#examples-22)Examples

[ⓘ](# "This example panics")

```
let x: Result<u32, &str> = Ok(2);
x.unwrap_err(); // panics with `2`
```
```
let x: Result<u32, &str> = Err("emergency failure");
assert_eq!(x.unwrap_err(), "emergency failure");
```

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1233-1235)

#### pub fn [into\_ok](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.into_ok)(self) -> T where E: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[!](https://doc.rust-lang.org/nightly/std/primitive.never.html)>,

🔬This is a nightly-only experimental API. (`unwrap_infallible`)

Returns the contained [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok") value, but never panics.

Unlike [`unwrap`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#method.unwrap "method core::result::Result::unwrap"), this method is known to never panic on the
result types it is implemented for. Therefore, it can be used
instead of `unwrap` as a maintainability safeguard that will fail
to compile if the error type of the `Result` is later changed
to an error that can actually occur.

##### [§](#examples-23)Examples

```

fn only_good_news() -> Result<String, !> {
    Ok("this is fine".into())
}

let s: String = only_good_news().into_ok();
println!("{s}");
```

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1268-1270)

#### pub fn [into\_err](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.into_err)(self) -> E where T: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[!](https://doc.rust-lang.org/nightly/std/primitive.never.html)>,

🔬This is a nightly-only experimental API. (`unwrap_infallible`)

Returns the contained [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err") value, but never panics.

Unlike [`unwrap_err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#method.unwrap_err "method core::result::Result::unwrap_err"), this method is known to never panic on the
result types it is implemented for. Therefore, it can be used
instead of `unwrap_err` as a maintainability safeguard that will fail
to compile if the ok type of the `Result` is later changed
to a type that can actually occur.

##### [§](#examples-24)Examples

```

fn only_bad_news() -> Result<!, String> {
    Err("Oops, it failed".into())
}

let error: String = only_bad_news().into_err();
println!("{error}");
```

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1311)

#### pub fn [and](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.and)<U>(self, res: [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<U, E>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<U, E>

Returns `res` if the result is [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok"), otherwise returns the [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err") value of `self`.

Arguments passed to `and` are eagerly evaluated; if you are passing the
result of a function call, it is recommended to use [`and_then`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#method.and_then "method core::result::Result::and_then"), which is
lazily evaluated.

##### [§](#examples-25)Examples

```
let x: Result<u32, &str> = Ok(2);
let y: Result<&str, &str> = Err("late error");
assert_eq!(x.and(y), Err("late error"));

let x: Result<u32, &str> = Err("early error");
let y: Result<&str, &str> = Ok("foo");
assert_eq!(x.and(y), Err("early error"));

let x: Result<u32, &str> = Err("not a 2");
let y: Result<&str, &str> = Err("late error");
assert_eq!(x.and(y), Err("not a 2"));

let x: Result<u32, &str> = Ok(2);
let y: Result<&str, &str> = Ok("different result type");
assert_eq!(x.and(y), Ok("different result type"));
```

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1351)

#### pub fn [and\_then](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.and_then)<U, F>(self, op: F) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<U, E> where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(T) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<U, E>,

Calls `op` if the result is [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok"), otherwise returns the [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err") value of `self`.

This function can be used for control flow based on `Result` values.

##### [§](#examples-26)Examples

```
fn sq_then_to_string(x: u32) -> Result<String, &'static str> {
    x.checked_mul(x).map(|sq| sq.to_string()).ok_or("overflowed")
}

assert_eq!(Ok(2).and_then(sq_then_to_string), Ok(4.to_string()));
assert_eq!(Ok(1_000_000).and_then(sq_then_to_string), Err("overflowed"));
assert_eq!(Err("not a number").and_then(sq_then_to_string), Err("not a number"));
```

Often used to chain fallible operations that may return [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err").

```
use std::{io::ErrorKind, path::Path};

// Note: on Windows "/" maps to "C:\"
let root_modified_time = Path::new("/").metadata().and_then(|md| md.modified());
assert!(root_modified_time.is_ok());

let should_fail = Path::new("/bad/path").metadata().and_then(|md| md.modified());
assert!(should_fail.is_err());
assert_eq!(should_fail.unwrap_err().kind(), ErrorKind::NotFound);
```

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1387)

#### pub fn [or](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.or)<F>(self, res: [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, F>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, F>

Returns `res` if the result is [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err"), otherwise returns the [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok") value of `self`.

Arguments passed to `or` are eagerly evaluated; if you are passing the
result of a function call, it is recommended to use [`or_else`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#method.or_else "method core::result::Result::or_else"), which is
lazily evaluated.

##### [§](#examples-27)Examples

```
let x: Result<u32, &str> = Ok(2);
let y: Result<u32, &str> = Err("late error");
assert_eq!(x.or(y), Ok(2));

let x: Result<u32, &str> = Err("early error");
let y: Result<u32, &str> = Ok(2);
assert_eq!(x.or(y), Ok(2));

let x: Result<u32, &str> = Err("not a 2");
let y: Result<u32, &str> = Err("late error");
assert_eq!(x.or(y), Err("late error"));

let x: Result<u32, &str> = Ok(2);
let y: Result<u32, &str> = Ok(100);
assert_eq!(x.or(y), Ok(2));
```

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1412)

#### pub fn [or\_else](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.or_else)<F, O>(self, op: O) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, F> where O: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(E) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, F>,

Calls `op` if the result is [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err"), otherwise returns the [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok") value of `self`.

This function can be used for control flow based on result values.

##### [§](#examples-28)Examples

```
fn sq(x: u32) -> Result<u32, u32> { Ok(x * x) }
fn err(x: u32) -> Result<u32, u32> { Err(x) }

assert_eq!(Ok(2).or_else(sq).or_else(sq), Ok(2));
assert_eq!(Ok(2).or_else(err).or_else(sq), Ok(2));
assert_eq!(Err(3).or_else(sq).or_else(err), Ok(9));
assert_eq!(Err(3).or_else(err).or_else(err), Err(3));
```

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1439)

#### pub fn [unwrap\_or](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.unwrap_or)(self, default: T) -> T

Returns the contained [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok") value or a provided default.

Arguments passed to `unwrap_or` are eagerly evaluated; if you are passing
the result of a function call, it is recommended to use [`unwrap_or_else`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#method.unwrap_or_else "method core::result::Result::unwrap_or_else"),
which is lazily evaluated.

##### [§](#examples-29)Examples

```
let default = 2;
let x: Result<u32, &str> = Ok(9);
assert_eq!(x.unwrap_or(default), 9);

let x: Result<u32, &str> = Err("error");
assert_eq!(x.unwrap_or(default), default);
```

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1460)

#### pub fn [unwrap\_or\_else](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.unwrap_or_else)<F>(self, op: F) -> T where F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")(E) -> T,

Returns the contained [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok") value or computes it from a closure.

##### [§](#examples-30)Examples

```
fn count(x: &str) -> usize { x.len() }

assert_eq!(Ok(2).unwrap_or_else(count), 2);
assert_eq!(Err("foo").unwrap_or_else(count), 3);
```

1.58.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1490)

#### pub unsafe fn [unwrap\_unchecked](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.unwrap_unchecked)(self) -> T

Returns the contained [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok") value, consuming the `self` value,
without checking that the value is not an [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err").

##### [§](#safety)Safety

Calling this method on an [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err") is *[undefined behavior](https://doc.rust-lang.org/reference/behavior-considered-undefined.html)*.

##### [§](#examples-31)Examples

```
let x: Result<u32, &str> = Ok(2);
assert_eq!(unsafe { x.unwrap_unchecked() }, 2);
```
```
let x: Result<u32, &str> = Err("emergency failure");
unsafe { x.unwrap_unchecked(); } // Undefined behavior!
```

1.58.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1521)

#### pub unsafe fn [unwrap\_err\_unchecked](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#tymethod.unwrap_err_unchecked)(self) -> E

Returns the contained [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err") value, consuming the `self` value,
without checking that the value is not an [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok").

##### [§](#safety-1)Safety

Calling this method on an [`Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok") is *[undefined behavior](https://doc.rust-lang.org/reference/behavior-considered-undefined.html)*.

##### [§](#examples-32)Examples

```
let x: Result<u32, &str> = Ok(2);
unsafe { x.unwrap_err_unchecked() }; // Undefined behavior!
```
```
let x: Result<u32, &str> = Err("emergency failure");
assert_eq!(unsafe { x.unwrap_err_unchecked() }, "emergency failure");
```

## Trait Implementations

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1724-1727)[§](#impl-Clone-for-Result%3CT,+E%3E)

### impl<T, E> [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where T: [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone"), E: [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone"),

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1730)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E>

Returns a copy of the value. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1738)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E>)

Performs copy-assignment from `source`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)

[Source](https://docs.rs/anyhow/1.0.97/x86_64-unknown-linux-gnu/src/anyhow/context.rs.html#42-44)[§](#impl-Context%3CT,+E%3E-for-Result%3CT,+E%3E)

### impl<T, E> [Context](https://docs.rs/anyhow/1.0.97/x86_64-unknown-linux-gnu/anyhow/trait.Context.html "trait anyhow::Context")<T, E> for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where E: StdError + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static,

[Source](https://docs.rs/anyhow/1.0.97/x86_64-unknown-linux-gnu/src/anyhow/context.rs.html#46-48)[§](#method.context)

#### fn [context](https://docs.rs/anyhow/1.0.97/x86_64-unknown-linux-gnu/anyhow/trait.Context.html#tymethod.context)<C>(self, context: C) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, [Error](https://docs.rs/anyhow/1.0.97/x86_64-unknown-linux-gnu/anyhow/struct.Error.html "struct anyhow::Error")> where C: [Display](https://doc.rust-lang.org/nightly/core/fmt/trait.Display.html "trait core::fmt::Display") + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static,

Wrap the error value with additional context.

[Source](https://docs.rs/anyhow/1.0.97/x86_64-unknown-linux-gnu/src/anyhow/context.rs.html#58-61)[§](#method.with_context)

#### fn [with\_context](https://docs.rs/anyhow/1.0.97/x86_64-unknown-linux-gnu/anyhow/trait.Context.html#tymethod.with_context)<C, F>(self, context: F) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, [Error](https://docs.rs/anyhow/1.0.97/x86_64-unknown-linux-gnu/anyhow/struct.Error.html "struct anyhow::Error")> where C: [Display](https://doc.rust-lang.org/nightly/core/fmt/trait.Display.html "trait core::fmt::Display") + [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static, F: [FnOnce](https://doc.rust-lang.org/nightly/core/ops/function/trait.FnOnce.html "trait core::ops::function::FnOnce")() -> C,

Wrap the error value with additional context that is evaluated lazily
only once an error does occur.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#524)[§](#impl-Debug-for-Result%3CT,+E%3E)

### impl<T, E> [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where T: [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug"), E: [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug"),

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#524)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")>

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/src/serde/de/impls.rs.html#2992-2995)[§](#impl-Deserialize%3C'de%3E-for-Result%3CT,+E%3E)

### impl<'de, T, E> [Deserialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html "trait serde::de::Deserialize")<'de> for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where T: [Deserialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html "trait serde::de::Deserialize")<'de>, E: [Deserialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html "trait serde::de::Deserialize")<'de>,

[Source](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/src/serde/de/impls.rs.html#2997-2999)[§](#method.deserialize)

#### fn [deserialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html#tymethod.deserialize)<D>( deserializer: D, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E>, <D as [Deserializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html "trait serde::de::Deserializer")<'de>>::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")> where D: [Deserializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html "trait serde::de::Deserializer")<'de>,

Deserialize this value from the given Serde deserializer. [Read more](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html#tymethod.deserialize)

[Source](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/src/serde_with/de/impls.rs.html#352-355)[§](#impl-DeserializeAs%3C'de,+Result%3CT,+E%3E%3E-for-Result%3CTAs,+EAs%3E)

### impl<'de, T, TAs, E, EAs> [DeserializeAs](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/serde_with/de/trait.DeserializeAs.html "trait serde_with::de::DeserializeAs")<'de, [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E>> for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<TAs, EAs> where TAs: [DeserializeAs](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/serde_with/de/trait.DeserializeAs.html "trait serde_with::de::DeserializeAs")<'de, T>, EAs: [DeserializeAs](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/serde_with/de/trait.DeserializeAs.html "trait serde_with::de::DeserializeAs")<'de, E>,

[Source](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/src/serde_with/de/impls.rs.html#357-359)[§](#method.deserialize_as)

#### fn [deserialize\_as](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/serde_with/de/trait.DeserializeAs.html#tymethod.deserialize_as)<D>( deserializer: D, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E>, <D as [Deserializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html "trait serde::de::Deserializer")<'de>>::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")> where D: [Deserializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html "trait serde::de::Deserializer")<'de>,

Deserialize this value from the given Serde deserializer.

[Source](https://docs.rs/glib/0.18.5/x86_64-unknown-linux-gnu/src/glib/translate.rs.html#1519-1520)[§](#impl-FromGlib%3CG%3E-for-Result%3COption%3CT%3E,+I%3E)

### impl<G, I, T> [FromGlib](https://docs.rs/glib/0.18.5/x86_64-unknown-linux-gnu/glib/translate/trait.FromGlib.html "trait glib::translate::FromGlib")<G> for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<T>, I> where G: [Copy](https://doc.rust-lang.org/nightly/core/marker/trait.Copy.html "trait core::marker::Copy"), I: [Error](https://doc.rust-lang.org/nightly/core/error/trait.Error.html "trait core::error::Error"), T: [TryFromGlib](https://docs.rs/glib/0.18.5/x86_64-unknown-linux-gnu/glib/translate/trait.TryFromGlib.html "trait glib::translate::TryFromGlib")<G, Error = [GlibNoneOrInvalidError](https://docs.rs/glib/0.18.5/x86_64-unknown-linux-gnu/glib/translate/enum.GlibNoneOrInvalidError.html "enum glib::translate::GlibNoneOrInvalidError")<I>>,

[Source](https://docs.rs/glib/0.18.5/x86_64-unknown-linux-gnu/src/glib/translate.rs.html#1523)[§](#method.from_glib)

#### unsafe fn [from\_glib](https://docs.rs/glib/0.18.5/x86_64-unknown-linux-gnu/glib/translate/trait.FromGlib.html#tymethod.from_glib)(val: G) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<T>, I>

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1948)[§](#impl-FromIterator%3CResult%3CA,+E%3E%3E-for-Result%3CV,+E%3E)

### impl<A, E, V> [FromIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.FromIterator.html "trait core::iter::traits::collect::FromIterator")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<A, E>> for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V, E> where V: [FromIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.FromIterator.html "trait core::iter::traits::collect::FromIterator")<A>,

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1992)[§](#method.from_iter)

#### fn [from\_iter](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.FromIterator.html#tymethod.from_iter)<I>(iter: I) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<V, E> where I: [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator")<Item = [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<A, E>>,

Takes each element in the `Iterator`: if it is an `Err`, no further
elements are taken, and the `Err` is returned. Should no `Err` occur, a
container with the values of each `Result` is returned.

Here is an example which increments every integer in a vector,
checking for overflow:

```
let v = vec![1, 2];
let res: Result<Vec<u32>, &'static str> = v.iter().map(|x: &u32|
    x.checked_add(1).ok_or("Overflow!")
).collect();
assert_eq!(res, Ok(vec![2, 3]));
```

Here is another example that tries to subtract one from another list
of integers, this time checking for underflow:

```
let v = vec![1, 2, 0];
let res: Result<Vec<u32>, &'static str> = v.iter().map(|x: &u32|
    x.checked_sub(1).ok_or("Underflow!")
).collect();
assert_eq!(res, Err("Underflow!"));
```

Here is a variation on the previous example, showing that no
further elements are taken from `iter` after the first `Err`.

```
let v = vec![3, 2, 1, 10];
let mut shared = 0;
let res: Result<Vec<u32>, &'static str> = v.iter().map(|x: &u32| {
    shared += x;
    x.checked_sub(2).ok_or("Underflow!")
}).collect();
assert_eq!(res, Err("Underflow!"));
assert_eq!(shared, 6);
```

Since the third element caused an underflow, no further elements were taken,
so the final value of `shared` is 6 (= `3 + 2 + 1`), not 16.

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#2017)[§](#impl-FromResidual%3CResult%3CInfallible,+E%3E%3E-for-Result%3CT,+F%3E)

### impl<T, E, F> [FromResidual](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.FromResidual.html "trait core::ops::try_trait::FromResidual")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Infallible](https://doc.rust-lang.org/nightly/core/convert/enum.Infallible.html "enum core::convert::Infallible"), E>> for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, F> where F: [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<E>,

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#2020)[§](#method.from_residual)

#### fn [from\_residual](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.FromResidual.html#tymethod.from_residual)(residual: [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Infallible](https://doc.rust-lang.org/nightly/core/convert/enum.Infallible.html "enum core::convert::Infallible"), E>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, F>

🔬This is a nightly-only experimental API. (`try_trait_v2`)

Constructs the type from a compatible `Residual` type. [Read more](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.FromResidual.html#tymethod.from_residual)

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#2028)[§](#impl-FromResidual%3CYeet%3CE%3E%3E-for-Result%3CT,+F%3E)

### impl<T, E, F> [FromResidual](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.FromResidual.html "trait core::ops::try_trait::FromResidual")<[Yeet](https://doc.rust-lang.org/nightly/core/ops/try_trait/struct.Yeet.html "struct core::ops::try_trait::Yeet")<E>> for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, F> where F: [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<E>,

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#2030)[§](#method.from_residual-1)

#### fn [from\_residual](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.FromResidual.html#tymethod.from_residual)(\_: [Yeet](https://doc.rust-lang.org/nightly/core/ops/try_trait/struct.Yeet.html "struct core::ops::try_trait::Yeet")<E>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, F>

🔬This is a nightly-only experimental API. (`try_trait_v2`)

Constructs the type from a compatible `Residual` type. [Read more](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.FromResidual.html#tymethod.from_residual)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#524)[§](#impl-Hash-for-Result%3CT,+E%3E)

### impl<T, E> [Hash](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html "trait core::hash::Hash") for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where T: [Hash](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html "trait core::hash::Hash"), E: [Hash](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html "trait core::hash::Hash"),

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#524)[§](#method.hash)

#### fn [hash](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#tymethod.hash)<\_\_H>(&self, state: [&mut \_\_H](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) where \_\_H: [Hasher](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"),

Feeds this value into the given [`Hasher`](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"). [Read more](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#tymethod.hash)

1.3.0 · [Source](https://doc.rust-lang.org/nightly/src/core/hash/mod.rs.html#235-237)[§](#method.hash_slice)

#### fn [hash\_slice](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#method.hash_slice)<H>(data: &[Self], state: [&mut H](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) where H: [Hasher](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Feeds a slice of this type into the given [`Hasher`](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"). [Read more](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#method.hash_slice)

[Source](https://docs.rs/glib/0.18.5/x86_64-unknown-linux-gnu/src/glib/translate.rs.html#381-385)[§](#impl-IntoGlib-for-Result%3CO,+E%3E)

### impl<O, E, G> [IntoGlib](https://docs.rs/glib/0.18.5/x86_64-unknown-linux-gnu/glib/translate/trait.IntoGlib.html "trait glib::translate::IntoGlib") for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<O, E> where G: [Copy](https://doc.rust-lang.org/nightly/core/marker/trait.Copy.html "trait core::marker::Copy"), O: [IntoGlib](https://docs.rs/glib/0.18.5/x86_64-unknown-linux-gnu/glib/translate/trait.IntoGlib.html "trait glib::translate::IntoGlib")<GlibType = G> + [TryFromGlib](https://docs.rs/glib/0.18.5/x86_64-unknown-linux-gnu/glib/translate/trait.TryFromGlib.html "trait glib::translate::TryFromGlib")<G, Error = E>, E: [IntoGlib](https://docs.rs/glib/0.18.5/x86_64-unknown-linux-gnu/glib/translate/trait.IntoGlib.html "trait glib::translate::IntoGlib")<GlibType = G>,

[Source](https://docs.rs/glib/0.18.5/x86_64-unknown-linux-gnu/src/glib/translate.rs.html#387)[§](#associatedtype.GlibType)

#### type [GlibType](https://docs.rs/glib/0.18.5/x86_64-unknown-linux-gnu/glib/translate/trait.IntoGlib.html#associatedtype.GlibType) = G

[Source](https://docs.rs/glib/0.18.5/x86_64-unknown-linux-gnu/src/glib/translate.rs.html#390)[§](#method.into_glib)

#### fn [into\_glib](https://docs.rs/glib/0.18.5/x86_64-unknown-linux-gnu/glib/translate/trait.IntoGlib.html#tymethod.into_glib)(self) -> <[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<O, E> as [IntoGlib](https://docs.rs/glib/0.18.5/x86_64-unknown-linux-gnu/glib/translate/trait.IntoGlib.html "trait glib::translate::IntoGlib")>::[GlibType](https://docs.rs/glib/0.18.5/x86_64-unknown-linux-gnu/glib/translate/trait.IntoGlib.html#associatedtype.GlibType "type glib::translate::IntoGlib::GlibType")

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1756)[§](#impl-IntoIterator-for-Result%3CT,+E%3E)

### impl<T, E> [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator") for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E>

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1776)[§](#method.into_iter)

#### fn [into\_iter](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html#tymethod.into_iter)(self) -> [IntoIter](https://doc.rust-lang.org/nightly/core/result/struct.IntoIter.html "struct core::result::IntoIter")<T>

Returns a consuming iterator over the possibly contained value.

The iterator yields one value if the result is [`Result::Ok`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Ok "variant core::result::Result::Ok"), otherwise none.

##### [§](#examples)Examples

```
let x: Result<u32, &str> = Ok(5);
let v: Vec<u32> = x.into_iter().collect();
assert_eq!(v, [5]);

let x: Result<u32, &str> = Err("nothing!");
let v: Vec<u32> = x.into_iter().collect();
assert_eq!(v, []);
```

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1757)[§](#associatedtype.Item)

#### type [Item](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html#associatedtype.Item) = T

The type of the elements being iterated over.

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1758)[§](#associatedtype.IntoIter)

#### type [IntoIter](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html#associatedtype.IntoIter) = [IntoIter](https://doc.rust-lang.org/nightly/core/result/struct.IntoIter.html "struct core::result::IntoIter")<T>

Which kind of iterator are we turning this into?

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#524)[§](#impl-Ord-for-Result%3CT,+E%3E)

### impl<T, E> [Ord](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html "trait core::cmp::Ord") for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where T: [Ord](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html "trait core::cmp::Ord"), E: [Ord](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html "trait core::cmp::Ord"),

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#524)[§](#method.cmp)

#### fn [cmp](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#tymethod.cmp)(&self, other: &[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E>) -> [Ordering](https://doc.rust-lang.org/nightly/core/cmp/enum.Ordering.html "enum core::cmp::Ordering")

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

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#524)[§](#impl-PartialEq-for-Result%3CT,+E%3E)

### impl<T, E> [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq") for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where T: [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq"), E: [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq"),

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#524)[§](#method.eq)

#### fn [eq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#tymethod.eq)(&self, other: &[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E>) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `self` and `other` values to be equal, and is used by `==`.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#262)[§](#method.ne)

#### fn [ne](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#method.ne)(&self, other: [&Rhs](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `!=`. The default implementation is almost always sufficient,
and should not be overridden without very good reason.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#524)[§](#impl-PartialOrd-for-Result%3CT,+E%3E)

### impl<T, E> [PartialOrd](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html "trait core::cmp::PartialOrd") for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where T: [PartialOrd](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html "trait core::cmp::PartialOrd"), E: [PartialOrd](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html "trait core::cmp::PartialOrd"),

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#524)[§](#method.partial_cmp)

#### fn [partial\_cmp](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#tymethod.partial_cmp)(&self, other: &[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E>) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Ordering](https://doc.rust-lang.org/nightly/core/cmp/enum.Ordering.html "enum core::cmp::Ordering")>

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

1.16.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/accum.rs.html#184-186)[§](#impl-Product%3CResult%3CU,+E%3E%3E-for-Result%3CT,+E%3E)

### impl<T, U, E> [Product](https://doc.rust-lang.org/nightly/core/iter/traits/accum/trait.Product.html "trait core::iter::traits::accum::Product")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<U, E>> for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where T: [Product](https://doc.rust-lang.org/nightly/core/iter/traits/accum/trait.Product.html "trait core::iter::traits::accum::Product")<U>,

[Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/accum.rs.html#205-207)[§](#method.product)

#### fn [product](https://doc.rust-lang.org/nightly/core/iter/traits/accum/trait.Product.html#tymethod.product)<I>(iter: I) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where I: [Iterator](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator")<Item = [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<U, E>>,

Takes each element in the [`Iterator`](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator"): if it is an [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err"), no further
elements are taken, and the [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err") is returned. Should no [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err")
occur, the product of all elements is returned.

##### [§](#examples-1)Examples

This multiplies each number in a vector of strings,
if a string could not be parsed the operation returns `Err`:

```
let nums = vec!["5", "10", "1", "2"];
let total: Result<usize, _> = nums.iter().map(|w| w.parse::<usize>()).product();
assert_eq!(total, Ok(100));
let nums = vec!["5", "10", "one", "2"];
let total: Result<usize, _> = nums.iter().map(|w| w.parse::<usize>()).product();
assert!(total.is_err());
```

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#2036)[§](#impl-Residual%3CT%3E-for-Result%3CInfallible,+E%3E)

### impl<T, E> [Residual](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Residual.html "trait core::ops::try_trait::Residual")<T> for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Infallible](https://doc.rust-lang.org/nightly/core/convert/enum.Infallible.html "enum core::convert::Infallible"), E>

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#2037)[§](#associatedtype.TryType)

#### type [TryType](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Residual.html#associatedtype.TryType) = [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E>

🔬This is a nightly-only experimental API. (`try_trait_v2_residual`)

The “return” type of this meta-function.

[Source](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/src/serde/ser/impls.rs.html#716-719)[§](#impl-Serialize-for-Result%3CT,+E%3E)

### impl<T, E> [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize") for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where T: [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize"), E: [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize"),

[Source](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/src/serde/ser/impls.rs.html#721-723)[§](#method.serialize)

#### fn [serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html#tymethod.serialize)<S>( &self, serializer: S, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<<S as [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer")>::[Ok](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html#associatedtype.Ok "type serde::ser::Serializer::Ok"), <S as [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer")>::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html#associatedtype.Error "type serde::ser::Serializer::Error")> where S: [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer"),

Serialize this value into the given Serde serializer. [Read more](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html#tymethod.serialize)

[Source](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/src/serde_with/ser/impls.rs.html#312-315)[§](#impl-SerializeAs%3CResult%3CT,+E%3E%3E-for-Result%3CTAs,+EAs%3E)

### impl<T, TAs, E, EAs> [SerializeAs](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/serde_with/ser/trait.SerializeAs.html "trait serde_with::ser::SerializeAs")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E>> for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<TAs, EAs> where TAs: [SerializeAs](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/serde_with/ser/trait.SerializeAs.html "trait serde_with::ser::SerializeAs")<T>, EAs: [SerializeAs](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/serde_with/ser/trait.SerializeAs.html "trait serde_with::ser::SerializeAs")<E>,

[Source](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/src/serde_with/ser/impls.rs.html#317-319)[§](#method.serialize_as)

#### fn [serialize\_as](https://docs.rs/serde_with/3.12.0/x86_64-unknown-linux-gnu/serde_with/ser/trait.SerializeAs.html#tymethod.serialize_as)<S>( source: &[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E>, serializer: S, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<<S as [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer")>::[Ok](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html#associatedtype.Ok "type serde::ser::Serializer::Ok"), <S as [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer")>::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html#associatedtype.Error "type serde::ser::Serializer::Error")> where S: [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer"),

Serialize this value into the given Serde serializer.

1.16.0 · [Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/accum.rs.html#153-155)[§](#impl-Sum%3CResult%3CU,+E%3E%3E-for-Result%3CT,+E%3E)

### impl<T, U, E> [Sum](https://doc.rust-lang.org/nightly/core/iter/traits/accum/trait.Sum.html "trait core::iter::traits::accum::Sum")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<U, E>> for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where T: [Sum](https://doc.rust-lang.org/nightly/core/iter/traits/accum/trait.Sum.html "trait core::iter::traits::accum::Sum")<U>,

[Source](https://doc.rust-lang.org/nightly/src/core/iter/traits/accum.rs.html#175-177)[§](#method.sum)

#### fn [sum](https://doc.rust-lang.org/nightly/core/iter/traits/accum/trait.Sum.html#tymethod.sum)<I>(iter: I) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where I: [Iterator](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator")<Item = [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<U, E>>,

Takes each element in the [`Iterator`](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator"): if it is an [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err"), no further
elements are taken, and the [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err") is returned. Should no [`Err`](https://doc.rust-lang.org/nightly/core/result/enum.Result.html#variant.Err "variant core::result::Result::Err")
occur, the sum of all elements is returned.

##### [§](#examples-1)Examples

This sums up every integer in a vector, rejecting the sum if a negative
element is encountered:

```
let f = |&x: &i32| if x < 0 { Err("Negative element found") } else { Ok(x) };
let v = vec![1, 2];
let res: Result<i32, _> = v.iter().map(f).sum();
assert_eq!(res, Ok(3));
let v = vec![1, -2];
let res: Result<i32, _> = v.iter().map(f).sum();
assert_eq!(res, Err("Negative element found"));
```

1.61.0 · [Source](https://doc.rust-lang.org/nightly/src/std/process.rs.html#2501)[§](#impl-Termination-for-Result%3CT,+E%3E)

### impl<T, E> [Termination](https://doc.rust-lang.org/nightly/std/process/trait.Termination.html "trait std::process::Termination") for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where T: [Termination](https://doc.rust-lang.org/nightly/std/process/trait.Termination.html "trait std::process::Termination"), E: [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug"),

[Source](https://doc.rust-lang.org/nightly/src/std/process.rs.html#2502)[§](#method.report)

#### fn [report](https://doc.rust-lang.org/nightly/std/process/trait.Termination.html#tymethod.report)(self) -> [ExitCode](https://doc.rust-lang.org/nightly/std/process/struct.ExitCode.html "struct std::process::ExitCode")

Is called to get the representation of the value as status code.
This status code is returned to the operating system.

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1998)[§](#impl-Try-for-Result%3CT,+E%3E)

### impl<T, E> [Try](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html "trait core::ops::try_trait::Try") for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E>

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1999)[§](#associatedtype.Output)

#### type [Output](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html#associatedtype.Output) = T

🔬This is a nightly-only experimental API. (`try_trait_v2`)

The type of the value produced by `?` when *not* short-circuiting.

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#2000)[§](#associatedtype.Residual)

#### type [Residual](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html#associatedtype.Residual) = [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Infallible](https://doc.rust-lang.org/nightly/core/convert/enum.Infallible.html "enum core::convert::Infallible"), E>

🔬This is a nightly-only experimental API. (`try_trait_v2`)

The type of the value passed to [`FromResidual::from_residual`](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.FromResidual.html#tymethod.from_residual "associated function core::ops::try_trait::FromResidual::from_residual")
as part of `?` when short-circuiting. [Read more](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html#associatedtype.Residual)

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#2003)[§](#method.from_output)

#### fn [from\_output](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html#tymethod.from_output)(output: <[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> as [Try](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html "trait core::ops::try_trait::Try")>::[Output](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html#associatedtype.Output "type core::ops::try_trait::Try::Output")) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E>

🔬This is a nightly-only experimental API. (`try_trait_v2`)

Constructs the type from its `Output` type. [Read more](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html#tymethod.from_output)

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#2008)[§](#method.branch)

#### fn [branch](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html#tymethod.branch)( self, ) -> [ControlFlow](https://doc.rust-lang.org/nightly/core/ops/control_flow/enum.ControlFlow.html "enum core::ops::control_flow::ControlFlow")<<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> as [Try](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html "trait core::ops::try_trait::Try")>::[Residual](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html#associatedtype.Residual "type core::ops::try_trait::Try::Residual"), <[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> as [Try](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html "trait core::ops::try_trait::Try")>::[Output](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html#associatedtype.Output "type core::ops::try_trait::Try::Output")>

🔬This is a nightly-only experimental API. (`try_trait_v2`)

Used in `?` to decide whether the operator should produce a value
(because this returned [`ControlFlow::Continue`](https://doc.rust-lang.org/nightly/core/ops/control_flow/enum.ControlFlow.html#variant.Continue "variant core::ops::control_flow::ControlFlow::Continue"))
or propagate a value back to the caller
(because this returned [`ControlFlow::Break`](https://doc.rust-lang.org/nightly/core/ops/control_flow/enum.ControlFlow.html#variant.Break "variant core::ops::control_flow::ControlFlow::Break")). [Read more](https://doc.rust-lang.org/nightly/core/ops/try_trait/trait.Try.html#tymethod.branch)

[Source](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/src/writeable/try_writeable.rs.html#292-295)[§](#impl-TryWriteable-for-Result%3CT,+E%3E)

### impl<T, E> [TryWriteable](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/try_writeable/trait.TryWriteable.html "trait writeable::try_writeable::TryWriteable") for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where T: [Writeable](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/trait.Writeable.html "trait writeable::Writeable"), E: [Writeable](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/trait.Writeable.html "trait writeable::Writeable") + [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone"),

[Source](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/src/writeable/try_writeable.rs.html#297)[§](#associatedtype.Error)

#### type [Error](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/try_writeable/trait.TryWriteable.html#associatedtype.Error) = E

[Source](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/src/writeable/try_writeable.rs.html#300-303)[§](#method.try_write_to)

#### fn [try\_write\_to](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/try_writeable/trait.TryWriteable.html#method.try_write_to)<W>( &self, sink: [&mut W](https://doc.rust-lang.org/nightly/std/primitive.reference.html), ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), <[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> as [TryWriteable](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/try_writeable/trait.TryWriteable.html "trait writeable::try_writeable::TryWriteable")>::[Error](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/try_writeable/trait.TryWriteable.html#associatedtype.Error "type writeable::try_writeable::TryWriteable::Error")>, [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")> where W: [Write](https://doc.rust-lang.org/nightly/core/fmt/trait.Write.html "trait core::fmt::Write") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Writes the content of this writeable to a sink. [Read more](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/try_writeable/trait.TryWriteable.html#method.try_write_to)

[Source](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/src/writeable/try_writeable.rs.html#311-314)[§](#method.try_write_to_parts)

#### fn [try\_write\_to\_parts](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/try_writeable/trait.TryWriteable.html#tymethod.try_write_to_parts)<S>( &self, sink: [&mut S](https://doc.rust-lang.org/nightly/std/primitive.reference.html), ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), <[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> as [TryWriteable](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/try_writeable/trait.TryWriteable.html "trait writeable::try_writeable::TryWriteable")>::[Error](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/try_writeable/trait.TryWriteable.html#associatedtype.Error "type writeable::try_writeable::TryWriteable::Error")>, [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")> where S: [PartsWrite](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/trait.PartsWrite.html "trait writeable::PartsWrite") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Writes the content of this writeable to a sink with parts (annotations). [Read more](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/try_writeable/trait.TryWriteable.html#tymethod.try_write_to_parts)

[Source](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/src/writeable/try_writeable.rs.html#324)[§](#method.writeable_length_hint)

#### fn [writeable\_length\_hint](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/try_writeable/trait.TryWriteable.html#method.writeable_length_hint)(&self) -> [LengthHint](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/struct.LengthHint.html "struct writeable::LengthHint")

Returns a hint for the number of UTF-8 bytes that will be written to the sink. [Read more](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/try_writeable/trait.TryWriteable.html#method.writeable_length_hint)

[Source](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/src/writeable/try_writeable.rs.html#332)[§](#method.try_write_to_string)

#### fn [try\_write\_to\_string](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/try_writeable/trait.TryWriteable.html#method.try_write_to_string)( &self, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'\_, [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>, (<[Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> as [TryWriteable](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/try_writeable/trait.TryWriteable.html "trait writeable::try_writeable::TryWriteable")>::[Error](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/try_writeable/trait.TryWriteable.html#associatedtype.Error "type writeable::try_writeable::TryWriteable::Error"), [Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'\_, [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>)>

Writes the content of this writeable to a string. [Read more](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/try_writeable/trait.TryWriteable.html#method.try_write_to_string)

[Source](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/src/writeable/try_writeable.rs.html#340)[§](#method.writeable_cmp_bytes)

#### fn [writeable\_cmp\_bytes](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/try_writeable/trait.TryWriteable.html#method.writeable_cmp_bytes)(&self, other: &[[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)]) -> [Ordering](https://doc.rust-lang.org/nightly/core/cmp/enum.Ordering.html "enum core::cmp::Ordering")

Compares the content of this writeable to a byte slice. [Read more](https://docs.rs/writeable/0.5.5/x86_64-unknown-linux-gnu/writeable/try_writeable/trait.TryWriteable.html#method.writeable_cmp_bytes)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#524)[§](#impl-Copy-for-Result%3CT,+E%3E)

### impl<T, E> [Copy](https://doc.rust-lang.org/nightly/core/marker/trait.Copy.html "trait core::marker::Copy") for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where T: [Copy](https://doc.rust-lang.org/nightly/core/marker/trait.Copy.html "trait core::marker::Copy"), E: [Copy](https://doc.rust-lang.org/nightly/core/marker/trait.Copy.html "trait core::marker::Copy"),

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#524)[§](#impl-Eq-for-Result%3CT,+E%3E)

### impl<T, E> [Eq](https://doc.rust-lang.org/nightly/core/cmp/trait.Eq.html "trait core::cmp::Eq") for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where T: [Eq](https://doc.rust-lang.org/nightly/core/cmp/trait.Eq.html "trait core::cmp::Eq"), E: [Eq](https://doc.rust-lang.org/nightly/core/cmp/trait.Eq.html "trait core::cmp::Eq"),

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#524)[§](#impl-StructuralPartialEq-for-Result%3CT,+E%3E)

### impl<T, E> [StructuralPartialEq](https://doc.rust-lang.org/nightly/core/marker/trait.StructuralPartialEq.html "trait core::marker::StructuralPartialEq") for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E>

[Source](https://doc.rust-lang.org/nightly/src/core/result.rs.html#1748-1751)[§](#impl-UseCloned-for-Result%3CT,+E%3E)

### impl<T, E> [UseCloned](https://doc.rust-lang.org/nightly/core/clone/trait.UseCloned.html "trait core::clone::UseCloned") for [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, E> where T: [UseCloned](https://doc.rust-lang.org/nightly/core/clone/trait.UseCloned.html "trait core::clone::UseCloned"), E: [UseCloned](https://doc.rust-lang.org/nightly/core/clone/trait.UseCloned.html "trait core::clone::UseCloned"),