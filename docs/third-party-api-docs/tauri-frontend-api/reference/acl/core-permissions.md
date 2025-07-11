# Core Permissions

A list of all permissions that can be used with the core of the Tauri framework.

If you are looking for permissions to specific Tauri plugins, please refer to the [Plugins section](/plugin/) of the documentation.

## [Default Permissions](#default-permissions)

The `core:default` permission in Tauri automatically adds:

* `core:app:default`
* `core:event:default`
* `core:image:default`
* `core:menu:default`
* `core:path:default`
* `core:resources:default`
* `core:tray:default`
* `core:webview:default`
* `core:window:default`

## [App](#app)

### [Default Permission](#default-permission)

The default permission, `core:app:default`, includes the following:

* `allow-version`
* `allow-name`
* `allow-tauri-version`

### [Permission Table](#permission-table)

| Identifier | Description |
| --- | --- |
| `core:app:allow-app-hide` | Enables the `app_hide` command without any pre-configured scope. |
| `core:app:deny-app-hide` | Denies the `app_hide` command without any pre-configured scope. |
| `core:app:allow-app-show` | Enables the `app_show` command without any pre-configured scope. |
| `core:app:deny-app-show` | Denies the `app_show` command without any pre-configured scope. |
| `core:app:allow-default-window-icon` | Enables the `default_window_icon` command without any pre-configured scope. |
| `core:app:deny-default-window-icon` | Denies the `default_window_icon` command without any pre-configured scope. |
| `core:app:allow-name` | Enables the `name` command without any pre-configured scope. |
| `core:app:deny-name` | Denies the `name` command without any pre-configured scope. |
| `core:app:allow-set-app-theme` | Enables the `set_app_theme` command without any pre-configured scope. |
| `core:app:deny-set-app-theme` | Denies the `set_app_theme` command without any pre-configured scope. |
| `core:app:allow-tauri-version` | Enables the `tauri_version` command without any pre-configured scope. |
| `core:app:deny-tauri-version` | Denies the `tauri_version` command without any pre-configured scope. |
| `core:app:allow-version` | Enables the `version` command without any pre-configured scope. |
| `core:app:deny-version` | Denies the `version` command without any pre-configured scope. |

## [Event](#event)

### [Default Permission](#default-permission-1)

The default permission, `core:event:default`, includes the following:

* `allow-listen`
* `allow-unlisten`
* `allow-emit`
* `allow-emit-to`

### [Permission Table](#permission-table-1)

| Identifier | Description |
| --- | --- |
| `core:event:allow-emit` | Enables the `emit` command without any pre-configured scope. |
| `core:event:deny-emit` | Denies the `emit` command without any pre-configured scope. |
| `core:event:allow-emit-to` | Enables the `emit_to` command without any pre-configured scope. |
| `core:event:deny-emit-to` | Denies the `emit_to` command without any pre-configured scope. |
| `core:event:allow-listen` | Enables the `listen` command without any pre-configured scope. |
| `core:event:deny-listen` | Denies the `listen` command without any pre-configured scope. |
| `core:event:allow-unlisten` | Enables the `unlisten` command without any pre-configured scope. |
| `core:event:deny-unlisten` | Denies the `unlisten` command without any pre-configured scope. |

## [Image](#image)

### [Default Permission](#default-permission-2)

The default permission, `core:image:default`, includes the following:

* `allow-new`
* `allow-from-bytes`
* `allow-from-path`
* `allow-rgba`
* `allow-size`

### [Permission Table](#permission-table-2)

| Identifier | Description |
| --- | --- |
| `core:image:allow-from-bytes` | Enables the `from_bytes` command without any pre-configured scope. |
| `core:image:deny-from-bytes` | Denies the `from_bytes` command without any pre-configured scope. |
| `core:image:allow-from-path` | Enables the `from_path` command without any pre-configured scope. |
| `core:image:deny-from-path` | Denies the `from_path` command without any pre-configured scope. |
| `core:image:allow-new` | Enables the `new` command without any pre-configured scope. |
| `core:image:deny-new` | Denies the `new` command without any pre-configured scope. |
| `core:image:allow-rgba` | Enables the `rgba` command without any pre-configured scope. |
| `core:image:deny-rgba` | Denies the `rgba` command without any pre-configured scope. |
| `core:image:allow-size` | Enables the `size` command without any pre-configured scope. |
| `core:image:deny-size` | Denies the `size` command without any pre-configured scope. |

