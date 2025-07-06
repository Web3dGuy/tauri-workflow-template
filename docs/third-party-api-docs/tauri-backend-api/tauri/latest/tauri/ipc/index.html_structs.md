# Module ipcCopy item path

[Settings](../../settings.html)

[Help](../../help.html)

Summary[Source](../../src/tauri/ipc/mod.rs.html#5-574)

Expand description

Types and functions related to Inter Procedure Call(IPC).

This module includes utilities to send messages to the JS layer of the webview.

## Structs[§](#structs)

[CallbackFn](struct.CallbackFn.html.md "struct tauri::ipc::CallbackFn")
:   The `Callback` type is the return value of the `transformCallback` JavaScript function.

[CapabilityBuilder](struct.CapabilityBuilder.html.md "struct tauri::ipc::CapabilityBuilder")
:   A builder for a [`Capability`](https://docs.rs/tauri-utils/2.3.1/x86_64-unknown-linux-gnu/tauri_utils/acl/capability/struct.Capability.html "struct tauri_utils::acl::capability::Capability").

[Channel](struct.Channel.html.md "struct tauri::ipc::Channel")
:   An IPC channel.

[CommandItem](struct.CommandItem.html.md "struct tauri::ipc::CommandItem")
:   Represents a custom command.

[CommandScope](struct.CommandScope.html.md "struct tauri::ipc::CommandScope")
:   Access scope for a command that can be retrieved directly in the command function.

[GlobalScope](struct.GlobalScope.html.md "struct tauri::ipc::GlobalScope")
:   Global access scope that can be retrieved directly in the command function.

[Invoke](struct.Invoke.html.md "struct tauri::ipc::Invoke")
:   The message and resolver given to a custom command.

[InvokeError](struct.InvokeError.html.md "struct tauri::ipc::InvokeError")
:   Error response from an [`InvokeMessage`](struct.InvokeMessage.html.md "struct tauri::ipc::InvokeMessage").

[InvokeMessage](struct.InvokeMessage.html.md "struct tauri::ipc::InvokeMessage")
:   An invoke message.

[InvokeResolver](struct.InvokeResolver.html.md "struct tauri::ipc::InvokeResolver")
:   Resolver of a invoke message.

[JavaScriptChannelId](struct.JavaScriptChannelId.html.md "struct tauri::ipc::JavaScriptChannelId")
:   The ID of a channel that was defined on the JavaScript layer.

[Request](struct.Request.html.md "struct tauri::ipc::Request")
:   The IPC request.

[Response](struct.Response.html.md "struct tauri::ipc::Response")
:   The IPC response.

[RuntimeAuthority](struct.RuntimeAuthority.html.md "struct tauri::ipc::RuntimeAuthority")
:   The runtime authority used to authorize IPC execution based on the Access Control List.

[ScopeValue](struct.ScopeValue.html.md "struct tauri::ipc::ScopeValue")
:   List of allowed and denied objects that match either the command-specific or plugin global scope criteria.

[SerializeOptions](struct.SerializeOptions.html.md "struct tauri::ipc::SerializeOptions")
:   Optional settings to pass to the templating system.

## Enums[§](#enums)

[InvokeBody](enum.InvokeBody.html.md "enum tauri::ipc::InvokeBody")
:   Possible values of an IPC payload.

[InvokeResponse](enum.InvokeResponse.html.md "enum tauri::ipc::InvokeResponse")
:   Response from a [`InvokeMessage`](struct.InvokeMessage.html.md "struct tauri::ipc::InvokeMessage") passed to the [`InvokeResolver`](struct.InvokeResolver.html.md "struct tauri::ipc::InvokeResolver").

[InvokeResponseBody](enum.InvokeResponseBody.html.md "enum tauri::ipc::InvokeResponseBody")
:   Possible values of an IPC response.

[Origin](enum.Origin.html.md "enum tauri::ipc::Origin")
:   The origin trying to access the IPC.

## Traits[§](#traits)

[CommandArg](trait.CommandArg.html.md "trait tauri::ipc::CommandArg")
:   Trait implemented by command arguments to derive a value from a [`CommandItem`](struct.CommandItem.html.md "struct tauri::ipc::CommandItem").

[IpcResponse](trait.IpcResponse.html.md "trait tauri::ipc::IpcResponse")
:   Marks a type as a response to an IPC call.

[RuntimeCapability](trait.RuntimeCapability.html.md "trait tauri::ipc::RuntimeCapability")
:   A capability that can be added at runtime.

[ScopeObject](trait.ScopeObject.html.md "trait tauri::ipc::ScopeObject")
:   Marks a type as a scope object.

[ScopeObjectMatch](trait.ScopeObjectMatch.html.md "trait tauri::ipc::ScopeObjectMatch")
:   A [`ScopeObject`](trait.ScopeObject.html.md "trait tauri::ipc::ScopeObject") whose validation can be represented as a `bool`.

## Type Aliases[§](#types)

[InvokeHandler](type.InvokeHandler.html.md "type tauri::ipc::InvokeHandler")
:   A closure that is run every time Tauri receives a message it doesn’t explicitly handle.

[InvokeResponder](type.InvokeResponder.html.md "type tauri::ipc::InvokeResponder")
:   A closure that is responsible for respond a JS message.

[OwnedInvokeResponder](type.OwnedInvokeResponder.html.md "type tauri::ipc::OwnedInvokeResponder")
:   Similar to [`InvokeResponder`](type.InvokeResponder.html.md "type tauri::ipc::InvokeResponder") but taking owned arguments.