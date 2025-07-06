# Module webviewCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/webview/mod.rs.html#5-1924)

Expand description

The Tauri webview types and functions.

## Structs[§](#structs)

[Color](struct.Color.html.md "struct tauri::webview::Color")
:   A tuple struct of RGBA colors. Each value has minimum of 0 and maximum of 255.

[Cookie](struct.Cookie.html.md "struct tauri::webview::Cookie")
:   Representation of an HTTP cookie.

[InvokeRequest](struct.InvokeRequest.html.md "struct tauri::webview::InvokeRequest")
:   The IPC invoke request.

[PageLoadPayload](struct.PageLoadPayload.html.md "struct tauri::webview::PageLoadPayload")
:   The payload for the [`WebviewBuilder::on_page_load`](struct.WebviewBuilder.html_method.on_page_load.md "method tauri::webview::WebviewBuilder::on_page_load") hook.

[PlatformWebview](struct.PlatformWebview.html.md "struct tauri::webview::PlatformWebview")`wry`
:   The platform webview handle. Accessed with [`Webview`](struct.Webview.html_method.with_webview.md "struct tauri::webview::Webview");

[ResolvedScope](struct.ResolvedScope.html.md "struct tauri::webview::ResolvedScope")
:   Resolved scope that can be obtained via [`Webview::resolve_command_scope`](struct.Webview.html_method.resolve_command_scope.md "method tauri::webview::Webview::resolve_command_scope").

[Url](struct.Url.html.md "struct tauri::webview::Url")
:   A parsed URL record.

[Webview](struct.Webview.html.md "struct tauri::webview::Webview")
:   Webview.

[WebviewBuilder](struct.WebviewBuilder.html.md "struct tauri::webview::WebviewBuilder")`unstable`
:   A builder for a webview.

[WebviewWindow](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow")
:   A type that wraps a [`Window`](..\window\struct.Window.html.md "struct tauri::window::Window") together with a [`Webview`](struct.Webview.html.md "struct tauri::webview::Webview").

[WebviewWindowBuilder](struct.WebviewWindowBuilder.html.md "struct tauri::webview::WebviewWindowBuilder")
:   A builder for [`WebviewWindow`](struct.WebviewWindow.html.md "struct tauri::webview::WebviewWindow"), a window that hosts a single webview.

## Enums[§](#enums)

[DownloadEvent](enum.DownloadEvent.html.md "enum tauri::webview::DownloadEvent")
:   Download event for the [`WebviewBuilder`](struct.WebviewBuilder.html_method.on_download.md "struct tauri::webview::WebviewBuilder") hook.

[PageLoadEvent](enum.PageLoadEvent.html.md "enum tauri::webview::PageLoadEvent")
:   Kind of event for the page load handler.