# Permission

Descriptions of explicit privileges of commands.

It can enable commands to be accessible in the frontend of the application.

If the scope is defined it can be used to fine grain control the access of individual or multiple commands.

**Object Properties**:

* commands
* description
* identifier (required)
* platforms
* scope
* version

### [commands](#commands)

[`Commands`](#commands)

Allowed or denied commands when using this permission.

Default

```

{

"allow": [],

"deny": []

}

```

### [description](#description)

`string` | `null`

Human-readable description of what the permission does.
Tauri internal convention is to use <h4> headings in markdown content
for Tauri documentation generation purposes.

### [identifier](#identifier)

`string`

A unique identifier for the permission.

### [platforms](#platforms)

[`Target`](#target)[] | `null`

Target platforms this permission applies. By default all platforms are affected by this permission.

### [scope](#scope)

[`Scopes`](#scopes)

Allowed or denied scoped when using this permission.

### [version](#version)

`integer` | `null` minimum of `1`, formatted as `uint64`

The version of the permission.

## [Definitions](#definitions)

### [Commands](#commands-1)

Allowed and denied commands inside a permission.

If two commands clash inside of `allow` and `deny`, it should be denied by default.

**Object Properties**:

* allow
* deny

##### [allow](#allow)

`string`[]

Allowed command.

**Default**: `[]`

##### [deny](#deny)

`string`[]

Denied command, which takes priority.

**Default**: `[]`

### [Number](#number)

**Any of the following**:

* `integer` formatted as `int64` Represents an [`i64`].
* `number` formatted as `double` Represents a [`f64`].

A valid ACL number.

### [Scopes](#scopes)

An argument for fine grained behavior control of Tauri commands.

It can be of any serde serializable type and is used to allow or prevent certain actions inside a Tauri command.
The configured scope is passed to the command and will be enforced by the command implementation.

##### [Example](#example)

```

{

"allow": [{ "path": "$HOME/**" }],

"deny": [{ "path": "$HOME/secret.txt" }]

}

```

**Object Properties**:

* allow
* deny

##### [allow](#allow-1)

[`Value`](#value)[] | `null`

Data that defines what is allowed by the scope.

##### [deny](#deny-1)

[`Value`](#value)[] | `null`

Data that defines what is denied by the scope. This should be prioritized by validation logic.

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

[Edit page](https://github.com/tauri-apps/tauri-docs/edit/v2/src/content/docs/reference/acl/permission.md)

[Previous   
 Capability](capability.md)   [Next   
 Scope](scope.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT