# Trait RuntimeCapabilityCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/ipc/authority.rs.html#72-75)

```
pub trait RuntimeCapability {
    // Required method
    fn build(self) -> CapabilityFile;
}
```

Expand description

A capability that can be added at runtime.

## Required Methods[§](#required-methods)

[Source](../../src/tauri/ipc/authority.rs.html#74)

#### fn [build](#tymethod.build)(self) -> [CapabilityFile](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/acl/capability/enum.CapabilityFile.html "enum tauri_utils::acl::capability::CapabilityFile")

Creates the capability file.

## Implementors[§](#implementors)

[Source](../../src/tauri/ipc/authority.rs.html#223-227)[§](#impl-RuntimeCapability-for-CapabilityBuilder)

### impl [RuntimeCapability](trait.RuntimeCapability.html.md "trait tauri::ipc::RuntimeCapability") for [CapabilityBuilder](struct.CapabilityBuilder.html.md "struct tauri::ipc::CapabilityBuilder")

[Source](../../src/tauri/ipc/authority.rs.html#77-81)[§](#impl-RuntimeCapability-for-T)

### impl<T: [AsRef](https://doc.rust-lang.org/nightly/core/convert/trait.AsRef.html "trait core::convert::AsRef")<[str](https://doc.rust-lang.org/nightly/std/primitive.str.html)>> [RuntimeCapability](trait.RuntimeCapability.html.md "trait tauri::ipc::RuntimeCapability") for T