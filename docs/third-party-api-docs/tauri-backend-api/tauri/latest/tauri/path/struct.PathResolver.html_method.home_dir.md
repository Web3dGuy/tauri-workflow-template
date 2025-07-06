# Struct PathResolverCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/path/desktop.rs.html#10)

```
pub struct PathResolver<R: Runtime>(/* private fields */);
```

Expand description

The path resolver is a helper class for general and application-specific path APIs.

## Implementations[§](#implementations)

[Source](../../src/tauri/path/desktop.rs.html#18-278)[§](#impl-PathResolver%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [PathResolver](struct.PathResolver.html.md "struct tauri::path::PathResolver")<R>

[Source](../../src/tauri/path/desktop.rs.html#29-33)

#### pub fn [file\_name](#method.file_name)(&self, path: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String")>

Returns the final component of the `Path`, if there is one.

If the path is a normal file, this is the file name. If it’s the path of a directory, this
is the directory name.

Returns [`None`](https://doc.rust-lang.org/nightly/core/option/enum.Option.html#variant.None "variant core::option::Option::None") if the path terminates in `..`.

On Android this also supports checking the file name of content URIs, such as the values returned by the dialog plugin.

If you are dealing with plain file system paths or not worried about Android content URIs, prefer [`Path::file_name`](https://doc.rust-lang.org/nightly/std/path/struct.Path.html#method.file_name "method std::path::Path::file_name").

[Source](../../src/tauri/path/desktop.rs.html#42-44)

#### pub fn [audio\_dir](#method.audio_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the user’s audio directory.

###### [§](#platform-specific)Platform-specific

* **Linux:** Resolves to [`xdg-user-dirs`](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/)’ `XDG_MUSIC_DIR`.
* **macOS:** Resolves to `$HOME/Music`.
* **Windows:** Resolves to `{FOLDERID_Music}`.

[Source](../../src/tauri/path/desktop.rs.html#53-55)

#### pub fn [cache\_dir](#method.cache_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the user’s cache directory.

###### [§](#platform-specific-1)Platform-specific

* **Linux:** Resolves to `$XDG_CACHE_HOME` or `$HOME/.cache`.
* **macOS:** Resolves to `$HOME/Library/Caches`.
* **Windows:** Resolves to `{FOLDERID_LocalAppData}`.

[Source](../../src/tauri/path/desktop.rs.html#64-66)

#### pub fn [config\_dir](#method.config_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the user’s config directory.

###### [§](#platform-specific-2)Platform-specific

* **Linux:** Resolves to `$XDG_CONFIG_HOME` or `$HOME/.config`.
* **macOS:** Resolves to `$HOME/Library/Application Support`.
* **Windows:** Resolves to `{FOLDERID_RoamingAppData}`.

[Source](../../src/tauri/path/desktop.rs.html#75-77)

#### pub fn [data\_dir](#method.data_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the user’s data directory.

###### [§](#platform-specific-3)Platform-specific

* **Linux:** Resolves to `$XDG_DATA_HOME` or `$HOME/.local/share`.
* **macOS:** Resolves to `$HOME/Library/Application Support`.
* **Windows:** Resolves to `{FOLDERID_RoamingAppData}`.

[Source](../../src/tauri/path/desktop.rs.html#86-88)

#### pub fn [local\_data\_dir](#method.local_data_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the user’s local data directory.

###### [§](#platform-specific-4)Platform-specific

* **Linux:** Resolves to `$XDG_DATA_HOME` or `$HOME/.local/share`.
* **macOS:** Resolves to `$HOME/Library/Application Support`.
* **Windows:** Resolves to `{FOLDERID_LocalAppData}`.

[Source](../../src/tauri/path/desktop.rs.html#97-99)

#### pub fn [desktop\_dir](#method.desktop_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the user’s desktop directory.

###### [§](#platform-specific-5)Platform-specific

* **Linux:** Resolves to [`xdg-user-dirs`](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/)’ `XDG_DESKTOP_DIR`.
* **macOS:** Resolves to `$HOME/Desktop`.
* **Windows:** Resolves to `{FOLDERID_Desktop}`.

[Source](../../src/tauri/path/desktop.rs.html#108-110)

#### pub fn [document\_dir](#method.document_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the user’s document directory.

###### [§](#platform-specific-6)Platform-specific

* **Linux:** Resolves to [`xdg-user-dirs`](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/)’ `XDG_DOCUMENTS_DIR`.
* **macOS:** Resolves to `$HOME/Documents`.
* **Windows:** Resolves to `{FOLDERID_Documents}`.

[Source](../../src/tauri/path/desktop.rs.html#119-121)

#### pub fn [download\_dir](#method.download_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the user’s download directory.

###### [§](#platform-specific-7)Platform-specific

* **Linux:** Resolves to [`xdg-user-dirs`](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/)’ `XDG_DOWNLOAD_DIR`.
* **macOS:** Resolves to `$HOME/Downloads`.
* **Windows:** Resolves to `{FOLDERID_Downloads}`.

[Source](../../src/tauri/path/desktop.rs.html#130-132)

#### pub fn [executable\_dir](#method.executable_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the user’s executable directory.

###### [§](#platform-specific-8)Platform-specific

* **Linux:** Resolves to `$XDG_BIN_HOME/../bin` or `$XDG_DATA_HOME/../bin` or `$HOME/.local/bin`.
* **macOS:** Not supported.
* **Windows:** Not supported.

[Source](../../src/tauri/path/desktop.rs.html#141-143)

#### pub fn [font\_dir](#method.font_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the user’s font directory.

###### [§](#platform-specific-9)Platform-specific

* **Linux:** Resolves to `$XDG_DATA_HOME/fonts` or `$HOME/.local/share/fonts`.
* **macOS:** Resolves to `$HOME/Library/Fonts`.
* **Windows:** Not supported.

[Source](../../src/tauri/path/desktop.rs.html#152-154)

#### pub fn [home\_dir](#method.home_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the user’s home directory.

###### [§](#platform-specific-10)Platform-specific

* **Linux:** Resolves to `$HOME`.
* **macOS:** Resolves to `$HOME`.
* **Windows:** Resolves to `{FOLDERID_Profile}`.

[Source](../../src/tauri/path/desktop.rs.html#163-165)

#### pub fn [picture\_dir](#method.picture_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the user’s picture directory.

###### [§](#platform-specific-11)Platform-specific

* **Linux:** Resolves to [`xdg-user-dirs`](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/)’ `XDG_PICTURES_DIR`.
* **macOS:** Resolves to `$HOME/Pictures`.
* **Windows:** Resolves to `{FOLDERID_Pictures}`.

[Source](../../src/tauri/path/desktop.rs.html#174-176)

#### pub fn [public\_dir](#method.public_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the user’s public directory.

###### [§](#platform-specific-12)Platform-specific

* **Linux:** Resolves to [`xdg-user-dirs`](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/)’ `XDG_PUBLICSHARE_DIR`.
* **macOS:** Resolves to `$HOME/Public`.
* **Windows:** Resolves to `{FOLDERID_Public}`.

[Source](../../src/tauri/path/desktop.rs.html#185-187)

#### pub fn [runtime\_dir](#method.runtime_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the user’s runtime directory.

###### [§](#platform-specific-13)Platform-specific

* **Linux:** Resolves to `$XDG_RUNTIME_DIR`.
* **macOS:** Not supported.
* **Windows:** Not supported.

[Source](../../src/tauri/path/desktop.rs.html#196-198)

#### pub fn [template\_dir](#method.template_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the user’s template directory.

###### [§](#platform-specific-14)Platform-specific

* **Linux:** Resolves to [`xdg-user-dirs`](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/)’ `XDG_TEMPLATES_DIR`.
* **macOS:** Not supported.
* **Windows:** Resolves to `{FOLDERID_Templates}`.

[Source](../../src/tauri/path/desktop.rs.html#207-209)

#### pub fn [video\_dir](#method.video_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the user’s video dir

###### [§](#platform-specific-15)Platform-specific

* **Linux:** Resolves to [`xdg-user-dirs`](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/)’ `XDG_VIDEOS_DIR`.
* **macOS:** Resolves to `$HOME/Movies`.
* **Windows:** Resolves to `{FOLDERID_Videos}`.

[Source](../../src/tauri/path/desktop.rs.html#212-215)

#### pub fn [resource\_dir](#method.resource_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the resource directory of this app.

[Source](../../src/tauri/path/desktop.rs.html#220-224)

#### pub fn [app\_config\_dir](#method.app_config_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the suggested directory for your app’s config files.

Resolves to [`config_dir`](struct.PathResolver.html_method.config_dir.md "method tauri::path::PathResolver::config_dir")`/${bundle_identifier}`.

[Source](../../src/tauri/path/desktop.rs.html#229-233)

#### pub fn [app\_data\_dir](#method.app_data_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the suggested directory for your app’s data files.

Resolves to [`data_dir`](struct.PathResolver.html_method.data_dir.md "method tauri::path::PathResolver::data_dir")`/${bundle_identifier}`.

[Source](../../src/tauri/path/desktop.rs.html#238-242)

#### pub fn [app\_local\_data\_dir](#method.app_local_data_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the suggested directory for your app’s local data files.

Resolves to [`local_data_dir`](struct.PathResolver.html_method.local_data_dir.md "method tauri::path::PathResolver::local_data_dir")`/${bundle_identifier}`.

[Source](../../src/tauri/path/desktop.rs.html#247-251)

#### pub fn [app\_cache\_dir](#method.app_cache_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the suggested directory for your app’s cache files.

Resolves to [`cache_dir`](struct.PathResolver.html_method.cache_dir.md "method tauri::path::PathResolver::cache_dir")`/${bundle_identifier}`.

[Source](../../src/tauri/path/desktop.rs.html#260-272)

#### pub fn [app\_log\_dir](#method.app_log_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Returns the path to the suggested directory for your app’s log files.

###### [§](#platform-specific-16)Platform-specific

* **Linux:** Resolves to [`local_data_dir`](struct.PathResolver.html_method.local_data_dir.md "method tauri::path::PathResolver::local_data_dir")`/${bundle_identifier}/logs`.
* **macOS:** Resolves to [`home_dir`](struct.PathResolver.html_method.home_dir.md "method tauri::path::PathResolver::home_dir")`/Library/Logs/${bundle_identifier}`
* **Windows:** Resolves to [`local_data_dir`](struct.PathResolver.html_method.local_data_dir.md "method tauri::path::PathResolver::local_data_dir")`/${bundle_identifier}/logs`.

[Source](../../src/tauri/path/desktop.rs.html#275-277)

#### pub fn [temp\_dir](#method.temp_dir)(&self) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

A temporary directory. Resolves to [`std::env::temp_dir`](https://doc.rust-lang.org/nightly/std/env/fn.temp_dir.html "fn std::env::temp_dir").

[Source](../../src/tauri/path/mod.rs.html#238-293)[§](#impl-PathResolver%3CR%3E-1)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [PathResolver](struct.PathResolver.html.md "struct tauri::path::PathResolver")<R>

[Source](../../src/tauri/path/mod.rs.html#252-254)

#### pub fn [resolve](#method.resolve)<P: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[Path](https://doc.rust-lang.org/nightly/std/path/struct.Path.html "struct std::path::Path")>>( &self, path: P, base\_directory: [BaseDirectory](enum.BaseDirectory.html.md "enum tauri::path::BaseDirectory"), ) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Resolves the path with the base directory.

##### [§](#examples)Examples

```
use tauri::{path::BaseDirectory, Manager};
tauri::Builder::default()
  .setup(|app| {
    let path = app.path().resolve("path/to/something", BaseDirectory::Config)?;
    assert_eq!(path.to_str().unwrap(), "/home/${whoami}/.config/path/to/something");
    Ok(())
  });
```

[Source](../../src/tauri/path/mod.rs.html#269-292)

#### pub fn [parse](#method.parse)<P: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[Path](https://doc.rust-lang.org/nightly/std/path/struct.Path.html "struct std::path::Path")>>(&self, path: P) -> [Result](..\type.Result.html.md "type tauri::Result")<[PathBuf](https://doc.rust-lang.org/nightly/std/path/struct.PathBuf.html "struct std::path::PathBuf")>

Parse the given path, resolving a [`BaseDirectory`](enum.BaseDirectory.html.md "enum tauri::path::BaseDirectory") variable if the path starts with one.

##### [§](#examples-1)Examples

```
use tauri::Manager;
tauri::Builder::default()
  .setup(|app| {
    let path = app.path().parse("$HOME/.bashrc")?;
    assert_eq!(path.to_str().unwrap(), "/home/${whoami}/.bashrc");
    Ok(())
  });
```

## Trait Implementations[§](#trait-implementations)

[Source](../../src/tauri/path/desktop.rs.html#12-16)[§](#impl-Clone-for-PathResolver%3CR%3E)

### impl<R: [Runtime](..\trait.Runtime.html.md "trait tauri::Runtime")> [Clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html "trait core::clone::Clone") for [PathResolver](struct.PathResolver.html.md "struct tauri::path::PathResolver")<R>

[Source](../../src/tauri/path/desktop.rs.html#13-15)[§](#method.clone)

#### fn [clone](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)(&self) -> Self

Returns a copy of the value. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#tymethod.clone)

1.0.0 · [Source](https://doc.rust-lang.org/nightly/src/core/clone.rs.html#174)[§](#method.clone_from)

#### fn [clone\_from](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)(&mut self, source: &Self)

Performs copy-assignment from `source`. [Read more](https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html#method.clone_from)

## Auto Trait Implementations[§](#synthetic-implementations)

[§](#impl-Freeze-for-PathResolver%3CR%3E)

### impl<R> [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze") for [PathResolver](struct.PathResolver.html.md "struct tauri::path::PathResolver")<R> where <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[Handle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.Handle "type tauri_runtime::Runtime::Handle"): [Freeze](https://doc.rust-lang.org/nightly/core/marker/trait.Freeze.html "trait core::marker::Freeze"),

[§](#impl-RefUnwindSafe-for-PathResolver%3CR%3E)

### impl<R> ![RefUnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.RefUnwindSafe.html "trait core::panic::unwind_safe::RefUnwindSafe") for [PathResolver](struct.PathResolver.html.md "struct tauri::path::PathResolver")<R>

[§](#impl-Send-for-PathResolver%3CR%3E)

### impl<R> [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") for [PathResolver](struct.PathResolver.html.md "struct tauri::path::PathResolver")<R>

[§](#impl-Sync-for-PathResolver%3CR%3E)

### impl<R> [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") for [PathResolver](struct.PathResolver.html.md "struct tauri::path::PathResolver")<R>

[§](#impl-Unpin-for-PathResolver%3CR%3E)

### impl<R> [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin") for [PathResolver](struct.PathResolver.html.md "struct tauri::path::PathResolver")<R> where <R as [Runtime](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html "trait tauri_runtime::Runtime")<[EventLoopMessage](..\enum.EventLoopMessage.html.md "enum tauri::EventLoopMessage")>>::[Handle](https://docs.rs/tauri-runtime/2.5.1/x86_64-unknown-linux-gnu/tauri_runtime/trait.Runtime.html#associatedtype.Handle "type tauri_runtime::Runtime::Handle"): [Unpin](https://doc.rust-lang.org/nightly/core/marker/trait.Unpin.html "trait core::marker::Unpin"),

[§](#impl-UnwindSafe-for-PathResolver%3CR%3E)

### impl<R> ![UnwindSafe](https://doc.rust-lang.org/nightly/core/panic/unwind_safe/trait.UnwindSafe.html "trait core::panic::unwind_safe::UnwindSafe") for [PathResolver](struct.PathResolver.html.md "struct tauri::path::PathResolver")<R>

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