# @tauri-apps/api

The Tauri API allows you to interface with the backend layer.

This module exposes all other modules as an object where the key is the module name, and the value is the module exports.

## [Examples](#examples)

```

import { event, window, path } from '@tauri-apps/api'

```

### [Vanilla JS API](#vanilla-js-api)

The above import syntax is for JavaScript/TypeScript with a bundler. If you’re using vanilla JavaScript, you can use the global `window.__TAURI__` object instead. It requires `app.withGlobalTauri` configuration option enabled.

```

const { event, window: tauriWindow, path } = window.__TAURI__;

```

## [Namespaces](#namespaces)

[Previous   
 0.6.0](/release/wry/v0.6.0/)   [Next   
 app](api\namespaceapp.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT