# Macro include\_imageCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](https://docs.rs/tauri-macros/2.1.1/x86_64-unknown-linux-gnu/src/tauri_macros/lib.rs.html#189)

```
include_image!() { /* proc-macro */ }
```

Expand description

Convert a .png or .ico icon to an Image
for things like `tauri::tray::TrayIconBuilder` to consume,
relative paths are resolved from `CARGO_MANIFEST_DIR`, not current file

#### [§](#examples)Examples

[ⓘ](# "This example is not tested")

```
const APP_ICON: Image<'_> = include_image!("./icons/32x32.png");

// then use it with tray
TrayIconBuilder::new().icon(APP_ICON).build().unwrap();

// or with window
WebviewWindowBuilder::new(app, "main", WebviewUrl::default())
    .icon(APP_ICON)
    .unwrap()
    .build()
    .unwrap();

// or with any other functions that takes `Image` struct
```

Note: this stores the image in raw pixels to the final binary,
so keep the icon size (width and height) small
or else it’s going to bloat your final executable