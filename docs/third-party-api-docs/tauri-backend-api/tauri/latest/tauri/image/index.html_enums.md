# Module imageCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/image/mod.rs.html#5-205)

Expand description

Image types used by this crate and also referenced by the JavaScript API layer.

## Structs[§](#structs)

[Image](struct.Image.html.md "struct tauri::image::Image")
:   An RGBA Image in row-major order from top to bottom.

## Enums[§](#enums)

[JsImage](enum.JsImage.html.md "enum tauri::image::JsImage")
:   An image type that accepts file paths, raw bytes, previously loaded images and image objects.
    This type is meant to be used along the [transformImage](https://v2.tauri.app/reference/javascript/api/namespaceimage/#transformimage) API.