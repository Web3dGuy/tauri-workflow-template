# Trait ManagerCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](../src/tauri/lib.rs.html#533-837)

```
pub trait Manager<R: Runtime>: ManagerBase<R> {
Show 19 methods    // Required method
    fn resources_table(&self) -> MutexGuard<'_, ResourceTable>;

    // Provided methods
    fn app_handle(&self) -> &AppHandle<R> { ... }
    fn config(&self) -> &Config { ... }
    fn package_info(&self) -> &PackageInfo { ... }
    fn get_window(&self, label: &str) -> Option<Window<R>> { ... }
    fn get_focused_window(&self) -> Option<Window<R>> { ... }
    fn windows(&self) -> HashMap<String, Window<R>> { ... }
    fn get_webview(&self, label: &str) -> Option<Webview<R>> { ... }
    fn webviews(&self) -> HashMap<String, Webview<R>> { ... }
    fn get_webview_window(&self, label: &str) -> Option<WebviewWindow<R>> { ... }
    fn webview_windows(&self) -> HashMap<String, WebviewWindow<R>> { ... }
    fn manage<T>(&self, state: T) -> bool
       where T: Send + Sync + 'static { ... }
    fn unmanage<T>(&self) -> Option<T>
       where T: Send + Sync + 'static { ... }
    fn state<T>(&self) -> State<'_, T> ⓘ
       where T: Send + Sync + 'static { ... }
    fn try_state<T>(&self) -> Option<State<'_, T>>
       where T: Send + Sync + 'static { ... }
    fn env(&self) -> Env { ... }
    fn asset_protocol_scope(&self) -> Scope { ... }
    fn path(&self) -> &PathResolver<R> { ... }
    fn add_capability(&self, capability: impl RuntimeCapability) -> Result<()> { ... }
}
```

Expand description

Manages a running application.

## Required Methods[§](#required-methods)

[Source](../src/tauri/lib.rs.html#769)

#### fn [resources\_table](#tymethod.resources_table)(&self) -> [MutexGuard](https://doc.rust-lang.org/nightly/std/sync/poison/mutex/struct.MutexGuard.html "struct std::sync::poison::mutex::MutexGuard")<'\_, [ResourceTable](struct.ResourceTable.html.md "struct tauri::ResourceTable")>

Get a reference to the resources table of this manager.

## Provided Methods[§](#provided-methods)

[Source](../src/tauri/lib.rs.html#535-537)

#### fn [app\_handle](#method.app_handle)(&self) -> &[AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>

The application handle associated with this manager.

[Source](../src/tauri/lib.rs.html#540-542)

#### fn [config](#method.config)(&self) -> &[Config](struct.Config.html.md "struct tauri::Config")

The [`Config`](struct.Config.html.md "struct tauri::Config") the manager was created with.

[Source](../src/tauri/lib.rs.html#545-547)

#### fn [package\_info](#method.package_info)(&self) -> &[PackageInfo](struct.PackageInfo.html.md "struct tauri::PackageInfo")

The [`PackageInfo`](struct.PackageInfo.html.md "struct tauri::PackageInfo") the manager was created with.

[Source](../src/tauri/lib.rs.html#552-554)

#### fn [get\_window](#method.get_window)(&self, label: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Window](window\struct.Window.html.md "struct tauri::window::Window")<R>>

Available on **crate feature `unstable`** only.

Fetch a single window from the manager.

[Source](../src/tauri/lib.rs.html#559-561)

#### fn [get\_focused\_window](#method.get_focused_window)(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Window](window\struct.Window.html.md "struct tauri::window::Window")<R>>

Available on **crate feature `unstable`** only.

Fetch the focused window. Returns `None` if there is not any focused window.

[Source](../src/tauri/lib.rs.html#566-568)

#### fn [windows](#method.windows)(&self) -> [HashMap](https://doc.rust-lang.org/nightly/std/collections/hash/map/struct.HashMap.html "struct std::collections::hash::map::HashMap")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"), [Window](window\struct.Window.html.md "struct tauri::window::Window")<R>>

Available on **crate feature `unstable`** only.

Fetch all managed windows.

[Source](../src/tauri/lib.rs.html#573-575)

#### fn [get\_webview](#method.get_webview)(&self, label: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[Webview](webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>>

Available on **crate feature `unstable`** only.

Fetch a single webview from the manager.

[Source](../src/tauri/lib.rs.html#580-582)

#### fn [webviews](#method.webviews)(&self) -> [HashMap](https://doc.rust-lang.org/nightly/std/collections/hash/map/struct.HashMap.html "struct std::collections::hash::map::HashMap")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"), [Webview](webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>>

Available on **crate feature `unstable`** only.

Fetch all managed webviews.

[Source](../src/tauri/lib.rs.html#585-597)

#### fn [get\_webview\_window](#method.get_webview_window)(&self, label: &[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[WebviewWindow](webview\struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>>

Fetch a single webview window from the manager.

[Source](../src/tauri/lib.rs.html#600-620)

#### fn [webview\_windows](#method.webview_windows)(&self) -> [HashMap](https://doc.rust-lang.org/nightly/std/collections/hash/map/struct.HashMap.html "struct std::collections::hash::map::HashMap")<[String](https://doc.rust-lang.org/nightly/alloc/string/struct.String.html "struct alloc::string::String"), [WebviewWindow](webview\struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>>

Fetch all managed webview windows.

[Source](../src/tauri/lib.rs.html#706-711)

#### fn [manage](#method.manage)<T>(&self, state: T) -> [bool](https://doc.rust-lang.org/nightly/std/primitive.bool.html) where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static,

Add `state` to the state managed by the application.

If the state for the `T` type has previously been set, the state is unchanged and false is returned. Otherwise true is returned.

Managed state can be retrieved by any command handler via the
[`State`](struct.State.html.md "struct tauri::State") guard. In particular, if a value of type `T`
is managed by Tauri, adding `State<T>` to the list of arguments in a
command handler instructs Tauri to retrieve the managed value.
Additionally, [`state`](trait.Manager.html_method.state.md "trait tauri::Manager") can be used to retrieve the value manually.

##### [§](#mutability)Mutability

Since the managed state is global and must be [`Send`](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [`Sync`](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync"), mutations can only happen through interior mutability:

```
use std::{collections::HashMap, sync::Mutex};
use tauri::State;
// here we use Mutex to achieve interior mutability
struct Storage {
  store: Mutex<HashMap<u64, String>>,
}
struct Connection;
struct DbConnection {
  db: Mutex<Option<Connection>>,
}

#[tauri::command]
fn connect(connection: State<DbConnection>) {
  // initialize the connection, mutating the state with interior mutability
  *connection.db.lock().unwrap() = Some(Connection {});
}

#[tauri::command]
fn storage_insert(key: u64, value: String, storage: State<Storage>) {
  // mutate the storage behind the Mutex
  storage.store.lock().unwrap().insert(key, value);
}

tauri::Builder::default()
  .manage(Storage { store: Default::default() })
  .manage(DbConnection { db: Default::default() })
  .invoke_handler(tauri::generate_handler![connect, storage_insert])
  // on an actual app, remove the string argument
  .run(tauri::generate_context!("test/fixture/src-tauri/tauri.conf.json"))
  .expect("error while running tauri application");
```

##### [§](#examples)Examples

```
use tauri::{Manager, State};

struct MyInt(isize);
struct MyString(String);

#[tauri::command]
fn int_command(state: State<MyInt>) -> String {
    format!("The stateful int is: {}", state.0)
}

#[tauri::command]
fn string_command<'r>(state: State<'r, MyString>) {
    println!("state: {}", state.inner().0);
}

tauri::Builder::default()
  .setup(|app| {
    app.manage(MyInt(0));
    app.manage(MyString("tauri".into()));
    // `MyInt` is already managed, so `manage()` returns false
    assert!(!app.manage(MyInt(1)));
    // read the `MyInt` managed state with the turbofish syntax
    let int = app.state::<MyInt>();
    assert_eq!(int.0, 0);
    // read the `MyString` managed state with the `State` guard
    let val: State<MyString> = app.state();
    assert_eq!(val.0, "tauri");
    Ok(())
  })
  .invoke_handler(tauri::generate_handler![int_command, string_command])
  // on an actual app, remove the string argument
  .run(tauri::generate_context!("test/fixture/src-tauri/tauri.conf.json"))
  .expect("error while running tauri application");
```

[Source](../src/tauri/lib.rs.html#733-739)

#### fn [unmanage](#method.unmanage)<T>(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<T> where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static,

👎Deprecated since 2.3.0: This method is unsafe, since it can cause dangling references.

Removes the state managed by the application for T. Returns the state if it was actually removed.

This method is *UNSAFE* and calling it will cause previously obtained references through
[Manager::state](trait.Manager.html_method.state.md "method tauri::Manager::state") and [State::inner](struct.State.html_method.inner.md "method tauri::State::inner") to become dangling references.

It is currently deprecated and may be removed in the future.

If you really want to unmanage a state, use [std::sync::Mutex](https://doc.rust-lang.org/nightly/std/sync/poison/mutex/struct.Mutex.html "struct std::sync::poison::mutex::Mutex") and [Option::take](https://doc.rust-lang.org/nightly/core/option/enum.Option.html#method.take "method core::option::Option::take") to wrap the state instead.

See [tauri-apps/tauri#12721](https://github.com/tauri-apps/tauri/issues/12721) for more information.

[Source](../src/tauri/lib.rs.html#747-756)

#### fn [state](#method.state)<T>(&self) -> [State](struct.State.html.md "struct tauri::State")<'\_, T> [ⓘ](#) where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static,

Retrieves the managed state for the type `T`.

##### [§](#panics)Panics

Panics if the state for the type `T` has not been previously [managed](trait.Manager.html_method.manage.md).
Use [try\_state](trait.Manager.html_method.try_state.md) for a non-panicking version.

[Source](../src/tauri/lib.rs.html#761-766)

#### fn [try\_state](#method.try_state)<T>(&self) -> [Option](https://doc.rust-lang.org/nightly/core/option/enum.Option.html "enum core::option::Option")<[State](struct.State.html.md "struct tauri::State")<'\_, T>> where T: [Send](https://doc.rust-lang.org/nightly/core/marker/trait.Send.html "trait core::marker::Send") + [Sync](https://doc.rust-lang.org/nightly/core/marker/trait.Sync.html "trait core::marker::Sync") + 'static,

Attempts to retrieve the managed state for the type `T`.

Returns `Some` if the state has previously been [managed](trait.Manager.html_method.manage.md). Otherwise returns `None`.

[Source](../src/tauri/lib.rs.html#772-774)

#### fn [env](#method.env)(&self) -> [Env](struct.Env.html.md "struct tauri::Env")

Gets the managed [`Env`](struct.Env.html.md "struct tauri::Env").

[Source](../src/tauri/lib.rs.html#778-780)

#### fn [asset\_protocol\_scope](#method.asset_protocol_scope)(&self) -> [Scope](scope\fs\struct.Scope.html.md "struct tauri::scope::fs::Scope")

Gets the scope for the asset protocol.

[Source](../src/tauri/lib.rs.html#783-785)

#### fn [path](#method.path)(&self) -> &[PathResolver](path\struct.PathResolver.html.md "struct tauri::path::PathResolver")<R>

The path resolver.

[Source](../src/tauri/lib.rs.html#829-836)

#### fn [add\_capability](#method.add_capability)(&self, capability: impl [RuntimeCapability](ipc\trait.RuntimeCapability.html.md "trait tauri::ipc::RuntimeCapability")) -> [Result](type.Result.html.md "type tauri::Result")<[()](https://doc.rust-lang.org/nightly/std/primitive.unit.html)>

Adds a capability to the app.

Note that by default every capability file in the `src-tauri/capabilities` folder
are automatically enabled unless specific capabilities are configured in [`tauri.conf.json > app > security > capabilities`](https://tauri.app/reference/config/#capabilities),
so you should use a different director for the runtime-added capabilities or use [tauri\_build::Attributes::capabilities\_path\_pattern](https://docs.rs/tauri-build/2/tauri_build/struct.Attributes.html#method.capabilities_path_pattern).

##### [§](#examples-1)Examples

```
use tauri::Manager;

tauri::Builder::default()
  .setup(|app| {
    #[cfg(feature = "beta")]
    app.add_capability(include_str!("../capabilities/beta/cap.json"));

    #[cfg(feature = "stable")]
    app.add_capability(include_str!("../capabilities/stable/cap.json"));
    Ok(())
  });
```

The above example assumes the following directory layout:

```
├── capabilities
│   ├── app (default capabilities used by any app flavor)
|   |   |-- cap.json
│   ├── beta (capabilities only added to a `beta` flavor)
|   |   |-- cap.json
│   ├── stable (capabilities only added to a `stable` flavor)
|       |-- cap.json
```

For this layout to be properly parsed by Tauri, we need to change the build script to

```
// only pick up capabilities in the capabilities/app folder by default
let attributes = tauri_build::Attributes::new().capabilities_path_pattern("./capabilities/app/*.json");
tauri_build::try_build(attributes).unwrap();
```

## Dyn Compatibility[§](#dyn-compatibility)

This trait is **not** [dyn compatible](https://doc.rust-lang.org/nightly/reference/items/traits.html#dyn-compatibility).

*In older versions of Rust, dyn compatibility was called "object safety", so this trait is not object safe.*

## Implementors[§](#implementors)

[Source](../src/tauri/app.rs.html#651-655)[§](#impl-Manager%3CR%3E-for-App%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Manager](trait.Manager.html.md "trait tauri::Manager")<R> for [App](struct.App.html.md "struct tauri::App")<R>

[Source](../src/tauri/app.rs.html#605-609)[§](#impl-Manager%3CR%3E-for-AppHandle%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Manager](trait.Manager.html.md "trait tauri::Manager")<R> for [AppHandle](struct.AppHandle.html.md "struct tauri::AppHandle")<R>

[Source](../src/tauri/webview/mod.rs.html#1865-1872)[§](#impl-Manager%3CR%3E-for-Webview%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Manager](trait.Manager.html.md "trait tauri::Manager")<R> for [Webview](webview\struct.Webview.html.md "struct tauri::webview::Webview")<R>

[Source](../src/tauri/webview/webview_window.rs.html#2169-2177)[§](#impl-Manager%3CR%3E-for-WebviewWindow%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Manager](trait.Manager.html.md "trait tauri::Manager")<R> for [WebviewWindow](webview\struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")<R>

[Source](../src/tauri/window/mod.rs.html#940-947)[§](#impl-Manager%3CR%3E-for-Window%3CR%3E)

### impl<R: [Runtime](trait.Runtime.html.md "trait tauri::Runtime")> [Manager](trait.Manager.html.md "trait tauri::Manager")<R> for [Window](window\struct.Window.html.md "struct tauri::window::Window")<R>

{"State<'\_, T>":"<h3>Notable traits for <code><a class=\"struct\" href=\"struct.State.html\" title=\"struct tauri::State\">State</a>&lt;'r, T&gt;</code></h3><pre><code><div class=\"where\">impl&lt;T&gt; <a class=\"trait\" href=\"https://docs.rs/time/0.3.41/x86\_64-unknown-linux-gnu/time/formatting/formattable/trait.Formattable.html\" title=\"trait time::formatting::formattable::Formattable\">Formattable</a> for T<div class=\"where\">where\n T: <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html\" title=\"trait core::ops::deref::Deref\">Deref</a>,\n &lt;T as <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html\" title=\"trait core::ops::deref::Deref\">Deref</a>&gt;::<a class=\"associatedtype\" href=\"https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html#associatedtype.Target\" title=\"type core::ops::deref::Deref::Target\">Target</a>: <a class=\"trait\" href=\"https://docs.rs/time/0.3.41/x86\_64-unknown-linux-gnu/time/formatting/formattable/trait.Formattable.html\" title=\"trait time::formatting::formattable::Formattable\">Formattable</a>,</div></div><div class=\"where\">impl&lt;T&gt; <a class=\"trait\" href=\"https://docs.rs/time/0.3.41/x86\_64-unknown-linux-gnu/time/parsing/parsable/trait.Parsable.html\" title=\"trait time::parsing::parsable::Parsable\">Parsable</a> for T<div class=\"where\">where\n T: <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html\" title=\"trait core::ops::deref::Deref\">Deref</a>,\n &lt;T as <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html\" title=\"trait core::ops::deref::Deref\">Deref</a>&gt;::<a class=\"associatedtype\" href=\"https://doc.rust-lang.org/nightly/core/ops/deref/trait.Deref.html#associatedtype.Target\" title=\"type core::ops::deref::Deref::Target\">Target</a>: <a class=\"trait\" href=\"https://docs.rs/time/0.3.41/x86\_64-unknown-linux-gnu/time/parsing/parsable/trait.Parsable.html\" title=\"trait time::parsing::parsable::Parsable\">Parsable</a>,</div></div>"}