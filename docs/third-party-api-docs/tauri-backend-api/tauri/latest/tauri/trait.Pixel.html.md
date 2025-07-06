# Trait PixelCopy item path

[Settings](../settings.html)

[Help](../help.html)

Summary[Source](https://docs.rs/dpi/0.1.1/x86_64-unknown-linux-gnu/src/dpi/lib.rs.html#73)

```
pub trait Pixel: Copy + Into<f64> {
    // Required method
    fn from_f64(f: f64) -> Self;

    // Provided method
    fn cast<P>(self) -> P
       where P: Pixel { ... }
}
```

## Required Methods[§](#required-methods)

[Source](https://docs.rs/dpi/0.1.1/x86_64-unknown-linux-gnu/src/dpi/lib.rs.html#74)

#### fn [from\_f64](#tymethod.from_f64)(f: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> Self

## Provided Methods[§](#provided-methods)

[Source](https://docs.rs/dpi/0.1.1/x86_64-unknown-linux-gnu/src/dpi/lib.rs.html#75)

#### fn [cast](#method.cast)<P>(self) -> P where P: [Pixel](trait.Pixel.html.md "trait tauri::Pixel"),

## Dyn Compatibility[§](#dyn-compatibility)

This trait is **not** [dyn compatible](https://doc.rust-lang.org/nightly/reference/items/traits.html#dyn-compatibility).

*In older versions of Rust, dyn compatibility was called "object safety", so this trait is not object safe.*

## Implementations on Foreign Types[§](#foreign-impls)

[Source](https://docs.rs/dpi/0.1.1/x86_64-unknown-linux-gnu/src/dpi/lib.rs.html#110)[§](#impl-Pixel-for-f32)

### impl [Pixel](trait.Pixel.html.md "trait tauri::Pixel") for [f32](https://doc.rust-lang.org/nightly/std/primitive.f32.html)

[Source](https://docs.rs/dpi/0.1.1/x86_64-unknown-linux-gnu/src/dpi/lib.rs.html#111)[§](#method.from_f64)

#### fn [from\_f64](#tymethod.from_f64)(f: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> [f32](https://doc.rust-lang.org/nightly/std/primitive.f32.html)

[Source](https://docs.rs/dpi/0.1.1/x86_64-unknown-linux-gnu/src/dpi/lib.rs.html#115)[§](#impl-Pixel-for-f64)

### impl [Pixel](trait.Pixel.html.md "trait tauri::Pixel") for [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)

[Source](https://docs.rs/dpi/0.1.1/x86_64-unknown-linux-gnu/src/dpi/lib.rs.html#116)[§](#method.from_f64-1)

#### fn [from\_f64](#tymethod.from_f64)(f: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)

[Source](https://docs.rs/dpi/0.1.1/x86_64-unknown-linux-gnu/src/dpi/lib.rs.html#95)[§](#impl-Pixel-for-i8)

### impl [Pixel](trait.Pixel.html.md "trait tauri::Pixel") for [i8](https://doc.rust-lang.org/nightly/std/primitive.i8.html)

[Source](https://docs.rs/dpi/0.1.1/x86_64-unknown-linux-gnu/src/dpi/lib.rs.html#96)[§](#method.from_f64-2)

#### fn [from\_f64](#tymethod.from_f64)(f: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> [i8](https://doc.rust-lang.org/nightly/std/primitive.i8.html)

[Source](https://docs.rs/dpi/0.1.1/x86_64-unknown-linux-gnu/src/dpi/lib.rs.html#100)[§](#impl-Pixel-for-i16)

### impl [Pixel](trait.Pixel.html.md "trait tauri::Pixel") for [i16](https://doc.rust-lang.org/nightly/std/primitive.i16.html)

[Source](https://docs.rs/dpi/0.1.1/x86_64-unknown-linux-gnu/src/dpi/lib.rs.html#101)[§](#method.from_f64-3)

#### fn [from\_f64](#tymethod.from_f64)(f: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> [i16](https://doc.rust-lang.org/nightly/std/primitive.i16.html)

[Source](https://docs.rs/dpi/0.1.1/x86_64-unknown-linux-gnu/src/dpi/lib.rs.html#105)[§](#impl-Pixel-for-i32)

### impl [Pixel](trait.Pixel.html.md "trait tauri::Pixel") for [i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html)

[Source](https://docs.rs/dpi/0.1.1/x86_64-unknown-linux-gnu/src/dpi/lib.rs.html#106)[§](#method.from_f64-4)

#### fn [from\_f64](#tymethod.from_f64)(f: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> [i32](https://doc.rust-lang.org/nightly/std/primitive.i32.html)

[Source](https://docs.rs/dpi/0.1.1/x86_64-unknown-linux-gnu/src/dpi/lib.rs.html#80)[§](#impl-Pixel-for-u8)

### impl [Pixel](trait.Pixel.html.md "trait tauri::Pixel") for [u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)

[Source](https://docs.rs/dpi/0.1.1/x86_64-unknown-linux-gnu/src/dpi/lib.rs.html#81)[§](#method.from_f64-5)

#### fn [from\_f64](#tymethod.from_f64)(f: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> [u8](https://doc.rust-lang.org/nightly/std/primitive.u8.html)

[Source](https://docs.rs/dpi/0.1.1/x86_64-unknown-linux-gnu/src/dpi/lib.rs.html#85)[§](#impl-Pixel-for-u16)

### impl [Pixel](trait.Pixel.html.md "trait tauri::Pixel") for [u16](https://doc.rust-lang.org/nightly/std/primitive.u16.html)

[Source](https://docs.rs/dpi/0.1.1/x86_64-unknown-linux-gnu/src/dpi/lib.rs.html#86)[§](#method.from_f64-6)

#### fn [from\_f64](#tymethod.from_f64)(f: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> [u16](https://doc.rust-lang.org/nightly/std/primitive.u16.html)

[Source](https://docs.rs/dpi/0.1.1/x86_64-unknown-linux-gnu/src/dpi/lib.rs.html#90)[§](#impl-Pixel-for-u32)

### impl [Pixel](trait.Pixel.html.md "trait tauri::Pixel") for [u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html)

[Source](https://docs.rs/dpi/0.1.1/x86_64-unknown-linux-gnu/src/dpi/lib.rs.html#91)[§](#method.from_f64-7)

#### fn [from\_f64](#tymethod.from_f64)(f: [f64](https://doc.rust-lang.org/nightly/std/primitive.f64.html)) -> [u32](https://doc.rust-lang.org/nightly/std/primitive.u32.html)

## Implementors[§](#implementors)