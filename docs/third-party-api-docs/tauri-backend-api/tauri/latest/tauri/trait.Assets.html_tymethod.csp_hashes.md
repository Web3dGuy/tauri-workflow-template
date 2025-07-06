# Trait AssetsCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](../src/tauri/lib.rs.html#342-356)

```
pub trait Assets<R: Runtime>:
    Send
    + Sync
    + 'static {
    // Required methods
    fn get(&self, key: &AssetKey) -> Option<Cow<'_, [u8]>>;
    fn iter(&self) -> Box<AssetsIter<'_>>;
    fn csp_hashes(
        &self,
        html_path: &AssetKey,
    ) -> Box<dyn Iterator<Item = CspHash<'_>> + '_>;

    // Provided method
    fn setup(&self, app: &App<R>) { ... }
}
```

Expand description

Represents a container of file assets that are retrievable during runtime.

## Required Methods[§](#required-methods)

[Source](../src/tauri/lib.rs.html#349)

#### fn [get](#tymethod.get)(&self, key: &[AssetKey](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/assets/struct.AssetKey.html "struct tauri_utils::assets::AssetKey")) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'\_, [[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)]>>

Get the content of the passed [`AssetKey`](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/assets/struct.AssetKey.html "struct tauri_utils::assets::AssetKey").

[Source](../src/tauri/lib.rs.html#352)

#### fn [iter](#tymethod.iter)(&self) -> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<[AssetsIter](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/assets/type.AssetsIter.html "type tauri_utils::assets::AssetsIter")<'\_>>

Iterator for the assets.

[Source](../src/tauri/lib.rs.html#355)

#### fn [csp\_hashes](#tymethod.csp_hashes)( &self, html\_path: &[AssetKey](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/assets/struct.AssetKey.html "struct tauri_utils::assets::AssetKey"), ) -> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<dyn [Iterator](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator")<Item = [CspHash](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/assets/enum.CspHash.html "enum tauri_utils::assets::CspHash")<'\_>> + '\_>

Gets the hashes for the CSP tag of the HTML on the given path.

## Provided Methods[§](#provided-methods)

[Source](../src/tauri/lib.rs.html#344-346)

#### fn [setup](#method.setup)(&self, app: &[App](struct.App.html.md "struct tauri::App")<R>)

Initialize the asset provider.

## Implementations on Foreign Types[§](#foreign-impls)

[Source](../src/tauri/lib.rs.html#358-370)[§](#impl-Assets%3CR%3E-for-EmbeddedAssets)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Assets](trait.Assets.html.md "trait tauri::Assets")<R> for [EmbeddedAssets](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/assets/struct.EmbeddedAssets.html "struct tauri_utils::assets::EmbeddedAssets")

[Source](../src/tauri/lib.rs.html#359-361)[§](#method.get)

#### fn [get](#tymethod.get)(&self, key: &[AssetKey](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/assets/struct.AssetKey.html "struct tauri_utils::assets::AssetKey")) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Cow](https://doc.rust-lang.org/nightly/alloc/borrow/enum.Cow.html "enum alloc::borrow::Cow")<'\_, [[u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)]>>

[Source](../src/tauri/lib.rs.html#363-365)[§](#method.iter)

#### fn [iter](#tymethod.iter)(&self) -> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<[AssetsIter](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/assets/type.AssetsIter.html "type tauri_utils::assets::AssetsIter")<'\_>>

[Source](../src/tauri/lib.rs.html#367-369)[§](#method.csp_hashes)

#### fn [csp\_hashes](#tymethod.csp_hashes)( &self, html\_path: &[AssetKey](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/assets/struct.AssetKey.html "struct tauri_utils::assets::AssetKey"), ) -> [Box](https://doc.rust-lang.org/nightly/alloc/boxed/struct.Box.html "struct alloc::boxed::Box")<dyn [Iterator](https://doc.rust-lang.org/nightly/core/iter/traits/iterator/trait.Iterator.html "trait core::iter::traits::iterator::Iterator")<Item = [CspHash](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/assets/enum.CspHash.html "enum tauri_utils::assets::CspHash")<'\_>> + '\_>

## Implementors[§](#implementors)

[Source](../src/tauri/test/mod.rs.html#81-98)[§](#impl-Assets%3CR%3E-for-NoopAsset)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Assets](trait.Assets.html.md "trait tauri::Assets")<R> for [NoopAsset](test\struct.NoopAsset.html.md "struct tauri::test::NoopAsset")

Available on **crate feature `test`** only.