## [Menu](#menu)

### [Default Permission](#default-permission-3)

The default permission, `core:menu:default`, includes the following:

* `allow-new`
* `allow-append`
* `allow-prepend`
* `allow-insert`
* `allow-remove`
* `allow-remove-at`
* `allow-items`
* `allow-get`
* `allow-popup`
* `allow-create-default`
* `allow-set-as-app-menu`
* `allow-set-as-window-menu`
* `allow-text`
* `allow-set-text`
* `allow-is-enabled`
* `allow-set-enabled`
* `allow-set-accelerator`
* `allow-set-as-windows-menu-for-nsapp`
* `allow-set-as-help-menu-for-nsapp`
* `allow-is-checked`
* `allow-set-checked`
* `allow-set-icon`

### [Permission Table](#permission-table-3)

| Identifier | Description |
| --- | --- |
| `core:menu:allow-append` | Enables the `append` command without any pre-configured scope. |
| `core:menu:deny-append` | Denies the `append` command without any pre-configured scope. |
| `core:menu:allow-create-default` | Enables the `create_default` command without any pre-configured scope. |
| `core:menu:deny-create-default` | Denies the `create_default` command without any pre-configured scope. |
| `core:menu:allow-get` | Enables the `get` command without any pre-configured scope. |
| `core:menu:deny-get` | Denies the `get` command without any pre-configured scope. |
| `core:menu:allow-insert` | Enables the `insert` command without any pre-configured scope. |
| `core:menu:deny-insert` | Denies the `insert` command without any pre-configured scope. |
| `core:menu:allow-is-checked` | Enables the `is_checked` command without any pre-configured scope. |
| `core:menu:deny-is-checked` | Denies the `is_checked` command without any pre-configured scope. |
| `core:menu:allow-is-enabled` | Enables the `is_enabled` command without any pre-configured scope. |
| `core:menu:deny-is-enabled` | Denies the `is_enabled` command without any pre-configured scope. |
| `core:menu:allow-items` | Enables the `items` command without any pre-configured scope. |
| `core:menu:deny-items` | Denies the `items` command without any pre-configured scope. |
| `core:menu:allow-new` | Enables the `new` command without any pre-configured scope. |
| `core:menu:deny-new` | Denies the `new` command without any pre-configured scope. |
| `core:menu:allow-popup` | Enables the `popup` command without any pre-configured scope. |
| `core:menu:deny-popup` | Denies the `popup` command without any pre-configured scope. |
| `core:menu:allow-prepend` | Enables the `prepend` command without any pre-configured scope. |
| `core:menu:deny-prepend` | Denies the `prepend` command without any pre-configured scope. |
| `core:menu:allow-remove` | Enables the `remove` command without any pre-configured scope. |
| `core:menu:deny-remove` | Denies the `remove` command without any pre-configured scope. |
| `core:menu:allow-remove-at` | Enables the `remove_at` command without any pre-configured scope. |
| `core:menu:deny-remove-at` | Denies the `remove_at` command without any pre-configured scope. |
| `core:menu:allow-set-accelerator` | Enables the `set_accelerator` command without any pre-configured scope. |
| `core:menu:deny-set-accelerator` | Denies the `set_accelerator` command without any pre-configured scope. |
| `core:menu:allow-set-as-app-menu` | Enables the `set_as_app_menu` command without any pre-configured scope. |
| `core:menu:deny-set-as-app-menu` | Denies the `set_as_app_menu` command without any pre-configured scope. |
| `core:menu:allow-set-as-help-menu-for-nsapp` | Enables the `set_as_help_menu_for_nsapp` command without any pre-configured scope. |
| `core:menu:deny-set-as-help-menu-for-nsapp` | Denies the `set_as_help_menu_for_nsapp` command without any pre-configured scope. |
| `core:menu:allow-set-as-window-menu` | Enables the `set_as_window_menu` command without any pre-configured scope. |
| `core:menu:deny-set-as-window-menu` | Denies the `set_as_window_menu` command without any pre-configured scope. |
| `core:menu:allow-set-as-windows-menu-for-nsapp` | Enables the `set_as_windows_menu_for_nsapp` command without any pre-configured scope. |
| `core:menu:deny-set-as-windows-menu-for-nsapp` | Denies the `set_as_windows_menu_for_nsapp` command without any pre-configured scope. |
| `core:menu:allow-set-checked` | Enables the `set_checked` command without any pre-configured scope. |
| `core:menu:deny-set-checked` | Denies the `set_checked` command without any pre-configured scope. |
| `core:menu:allow-set-enabled` | Enables the `set_enabled` command without any pre-configured scope. |
| `core:menu:deny-set-enabled` | Denies the `set_enabled` command without any pre-configured scope. |
| `core:menu:allow-set-icon` | Enables the `set_icon` command without any pre-configured scope. |
| `core:menu:deny-set-icon` | Denies the `set_icon` command without any pre-configured scope. |
| `core:menu:allow-set-text` | Enables the `set_text` command without any pre-configured scope. |
| `core:menu:deny-set-text` | Denies the `set_text` command without any pre-configured scope. |
| `core:menu:allow-text` | Enables the `text` command without any pre-configured scope. |
| `core:menu:deny-text` | Denies the `text` command without any pre-configured scope. |

## [Path](#path)

### [Default Permission](#default-permission-4)

The default permission, `core:path:default`, includes the following:

* `allow-resolve-directory`
* `allow-resolve`
* `allow-normalize`
* `allow-join`
* `allow-dirname`
* `allow-extname`
* `allow-basename`
* `allow-is-absolute`

### [Permission Table](#permission-table-4)

| Identifier | Description |
| --- | --- |
| `core:path:allow-basename` | Enables the `basename` command without any pre-configured scope. |
| `core:path:deny-basename` | Denies the `basename` command without any pre-configured scope. |
| `core:path:allow-dirname` | Enables the `dirname` command without any pre-configured scope. |
| `core:path:deny-dirname` | Denies the `dirname` command without any pre-configured scope. |
| `core:path:allow-extname` | Enables the `extname` command without any pre-configured scope. |
| `core:path:deny-extname` | Denies the `extname` command without any pre-configured scope. |
| `core:path:allow-is-absolute` | Enables the `is_absolute` command without any pre-configured scope. |
| `core:path:deny-is-absolute` | Denies the `is_absolute` command without any pre-configured scope. |
| `core:path:allow-join` | Enables the `join` command without any pre-configured scope. |
| `core:path:deny-join` | Denies the `join` command without any pre-configured scope. |
| `core:path:allow-normalize` | Enables the `normalize` command without any pre-configured scope. |
| `core:path:deny-normalize` | Denies the `normalize` command without any pre-configured scope. |
| `core:path:allow-resolve` | Enables the `resolve` command without any pre-configured scope. |
| `core:path:deny-resolve` | Denies the `resolve` command without any pre-configured scope. |
| `core:path:allow-resolve-directory` | Enables the `resolve_directory` command without any pre-configured scope. |
| `core:path:deny-resolve-directory` | Denies the `resolve_directory` command without any pre-configured scope. |

## [Resources](#resources)

### [Default Permission](#default-permission-5)

The default permission, `core:resources:default`, includes the following:

* `allow-close`

### [Permission Table](#permission-table-5)

| Identifier | Description |
| --- | --- |
| `core:resources:allow-close` | Enables the `close` command without any pre-configured scope. |
| `core:resources:deny-close` | Denies the `close` command without any pre-configured scope. |

## [Tray](#tray)

### [Default Permission](#default-permission-6)

The default permission, `core:tray:default`, includes the following:

* `allow-new`
* `allow-get-by-id`
* `allow-remove-by-id`
* `allow-set-icon`
* `allow-set-menu`
* `allow-set-tooltip`
* `allow-set-title`
* `allow-set-visible`
* `allow-set-temp-dir-path`
* `allow-set-icon-as-template`
* `allow-set-show-menu-on-left-click`

### [Permission Table](#permission-table-6)

