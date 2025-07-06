# @tauri-apps/plugin-sql

## [Classes](#classes)

### [default](#default)

**Database**

The `Database` class serves as the primary interface for
communicating with the rust side of the sql plugin.

#### [Constructors](#constructors)

##### [new default()](#new-default)

```

new default(path): default

```

###### [Parameters](#parameters)

| Parameter | Type |
| --- | --- |
| `path` | `string` |

###### [Returns](#returns)

[`default`](sql.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/sql/guest-js/index.ts#L29>

#### [Properties](#properties)

| Property | Type | Defined in |
| --- | --- | --- |
| `path` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/sql/guest-js/index.ts#L28> |

#### [Methods](#methods)

##### [close()](#close)

```

close(db?): Promise<boolean>

```

**close**

Closes the database connection pool.

###### [Parameters](#parameters-1)

| Parameter | Type | Description |
| --- | --- | --- |
| `db`? | `string` | Optionally state the name of a database if you are managing more than one. Otherwise, all database pools will be in scope. |

###### [Returns](#returns-1)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

###### [Example](#example)

```

const success = await db.close()

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/sql/guest-js/index.ts#L162>

##### [execute()](#execute)

```

execute(query, bindValues?): Promise<QueryResult>

```

**execute**

Passes a SQL expression to the database for execution.

###### [Parameters](#parameters-2)

| Parameter | Type |
| --- | --- |
| `query` | `string` |
| `bindValues`? | `unknown`[] |

###### [Returns](#returns-2)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`QueryResult`](sql.md)>

###### [Example](#example-1)

```

// for sqlite & postgres

// INSERT example

const result = await db.execute(

"INSERT into todos (id, title, status) VALUES ($1, $2, $3)",

[ todos.id, todos.title, todos.status ]

);

// UPDATE example

const result = await db.execute(

"UPDATE todos SET title = $1, completed = $2 WHERE id = $3",

[ todos.title, todos.status, todos.id ]

);

// for mysql

// INSERT example

const result = await db.execute(

"INSERT into todos (id, title, status) VALUES (?, ?, ?)",

[ todos.id, todos.title, todos.status ]

);

// UPDATE example

const result = await db.execute(

"UPDATE todos SET title = ?, completed = ? WHERE id = ?",

[ todos.title, todos.status, todos.id ]

);

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/sql/guest-js/index.ts#L108>

##### [select()](#select)

```

select<T>(query, bindValues?): Promise<T>

```

**select**

Passes in a SELECT query to the database for execution.

###### [Type Parameters](#type-parameters)

| Type Parameter |
| --- |
| `T` |

###### [Parameters](#parameters-3)

| Parameter | Type |
| --- | --- |
| `query` | `string` |
| `bindValues`? | `unknown`[] |

###### [Returns](#returns-3)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`T`>

###### [Example](#example-2)

```

// for sqlite & postgres

const result = await db.select(

"SELECT * from todos WHERE id = $1", [ id ]

);

// for mysql

const result = await db.select(

"SELECT * from todos WHERE id = ?", [ id ]

);

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/sql/guest-js/index.ts#L141>

##### [get()](#get)

```

static get(path): default

```

**get**

A static initializer which synchronously returns an instance of
the Database class while deferring the actual database connection
until the first invocation or selection on the database.

# [Sqlite](#sqlite)

The path is relative to `tauri::path::BaseDirectory::App` and must start with `sqlite:`.

###### [Parameters](#parameters-4)

| Parameter | Type |
| --- | --- |
| `path` | `string` |

###### [Returns](#returns-4)

[`default`](sql.md)

###### [Example](#example-3)

```

const db = Database.get("sqlite:test.db");

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/sql/guest-js/index.ts#L72>

##### [load()](#load)

```

static load(path): Promise<default>

```

**load**

A static initializer which connects to the underlying database and
returns a `Database` instance once a connection to the database is established.

# [Sqlite](#sqlite-1)

The path is relative to `tauri::path::BaseDirectory::App` and must start with `sqlite:`.

###### [Parameters](#parameters-5)

| Parameter | Type |
| --- | --- |
| `path` | `string` |

###### [Returns](#returns-5)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`default`](sql.md)>

###### [Example](#example-4)

```

const db = await Database.load("sqlite:test.db");

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/sql/guest-js/index.ts#L48>

## [Interfaces](#interfaces)

### [QueryResult](#queryresult)

#### [Properties](#properties-1)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `lastInsertId?` | `number` | The last inserted `id`. This value is not set for Postgres databases. If the last inserted id is required on Postgres, the `select` function must be used, with a `RETURNING` clause (`INSERT INTO todos (title) VALUES ($1) RETURNING id`). | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/sql/guest-js/index.ts#L18> |
| `rowsAffected` | `number` | The number of rows affected by the query. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/sql/guest-js/index.ts#L9> |

[Previous   
 shell](shell.md)   [Next   
 store](store.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT