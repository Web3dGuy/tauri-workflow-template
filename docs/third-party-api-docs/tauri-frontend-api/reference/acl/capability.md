# Capability

A grouping and boundary mechanism developers can use to isolate access to the IPC layer.

It controls application windows fine grained access to the Tauri core, application, or plugin commands.
If a window is not matching any capability then it has no access to the IPC layer at all.

This can be done to create groups of windows, based on their required system access, which can reduce
impact of frontend vulnerabilities in less privileged windows.
Windows can be added to a capability by exact name (e.g. `main-window`) or glob patterns like `*` or `admin-*`.
A Window can have none, one, or multiple associated capabilities.

### [Example](#example)

```

{

"identifier": "main-user-files-write",

"description": "This capability allows the `main` window on macOS and Windows access to `filesystem` write related commands and `dialog` commands to enable programatic access to files selected by the user.",

"windows": [

"main"

],

"permissions": [

"core:default",

"dialog:open",

{

"identifier": "fs:allow-write-text-file",

"allow": [{ "path": "$HOME/test.txt" }]

},

],

"platforms": ["macOS","windows"]

}

```

**Object Properties**:

* description
* identifier (required)
* local
* permissions (required)
* platforms
* remote
* webviews
* windows

### [description](#description)

`string`

Description of what the capability is intended to allow on associated windows.

It should contain a description of what the grouped permissions should allow.

#### [Example](#example-1)

This capability allows the `main` window access to `filesystem` write related
commands and `dialog` commands to enable programatic access to files selected by the user.

### [identifier](#identifier)

`string`

Identifier of the capability.

#### [Example](#example-2)

`main-user-files-write`

### [local](#local)

`boolean`

Whether this capability is enabled for local app URLs or not. Defaults to `true`.

**Default**: `true`

### [permissions](#permissions)

[`PermissionEntry`](#permissionentry)[] each item must be unique

List of permissions attached to this capability.

Must include the plugin name as prefix in the form of `${plugin-name}:${permission-name}`.
For commands directly implemented in the application itself only `${permission-name}`
is required.

#### [Example](#example-3)

```

[

"core:default",

"shell:allow-open",

"dialog:open",

{

"identifier": "fs:allow-write-text-file",

"allow": [{ "path": "$HOME/test.txt" }]

}

]

```

### [platforms](#platforms)

[`Target`](#target)[] | `null`

Limit which target platforms this capability applies to.

By default all platforms are targeted.

#### [Example](#example-4)

`["macOS","windows"]`

### [remote](#remote)

[`CapabilityRemote`](#capabilityremote) | `null`

Configure remote URLs that can use the capability permissions.

This setting is optional and defaults to not being set, as our
default use case is that the content is served from our local application.

Caution

Make sure you understand the security implications of providing remote
sources with local system access.

#### [Example](#example-5)

```

{

"urls": ["https://*.mydomain.dev"]

}

```

### [webviews](#webviews)

`string`[]

List of webviews that are affected by this capability. Can be a glob pattern.

This is only required when using on multiwebview contexts, by default
all child webviews of a window that matches [`Self::windows`] are linked.

#### [Example](#example-6)

`["sub-webview-one", "sub-webview-two"]`

### [windows](#windows)

`string`[]

List of windows that are affected by this capability. Can be a glob pattern.

On multiwebview windows, prefer [`Self::webviews`] for a fine grained access control.

#### [Example](#example-7)

`["main"]`

## [Definitions](#definitions)

### [CapabilityRemote](#capabilityremote)

Configuration for remote URLs that are associated with the capability.

**Object Properties**:

* urls (required)

##### [urls](#urls)

`string`[]

Remote domains this capability refers to using the [URLPattern standard](https://urlpattern.spec.whatwg.org/).

###### [Examples](#examples)

* “https://\*.mydomain.dev”: allows subdomains of mydomain.dev
* “<https://mydomain.dev/api/>\*”: allows any subpath of mydomain.dev/api

### [Identifier](#identifier-1)

`string`

### [Number](#number)

**Any of the following**:

* `integer` formatted as `int64` Represents an [`i64`].
* `number` formatted as `double` Represents a [`f64`].

A valid ACL number.

### [PermissionEntry](#permissionentry)

**Any of the following**:

* [`Identifier`](#identifier) Reference a permission or permission set by identifier.
* Reference a permission or permission set by identifier and extends its scope. **Object Properties**: - allow - deny - identifier (required) ##### allow [`Value`](#value)[] | `null` Data that defines what is allowed by the scope. ##### deny [`Value`](#value)[] | `null` Data that defines what is denied by the scope. This should be prioritized by validation logic. ##### identifier [`Identifier`](#identifier) Identifier of the permission or permission set.

An entry for a permission value in a [`Capability`] can be either a raw permission [`Identifier`]
or an object that references a permission and extends its scope.

### [Target](#target)

**One of the following**:

* `"macOS"` MacOS.
* `"windows"` Windows.
* `"linux"` Linux.
* `"android"` Android.
* `"iOS"` iOS.

Platform target.

### [Value](#value)

**Any of the following**:

* `null` Represents a null JSON value.
* `boolean` Represents a [`bool`].
* [`Number`](#number) Represents a valid ACL [`Number`].
* `string` Represents a [`String`].
* [`Value`](#value)[] Represents a list of other [`Value`]s.
* Represents a map of [`String`] keys to [`Value`]s. **Allows additional properties**: [`Value`](#value)

All supported ACL values.

[Edit page](https://github.com/tauri-apps/tauri-docs/edit/v2/src/content/docs/reference/acl/capability.md)

[Previous   
 Trademark Guidelines](/about/trademark/)   [Next   
 Permission](permission.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT