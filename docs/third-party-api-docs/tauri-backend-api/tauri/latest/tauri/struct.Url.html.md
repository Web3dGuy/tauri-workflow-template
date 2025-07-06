# Struct UrlCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#227)

```
pub struct Url { /* private fields */ }
```

Expand description

A parsed URL record.

## Implementations[§](#implementations)

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#317)[§](#impl-Url)

### impl [Url](struct.Url.html.md "struct tauri::Url")

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#340)

#### pub fn [parse](#method.parse)(input: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Url](struct.Url.html.md "struct tauri::Url"), [ParseError](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/url/parser/enum.ParseError.html "enum url::parser::ParseError")>

Parse an absolute URL from a string.

##### [§](#examples)Examples

```
use url::Url;

let url = Url::parse("https://example.net")?;
```

##### [§](#errors)Errors

If the function can not parse an absolute URL from the given string,
a [`ParseError`](enum.ParseError.html.md) variant will be returned.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#370-375)

#### pub fn [parse\_with\_params](#method.parse_with_params)<I, K, V>( input: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html), iter: I, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Url](struct.Url.html.md "struct tauri::Url"), [ParseError](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/url/parser/enum.ParseError.html "enum url::parser::ParseError")> where I: [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator"), <I as [IntoIterator](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html "trait core::iter::traits::collect::IntoIterator")>::[Item](https://doc.rust-lang.org/nightly/core/iter/traits/collect/trait.IntoIterator.html#associatedtype.Item "type core::iter::traits::collect::IntoIterator::Item"): [Borrow](https://doc.rust-lang.org/nightly/core/borrow/trait.Borrow.html "trait core::borrow::Borrow")<[(K, V)](https://doc.rust-lang.org/nightly/std/primitive.tuple.html)>, K: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>, V: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>,

Parse an absolute URL from a string and add params to its query string.

Existing params are not removed.

##### [§](#examples-1)Examples

```
use url::Url;

let url = Url::parse_with_params("https://example.net?dont=clobberme",
                                 &[("lang", "rust"), ("browser", "servo")])?;
assert_eq!("https://example.net/?dont=clobberme&lang=rust&browser=servo", url.as_str());
```

##### [§](#errors-1)Errors

If the function can not parse an absolute URL from the given string,
a [`ParseError`](enum.ParseError.html.md) variant will be returned.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#465)

#### pub fn [join](#method.join)(&self, input: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Url](struct.Url.html.md "struct tauri::Url"), [ParseError](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/url/parser/enum.ParseError.html "enum url::parser::ParseError")>

Parse a string as an URL, with this URL as the base URL.

The inverse of this is [`make_relative`](#method.make_relative).

##### [§](#notes)Notes

* A trailing slash is significant.
  Without it, the last path component is considered to be a “file” name
  to be removed to get at the “directory” that is used as the base.
* A [scheme relative special URL](https://url.spec.whatwg.org/#scheme-relative-special-url-string)
  as input replaces everything in the base URL after the scheme.
* An absolute URL (with a scheme) as input replaces the whole base URL (even the scheme).

##### [§](#examples-2)Examples

```
use url::Url;

// Base without a trailing slash
let base = Url::parse("https://example.net/a/b.html")?;
let url = base.join("c.png")?;
assert_eq!(url.as_str(), "https://example.net/a/c.png");  // Not /a/b.html/c.png

// Base with a trailing slash
let base = Url::parse("https://example.net/a/b/")?;
let url = base.join("c.png")?;
assert_eq!(url.as_str(), "https://example.net/a/b/c.png");

// Input as scheme relative special URL
let base = Url::parse("https://alice.com/a")?;
let url = base.join("//eve.com/b")?;
assert_eq!(url.as_str(), "https://eve.com/b");

// Input as absolute URL
let base = Url::parse("https://alice.com/a")?;
let url = base.join("http://eve.com/b")?;
assert_eq!(url.as_str(), "http://eve.com/b");  // http instead of https
```

##### [§](#errors-2)Errors

If the function can not parse an URL from the given string
with this URL as the base URL, a [`ParseError`](enum.ParseError.html.md) variant will be returned.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#510)

#### pub fn [make\_relative](#method.make_relative)(&self, url: &[Url](struct.Url.html.md "struct tauri::Url")) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>

Creates a relative URL if possible, with this URL as the base URL.

This is the inverse of [`join`](#method.join).

##### [§](#examples-3)Examples

```
use url::Url;

let base = Url::parse("https://example.net/a/b.html")?;
let url = Url::parse("https://example.net/a/c.png")?;
let relative = base.make_relative(&url);
assert_eq!(relative.as_ref().map(|s| s.as_str()), Some("c.png"));

let base = Url::parse("https://example.net/a/b/")?;
let url = Url::parse("https://example.net/a/b/c.png")?;
let relative = base.make_relative(&url);
assert_eq!(relative.as_ref().map(|s| s.as_str()), Some("c.png"));

let base = Url::parse("https://example.net/a/b/")?;
let url = Url::parse("https://example.net/a/d/c.png")?;
let relative = base.make_relative(&url);
assert_eq!(relative.as_ref().map(|s| s.as_str()), Some("../d/c.png"));

let base = Url::parse("https://example.net/a/b.html?c=d")?;
let url = Url::parse("https://example.net/a/b.html?e=f")?;
let relative = base.make_relative(&url);
assert_eq!(relative.as_ref().map(|s| s.as_str()), Some("?e=f"));
```

##### [§](#errors-3)Errors

If this URL can’t be a base for the given URL, `None` is returned.
This is for example the case if the scheme, host or port are not the same.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#620)

#### pub fn [options](#method.options)<'a>() -> [ParseOptions](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/url/struct.ParseOptions.html "struct url::ParseOptions")<'a>

Return a default `ParseOptions` that can fully configure the URL parser.

##### [§](#examples-4)Examples

Get default `ParseOptions`, then change base url

```
use url::Url;
let options = Url::options();
let api = Url::parse("https://api.example.com")?;
let base_url = options.base_url(Some(&api));
let version_url = base_url.parse("version.json")?;
assert_eq!(version_url.as_str(), "https://api.example.com/version.json");
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#647)

#### pub fn [as\_str](#method.as_str)(&self) -> &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

Return the serialization of this URL.

This is fast since that serialization is already stored in the `Url` struct.

##### [§](#examples-5)Examples

```
use url::Url;

let url_str = "https://example.net/";
let url = Url::parse(url_str)?;
assert_eq!(url.as_str(), url_str);
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#671)

#### pub fn [into\_string](#method.into_string)(self) -> [String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")

👎Deprecated since 2.3.0: use Into<String>

Return the serialization of this URL.

This consumes the `Url` and takes ownership of the `String` stored in it.

##### [§](#examples-6)Examples

```
use url::Url;

let url_str = "https://example.net/";
let url = Url::parse(url_str)?;
assert_eq!(String::from(url), url_str);
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#877)

#### pub fn [origin](#method.origin)(&self) -> [Origin](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/url/origin/enum.Origin.html "enum url::origin::Origin")

Return the origin of this URL (<https://url.spec.whatwg.org/#origin>)

Note: this returns an opaque origin for `file:` URLs, which causes
`url.origin() != url.origin()`.

##### [§](#examples-7)Examples

URL with `ftp` scheme:

```
use url::{Host, Origin, Url};

let url = Url::parse("ftp://example.com/foo")?;
assert_eq!(url.origin(),
           Origin::Tuple("ftp".into(),
                         Host::Domain("example.com".into()),
                         21));
```

URL with `blob` scheme:

```
use url::{Host, Origin, Url};

let url = Url::parse("blob:https://example.com/foo")?;
assert_eq!(url.origin(),
           Origin::Tuple("https".into(),
                         Host::Domain("example.com".into()),
                         443));
```

URL with `file` scheme:

```
use url::{Host, Origin, Url};

let url = Url::parse("file:///tmp/foo")?;
assert!(!url.origin().is_tuple());

let other_url = Url::parse("file:///tmp/foo")?;
assert!(url.origin() != other_url.origin());
```

URL with other scheme:

```
use url::{Host, Origin, Url};

let url = Url::parse("foo:bar")?;
assert!(!url.origin().is_tuple());
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#897)

#### pub fn [scheme](#method.scheme)(&self) -> &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

Return the scheme of this URL, lower-cased, as an ASCII string without the ‘:’ delimiter.

##### [§](#examples-8)Examples

```
use url::Url;

let url = Url::parse("file:///tmp/foo")?;
assert_eq!(url.scheme(), "file");
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#917)

#### pub fn [is\_special](#method.is_special)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Return whether the URL is special (has a special scheme)

##### [§](#examples-9)Examples

```
use url::Url;

assert!(Url::parse("http:///tmp/foo")?.is_special());
assert!(Url::parse("file:///tmp/foo")?.is_special());
assert!(!Url::parse("moz:///tmp/foo")?.is_special());
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#950)

#### pub fn [has\_authority](#method.has_authority)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Return whether the URL has an ‘authority’,
which can contain a username, password, host, and port number.

URLs that do *not* are either path-only like `unix:/run/foo.socket`
or cannot-be-a-base like `data:text/plain,Stuff`.

See also the `authority` method.

##### [§](#examples-10)Examples

```
use url::Url;

let url = Url::parse("ftp://rms@example.com")?;
assert!(url.has_authority());

let url = Url::parse("unix:/run/foo.socket")?;
assert!(!url.has_authority());

let url = Url::parse("data:text/plain,Stuff")?;
assert!(!url.has_authority());
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#987)

#### pub fn [authority](#method.authority)(&self) -> &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

Return the authority of this URL as an ASCII string.

Non-ASCII domains are punycode-encoded per IDNA if this is the host
of a special URL, or percent encoded for non-special URLs.
IPv6 addresses are given between `[` and `]` brackets.
Ports are omitted if they match the well known port of a special URL.

Username and password are percent-encoded.

See also the `has_authority` method.

##### [§](#examples-11)Examples

```
use url::Url;

let url = Url::parse("unix:/run/foo.socket")?;
assert_eq!(url.authority(), "");
let url = Url::parse("file:///tmp/foo")?;
assert_eq!(url.authority(), "");
let url = Url::parse("https://user:password@example.com/tmp/foo")?;
assert_eq!(url.authority(), "user:password@example.com");
let url = Url::parse("irc://àlex.рф.example.com:6667/foo")?;
assert_eq!(url.authority(), "%C3%A0lex.%D1%80%D1%84.example.com:6667");
let url = Url::parse("http://àlex.рф.example.com:80/foo")?;
assert_eq!(url.authority(), "xn--lex-8ka.xn--p1ai.example.com");
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#1022)

#### pub fn [cannot\_be\_a\_base](#method.cannot_be_a_base)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Return whether this URL is a cannot-be-a-base URL,
meaning that parsing a relative URL string with this URL as the base will return an error.

This is the case if the scheme and `:` delimiter are not followed by a `/` slash,
as is typically the case of `data:` and `mailto:` URLs.

##### [§](#examples-12)Examples

```
use url::Url;

let url = Url::parse("ftp://rms@example.com")?;
assert!(!url.cannot_be_a_base());

let url = Url::parse("unix:/run/foo.socket")?;
assert!(!url.cannot_be_a_base());

let url = Url::parse("data:text/plain,Stuff")?;
assert!(url.cannot_be_a_base());
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#1048)

#### pub fn [username](#method.username)(&self) -> &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

Return the username for this URL (typically the empty string)
as a percent-encoded ASCII string.

##### [§](#examples-13)Examples

```
use url::Url;

let url = Url::parse("ftp://rms@example.com")?;
assert_eq!(url.username(), "rms");

let url = Url::parse("ftp://:secret123@example.com")?;
assert_eq!(url.username(), "");

let url = Url::parse("https://example.com")?;
assert_eq!(url.username(), "");
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#1081)

#### pub fn [password](#method.password)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>

Return the password for this URL, if any, as a percent-encoded ASCII string.

##### [§](#examples-14)Examples

```
use url::Url;

let url = Url::parse("ftp://rms:secret123@example.com")?;
assert_eq!(url.password(), Some("secret123"));

let url = Url::parse("ftp://:secret123@example.com")?;
assert_eq!(url.password(), Some("secret123"));

let url = Url::parse("ftp://rms@example.com")?;
assert_eq!(url.password(), None);

let url = Url::parse("https://example.com")?;
assert_eq!(url.password(), None);
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#1116)

#### pub fn [has\_host](#method.has_host)(&self) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Equivalent to `url.host().is_some()`.

##### [§](#examples-15)Examples

```
use url::Url;

let url = Url::parse("ftp://rms@example.com")?;
assert!(url.has_host());

let url = Url::parse("unix:/run/foo.socket")?;
assert!(!url.has_host());

let url = Url::parse("data:text/plain,Stuff")?;
assert!(!url.has_host());
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#1153)

#### pub fn [host\_str](#method.host_str)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>

Return the string representation of the host (domain or IP address) for this URL, if any.

Non-ASCII domains are punycode-encoded per IDNA if this is the host
of a special URL, or percent encoded for non-special URLs.
IPv6 addresses are given between `[` and `]` brackets.

Cannot-be-a-base URLs (typical of `data:` and `mailto:`) and some `file:` URLs
don’t have a host.

See also the `host` method.

##### [§](#examples-16)Examples

```
use url::Url;

let url = Url::parse("https://127.0.0.1/index.html")?;
assert_eq!(url.host_str(), Some("127.0.0.1"));

let url = Url::parse("ftp://rms@example.com")?;
assert_eq!(url.host_str(), Some("example.com"));

let url = Url::parse("unix:/run/foo.socket")?;
assert_eq!(url.host_str(), None);

let url = Url::parse("data:text/plain,Stuff")?;
assert_eq!(url.host_str(), None);
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#1192)

#### pub fn [host](#method.host)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Host](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/url/host/enum.Host.html "enum url::host::Host")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>

Return the parsed representation of the host for this URL.
Non-ASCII domain labels are punycode-encoded per IDNA if this is the host
of a special URL, or percent encoded for non-special URLs.

Cannot-be-a-base URLs (typical of `data:` and `mailto:`) and some `file:` URLs
don’t have a host.

See also the `host_str` method.

##### [§](#examples-17)Examples

```
use url::Url;

let url = Url::parse("https://127.0.0.1/index.html")?;
assert!(url.host().is_some());

let url = Url::parse("ftp://rms@example.com")?;
assert!(url.host().is_some());

let url = Url::parse("unix:/run/foo.socket")?;
assert!(url.host().is_none());

let url = Url::parse("data:text/plain,Stuff")?;
assert!(url.host().is_none());
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#1224)

#### pub fn [domain](#method.domain)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>

If this URL has a host and it is a domain name (not an IP address), return it.
Non-ASCII domains are punycode-encoded per IDNA if this is the host
of a special URL, or percent encoded for non-special URLs.

##### [§](#examples-18)Examples

```
use url::Url;

let url = Url::parse("https://127.0.0.1/")?;
assert_eq!(url.domain(), None);

let url = Url::parse("mailto:rms@example.net")?;
assert_eq!(url.domain(), None);

let url = Url::parse("https://example.com/")?;
assert_eq!(url.domain(), Some("example.com"));
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#1256)

#### pub fn [port](#method.port)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[u16](https://doc.rust-lang.org/nightly/std/primitive.u16.html)>

Return the port number for this URL, if any.

Note that default port numbers are never reflected by the serialization,
use the `port_or_known_default()` method if you want a default port number returned.

##### [§](#examples-19)Examples

```
use url::Url;

let url = Url::parse("https://example.com")?;
assert_eq!(url.port(), None);

let url = Url::parse("https://example.com:443/")?;
assert_eq!(url.port(), None);

let url = Url::parse("ssh://example.com:22")?;
assert_eq!(url.port(), Some(22));
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#1288)

#### pub fn [port\_or\_known\_default](#method.port_or_known_default)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[u16](https://doc.rust-lang.org/nightly/std/primitive.u16.html)>

Return the port number for this URL, or the default port number if it is known.

This method only knows the default port number
of the `http`, `https`, `ws`, `wss` and `ftp` schemes.

For URLs in these schemes, this method always returns `Some(_)`.
For other schemes, it is the same as `Url::port()`.

##### [§](#examples-20)Examples

```
use url::Url;

let url = Url::parse("foo://example.com")?;
assert_eq!(url.port_or_known_default(), None);

let url = Url::parse("foo://example.com:1456")?;
assert_eq!(url.port_or_known_default(), Some(1456));

let url = Url::parse("https://example.com")?;
assert_eq!(url.port_or_known_default(), Some(443));
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#1327-1330)

#### pub fn [socket\_addrs](#method.socket_addrs)( &self, default\_port\_number: impl [Fn](https://doc.rust-lang.org/nightly/core/ops/function/trait.Fn.html "trait core::ops::function::Fn")() -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[u16](https://doc.rust-lang.org/nightly/std/primitive.u16.html)>, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Vec](https://doc.rust-lang.org/nightly/alloc/vec/struct.Vec.html "struct alloc::vec::Vec")<[SocketAddr](https://doc.rust-lang.org/nightly/core/net/socket_addr/enum.SocketAddr.html "enum core::net::socket_addr::SocketAddr")>, [Error](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error")>

Resolve a URL’s host and port number to `SocketAddr`.

If the URL has the default port number of a scheme that is unknown to this library,
`default_port_number` provides an opportunity to provide the actual port number.
In non-example code this should be implemented either simply as `|| None`,
or by matching on the URL’s `.scheme()`.

If the host is a domain, it is resolved using the standard library’s DNS support.

##### [§](#examples-21)Examples

```
let url = url::Url::parse("https://example.net/").unwrap();
let addrs = url.socket_addrs(|| None).unwrap();
std::net::TcpStream::connect(&*addrs)
```
```
/// With application-specific known default port numbers
fn socket_addrs(url: url::Url) -> std::io::Result<Vec<std::net::SocketAddr>> {
    url.socket_addrs(|| match url.scheme() {
        "socks5" | "socks5h" => Some(1080),
        _ => None,
    })
}
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#1378)

#### pub fn [path](#method.path)(&self) -> &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

Return the path for this URL, as a percent-encoded ASCII string.
For cannot-be-a-base URLs, this is an arbitrary string that doesn’t start with ‘/’.
For other URLs, this starts with a ‘/’ slash
and continues with slash-separated path segments.

##### [§](#examples-22)Examples

```
use url::{Url, ParseError};

let url = Url::parse("https://example.com/api/versions?page=2")?;
assert_eq!(url.path(), "/api/versions");

let url = Url::parse("https://example.com")?;
assert_eq!(url.path(), "/");

let url = Url::parse("https://example.com/countries/việt nam")?;
assert_eq!(url.path(), "/countries/vi%E1%BB%87t%20nam");
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#1429)

#### pub fn [path\_segments](#method.path_segments)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Split](https://doc.rust-lang.org/nightly/core/str/iter/struct.Split.html "struct core::str::iter::Split")<'\_, [char](https://doc.rust-lang.org/nightly/std/primitive.char.html)>>

Unless this URL is cannot-be-a-base,
return an iterator of ‘/’ slash-separated path segments,
each as a percent-encoded ASCII string.

Return `None` for cannot-be-a-base URLs.

When `Some` is returned, the iterator always contains at least one string
(which may be empty).

##### [§](#examples-23)Examples

```
use url::Url;

let url = Url::parse("https://example.com/foo/bar")?;
let mut path_segments = url.path_segments().ok_or_else(|| "cannot be base")?;
assert_eq!(path_segments.next(), Some("foo"));
assert_eq!(path_segments.next(), Some("bar"));
assert_eq!(path_segments.next(), None);

let url = Url::parse("https://example.com")?;
let mut path_segments = url.path_segments().ok_or_else(|| "cannot be base")?;
assert_eq!(path_segments.next(), Some(""));
assert_eq!(path_segments.next(), None);

let url = Url::parse("data:text/plain,HelloWorld")?;
assert!(url.path_segments().is_none());

let url = Url::parse("https://example.com/countries/việt nam")?;
let mut path_segments = url.path_segments().ok_or_else(|| "cannot be base")?;
assert_eq!(path_segments.next(), Some("countries"));
assert_eq!(path_segments.next(), Some("vi%E1%BB%87t%20nam"));
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#1458)

#### pub fn [query](#method.query)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>

Return this URL’s query string, if any, as a percent-encoded ASCII string.

##### [§](#examples-24)Examples

```
use url::Url;

fn run() -> Result<(), ParseError> {
let url = Url::parse("https://example.com/products?page=2")?;
let query = url.query();
assert_eq!(query, Some("page=2"));

let url = Url::parse("https://example.com/products")?;
let query = url.query();
assert!(query.is_none());

let url = Url::parse("https://example.com/?country=español")?;
let query = url.query();
assert_eq!(query, Some("country=espa%C3%B1ol"));
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#1497)

#### pub fn [query\_pairs](#method.query_pairs)(&self) -> [Parse](https://docs.rs/form_urlencoded/1.2.1/x86_64-unknown-linux-gnu/form_urlencoded/struct.Parse.html "struct form_urlencoded::Parse")<'\_>

Parse the URL’s query string, if any, as `application/x-www-form-urlencoded`
and return an iterator of (key, value) pairs.

##### [§](#examples-25)Examples

```
use std::borrow::Cow;

use url::Url;

let url = Url::parse("https://example.com/products?page=2&sort=desc")?;
let mut pairs = url.query_pairs();

assert_eq!(pairs.count(), 2);

assert_eq!(pairs.next(), Some((Cow::Borrowed("page"), Cow::Borrowed("2"))));
assert_eq!(pairs.next(), Some((Cow::Borrowed("sort"), Cow::Borrowed("desc"))));
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#1533)

#### pub fn [fragment](#method.fragment)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>

Return this URL’s fragment identifier, if any.

A fragment is the part of the URL after the `#` symbol.
The fragment is optional and, if present, contains a fragment identifier
that identifies a secondary resource, such as a section heading
of a document.

In HTML, the fragment identifier is usually the id attribute of a an element
that is scrolled to on load. Browsers typically will not send the fragment portion
of a URL to the server.

**Note:** the parser did *not* percent-encode this component,
but the input may have been percent-encoded already.

##### [§](#examples-26)Examples

```
use url::Url;

let url = Url::parse("https://example.com/data.csv#row=4")?;

assert_eq!(url.fragment(), Some("row=4"));

let url = Url::parse("https://example.com/data.csv#cell=4,1-6,2")?;

assert_eq!(url.fragment(), Some("cell=4,1-6,2"));
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#1570)

#### pub fn [set\_fragment](#method.set_fragment)(&mut self, fragment: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>)

Change this URL’s fragment identifier.

##### [§](#examples-27)Examples

```
use url::Url;

let mut url = Url::parse("https://example.com/data.csv")?;
assert_eq!(url.as_str(), "https://example.com/data.csv");
url.set_fragment(Some("cell=4,1-6,2"));
assert_eq!(url.as_str(), "https://example.com/data.csv#cell=4,1-6,2");
assert_eq!(url.fragment(), Some("cell=4,1-6,2"));

url.set_fragment(None);
assert_eq!(url.as_str(), "https://example.com/data.csv");
assert!(url.fragment().is_none());
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#1625)

#### pub fn [set\_query](#method.set_query)(&mut self, query: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>)

Change this URL’s query string. If `query` is `None`, this URL’s
query string will be cleared.

##### [§](#examples-28)Examples

```
use url::Url;

let mut url = Url::parse("https://example.com/products")?;
assert_eq!(url.as_str(), "https://example.com/products");

url.set_query(Some("page=2"));
assert_eq!(url.as_str(), "https://example.com/products?page=2");
assert_eq!(url.query(), Some("page=2"));
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#1689)

#### pub fn [query\_pairs\_mut](#method.query_pairs_mut)(&mut self) -> [Serializer](https://docs.rs/form_urlencoded/1.2.1/x86_64-unknown-linux-gnu/form_urlencoded/struct.Serializer.html "struct form_urlencoded::Serializer")<'\_, [UrlQuery](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/url/struct.UrlQuery.html "struct url::UrlQuery")<'\_>>

Manipulate this URL’s query string, viewed as a sequence of name/value pairs
in `application/x-www-form-urlencoded` syntax.

The return value has a method-chaining API:

```

let mut url = Url::parse("https://example.net?lang=fr#nav")?;
assert_eq!(url.query(), Some("lang=fr"));

url.query_pairs_mut().append_pair("foo", "bar");
assert_eq!(url.query(), Some("lang=fr&foo=bar"));
assert_eq!(url.as_str(), "https://example.net/?lang=fr&foo=bar#nav");

url.query_pairs_mut()
    .clear()
    .append_pair("foo", "bar & baz")
    .append_pair("saisons", "\u{00C9}t\u{00E9}+hiver");
assert_eq!(url.query(), Some("foo=bar+%26+baz&saisons=%C3%89t%C3%A9%2Bhiver"));
assert_eq!(url.as_str(),
           "https://example.net/?foo=bar+%26+baz&saisons=%C3%89t%C3%A9%2Bhiver#nav");
```

Note: `url.query_pairs_mut().clear();` is equivalent to `url.set_query(Some(""))`,
not `url.set_query(None)`.

The state of `Url` is unspecified if this return value is leaked without being dropped.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#1755)

#### pub fn [set\_path](#method.set_path)(&mut self, path: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html))

Change this URL’s path.

##### [§](#examples-29)Examples

```
use url::Url;

let mut url = Url::parse("https://example.com")?;
url.set_path("api/comments");
assert_eq!(url.as_str(), "https://example.com/api/comments");
assert_eq!(url.path(), "/api/comments");

let mut url = Url::parse("https://example.com/api")?;
url.set_path("data/report.csv");
assert_eq!(url.as_str(), "https://example.com/data/report.csv");
assert_eq!(url.path(), "/data/report.csv");

// `set_path` percent-encodes the given string if it's not already percent-encoded.
let mut url = Url::parse("https://example.com")?;
url.set_path("api/some comments");
assert_eq!(url.as_str(), "https://example.com/api/some%20comments");
assert_eq!(url.path(), "/api/some%20comments");

// `set_path` will not double percent-encode the string if it's already percent-encoded.
let mut url = Url::parse("https://example.com")?;
url.set_path("api/some%20comments");
assert_eq!(url.as_str(), "https://example.com/api/some%20comments");
assert_eq!(url.path(), "/api/some%20comments");

```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#1784)

#### pub fn [path\_segments\_mut](#method.path_segments_mut)(&mut self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[PathSegmentsMut](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/url/path_segments/struct.PathSegmentsMut.html "struct url::path_segments::PathSegmentsMut")<'\_>, [()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Return an object with methods to manipulate this URL’s path segments.

Return `Err(())` if this URL is cannot-be-a-base.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#1876)

#### pub fn [set\_port](#method.set_port)(&mut self, port: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[u16](https://doc.rust-lang.org/nightly/std/primitive.u16.html)>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Change this URL’s port number.

Note that default port numbers are not reflected in the serialization.

If this URL is cannot-be-a-base, does not have a host, or has the `file` scheme;
do nothing and return `Err`.

##### [§](#examples-30)Examples

```
use url::Url;

let mut url = Url::parse("ssh://example.net:2048/")?;

url.set_port(Some(4096)).map_err(|_| "cannot be base")?;
assert_eq!(url.as_str(), "ssh://example.net:4096/");

url.set_port(None).map_err(|_| "cannot be base")?;
assert_eq!(url.as_str(), "ssh://example.net/");
```

Known default port numbers are not reflected:

```
use url::Url;

let mut url = Url::parse("https://example.org/")?;

url.set_port(Some(443)).map_err(|_| "cannot be base")?;
assert!(url.port().is_none());
```

Cannot set port for cannot-be-a-base URLs:

```
use url::Url;

let mut url = Url::parse("mailto:rms@example.net")?;

let result = url.set_port(Some(80));
assert!(result.is_err());

let result = url.set_port(None);
assert!(result.is_err());
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2009)

#### pub fn [set\_host](#method.set_host)(&mut self, host: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [ParseError](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/url/parser/enum.ParseError.html "enum url::parser::ParseError")>

Change this URL’s host.

Removing the host (calling this with `None`)
will also remove any username, password, and port number.

##### [§](#examples-31)Examples

Change host:

```
use url::Url;

let mut url = Url::parse("https://example.net")?;
let result = url.set_host(Some("rust-lang.org"));
assert!(result.is_ok());
assert_eq!(url.as_str(), "https://rust-lang.org/");
```

Remove host:

```
use url::Url;

let mut url = Url::parse("foo://example.net")?;
let result = url.set_host(None);
assert!(result.is_ok());
assert_eq!(url.as_str(), "foo:/");
```

Cannot remove host for ‘special’ schemes (e.g. `http`):

```
use url::Url;

let mut url = Url::parse("https://example.net")?;
let result = url.set_host(None);
assert!(result.is_err());
assert_eq!(url.as_str(), "https://example.net/");
```

Cannot change or remove host for cannot-be-a-base URLs:

```
use url::Url;

let mut url = Url::parse("mailto:rms@example.net")?;

let result = url.set_host(Some("rust-lang.org"));
assert!(result.is_err());
assert_eq!(url.as_str(), "mailto:rms@example.net");

let result = url.set_host(None);
assert!(result.is_err());
assert_eq!(url.as_str(), "mailto:rms@example.net");
```

##### [§](#errors-4)Errors

If this URL is cannot-be-a-base or there is an error parsing the given `host`,
a [`ParseError`](enum.ParseError.html.md) variant will be returned.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2154)

#### pub fn [set\_ip\_host](#method.set_ip_host)(&mut self, address: [IpAddr](https://doc.rust-lang.org/nightly/core/net/ip_addr/enum.IpAddr.html "enum core::net::ip_addr::IpAddr")) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Change this URL’s host to the given IP address.

If this URL is cannot-be-a-base, do nothing and return `Err`.

Compared to `Url::set_host`, this skips the host parser.

##### [§](#examples-32)Examples

```
use url::{Url, ParseError};

let mut url = Url::parse("http://example.com")?;
url.set_ip_host("127.0.0.1".parse().unwrap());
assert_eq!(url.host_str(), Some("127.0.0.1"));
assert_eq!(url.as_str(), "http://127.0.0.1/");
```

Cannot change URL’s from mailto(cannot-be-base) to ip:

```
use url::{Url, ParseError};

let mut url = Url::parse("mailto:rms@example.com")?;
let result = url.set_ip_host("127.0.0.1".parse().unwrap());

assert_eq!(url.as_str(), "mailto:rms@example.com");
assert!(result.is_err());
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2194)

#### pub fn [set\_password](#method.set_password)(&mut self, password: [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<&[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Change this URL’s password.

If this URL is cannot-be-a-base or does not have a host, do nothing and return `Err`.

##### [§](#examples-33)Examples

```
use url::{Url, ParseError};

let mut url = Url::parse("mailto:rmz@example.com")?;
let result = url.set_password(Some("secret_password"));
assert!(result.is_err());

let mut url = Url::parse("ftp://user1:secret1@example.com")?;
let result = url.set_password(Some("secret_password"));
assert_eq!(url.password(), Some("secret_password"));

let mut url = Url::parse("ftp://user2:@example.com")?;
let result = url.set_password(Some("secret2"));
assert!(result.is_ok());
assert_eq!(url.password(), Some("secret2"));
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2288)

#### pub fn [set\_username](#method.set_username)(&mut self, username: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Change this URL’s username.

If this URL is cannot-be-a-base or does not have a host, do nothing and return `Err`.

##### [§](#examples-34)Examples

Cannot setup username from mailto(cannot-be-base)

```
use url::{Url, ParseError};

let mut url = Url::parse("mailto:rmz@example.com")?;
let result = url.set_username("user1");
assert_eq!(url.as_str(), "mailto:rmz@example.com");
assert!(result.is_err());
```

Setup username to user1

```
use url::{Url, ParseError};

let mut url = Url::parse("ftp://:secre1@example.com/")?;
let result = url.set_username("user1");
assert!(result.is_ok());
assert_eq!(url.username(), "user1");
assert_eq!(url.as_str(), "ftp://user1:secre1@example.com/");
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2450)

#### pub fn [set\_scheme](#method.set_scheme)(&mut self, scheme: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Change this URL’s scheme.

Do nothing and return `Err` under the following circumstances:

* If the new scheme is not in `[a-zA-Z][a-zA-Z0-9+.-]+`
* If this URL is cannot-be-a-base and the new scheme is one of
  `http`, `https`, `ws`, `wss` or `ftp`
* If either the old or new scheme is `http`, `https`, `ws`,
  `wss` or `ftp` and the other is not one of these
* If the new scheme is `file` and this URL includes credentials
  or has a non-null port
* If this URL’s scheme is `file` and its host is empty or null

See also [the URL specification’s section on legal scheme state
overrides](https://url.spec.whatwg.org/#scheme-state).

##### [§](#examples-35)Examples

Change the URL’s scheme from `https` to `http`:

```
use url::Url;

let mut url = Url::parse("https://example.net")?;
let result = url.set_scheme("http");
assert_eq!(url.as_str(), "http://example.net/");
assert!(result.is_ok());
```

Change the URL’s scheme from `foo` to `bar`:

```
use url::Url;

let mut url = Url::parse("foo://example.net")?;
let result = url.set_scheme("bar");
assert_eq!(url.as_str(), "bar://example.net");
assert!(result.is_ok());
```

Cannot change URL’s scheme from `https` to `foõ`:

```
use url::Url;

let mut url = Url::parse("https://example.net")?;
let result = url.set_scheme("foõ");
assert_eq!(url.as_str(), "https://example.net/");
assert!(result.is_err());
```

Cannot change URL’s scheme from `mailto` (cannot-be-a-base) to `https`:

```
use url::Url;

let mut url = Url::parse("mailto:rms@example.net")?;
let result = url.set_scheme("https");
assert_eq!(url.as_str(), "mailto:rms@example.net");
assert!(result.is_err());
```

Cannot change the URL’s scheme from `foo` to `https`:

```
use url::Url;

let mut url = Url::parse("foo://example.net")?;
let result = url.set_scheme("https");
assert_eq!(url.as_str(), "foo://example.net");
assert!(result.is_err());
```

Cannot change the URL’s scheme from `http` to `foo`:

```
use url::Url;

let mut url = Url::parse("http://example.net")?;
let result = url.set_scheme("foo");
assert_eq!(url.as_str(), "http://example.net/");
assert!(result.is_err());
```

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2541)

#### pub fn [from\_file\_path](#method.from_file_path)<P>(path: P) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Url](struct.Url.html.md "struct tauri::Url"), [()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> where P: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[Path](https://doc.rust-lang.org/nightly/std/path/struct.Path.html "struct std::path::Path")>,

Convert a file name as `std::path::Path` into an URL in the `file` scheme.

This returns `Err` if the given path is not absolute or,
on Windows, if the prefix is not a disk prefix (e.g. `C:`) or a UNC prefix (`\\`).

##### [§](#examples-36)Examples

On Unix-like platforms:

```
use url::Url;

let url = Url::from_file_path("/tmp/foo.txt")?;
assert_eq!(url.as_str(), "file:///tmp/foo.txt");

let url = Url::from_file_path("../foo.txt");
assert!(url.is_err());

let url = Url::from_file_path("https://google.com/");
assert!(url.is_err());
```

This method is only available if the `std` Cargo feature is enabled.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2589)

#### pub fn [from\_directory\_path](#method.from_directory_path)<P>(path: P) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Url](struct.Url.html.md "struct tauri::Url"), [()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)> where P: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[Path](https://doc.rust-lang.org/nightly/std/path/struct.Path.html "struct std::path::Path")>,

Convert a directory name as `std::path::Path` into an URL in the `file` scheme.

This returns `Err` if the given path is not absolute or,
on Windows, if the prefix is not a disk prefix (e.g. `C:`) or a UNC prefix (`\\`).

Compared to `from_file_path`, this ensure that URL’s the path has a trailing slash
so that the entire path is considered when using this URL as a base URL.

For example:

* `"index.html"` parsed with `Url::from_directory_path(Path::new("/var/www"))`
  as the base URL is `file:///var/www/index.html`
* `"index.html"` parsed with `Url::from_file_path(Path::new("/var/www"))`
  as the base URL is `file:///var/index.html`, which might not be what was intended.

Note that `std::path` does not consider trailing slashes significant
and usually does not include them (e.g. in `Path::parent()`).

This method is only available if the `std` Cargo feature is enabled.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2605-2607)

#### pub fn [serialize\_internal](#method.serialize_internal)<S>( &self, serializer: S, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<<S as [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer")>::[Ok](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html#associatedtype.Ok "type serde::ser::Serializer::Ok"), <S as [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer")>::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html#associatedtype.Error "type serde::ser::Serializer::Error")> where S: [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer"),

Serialize with Serde using the internal representation of the `Url` struct.

The corresponding `deserialize_internal` method sacrifices some invariant-checking
for speed, compared to the `Deserialize` trait impl.

This method is only available if the `serde` Cargo feature is enabled.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2647-2649)

#### pub fn [deserialize\_internal](#method.deserialize_internal)<'de, D>( deserializer: D, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Url](struct.Url.html.md "struct tauri::Url"), <D as [Deserializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html "trait serde::de::Deserializer")<'de>>::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")> where D: [Deserializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html "trait serde::de::Deserializer")<'de>,

Serialize with Serde using the internal representation of the `Url` struct.

The corresponding `deserialize_internal` method sacrifices some invariant-checking
for speed, compared to the `Deserialize` trait impl.

This method is only available if the `serde` Cargo feature is enabled.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2715)

#### pub fn [to\_file\_path](#method.to_file_path)(&self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf"), [()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Assuming the URL is in the `file` scheme or similar,
convert its path to an absolute `std::path::Path`.

**Note:** This does not actually check the URL’s `scheme`,
and may give nonsensical results for other schemes.
It is the user’s responsibility to check the URL’s scheme before calling this.

```
let path = url.to_file_path();
```

Returns `Err` if the host is neither empty nor `"localhost"` (except on Windows, where
`file:` URLs may have a non-local host),
or if `Path::new_opt()` returns `None`.
(That is, if the percent-decoded path contains a NUL byte or,
for a Windows path, is not UTF-8.)

This method is only available if the `std` Cargo feature is enabled.

## Trait Implementations[§](#trait-implementations)

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2837)[§](#impl-AsRef%3Cstr%3E-for-Url)

### impl [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)> for [Url](struct.Url.html.md "struct tauri::Url")

Return the serialization of this URL.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2839)[§](#method.as_ref)

#### fn [as\_ref](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html#tymethod.as_ref)(&self) -> &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

Converts this type into a shared reference of the (usually inferred) input type.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#226)[§](#impl-Clone-for-Url)

### impl [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [Url](struct.Url.html.md "struct tauri::Url")

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#226)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> [Url](struct.Url.html.md "struct tauri::Url")

Returns a copy of the value. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#174)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &Self)

Performs copy-assignment from `source`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2780)[§](#impl-Debug-for-Url)

### impl [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") for [Url](struct.Url.html.md "struct tauri::Url")

Debug the serialization of this URL.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2782)[§](#method.fmt)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)(&self, formatter: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")>

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html#tymethod.fmt)

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2886)[§](#impl-Deserialize%3C'de%3E-for-Url)

### impl<'de> [Deserialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html "trait serde::de::Deserialize")<'de> for [Url](struct.Url.html.md "struct tauri::Url")

Deserializes this URL from a `serde` stream.

This implementation is only available if the `serde` Cargo feature is enabled.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2887-2889)[§](#method.deserialize)

#### fn [deserialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html#tymethod.deserialize)<D>( deserializer: D, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Url](struct.Url.html.md "struct tauri::Url"), <D as [Deserializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html "trait serde::de::Deserializer")<'de>>::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html#associatedtype.Error "type serde::de::Deserializer::Error")> where D: [Deserializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserializer.html "trait serde::de::Deserializer")<'de>,

Deserialize this value from the given Serde deserializer. [Read more](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html#tymethod.deserialize)

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2765)[§](#impl-Display-for-Url)

### impl [Display](https://doc.rust-lang.org/nightly/core/fmt/trait.Display.html "trait core::fmt::Display") for [Url](struct.Url.html.md "struct tauri::Url")

Display the serialization of this URL.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2767)[§](#method.fmt-1)

#### fn [fmt](https://doc.rust-lang.org/nightly/core/fmt/trait.Display.html#tymethod.fmt)(&self, formatter: &mut [Formatter](https://doc.rust-lang.org/nightly/core/fmt/struct.Formatter.html "struct core::fmt::Formatter")<'\_>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html), [Error](https://doc.rust-lang.org/nightly/core/fmt/struct.Error.html "struct core::fmt::Error")>

Formats the value using the given formatter. [Read more](https://doc.rust-lang.org/nightly/core/fmt/trait.Display.html#tymethod.fmt)

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2773)[§](#impl-From%3CUrl%3E-for-String)

### impl [From](https://doc.rust-lang.org/nightly/core/convert/trait.From.html "trait core::convert::From")<[Url](struct.Url.html.md "struct tauri::Url")> for [String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")

String conversion.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2774)[§](#method.from)

#### fn [from](https://doc.rust-lang.org/nightly/core/convert/trait.From.html#tymethod.from)(value: [Url](struct.Url.html.md "struct tauri::Url")) -> [String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")

Converts to this type from the input type.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2747)[§](#impl-FromStr-for-Url)

### impl [FromStr](https://doc.rust-lang.org/nightly/core/str/traits/trait.FromStr.html "trait core::str::traits::FromStr") for [Url](struct.Url.html.md "struct tauri::Url")

Parse a string as an URL, without a base URL or encoding override.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2748)[§](#associatedtype.Err)

#### type [Err](https://doc.rust-lang.org/nightly/core/str/traits/trait.FromStr.html#associatedtype.Err) = [ParseError](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/url/parser/enum.ParseError.html "enum url::parser::ParseError")

The associated error which can be returned from parsing.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2751)[§](#method.from_str)

#### fn [from\_str](https://doc.rust-lang.org/nightly/core/str/traits/trait.FromStr.html#tymethod.from_str)(input: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Url](struct.Url.html.md "struct tauri::Url"), [ParseError](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/url/parser/enum.ParseError.html "enum url::parser::ParseError")>

Parses a string `s` to return a value of this type. [Read more](https://doc.rust-lang.org/nightly/core/str/traits/trait.FromStr.html#tymethod.from_str)

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2826)[§](#impl-Hash-for-Url)

### impl [Hash](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html "trait core::hash::Hash") for [Url](struct.Url.html.md "struct tauri::Url")

URLs hash like their serialization.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2828-2830)[§](#method.hash)

#### fn [hash](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#tymethod.hash)<H>(&self, state: [&mut H](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) where H: [Hasher](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"),

Feeds this value into the given [`Hasher`](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"). [Read more](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#tymethod.hash)

1.3.0 · [Source](https://doc.rust-lang.org/nightly/src/core/hash/mod.rs.html#235-237)[§](#method.hash_slice)

#### fn [hash\_slice](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#method.hash_slice)<H>(data: &[Self], state: [&mut H](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) where H: [Hasher](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"), Self: [Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

Feeds a slice of this type into the given [`Hasher`](https://doc.rust-lang.org/nightly/core/hash/trait.Hasher.html "trait core::hash::Hasher"). [Read more](https://doc.rust-lang.org/nightly/core/hash/trait.Hash.html#method.hash_slice)

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/slicing.rs.html#34)[§](#impl-Index%3CRange%3CPosition%3E%3E-for-Url)

### impl [Index](https://doc.rust-lang.org/nightly/core/ops/index/trait.Index.html "trait core::ops::index::Index")<[Range](https://doc.rust-lang.org/nightly/core/ops/range/struct.Range.html "struct core::ops::range::Range")<[Position](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/url/slicing/enum.Position.html "enum url::slicing::Position")>> for [Url](struct.Url.html.md "struct tauri::Url")

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/slicing.rs.html#35)[§](#associatedtype.Output-3)

#### type [Output](https://doc.rust-lang.org/nightly/core/ops/index/trait.Index.html#associatedtype.Output) = [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

The returned type after indexing.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/slicing.rs.html#36)[§](#method.index-3)

#### fn [index](https://doc.rust-lang.org/nightly/core/ops/index/trait.Index.html#tymethod.index)(&self, range: [Range](https://doc.rust-lang.org/nightly/core/ops/range/struct.Range.html "struct core::ops::range::Range")<[Position](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/url/slicing/enum.Position.html "enum url::slicing::Position")>) -> &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

Performs the indexing (`container[index]`) operation. [Read more](https://doc.rust-lang.org/nightly/core/ops/index/trait.Index.html#tymethod.index)

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/slicing.rs.html#20)[§](#impl-Index%3CRangeFrom%3CPosition%3E%3E-for-Url)

### impl [Index](https://doc.rust-lang.org/nightly/core/ops/index/trait.Index.html "trait core::ops::index::Index")<[RangeFrom](https://doc.rust-lang.org/nightly/core/ops/range/struct.RangeFrom.html "struct core::ops::range::RangeFrom")<[Position](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/url/slicing/enum.Position.html "enum url::slicing::Position")>> for [Url](struct.Url.html.md "struct tauri::Url")

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/slicing.rs.html#21)[§](#associatedtype.Output-1)

#### type [Output](https://doc.rust-lang.org/nightly/core/ops/index/trait.Index.html#associatedtype.Output) = [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

The returned type after indexing.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/slicing.rs.html#22)[§](#method.index-1)

#### fn [index](https://doc.rust-lang.org/nightly/core/ops/index/trait.Index.html#tymethod.index)(&self, range: [RangeFrom](https://doc.rust-lang.org/nightly/core/ops/range/struct.RangeFrom.html "struct core::ops::range::RangeFrom")<[Position](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/url/slicing/enum.Position.html "enum url::slicing::Position")>) -> &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

Performs the indexing (`container[index]`) operation. [Read more](https://doc.rust-lang.org/nightly/core/ops/index/trait.Index.html#tymethod.index)

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/slicing.rs.html#13)[§](#impl-Index%3CRangeFull%3E-for-Url)

### impl [Index](https://doc.rust-lang.org/nightly/core/ops/index/trait.Index.html "trait core::ops::index::Index")<[RangeFull](https://doc.rust-lang.org/nightly/core/ops/range/struct.RangeFull.html "struct core::ops::range::RangeFull")> for [Url](struct.Url.html.md "struct tauri::Url")

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/slicing.rs.html#14)[§](#associatedtype.Output)

#### type [Output](https://doc.rust-lang.org/nightly/core/ops/index/trait.Index.html#associatedtype.Output) = [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

The returned type after indexing.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/slicing.rs.html#15)[§](#method.index)

#### fn [index](https://doc.rust-lang.org/nightly/core/ops/index/trait.Index.html#tymethod.index)(&self, \_: [RangeFull](https://doc.rust-lang.org/nightly/core/ops/range/struct.RangeFull.html "struct core::ops::range::RangeFull")) -> &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

Performs the indexing (`container[index]`) operation. [Read more](https://doc.rust-lang.org/nightly/core/ops/index/trait.Index.html#tymethod.index)

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/slicing.rs.html#27)[§](#impl-Index%3CRangeTo%3CPosition%3E%3E-for-Url)

### impl [Index](https://doc.rust-lang.org/nightly/core/ops/index/trait.Index.html "trait core::ops::index::Index")<[RangeTo](https://doc.rust-lang.org/nightly/core/ops/range/struct.RangeTo.html "struct core::ops::range::RangeTo")<[Position](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/url/slicing/enum.Position.html "enum url::slicing::Position")>> for [Url](struct.Url.html.md "struct tauri::Url")

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/slicing.rs.html#28)[§](#associatedtype.Output-2)

#### type [Output](https://doc.rust-lang.org/nightly/core/ops/index/trait.Index.html#associatedtype.Output) = [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

The returned type after indexing.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/slicing.rs.html#29)[§](#method.index-2)

#### fn [index](https://doc.rust-lang.org/nightly/core/ops/index/trait.Index.html#tymethod.index)(&self, range: [RangeTo](https://doc.rust-lang.org/nightly/core/ops/range/struct.RangeTo.html "struct core::ops::range::RangeTo")<[Position](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/url/slicing/enum.Position.html "enum url::slicing::Position")>) -> &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)

Performs the indexing (`container[index]`) operation. [Read more](https://doc.rust-lang.org/nightly/core/ops/index/trait.Index.html#tymethod.index)

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2810)[§](#impl-Ord-for-Url)

### impl [Ord](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html "trait core::cmp::Ord") for [Url](struct.Url.html.md "struct tauri::Url")

URLs compare like their serialization.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2812)[§](#method.cmp)

#### fn [cmp](https://doc.rust-lang.org/nightly/core/cmp/trait.Ord.html#tymethod.cmp)(&self, other: &[Url](struct.Url.html.md "struct tauri::Url")) -> [Ordering](https://doc.rust-lang.org/nightly/core/cmp/enum.Ordering.html "enum core::cmp::Ordering")

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

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2802)[§](#impl-PartialEq-for-Url)

### impl [PartialEq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html "trait core::cmp::PartialEq") for [Url](struct.Url.html.md "struct tauri::Url")

URLs compare like their serialization.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2804)[§](#method.eq)

#### fn [eq](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#tymethod.eq)(&self, other: &[Url](struct.Url.html.md "struct tauri::Url")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `self` and `other` values to be equal, and is used by `==`.

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/cmp.rs.html#262)[§](#method.ne)

#### fn [ne](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialEq.html#method.ne)(&self, other: [&Rhs](https://doc.rust-lang.org/nightly/std/primitive.reference.html)) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Tests for `!=`. The default implementation is almost always sufficient,
and should not be overridden without very good reason.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2818)[§](#impl-PartialOrd-for-Url)

### impl [PartialOrd](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html "trait core::cmp::PartialOrd") for [Url](struct.Url.html.md "struct tauri::Url")

URLs compare like their serialization.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2820)[§](#method.partial_cmp)

#### fn [partial\_cmp](https://doc.rust-lang.org/nightly/core/cmp/trait.PartialOrd.html#tymethod.partial_cmp)(&self, other: &[Url](struct.Url.html.md "struct tauri::Url")) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Ordering](https://doc.rust-lang.org/nightly/core/cmp/enum.Ordering.html "enum core::cmp::Ordering")>

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

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2873)[§](#impl-Serialize-for-Url)

### impl [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize") for [Url](struct.Url.html.md "struct tauri::Url")

Serializes this URL into a `serde` stream.

This implementation is only available if the `serde` Cargo feature is enabled.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2874-2876)[§](#method.serialize)

#### fn [serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html#tymethod.serialize)<S>( &self, serializer: S, ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<<S as [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer")>::[Ok](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html#associatedtype.Ok "type serde::ser::Serializer::Ok"), <S as [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer")>::[Error](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html#associatedtype.Error "type serde::ser::Serializer::Error")> where S: [Serializer](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serializer.html "trait serde::ser::Serializer"),

Serialize this value into the given Serde serializer. [Read more](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html#tymethod.serialize)

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2756)[§](#impl-TryFrom%3C%26str%3E-for-Url)

### impl<'a> [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<&'a [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)> for [Url](struct.Url.html.md "struct tauri::Url")

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2757)[§](#associatedtype.Error)

#### type [Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error) = [ParseError](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/url/parser/enum.ParseError.html "enum url::parser::ParseError")

The type returned in the event of a conversion error.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2759)[§](#method.try_from)

#### fn [try\_from](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#tymethod.try_from)(s: &'a [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[Url](struct.Url.html.md "struct tauri::Url"), <[Url](struct.Url.html.md "struct tauri::Url") as [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<&'a [str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>>::[Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error "type core::convert::TryFrom::Error")>

Performs the conversion.

[Source](https://docs.rs/url/2.5.4/x86_64-unknown-linux-gnu/src/url/lib.rs.html#2799)[§](#impl-Eq-for-Url)

### impl [Eq](https://doc.rust-lang.org/nightly/core/cmp/trait.Eq.html "trait core::cmp::Eq") for [Url](struct.Url.html.md "struct tauri::Url")

URLs compare like their serialization.

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-Url)

### impl [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [Url](struct.Url.html.md "struct tauri::Url")

[§](#impl-RefUnwindSafe-for-Url)

### impl [RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [Url](struct.Url.html.md "struct tauri::Url")

[§](#impl-Send-for-Url)

### impl [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [Url](struct.Url.html.md "struct tauri::Url")

[§](#impl-Sync-for-Url)

### impl [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [Url](struct.Url.html.md "struct tauri::Url")

[§](#impl-Unpin-for-Url)

### impl [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [Url](struct.Url.html.md "struct tauri::Url")

[§](#impl-UnwindSafe-for-Url)

### impl [UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [Url](struct.Url.html.md "struct tauri::Url")

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

[Source](../src/tauri/ipc/command.rs.html#62-70)[§](#impl-CommandArg%3C'de,+R%3E-for-D)

### impl<'de, D, R> [CommandArg](ipc\trait.CommandArg.html.md "trait tauri::ipc::CommandArg")<'de, R> for D where D: [Deserialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.Deserialize.html "trait serde::de::Deserialize")<'de>, R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime"),

[Source](../src/tauri/ipc/command.rs.html#63-69)[§](#method.from_command)

#### fn [from\_command](ipc\trait.CommandArg.html_tymethod.from_command.md)(command: [CommandItem](ipc\struct.CommandItem.html.md "struct tauri::ipc::CommandItem")<'de, R>) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<D, [InvokeError](ipc\struct.InvokeError.html.md "struct tauri::ipc::InvokeError")>

Derives an instance of `Self` from the [`CommandItem`](ipc\struct.CommandItem.html.md "struct tauri::ipc::CommandItem"). [Read more](ipc\trait.CommandArg.html_tymethod.from_command.md)

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

[Source](../src/tauri/ipc/mod.rs.html#176-182)[§](#impl-IpcResponse-for-T)

### impl<T> [IpcResponse](ipc\trait.IpcResponse.html.md "trait tauri::ipc::IpcResponse") for T where T: [Serialize](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/ser/trait.Serialize.html "trait serde::ser::Serialize"),

[Source](../src/tauri/ipc/mod.rs.html#177-181)[§](#method.body)

#### fn [body](ipc\trait.IpcResponse.html_tymethod.body.md)(self) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<[InvokeResponseBody](ipc\enum.InvokeResponseBody.html.md "enum tauri::ipc::InvokeResponseBody"), [Error](enum.Error.html.md "enum tauri::Error")>

Resolve the IPC response body.

[Source](../src/tauri/ipc/authority.rs.html#77-81)[§](#impl-RuntimeCapability-for-T)

### impl<T> [RuntimeCapability](ipc\trait.RuntimeCapability.html.md "trait tauri::ipc::RuntimeCapability") for T where T: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>,

[Source](../src/tauri/ipc/authority.rs.html#78-80)[§](#method.build)

#### fn [build](ipc\trait.RuntimeCapability.html_tymethod.build.md)(self) -> [CapabilityFile](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/acl/capability/enum.CapabilityFile.html "enum tauri_utils::acl::capability::CapabilityFile")

Creates the capability file.

[Source](../src/tauri/ipc/authority.rs.html#799-804)[§](#impl-ScopeObject-for-T)

### impl<T> [ScopeObject](ipc\trait.ScopeObject.html.md "trait tauri::ipc::ScopeObject") for T where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + [Debug](https://doc.rust-lang.org/nightly/core/fmt/trait.Debug.html "trait core::fmt::Debug") + [DeserializeOwned](https://docs.rs/serde/1.0.219/x86_64-unknown-linux-gnu/serde/de/trait.DeserializeOwned.html "trait serde::de::DeserializeOwned") + 'static,

[Source](../src/tauri/ipc/authority.rs.html#800)[§](#associatedtype.Error-1)

#### type [Error](ipc\trait.ScopeObject.html_associatedtype.Error.md) = [Error](https://docs.rs/serde_json/1.0.140/x86_64-unknown-linux-gnu/serde_json/error/struct.Error.html "struct serde_json::error::Error")

The error type.

[Source](../src/tauri/ipc/authority.rs.html#801-803)[§](#method.deserialize-1)

#### fn [deserialize](ipc\trait.ScopeObject.html_tymethod.deserialize.md)<R>( \_app: &[AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>, raw: [Value](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/acl/value/enum.Value.html "enum tauri_utils::acl::value::Value"), ) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, <T as [ScopeObject](ipc\trait.ScopeObject.html.md "trait tauri::ipc::ScopeObject")>::[Error](ipc\trait.ScopeObject.html_associatedtype.Error.md "type tauri::ipc::ScopeObject::Error")> where R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime"),

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

[Source](https://doc.rust-lang.org/nightly/src/alloc/string.rs.html#2744)[§](#impl-ToString-for-T)

### impl<T> [ToString](https://doc.rust-lang.org/nightly/alloc/string/trait.ToString.html "trait alloc::string::ToString") for T where T: [Display](https://doc.rust-lang.org/nightly/core/fmt/trait.Display.html "trait core::fmt::Display") + ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized"),

[Source](https://doc.rust-lang.org/nightly/src/alloc/string.rs.html#2746)[§](#method.to_string)

#### fn [to\_string](https://doc.rust-lang.org/nightly/alloc/string/trait.ToString.html#tymethod.to_string)(&self) -> [String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")

Converts the given value to a `String`. [Read more](https://doc.rust-lang.org/nightly/alloc/string/trait.ToString.html#tymethod.to_string)

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#806-808)[§](#impl-TryFrom%3CU%3E-for-T)

### impl<T, U> [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<U> for T where U: [Into](https://doc.rust-lang.org/nightly/core/convert/trait.Into.html "trait core::convert::Into")<T>,

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#810)[§](#associatedtype.Error-3)

#### type [Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error) = [Infallible](https://doc.rust-lang.org/nightly/core/convert/enum.Infallible.html "enum core::convert::Infallible")

The type returned in the event of a conversion error.

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#813)[§](#method.try_from-1)

#### fn [try\_from](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#tymethod.try_from)(value: U) -> [Result](https://doc.rust-lang.org/nightly/core/result/enum.Result.html "enum core::result::Result")<T, <T as [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<U>>::[Error](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html#associatedtype.Error "type core::convert::TryFrom::Error")>

Performs the conversion.

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#791-793)[§](#impl-TryInto%3CU%3E-for-T)

### impl<T, U> [TryInto](https://doc.rust-lang.org/nightly/core/convert/trait.TryInto.html "trait core::convert::TryInto")<U> for T where U: [TryFrom](https://doc.rust-lang.org/nightly/core/convert/trait.TryFrom.html "trait core::convert::TryFrom")<T>,

[Source](https://doc.rust-lang.org/nightly/src/core/convert/mod.rs.html#795)[§](#associatedtype.Error-2)

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