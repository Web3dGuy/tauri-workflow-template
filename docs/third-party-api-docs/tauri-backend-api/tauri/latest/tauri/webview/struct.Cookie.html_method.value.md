# Struct CookieCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#215)

```
pub struct Cookie<'c> { /* private fields */ }
```

Expand description

Representation of an HTTP cookie.

### [§](#constructing-a-cookie)Constructing a `Cookie`

To construct a cookie with only a name/value, use [`Cookie::new()`](struct.Cookie.html_method.new.md "associated function tauri::webview::Cookie::new"):

```
use cookie::Cookie;

let cookie = Cookie::new("name", "value");
assert_eq!(cookie.to_string(), "name=value");
```

### [§](#building-a-cookie)Building a `Cookie`

To construct more elaborate cookies, use [`Cookie::build()`](struct.Cookie.html_method.build.md "associated function tauri::webview::Cookie::build") and
[`CookieBuilder`](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/cookie/builder/struct.CookieBuilder.html "struct cookie::builder::CookieBuilder") methods. `Cookie::build()` accepts any type that
implements `T: Into<Cookie>`. See [`Cookie::build()`](struct.Cookie.html_method.build.md "associated function tauri::webview::Cookie::build") for details.

```
use cookie::Cookie;

let cookie = Cookie::build(("name", "value"))
    .domain("www.rust-lang.org")
    .path("/")
    .secure(true)
    .http_only(true);

jar.add(cookie);
jar.remove(Cookie::build("name").path("/"));
```

## Implementations[§](#implementations)

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#241)[§](#impl-Cookie%3C'c%3E)

### impl<'c> [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'c>

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#256-258)

#### pub fn [new](#method.new)<N, V>(name: N, value: V) -> [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'c> where N: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'c, [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>, V: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'c, [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>,

Creates a new `Cookie` with the given name and value.

##### [§](#example)Example

```
use cookie::Cookie;

let cookie = Cookie::new("name", "value");
assert_eq!(cookie.name_value(), ("name", "value"));

// This is equivalent to `from` with a `(name, value)` tuple:
let cookie = Cookie::from(("name", "value"));
assert_eq!(cookie.name_value(), ("name", "value"));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#292-293)

#### pub fn [named](#method.named)<N>(name: N) -> [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'c> where N: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'c, [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>,

👎Deprecated since 0.18.0: use `Cookie::build(name)` or `Cookie::from(name)`

Creates a new `Cookie` with the given name and an empty value.

##### [§](#example-1)Example

```
use cookie::Cookie;

let cookie = Cookie::named("name");
assert_eq!(cookie.name(), "name");
assert!(cookie.value().is_empty());

// This is equivalent to `from` with `"name`:
let cookie = Cookie::from("name");
assert_eq!(cookie.name(), "name");
assert!(cookie.value().is_empty());
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#327)

#### pub fn [build](#method.build)<C>(base: C) -> [CookieBuilder](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/cookie/builder/struct.CookieBuilder.html "struct cookie::builder::CookieBuilder")<'c> where C: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'c>>,

Creates a new [`CookieBuilder`](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/cookie/builder/struct.CookieBuilder.html "struct cookie::builder::CookieBuilder") starting from a `base` cookie.

Any type that implements `T: Into<Cookie>` can be used as a `base`:

