# Trait ScopeObjectMatchCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/ipc/authority.rs.html#841-849)

```
pub trait ScopeObjectMatch: ScopeObject {
    type Input: ?Sized;

    // Required method
    fn matches(&self, input: &Self::Input) -> bool;
}
```

Expand description

A [`ScopeObject`](trait.ScopeObject.html.md "trait tauri::ipc::ScopeObject") whose validation can be represented as a `bool`.

## [§](#example)Example

```
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub enum Scope {
  Domain(Url),
  StartsWith(String),
}

impl ScopeObjectMatch for Scope {
  type Input = str;

  fn matches(&self, input: &str) -> bool {
    match self {
      Scope::Domain(url) => {
        let parsed: Url = match input.parse() {
          Ok(parsed) => parsed,
          Err(_) => return false,
        };

        let domain = parsed.domain();

        domain.is_some() && domain == url.domain()
      }
      Scope::StartsWith(start) => input.starts_with(start),
    }
  }
}
```

## Required Associated Types[§](#required-associated-types)

[Source](../../src/tauri/ipc/authority.rs.html#845)

#### type [Input](#associatedtype.Input): ?[Sized](https://doc.rust-lang.org/nightly/core/marker/trait.Sized.html "trait core::marker::Sized")

The type of input expected to validate against the scope.

This will be borrowed, so if you want to match on a `&str` this type should be `str`.

## Required Methods[§](#required-methods)

[Source](../../src/tauri/ipc/authority.rs.html#848)

#### fn [matches](#tymethod.matches)(&self, input: &Self::[Input](trait.ScopeObjectMatch.html_associatedtype.Input.md "type tauri::ipc::ScopeObjectMatch::Input")) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html)

Check if the input matches against the scope.

## Dyn Compatibility[§](#dyn-compatibility)

This trait is **not** [dyn compatible](https://doc.rust-lang.org/nightly/reference/items/traits.html#dyn-compatibility).

*In older versions of Rust, dyn compatibility was called "object safety", so this trait is not object safe.*

## Implementors[§](#implementors)