| Identifier | Description |
| --- | --- |
| `core:tray:allow-get-by-id` | Enables the `get_by_id` command without any pre-configured scope. |
| `core:tray:deny-get-by-id` | Denies the `get_by_id` command without any pre-configured scope. |
| `core:tray:allow-new` | Enables the `new` command without any pre-configured scope. |
| `core:tray:deny-new` | Denies the `new` command without any pre-configured scope. |
| `core:tray:allow-remove-by-id` | Enables the `remove_by_id` command without any pre-configured scope. |
| `core:tray:deny-remove-by-id` | Denies the `remove_by_id` command without any pre-configured scope. |
| `core:tray:allow-set-icon` | Enables the `set_icon` command without any pre-configured scope. |
| `core:tray:deny-set-icon` | Denies the `set_icon` command without any pre-configured scope. |
| `core:tray:allow-set-icon-as-template` | Enables the `set_icon_as_template` command without any pre-configured scope. |
| `core:tray:deny-set-icon-as-template` | Denies the `set_icon_as_template` command without any pre-configured scope. |
| `core:tray:allow-set-menu` | Enables the `set_menu` command without any pre-configured scope. |
| `core:tray:deny-set-menu` | Denies the `set_menu` command without any pre-configured scope. |
| `core:tray:allow-set-show-menu-on-left-click` | Enables the `set_show_menu_on_left_click` command without any pre-configured scope. |
| `core:tray:deny-set-show-menu-on-left-click` | Denies the `set_show_menu_on_left_click` command without any pre-configured scope. |
| `core:tray:allow-set-temp-dir-path` | Enables the `set_temp_dir_path` command without any pre-configured scope. |
| `core:tray:deny-set-temp-dir-path` | Denies the `set_temp_dir_path` command without any pre-configured scope. |
| `core:tray:allow-set-title` | Enables the `set_title` command without any pre-configured scope. |
| `core:tray:deny-set-title` | Denies the `set_title` command without any pre-configured scope. |
| `core:tray:allow-set-tooltip` | Enables the `set_tooltip` command without any pre-configured scope. |
| `core:tray:deny-set-tooltip` | Denies the `set_tooltip` command without any pre-configured scope. |
| `core:tray:allow-set-visible` | Enables the `set_visible` command without any pre-configured scope. |
| `core:tray:deny-set-visible` | Denies the `set_visible` command without any pre-configured scope. |

## [Webview](#webview)

### [Default Permission](#default-permission-7)

The default permission, `core:webview:default`, includes the following:

* `allow-get-all-webviews`
* `allow-webview-position`
* `allow-webview-size`
* `allow-internal-toggle-devtools`

### [Permission Table](#permission-table-7)

| Identifier | Description |
| --- | --- |
| `core:webview:allow-clear-all-browsing-data` | Enables the `clear_all_browsing_data` command without any pre-configured scope. |
| `core:webview:deny-clear-all-browsing-data` | Denies the `clear_all_browsing_data` command without any pre-configured scope. |
| `core:webview:allow-create-webview` | Enables the `create_webview` command without any pre-configured scope. |
| `core:webview:deny-create-webview` | Denies the `create_webview` command without any pre-configured scope. |
| `core:webview:allow-create-webview-window` | Enables the `create_webview_window` command without any pre-configured scope. |
| `core:webview:deny-create-webview-window` | Denies the `create_webview_window` command without any pre-configured scope. |
| `core:webview:allow-get-all-webviews` | Enables the `get_all_webviews` command without any pre-configured scope. |
| `core:webview:deny-get-all-webviews` | Denies the `get_all_webviews` command without any pre-configured scope. |
| `core:webview:allow-internal-toggle-devtools` | Enables the `internal_toggle_devtools` command without any pre-configured scope. |
| `core:webview:deny-internal-toggle-devtools` | Denies the `internal_toggle_devtools` command without any pre-configured scope. |
| `core:webview:allow-print` | Enables the `print` command without any pre-configured scope. |
| `core:webview:deny-print` | Denies the `print` command without any pre-configured scope. |
| `core:webview:allow-reparent` | Enables the `reparent` command without any pre-configured scope. |
| `core:webview:deny-reparent` | Denies the `reparent` command without any pre-configured scope. |
| `core:webview:allow-set-webview-focus` | Enables the `set_webview_focus` command without any pre-configured scope. |
| `core:webview:deny-set-webview-focus` | Denies the `set_webview_focus` command without any pre-configured scope. |
| `core:webview:allow-set-webview-position` | Enables the `set_webview_position` command without any pre-configured scope. |
| `core:webview:deny-set-webview-position` | Denies the `set_webview_position` command without any pre-configured scope. |
| `core:webview:allow-set-webview-size` | Enables the `set_webview_size` command without any pre-configured scope. |
| `core:webview:deny-set-webview-size` | Denies the `set_webview_size` command without any pre-configured scope. |
| `core:webview:allow-set-webview-zoom` | Enables the `set_webview_zoom` command without any pre-configured scope. |
| `core:webview:deny-set-webview-zoom` | Denies the `set_webview_zoom` command without any pre-configured scope. |
| `core:webview:allow-webview-close` | Enables the `webview_close` command without any pre-configured scope. |
| `core:webview:deny-webview-close` | Denies the `webview_close` command without any pre-configured scope. |
| `core:webview:allow-webview-hide` | Enables the `webview_hide` command without any pre-configured scope. |
| `core:webview:deny-webview-hide` | Denies the `webview_hide` command without any pre-configured scope. |
| `core:webview:allow-webview-position` | Enables the `webview_position` command without any pre-configured scope. |
| `core:webview:deny-webview-position` | Denies the `webview_position` command without any pre-configured scope. |
| `core:webview:allow-webview-show` | Enables the `webview_show` command without any pre-configured scope. |
| `core:webview:deny-webview-show` | Denies the `webview_show` command without any pre-configured scope. |
| `core:webview:allow-webview-size` | Enables the `webview_size` command without any pre-configured scope. |
| `core:webview:deny-webview-size` | Denies the `webview_size` command without any pre-configured scope. |