| `Into<Cookie>` Type | Example | Equivalent To |
| --- | --- | --- |
| `(K, V)`, `K, V: Into<Cow<str>>` | `("name", "value")` | `Cookie::new(name, value)` |
| `&str`, `String`, `Cow<str>` | `"name"` | `Cookie::new(name, "")` |
| [`CookieBuilder`](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/cookie/builder/struct.CookieBuilder.html "struct cookie::builder::CookieBuilder") | `Cookie::build("foo")` | [`CookieBuilder::build()`](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/cookie/builder/struct.CookieBuilder.html#method.build "method cookie::builder::CookieBuilder::build") |

##### [§](#example-2)Example

```
use cookie::Cookie;

// Use `(K, V)` as the base, setting a name and value.
let b1 = Cookie::build(("name", "value")).path("/");
assert_eq!(b1.inner().name_value(), ("name", "value"));
assert_eq!(b1.inner().path(), Some("/"));

// Use `&str` as the base, setting a name and empty value.
let b2 = Cookie::build(("name"));
assert_eq!(b2.inner().name_value(), ("name", ""));

// Use `CookieBuilder` as the base, inheriting all properties.
let b3 = Cookie::build(b1);
assert_eq!(b3.inner().name_value(), ("name", "value"));
assert_eq!(b3.inner().path(), Some("/"));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#344-345)

#### pub fn [parse](#method.parse)<S>(s: S) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'c>, [ParseError](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/cookie/parse/enum.ParseError.html "enum cookie::parse::ParseError")> where S: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'c, [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>,

Parses a `Cookie` from the given HTTP cookie header value string. Does
not perform any percent-decoding.

##### [§](#example-3)Example

```
use cookie::Cookie;

let c = Cookie::parse("foo=bar%20baz; HttpOnly").unwrap();
assert_eq!(c.name_value(), ("foo", "bar%20baz"));
assert_eq!(c.http_only(), Some(true));
assert_eq!(c.secure(), None);
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#401-402)

#### pub fn [split\_parse](#method.split_parse)<S>(string: S) -> [SplitCookies](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/cookie/struct.SplitCookies.html "struct cookie::SplitCookies")<'c> where S: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'c, [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>,

Parses the HTTP `Cookie` header, a series of cookie names and value
separated by `;`, returning an iterator over the parse results. Each
item returned by the iterator is a `Result<Cookie, ParseError>` of
parsing one name/value pair. Empty cookie values (i.e, in `a=1;;b=2`)
and any excess surrounding whitespace are ignored.

Unlike [`Cookie::split_parse_encoded()`], this method *does **not***
percent-decode keys and values.

##### [§](#example-4)Example

```
use cookie::Cookie;

let string = "name=value; other=key%20value";
for cookie in Cookie::split_parse(string) {
    let cookie = cookie.unwrap();
    match cookie.name() {
        "name" => assert_eq!(cookie.value(), "value"),
        "other" => assert_eq!(cookie.value(), "key%20value"),
        _ => unreachable!()
    }
}
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#464)

#### pub fn [into\_owned](#method.into_owned)(self) -> [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'static>

Converts `self` into a `Cookie` with a static lifetime with as few
allocations as possible.

##### [§](#example-5)Example

```
use cookie::Cookie;

let c = Cookie::new("a", "b");
let owned_cookie = c.into_owned();
assert_eq!(owned_cookie.name_value(), ("a", "b"));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#491)

#### pub fn [name](#method.name)(&self) -> &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

Returns the name of `self`.

##### [§](#example-6)Example

```
use cookie::Cookie;

let c = Cookie::new("name", "value");
assert_eq!(c.name(), "name");
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#512)

#### pub fn [value](#method.value)(&self) -> &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

Returns the value of `self`.

Does not strip surrounding quotes. See [`Cookie::value_trimmed()`](struct.Cookie.html_method.value_trimmed.md "method tauri::webview::Cookie::value_trimmed") for a
version that does.

##### [§](#example-7)Example

```
use cookie::Cookie;

let c = Cookie::new("name", "value");
assert_eq!(c.value(), "value");

let c = Cookie::new("name", "\"value\"");
assert_eq!(c.value(), "\"value\"");
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#546)

#### pub fn [value\_trimmed](#method.value_trimmed)(&self) -> &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

Returns the value of `self` with surrounding double-quotes trimmed.

This is *not* the value of the cookie (*that* is [`Cookie::value()`](struct.Cookie.html_method.value.md "method tauri::webview::Cookie::value")).
Instead, this is the value with a surrounding pair of double-quotes, if
any, trimmed away. Quotes are only trimmed when they form a pair and
never otherwise. The trimmed value is never used for other operations,
such as equality checking, on `self`.

##### [§](#example-8)Example

```
use cookie::Cookie;
let c0 = Cookie::new("name", "value");
assert_eq!(c0.value_trimmed(), "value");

let c = Cookie::new("name", "\"value\"");
assert_eq!(c.value_trimmed(), "value");
assert!(c != c0);

let c = Cookie::new("name", "\"value");
assert_eq!(c.value(), "\"value");
assert_eq!(c.value_trimmed(), "\"value");
assert!(c != c0);

let c = Cookie::new("name", "\"value\"\"");
assert_eq!(c.value(), "\"value\"\"");
assert_eq!(c.value_trimmed(), "value\"");
assert!(c != c0);
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#574)

#### pub fn [name\_value](#method.name_value)(&self) -> (&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html))

Returns the name and value of `self` as a tuple of `(name, value)`.

##### [§](#example-9)Example

```
use cookie::Cookie;

let c = Cookie::new("name", "value");
assert_eq!(c.name_value(), ("name", "value"));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#590)

#### pub fn [name\_value\_trimmed](#method.name_value_trimmed)(&self) -> (&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html))

Returns the name and [trimmed value](struct.Cookie.html_method.value_trimmed.md "method tauri::webview::Cookie::value_trimmed") of `self`
as a tuple of `(name, trimmed_value)`.

##### [§](#example-10)Example

```
use cookie::Cookie;

let c = Cookie::new("name", "\"value\"");
assert_eq!(c.name_value_trimmed(), ("name", "value"));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#622)

#### pub fn [http\_only](#method.http_only)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Returns whether this cookie was marked `HttpOnly` or not. Returns
`Some(true)` when the cookie was explicitly set (manually or parsed) as
`HttpOnly`, `Some(false)` when `http_only` was manually set to `false`,
and `None` otherwise.

##### [§](#example-11)Example

```
use cookie::Cookie;

let c = Cookie::parse("name=value; httponly").unwrap();
assert_eq!(c.http_only(), Some(true));

let mut c = Cookie::new("name", "value");
assert_eq!(c.http_only(), None);

let mut c = Cookie::new("name", "value");
assert_eq!(c.http_only(), None);

// An explicitly set "false" value.
c.set_http_only(false);
assert_eq!(c.http_only(), Some(false));

// An explicitly set "true" value.
c.set_http_only(true);
assert_eq!(c.http_only(), Some(true));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#654)

#### pub fn [secure](#method.secure)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Returns whether this cookie was marked `Secure` or not. Returns
`Some(true)` when the cookie was explicitly set (manually or parsed) as
`Secure`, `Some(false)` when `secure` was manually set to `false`, and
`None` otherwise.

##### [§](#example-12)Example

```
use cookie::Cookie;

let c = Cookie::parse("name=value; Secure").unwrap();
assert_eq!(c.secure(), Some(true));

let mut c = Cookie::parse("name=value").unwrap();
assert_eq!(c.secure(), None);

let mut c = Cookie::new("name", "value");
assert_eq!(c.secure(), None);

// An explicitly set "false" value.
c.set_secure(false);
assert_eq!(c.secure(), Some(false));

// An explicitly set "true" value.
c.set_secure(true);
assert_eq!(c.secure(), Some(true));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#669)

#### pub fn [same\_site](#method.same_site)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[SameSite](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/cookie/same_site/enum.SameSite.html "enum cookie::same_site::SameSite")>

Returns the `SameSite` attribute of this cookie if one was specified.

##### [§](#example-13)Example

```
use cookie::{Cookie, SameSite};

let c = Cookie::parse("name=value; SameSite=Lax").unwrap();
assert_eq!(c.same_site(), Some(SameSite::Lax));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#706)

#### pub fn [partitioned](#method.partitioned)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>

Returns whether this cookie was marked `Partitioned` or not. Returns
`Some(true)` when the cookie was explicitly set (manually or parsed) as
`Partitioned`, `Some(false)` when `partitioned` was manually set to `false`,
and `None` otherwise.

**Note:** This cookie attribute is an [HTTP draft](https://www.ietf.org/id/draft-cutler-httpbis-partitioned-cookies-01.html)! Its meaning and
definition are not standardized and therefore subject to change.

##### [§](#example-14)Example

```
use cookie::Cookie;

let c = Cookie::parse("name=value; Partitioned").unwrap();
assert_eq!(c.partitioned(), Some(true));

let mut c = Cookie::parse("name=value").unwrap();
assert_eq!(c.partitioned(), None);

let mut c = Cookie::new("name", "value");
assert_eq!(c.partitioned(), None);

// An explicitly set "false" value.
c.set_partitioned(false);
assert_eq!(c.partitioned(), Some(false));

// An explicitly set "true" value.
c.set_partitioned(true);
assert_eq!(c.partitioned(), Some(true));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#724)

#### pub fn [max\_age](#method.max_age)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Duration](https://docs.rs/time/0.3.41/x86_64-unknown-linux-gnu/time/duration/struct.Duration.html "struct time::duration::Duration")>

Returns the specified max-age of the cookie if one was specified.

##### [§](#example-15)Example

```
use cookie::Cookie;

let c = Cookie::parse("name=value").unwrap();
assert_eq!(c.max_age(), None);

let c = Cookie::parse("name=value; Max-Age=3600").unwrap();
assert_eq!(c.max_age().map(|age| age.whole_hours()), Some(1));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#745)

#### pub fn [path](#method.path)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>

Returns the `Path` of the cookie if one was specified.

##### [§](#example-16)Example

```
use cookie::Cookie;

let c = Cookie::parse("name=value").unwrap();
assert_eq!(c.path(), None);

let c = Cookie::parse("name=value; Path=/").unwrap();
assert_eq!(c.path(), Some("/"));

let c = Cookie::parse("name=value; path=/sub").unwrap();
assert_eq!(c.path(), Some("/sub"));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#777)

#### pub fn [domain](#method.domain)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>

Returns the `Domain` of the cookie if one was specified.

This does not consider whether the `Domain` is valid; validation is left
to higher-level libraries, as needed. However, if the `Domain` starts
with a leading `.`, the leading `.` is stripped.

##### [§](#example-17)Example

```
use cookie::Cookie;

let c = Cookie::parse("name=value").unwrap();
assert_eq!(c.domain(), None);

let c = Cookie::parse("name=value; Domain=crates.io").unwrap();
assert_eq!(c.domain(), Some("crates.io"));

let c = Cookie::parse("name=value; Domain=.crates.io").unwrap();
assert_eq!(c.domain(), Some("crates.io"));

// Note that `..crates.io` is not a valid domain.
let c = Cookie::parse("name=value; Domain=..crates.io").unwrap();
assert_eq!(c.domain(), Some(".crates.io"));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#807)

#### pub fn [expires](#method.expires)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Expiration](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/cookie/expiration/enum.Expiration.html "enum cookie::expiration::Expiration")>

Returns the [`Expiration`](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/cookie/expiration/enum.Expiration.html "enum cookie::expiration::Expiration") of the cookie if one was specified.

##### [§](#example-18)Example

```
use cookie::{Cookie, Expiration};

let c = Cookie::parse("name=value").unwrap();
assert_eq!(c.expires(), None);

// Here, `cookie.expires_datetime()` returns `None`.
let c = Cookie::build(("name", "value")).expires(None).build();
assert_eq!(c.expires(), Some(Expiration::Session));

let expire_time = "Wed, 21 Oct 2017 07:28:00 GMT";
let cookie_str = format!("name=value; Expires={}", expire_time);
let c = Cookie::parse(cookie_str).unwrap();
assert_eq!(c.expires().and_then(|e| e.datetime()).map(|t| t.year()), Some(2017));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#831)

#### pub fn [expires\_datetime](#method.expires_datetime)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[OffsetDateTime](https://docs.rs/time/0.3.41/x86_64-unknown-linux-gnu/time/offset_date_time/struct.OffsetDateTime.html "struct time::offset_date_time::OffsetDateTime")>

Returns the expiration date-time of the cookie if one was specified.

##### [§](#example-19)Example

```
use cookie::Cookie;

let c = Cookie::parse("name=value").unwrap();
assert_eq!(c.expires_datetime(), None);

// Here, `cookie.expires()` returns `Some`.
let c = Cookie::build(("name", "value")).expires(None).build();
assert_eq!(c.expires_datetime(), None);

let expire_time = "Wed, 21 Oct 2017 07:28:00 GMT";
let cookie_str = format!("name=value; Expires={}", expire_time);
let c = Cookie::parse(cookie_str).unwrap();
assert_eq!(c.expires_datetime().map(|t| t.year()), Some(2017));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#848)

#### pub fn [set\_name](#method.set_name)<N>(&mut self, name: N) where N: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'c, [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>,

Sets the name of `self` to `name`.

##### [§](#example-20)Example

```
use cookie::Cookie;

let mut c = Cookie::new("name", "value");
assert_eq!(c.name(), "name");

c.set_name("foo");
assert_eq!(c.name(), "foo");
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#865)

#### pub fn [set\_value](#method.set_value)<V>(&mut self, value: V) where V: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'c, [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>,

Sets the value of `self` to `value`.

##### [§](#example-21)Example

```
use cookie::Cookie;

let mut c = Cookie::new("name", "value");
assert_eq!(c.value(), "value");

c.set_value("bar");
assert_eq!(c.value(), "bar");
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#890)

#### pub fn [set\_http\_only](#method.set_http_only)<T>(&mut self, value: T) where T: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>>,

Sets the value of `http_only` in `self` to `value`. If `value` is
`None`, the field is unset.

##### [§](#example-22)Example

```
use cookie::Cookie;

let mut c = Cookie::new("name", "value");
assert_eq!(c.http_only(), None);

c.set_http_only(true);
assert_eq!(c.http_only(), Some(true));

c.set_http_only(false);
assert_eq!(c.http_only(), Some(false));

c.set_http_only(None);
assert_eq!(c.http_only(), None);
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#915)

#### pub fn [set\_secure](#method.set_secure)<T>(&mut self, value: T) where T: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>>,

Sets the value of `secure` in `self` to `value`. If `value` is `None`,
the field is unset.

##### [§](#example-23)Example

```
use cookie::Cookie;

let mut c = Cookie::new("name", "value");
assert_eq!(c.secure(), None);

c.set_secure(true);
assert_eq!(c.secure(), Some(true));

c.set_secure(false);
assert_eq!(c.secure(), Some(false));

c.set_secure(None);
assert_eq!(c.secure(), None);
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#954)

#### pub fn [set\_same\_site](#method.set_same_site)<T>(&mut self, value: T) where T: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[SameSite](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/cookie/same_site/enum.SameSite.html "enum cookie::same_site::SameSite")>>,

Sets the value of `same_site` in `self` to `value`. If `value` is
`None`, the field is unset. If `value` is `SameSite::None`, the “Secure”
flag will be set when the cookie is written out unless `secure` is
explicitly set to `false` via [`Cookie::set_secure()`](struct.Cookie.html_method.set_secure.md "method tauri::webview::Cookie::set_secure") or the equivalent
builder method.

##### [§](#example-24)Example

```
use cookie::{Cookie, SameSite};

let mut c = Cookie::new("name", "value");
assert_eq!(c.same_site(), None);

c.set_same_site(SameSite::None);
assert_eq!(c.same_site(), Some(SameSite::None));
assert_eq!(c.to_string(), "name=value; SameSite=None; Secure");

c.set_secure(false);
assert_eq!(c.to_string(), "name=value; SameSite=None");

let mut c = Cookie::new("name", "value");
assert_eq!(c.same_site(), None);

c.set_same_site(SameSite::Strict);
assert_eq!(c.same_site(), Some(SameSite::Strict));
assert_eq!(c.to_string(), "name=value; SameSite=Strict");

c.set_same_site(None);
assert_eq!(c.same_site(), None);
assert_eq!(c.to_string(), "name=value");
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#991)

#### pub fn [set\_partitioned](#method.set_partitioned)<T>(&mut self, value: T) where T: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)>>,

Sets the value of `partitioned` in `self` to `value`. If `value` is
`None`, the field is unset.

**Note:** *Partitioned* cookies require the `Secure` attribute to be
set. As such, `Partitioned` cookies are always rendered with the
`Secure` attribute, irrespective of the `Secure` attribute’s setting.

**Note:** This cookie attribute is an [HTTP draft](https://www.ietf.org/id/draft-cutler-httpbis-partitioned-cookies-01.html)! Its meaning and
definition are not standardized and therefore subject to change.

##### [§](#example-25)Example

```
use cookie::Cookie;

let mut c = Cookie::new("name", "value");
assert_eq!(c.partitioned(), None);

c.set_partitioned(true);
assert_eq!(c.partitioned(), Some(true));
assert!(c.to_string().contains("Secure"));

c.set_partitioned(false);
assert_eq!(c.partitioned(), Some(false));
assert!(!c.to_string().contains("Secure"));

c.set_partitioned(None);
assert_eq!(c.partitioned(), None);
assert!(!c.to_string().contains("Secure"));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1017)

#### pub fn [set\_max\_age](#method.set_max_age)<D>(&mut self, value: D) where D: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Duration](https://docs.rs/time/0.3.41/x86_64-unknown-linux-gnu/time/duration/struct.Duration.html "struct time::duration::Duration")>>,

Sets the value of `max_age` in `self` to `value`. If `value` is `None`,
the field is unset.

##### [§](#example-26)Example

```
use cookie::Cookie;
use cookie::time::Duration;

let mut c = Cookie::new("name", "value");
assert_eq!(c.max_age(), None);

c.set_max_age(Duration::hours(10));
assert_eq!(c.max_age(), Some(Duration::hours(10)));

c.set_max_age(None);
assert!(c.max_age().is_none());
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1034)

#### pub fn [set\_path](#method.set_path)<P>(&mut self, path: P) where P: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'c, [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>,

Sets the `path` of `self` to `path`.

##### [§](#example-27)Example

```
use cookie::Cookie;

let mut c = Cookie::new("name", "value");
assert_eq!(c.path(), None);

c.set_path("/");
assert_eq!(c.path(), Some("/"));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1054)

#### pub fn [unset\_path](#method.unset_path)(&mut self)

Unsets the `path` of `self`.

##### [§](#example-28)Example

```
use cookie::Cookie;

let mut c = Cookie::new("name", "value");
assert_eq!(c.path(), None);

c.set_path("/");
assert_eq!(c.path(), Some("/"));

c.unset_path();
assert_eq!(c.path(), None);
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1071)

#### pub fn [set\_domain](#method.set_domain)<D>(&mut self, domain: D) where D: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'c, [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>,

Sets the `domain` of `self` to `domain`.

##### [§](#example-29)Example

```
use cookie::Cookie;

let mut c = Cookie::new("name", "value");
assert_eq!(c.domain(), None);

c.set_domain("rust-lang.org");
assert_eq!(c.domain(), Some("rust-lang.org"));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1091)

#### pub fn [unset\_domain](#method.unset_domain)(&mut self)

Unsets the `domain` of `self`.

##### [§](#example-30)Example

```
use cookie::Cookie;

let mut c = Cookie::new("name", "value");
assert_eq!(c.domain(), None);

c.set_domain("rust-lang.org");
assert_eq!(c.domain(), Some("rust-lang.org"));

c.unset_domain();
assert_eq!(c.domain(), None);
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1117)

#### pub fn [set\_expires](#method.set_expires)<T>(&mut self, time: T) where T: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Expiration](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/cookie/expiration/enum.Expiration.html "enum cookie::expiration::Expiration")>,

Sets the expires field of `self` to `time`. If `time` is `None`, an
expiration of [`Session`](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/cookie/expiration/enum.Expiration.html#variant.Session "variant cookie::expiration::Expiration::Session") is set.

##### [§](#example-31)Example

```
use cookie::{Cookie, Expiration};
use cookie::time::{Duration, OffsetDateTime};

let mut c = Cookie::new("name", "value");
assert_eq!(c.expires(), None);

let mut now = OffsetDateTime::now_utc();
now += Duration::weeks(52);

c.set_expires(now);
assert!(c.expires().is_some());

c.set_expires(None);
assert_eq!(c.expires(), Some(Expiration::Session));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1141)

#### pub fn [unset\_expires](#method.unset_expires)(&mut self)

Unsets the `expires` of `self`.

##### [§](#example-32)Example

```
use cookie::{Cookie, Expiration};

let mut c = Cookie::new("name", "value");
assert_eq!(c.expires(), None);

c.set_expires(None);
assert_eq!(c.expires(), Some(Expiration::Session));

c.unset_expires();
assert_eq!(c.expires(), None);
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1165)

#### pub fn [make\_permanent](#method.make_permanent)(&mut self)

Makes `self` a “permanent” cookie by extending its expiration and max
age 20 years into the future.

##### [§](#example-33)Example

```
use cookie::Cookie;
use cookie::time::Duration;

let mut c = Cookie::new("foo", "bar");
assert!(c.expires().is_none());
assert!(c.max_age().is_none());

c.make_permanent();
assert!(c.expires().is_some());
assert_eq!(c.max_age(), Some(Duration::days(365 * 20)));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1192)

#### pub fn [make\_removal](#method.make_removal)(&mut self)

Make `self` a “removal” cookie by clearing its value, setting a max-age
of `0`, and setting an expiration date far in the past.

##### [§](#example-34)Example

```
use cookie::Cookie;
use cookie::time::Duration;

let mut c = Cookie::new("foo", "bar");
c.make_permanent();
assert_eq!(c.max_age(), Some(Duration::days(365 * 20)));
assert_eq!(c.value(), "bar");

c.make_removal();
assert_eq!(c.value(), "");
assert_eq!(c.max_age(), Some(Duration::ZERO));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1263)

#### pub fn [name\_raw](#method.name_raw)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&'c [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>

Returns the name of `self` as a string slice of the raw string `self`
was originally parsed from. If `self` was not originally parsed from a
raw string, returns `None`.

This method differs from [`Cookie::name()`](struct.Cookie.html_method.name.md "method tauri::webview::Cookie::name") in that it returns a string
with the same lifetime as the originally parsed string. This lifetime
may outlive `self`. If a longer lifetime is not required, or you’re
unsure if you need a longer lifetime, use [`Cookie::name()`](struct.Cookie.html_method.name.md "method tauri::webview::Cookie::name").

##### [§](#example-35)Example

```
use cookie::Cookie;

let cookie_string = format!("{}={}", "foo", "bar");

// `c` will be dropped at the end of the scope, but `name` will live on
let name = {
    let c = Cookie::parse(cookie_string.as_str()).unwrap();
    c.name_raw()
};

assert_eq!(name, Some("foo"));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1293)

#### pub fn [value\_raw](#method.value_raw)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&'c [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>

Returns the value of `self` as a string slice of the raw string `self`
was originally parsed from. If `self` was not originally parsed from a
raw string, returns `None`.

This method differs from [`Cookie::value()`](struct.Cookie.html_method.value.md "method tauri::webview::Cookie::value") in that it returns a
string with the same lifetime as the originally parsed string. This
lifetime may outlive `self`. If a longer lifetime is not required, or
you’re unsure if you need a longer lifetime, use [`Cookie::value()`](struct.Cookie.html_method.value.md "method tauri::webview::Cookie::value").

##### [§](#example-36)Example

```
use cookie::Cookie;

let cookie_string = format!("{}={}", "foo", "bar");

// `c` will be dropped at the end of the scope, but `value` will live on
let value = {
    let c = Cookie::parse(cookie_string.as_str()).unwrap();
    c.value_raw()
};

assert_eq!(value, Some("bar"));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1324)

#### pub fn [path\_raw](#method.path_raw)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&'c [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>

Returns the `Path` of `self` as a string slice of the raw string `self`
was originally parsed from. If `self` was not originally parsed from a
raw string, or if `self` doesn’t contain a `Path`, or if the `Path` has
changed since parsing, returns `None`.

This method differs from [`Cookie::path()`](struct.Cookie.html_method.path.md "method tauri::webview::Cookie::path") in that it returns a
string with the same lifetime as the originally parsed string. This
lifetime may outlive `self`. If a longer lifetime is not required, or
you’re unsure if you need a longer lifetime, use [`Cookie::path()`](struct.Cookie.html_method.path.md "method tauri::webview::Cookie::path").

##### [§](#example-37)Example

```
use cookie::Cookie;

let cookie_string = format!("{}={}; Path=/", "foo", "bar");

// `c` will be dropped at the end of the scope, but `path` will live on
let path = {
    let c = Cookie::parse(cookie_string.as_str()).unwrap();
    c.path_raw()
};

assert_eq!(path, Some("/"));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1362)

#### pub fn [domain\_raw](#method.domain_raw)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&'c [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>

Returns the `Domain` of `self` as a string slice of the raw string
`self` was originally parsed from. If `self` was not originally parsed
from a raw string, or if `self` doesn’t contain a `Domain`, or if the
`Domain` has changed since parsing, returns `None`.

Like [`Cookie::domain()`](struct.Cookie.html_method.domain.md "method tauri::webview::Cookie::domain"), this does not consider whether `Domain` is
valid; validation is left to higher-level libraries, as needed. However,
if `Domain` starts with a leading `.`, the leading `.` is stripped.

This method differs from [`Cookie::domain()`](struct.Cookie.html_method.domain.md "method tauri::webview::Cookie::domain") in that it returns a
string with the same lifetime as the originally parsed string. This
lifetime may outlive `self` struct. If a longer lifetime is not
required, or you’re unsure if you need a longer lifetime, use
[`Cookie::domain()`](struct.Cookie.html_method.domain.md "method tauri::webview::Cookie::domain").

##### [§](#example-38)Example

```
use cookie::Cookie;

let cookie_string = format!("{}={}; Domain=.crates.io", "foo", "bar");

//`c` will be dropped at the end of the scope, but `domain` will live on
let domain = {
    let c = Cookie::parse(cookie_string.as_str()).unwrap();
    c.domain_raw()
};

assert_eq!(domain, Some("crates.io"));
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1415)

#### pub fn [stripped](#method.stripped)<'a>(&'a self) -> [Display](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/cookie/struct.Display.html "struct cookie::Display")<'a, 'c>

Wraps `self` in a stripped `Display`]: a cost-free wrapper around
`Cookie` whose [`fmt::Display`](https://doc.rust-lang.org/nightly/core/fmt/trait.Display.html "trait core::fmt::Display") implementation prints only the `name`
and `value` of the wrapped `Cookie`.

The returned structure can be chained with [`Display::encoded()`] to
encode the name and value.

##### [§](#example-39)Example

```
use cookie::Cookie;

let mut c = Cookie::build(("key?", "value")).secure(true).path("/").build();
assert_eq!(&c.stripped().to_string(), "key?=value");
```

## Trait Implementations[§](#trait-implementations)

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1679)[§](#impl-AsMut%3CCookie%3C'a%3E%3E-for-Cookie%3C'a%3E)

### impl<'a> [AsMut](https://doc.rust-lang.org/nightly/core/convert/trait.AsMut.html "trait core::convert::AsMut")<[Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'a>> for [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'a>

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1680)[§](#method.as_mut)

#### fn [as\_mut](https://doc.rust-lang.org/nightly/core/convert/trait.AsMut.html#tymethod.as_mut)(&mut self) -> &mut [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'a>

Converts this type into a mutable reference of the (usually inferred) input type.

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1673)[§](#impl-AsRef%3CCookie%3C'a%3E%3E-for-Cookie%3C'a%3E)

### impl<'a> [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'a>> for [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'a>

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1674)[§](#method.as_ref)

#### fn [as\_ref](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html#tymethod.as_ref)(&self) -> &[Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'a>

Converts this type into a shared reference of the (usually inferred) input type.

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#214)[§](#impl-Clone-for-Cookie%3C'c%3E)

### impl<'c> [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'c>

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#214)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'c>

Returns a copy of the value. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#174)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &Self)

Performs copy-assignment from `source`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#214)[§](#impl-Debug-for-Cookie%3C'c%3E)

### impl<'c> [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'c>

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#214)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")>

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1582)[§](#impl-Display-for-Cookie%3C'c%3E)

### impl<'c> [Display](https://doc.rust-lang.org/nightly/core/fmt/trait.Display.html "trait core::fmt::Display") for [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'c>

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1596)[§](#method.fmt-1)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Display.html#tymethod.fmt)(&self, f: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")>

Formats the cookie `self` as a `Set-Cookie` header value.

Does *not* percent-encode any values. To percent-encode, use
[`Cookie::encoded()`].

##### [§](#example-40)Example

```
use cookie::Cookie;

let mut cookie = Cookie::build(("foo", "bar")).path("/");
assert_eq!(cookie.to_string(), "foo=bar; Path=/");
```

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1640)[§](#impl-From%3C%26str%3E-for-Cookie%3C'a%3E)

### impl<'a> [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<&'a [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)> for [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'a>

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1641)[§](#method.from)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(name: &'a [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'a>

Converts to this type from the input type.

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1658-1660)[§](#impl-From%3C(N,+V)%3E-for-Cookie%3C'a%3E)

### impl<'a, N, V> [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[(N, V)](https://doc.rust-lang.org/nightly/std/primitive.tuple.html)> for [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'a> where N: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'a, [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>, V: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<[Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'a, [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>,

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1662)[§](#method.from-3)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(\_: [(N, V)](https://doc.rust-lang.org/nightly/std/primitive.tuple.html)) -> [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'a>

Converts to this type from the input type.

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1667)[§](#impl-From%3CCookieBuilder%3C'a%3E%3E-for-Cookie%3C'a%3E)

### impl<'a> [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[CookieBuilder](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/cookie/builder/struct.CookieBuilder.html "struct cookie::builder::CookieBuilder")<'a>> for [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'a>

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1668)[§](#method.from-4)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(builder: [CookieBuilder](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/cookie/builder/struct.CookieBuilder.html "struct cookie::builder::CookieBuilder")<'a>) -> [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'a>

Converts to this type from the input type.

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1652)[§](#impl-From%3CCow%3C'a,+str%3E%3E-for-Cookie%3C'a%3E)

### impl<'a> [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'a, [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>> for [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'a>

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1653)[§](#method.from-2)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(name: [Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'a, [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>) -> [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'a>

Converts to this type from the input type.

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1646)[§](#impl-From%3CString%3E-for-Cookie%3C'static%3E)

### impl [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")> for [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'static>

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1647)[§](#method.from-1)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(name: [String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")) -> [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'static>

Converts to this type from the input type.

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1602)[§](#impl-FromStr-for-Cookie%3C'static%3E)

### impl [FromStr](https://doc.rust-lang.org/nightly/core/str/traits/trait.FromStr.html "trait core::str::traits::FromStr") for [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'static>

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1603)[§](#associatedtype.Err)

#### type [Err](https://doc.rust-lang.org/nightly/core/str/traits/trait.FromStr.html#associatedtype.Err) = [ParseError](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/cookie/parse/enum.ParseError.html "enum cookie::parse::ParseError")

The associated error which can be returned from parsing.

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1605)[§](#method.from_str)

#### fn [from\_str](https://doc.rust-lang.org/nightly/core/str/traits/trait.FromStr.html#tymethod.from_str)(s: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'static>, [ParseError](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/cookie/parse/enum.ParseError.html "enum cookie::parse::ParseError")>

Parses a string `s` to return a value of this type. [Read more](https://doc.rust-lang.org/nightly/core/str/traits/trait.FromStr.html#tymethod.from_str)

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1610)[§](#impl-PartialEq%3CCookie%3C'b%3E%3E-for-Cookie%3C'a%3E)

### impl<'a, 'b> [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq")<[Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'b>> for [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'a>

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/lib.rs.html#1611)[§](#method.eq-1)

#### fn [eq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#tymethod.eq)(&self, other: &[Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'b>) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `self` and `other` values to be equal, and is used by `==`.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#262)[§](#method.ne-1)

#### fn [ne](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#method.ne)(&self, other: [&Rhs](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `!=`. The default implementation is almost always sufficient,
and should not be overridden without very good reason.

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/builder.rs.html#401)[§](#impl-PartialEq%3CCookieBuilder%3C'b%3E%3E-for-Cookie%3C'a%3E)

### impl<'a, 'b> [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq")<[CookieBuilder](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/cookie/builder/struct.CookieBuilder.html "struct cookie::builder::CookieBuilder")<'b>> for [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'a>

[Source](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/src/cookie/builder.rs.html#402)[§](#method.eq)

#### fn [eq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#tymethod.eq)(&self, other: &[CookieBuilder](https://docs.rs/cookie/0.18.1/x86_64-unknown-linux-gnu/cookie/builder/struct.CookieBuilder.html "struct cookie::builder::CookieBuilder")<'b>) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `self` and `other` values to be equal, and is used by `==`.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#262)[§](#method.ne)

#### fn [ne](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#method.ne)(&self, other: [&Rhs](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `!=`. The default implementation is almost always sufficient,
and should not be overridden without very good reason.

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-Cookie%3C'c%3E)

### impl<'c> [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'c>

[§](#impl-RefUnwindSafe-for-Cookie%3C'c%3E)

### impl<'c> [RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'c>

[§](#impl-Send-for-Cookie%3C'c%3E)

### impl<'c> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'c>

[§](#impl-Sync-for-Cookie%3C'c%3E)

### impl<'c> [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'c>

[§](#impl-Unpin-for-Cookie%3C'c%3E)

### impl<'c> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'c>

[§](#impl-UnwindSafe-for-Cookie%3C'c%3E)

### impl<'c> [UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")<'c>

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

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#770)[§](#method.from-5)

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