## [Window](#window)

### [Default Permission](#default-permission-8)

The default permission, `core:window:default`, includes the following:

* `allow-get-all-windows`
* `allow-scale-factor`
* `allow-inner-position`
* `allow-outer-position`
* `allow-inner-size`
* `allow-outer-size`
* `allow-is-fullscreen`
* `allow-is-minimized`
* `allow-is-maximized`
* `allow-is-focused`
* `allow-is-decorated`
* `allow-is-resizable`
* `allow-is-maximizable`
* `allow-is-minimizable`
* `allow-is-closable`
* `allow-is-visible`
* `allow-is-enabled`
* `allow-title`
* `allow-current-monitor`
* `allow-primary-monitor`
* `allow-monitor-from-point`
* `allow-available-monitors`
* `allow-cursor-position`
* `allow-theme`
* `allow-internal-toggle-maximize`

### [Permission Table](#permission-table-8)

| Identifier | Description |
| --- | --- |
| `core:window:allow-available-monitors` | Enables the `available_monitors` command without any pre-configured scope. |
| `core:window:deny-available-monitors` | Denies the `available_monitors` command without any pre-configured scope. |
| `core:window:allow-center` | Enables the `center` command without any pre-configured scope. |
| `core:window:deny-center` | Denies the `center` command without any pre-configured scope. |
| `core:window:allow-close` | Enables the `close` command without any pre-configured scope. |
| `core:window:deny-close` | Denies the `close` command without any pre-configured scope. |
| `core:window:allow-create` | Enables the `create` command without any pre-configured scope. |
| `core:window:deny-create` | Denies the `create` command without any pre-configured scope. |
| `core:window:allow-current-monitor` | Enables the `current_monitor` command without any pre-configured scope. |
| `core:window:deny-current-monitor` | Denies the `current_monitor` command without any pre-configured scope. |
| `core:window:allow-cursor-position` | Enables the `cursor_position` command without any pre-configured scope. |
| `core:window:deny-cursor-position` | Denies the `cursor_position` command without any pre-configured scope. |
| `core:window:allow-destroy` | Enables the `destroy` command without any pre-configured scope. |
| `core:window:deny-destroy` | Denies the `destroy` command without any pre-configured scope. |
| `core:window:allow-get-all-windows` | Enables the `get_all_windows` command without any pre-configured scope. |
| `core:window:deny-get-all-windows` | Denies the `get_all_windows` command without any pre-configured scope. |
| `core:window:allow-hide` | Enables the `hide` command without any pre-configured scope. |
| `core:window:deny-hide` | Denies the `hide` command without any pre-configured scope. |
| `core:window:allow-inner-position` | Enables the `inner_position` command without any pre-configured scope. |
| `core:window:deny-inner-position` | Denies the `inner_position` command without any pre-configured scope. |
| `core:window:allow-inner-size` | Enables the `inner_size` command without any pre-configured scope. |
| `core:window:deny-inner-size` | Denies the `inner_size` command without any pre-configured scope. |
| `core:window:allow-internal-toggle-maximize` | Enables the `internal_toggle_maximize` command without any pre-configured scope. |
| `core:window:deny-internal-toggle-maximize` | Denies the `internal_toggle_maximize` command without any pre-configured scope. |
| `core:window:allow-is-closable` | Enables the `is_closable` command without any pre-configured scope. |
| `core:window:deny-is-closable` | Denies the `is_closable` command without any pre-configured scope. |
| `core:window:allow-is-decorated` | Enables the `is_decorated` command without any pre-configured scope. |
| `core:window:deny-is-decorated` | Denies the `is_decorated` command without any pre-configured scope. |
| `core:window:allow-is-enabled` | Enables the `is_enabled` command without any pre-configured scope. |
| `core:window:deny-is-enabled` | Denies the `is_enabled` command without any pre-configured scope. |
| `core:window:allow-is-focused` | Enables the `is_focused` command without any pre-configured scope. |
| `core:window:deny-is-focused` | Denies the `is_focused` command without any pre-configured scope. |
| `core:window:allow-is-fullscreen` | Enables the `is_fullscreen` command without any pre-configured scope. |
| `core:window:deny-is-fullscreen` | Denies the `is_fullscreen` command without any pre-configured scope. |
| `core:window:allow-is-maximizable` | Enables the `is_maximizable` command without any pre-configured scope. |
| `core:window:deny-is-maximizable` | Denies the `is_maximizable` command without any pre-configured scope. |
| `core:window:allow-is-maximized` | Enables the `is_maximized` command without any pre-configured scope. |
| `core:window:deny-is-maximized` | Denies the `is_maximized` command without any pre-configured scope. |
| `core:window:allow-is-minimizable` | Enables the `is_minimizable` command without any pre-configured scope. |
| `core:window:deny-is-minimizable` | Denies the `is_minimizable` command without any pre-configured scope. |
| `core:window:allow-is-minimized` | Enables the `is_minimized` command without any pre-configured scope. |
| `core:window:deny-is-minimized` | Denies the `is_minimized` command without any pre-configured scope. |
| `core:window:allow-is-resizable` | Enables the `is_resizable` command without any pre-configured scope. |
| `core:window:deny-is-resizable` | Denies the `is_resizable` command without any pre-configured scope. |
| `core:window:allow-is-visible` | Enables the `is_visible` command without any pre-configured scope. |
| `core:window:deny-is-visible` | Denies the `is_visible` command without any pre-configured scope. |
| `core:window:allow-maximize` | Enables the `maximize` command without any pre-configured scope. |
| `core:window:deny-maximize` | Denies the `maximize` command without any pre-configured scope. |
| `core:window:allow-minimize` | Enables the `minimize` command without any pre-configured scope. |
| `core:window:deny-minimize` | Denies the `minimize` command without any pre-configured scope. |
| `core:window:allow-monitor-from-point` | Enables the `monitor_from_point` command without any pre-configured scope. |
| `core:window:deny-monitor-from-point` | Denies the `monitor_from_point` command without any pre-configured scope. |
| `core:window:allow-outer-position` | Enables the `outer_position` command without any pre-configured scope. |
| `core:window:deny-outer-position` | Denies the `outer_position` command without any pre-configured scope. |
| `core:window:allow-outer-size` | Enables the `outer_size` command without any pre-configured scope. |
| `core:window:deny-outer-size` | Denies the `outer_size` command without any pre-configured scope. |
| `core:window:allow-primary-monitor` | Enables the `primary_monitor` command without any pre-configured scope. |
| `core:window:deny-primary-monitor` | Denies the `primary_monitor` command without any pre-configured scope. |
| `core:window:allow-request-user-attention` | Enables the `request_user_attention` command without any pre-configured scope. |
| `core:window:deny-request-user-attention` | Denies the `request_user_attention` command without any pre-configured scope. |
| `core:window:allow-scale-factor` | Enables the `scale_factor` command without any pre-configured scope. |
| `core:window:deny-scale-factor` | Denies the `scale_factor` command without any pre-configured scope. |
| `core:window:allow-set-always-on-bottom` | Enables the `set_always_on_bottom` command without any pre-configured scope. |
| `core:window:deny-set-always-on-bottom` | Denies the `set_always_on_bottom` command without any pre-configured scope. |
| `core:window:allow-set-always-on-top` | Enables the `set_always_on_top` command without any pre-configured scope. |
| `core:window:deny-set-always-on-top` | Denies the `set_always_on_top` command without any pre-configured scope. |
| `core:window:allow-set-closable` | Enables the `set_closable` command without any pre-configured scope. |
| `core:window:deny-set-closable` | Denies the `set_closable` command without any pre-configured scope. |
| `core:window:allow-set-content-protected` | Enables the `set_content_protected` command without any pre-configured scope. |
| `core:window:deny-set-content-protected` | Denies the `set_content_protected` command without any pre-configured scope. |
| `core:window:allow-set-cursor-grab` | Enables the `set_cursor_grab` command without any pre-configured scope. |
| `core:window:deny-set-cursor-grab` | Denies the `set_cursor_grab` command without any pre-configured scope. |
| `core:window:allow-set-cursor-icon` | Enables the `set_cursor_icon` command without any pre-configured scope. |
| `core:window:deny-set-cursor-icon` | Denies the `set_cursor_icon` command without any pre-configured scope. |
| `core:window:allow-set-cursor-position` | Enables the `set_cursor_position` command without any pre-configured scope. |
| `core:window:deny-set-cursor-position` | Denies the `set_cursor_position` command without any pre-configured scope. |
| `core:window:allow-set-cursor-visible` | Enables the `set_cursor_visible` command without any pre-configured scope. |
| `core:window:deny-set-cursor-visible` | Denies the `set_cursor_visible` command without any pre-configured scope. |
| `core:window:allow-set-decorations` | Enables the `set_decorations` command without any pre-configured scope. |
| `core:window:deny-set-decorations` | Denies the `set_decorations` command without any pre-configured scope. |
| `core:window:allow-set-effects` | Enables the `set_effects` command without any pre-configured scope. |
| `core:window:deny-set-effects` | Denies the `set_effects` command without any pre-configured scope. |
| `core:window:allow-set-enabled` | Enables the `set_enabled` command without any pre-configured scope. |
| `core:window:deny-set-enabled` | Denies the `set_enabled` command without any pre-configured scope. |
| `core:window:allow-set-focus` | Enables the `set_focus` command without any pre-configured scope. |
| `core:window:deny-set-focus` | Denies the `set_focus` command without any pre-configured scope. |
| `core:window:allow-set-fullscreen` | Enables the `set_fullscreen` command without any pre-configured scope. |
| `core:window:deny-set-fullscreen` | Denies the `set_fullscreen` command without any pre-configured scope. |
| `core:window:allow-set-icon` | Enables the `set_icon` command without any pre-configured scope. |
| `core:window:deny-set-icon` | Denies the `set_icon` command without any pre-configured scope. |
| `core:window:allow-set-ignore-cursor-events` | Enables the `set_ignore_cursor_events` command without any pre-configured scope. |
| `core:window:deny-set-ignore-cursor-events` | Denies the `set_ignore_cursor_events` command without any pre-configured scope. |
| `core:window:allow-set-max-size` | Enables the `set_max_size` command without any pre-configured scope. |
| `core:window:deny-set-max-size` | Denies the `set_max_size` command without any pre-configured scope. |
| `core:window:allow-set-maximizable` | Enables the `set_maximizable` command without any pre-configured scope. |
| `core:window:deny-set-maximizable` | Denies the `set_maximizable` command without any pre-configured scope. |
| `core:window:allow-set-min-size` | Enables the `set_min_size` command without any pre-configured scope. |
| `core:window:deny-set-min-size` | Denies the `set_min_size` command without any pre-configured scope. |
| `core:window:allow-set-minimizable` | Enables the `set_minimizable` command without any pre-configured scope. |
| `core:window:deny-set-minimizable` | Denies the `set_minimizable` command without any pre-configured scope. |
| `core:window:allow-set-position` | Enables the `set_position` command without any pre-configured scope. |
| `core:window:deny-set-position` | Denies the `set_position` command without any pre-configured scope. |
| `core:window:allow-set-progress-bar` | Enables the `set_progress_bar` command without any pre-configured scope. |
| `core:window:deny-set-progress-bar` | Denies the `set_progress_bar` command without any pre-configured scope. |
| `core:window:allow-set-resizable` | Enables the `set_resizable` command without any pre-configured scope. |
| `core:window:deny-set-resizable` | Denies the `set_resizable` command without any pre-configured scope. |
| `core:window:allow-set-shadow` | Enables the `set_shadow` command without any pre-configured scope. |
| `core:window:deny-set-shadow` | Denies the `set_shadow` command without any pre-configured scope. |
| `core:window:allow-set-size` | Enables the `set_size` command without any pre-configured scope. |
| `core:window:deny-set-size` | Denies the `set_size` command without any pre-configured scope. |
| `core:window:allow-set-size-constraints` | Enables the `set_size_constraints` command without any pre-configured scope. |
| `core:window:deny-set-size-constraints` | Denies the `set_size_constraints` command without any pre-configured scope. |
| `core:window:allow-set-skip-taskbar` | Enables the `set_skip_taskbar` command without any pre-configured scope. |
| `core:window:deny-set-skip-taskbar` | Denies the `set_skip_taskbar` command without any pre-configured scope. |
| `core:window:allow-set-theme` | Enables the `set_theme` command without any pre-configured scope. |
| `core:window:deny-set-theme` | Denies the `set_theme` command without any pre-configured scope. |
| `core:window:allow-set-title` | Enables the `set_title` command without any pre-configured scope. |
| `core:window:deny-set-title` | Denies the `set_title` command without any pre-configured scope. |
| `core:window:allow-set-title-bar-style` | Enables the `set_title_bar_style` command without any pre-configured scope. |
| `core:window:deny-set-title-bar-style` | Denies the `set_title_bar_style` command without any pre-configured scope. |
| `core:window:allow-set-visible-on-all-workspaces` | Enables the `set_visible_on_all_workspaces` command without any pre-configured scope. |
| `core:window:deny-set-visible-on-all-workspaces` | Denies the `set_visible_on_all_workspaces` command without any pre-configured scope. |
| `core:window:allow-show` | Enables the `show` command without any pre-configured scope. |
| `core:window:deny-show` | Denies the `show` command without any pre-configured scope. |
| `core:window:allow-start-dragging` | Enables the `start_dragging` command without any pre-configured scope. |
| `core:window:deny-start-dragging` | Denies the `start_dragging` command without any pre-configured scope. |
| `core:window:allow-start-resize-dragging` | Enables the `start_resize_dragging` command without any pre-configured scope. |
| `core:window:deny-start-resize-dragging` | Denies the `start_resize_dragging` command without any pre-configured scope. |
| `core:window:allow-theme` | Enables the `theme` command without any pre-configured scope. |
| `core:window:deny-theme` | Denies the `theme` command without any pre-configured scope. |
| `core:window:allow-title` | Enables the `title` command without any pre-configured scope. |
| `core:window:deny-title` | Denies the `title` command without any pre-configured scope. |
| `core:window:allow-toggle-maximize` | Enables the `toggle_maximize` command without any pre-configured scope. |
| `core:window:deny-toggle-maximize` | Denies the `toggle_maximize` command without any pre-configured scope. |
| `core:window:allow-unmaximize` | Enables the `unmaximize` command without any pre-configured scope. |
| `core:window:deny-unmaximize` | Denies the `unmaximize` command without any pre-configured scope. |
| `core:window:allow-unminimize` | Enables the `unminimize` command without any pre-configured scope. |
| `core:window:deny-unminimize` | Denies the `unminimize` command without any pre-configured scope. |

[Edit page](https://github.com/tauri-apps/tauri-docs/edit/v2/src/content/docs/reference/acl/core-permissions.mdx)

Last updated: Feb 22, 2025

[Previous   
 Scope](scope.md)   [Next   
 Command Line Interface](..\cli.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT