# Callout

**Callouts** visually highlight important content for the user. They may contain
a title, an icon and content. Each intent has a default icon associated with it.

## Import

```
import { Callout } from "@blueprintjs/core";  

```

## Usage

A **Callout** highlights important content with an optional title and body text.

##### Callout Title

This is some descriptive content.

```
<Callout title="Callout Title">This is some descriptive content.</Callout>  

```

## Intent

The `intent` prop sets the visual style of the **Callout**, reflecting its purpose or severity. Each intent applies a unique color and includes a default icon.

This is a primary Callout

This is a success Callout

This is a warning Callout

This is a danger Callout

```
<Callout intent="primary">This is a primary Callout</Callout>  
<Callout intent="success">This is a success Callout</Callout>  
<Callout intent="warning">This is a warning Callout</Callout>  
<Callout intent="danger">This is a danger Callout</Callout>  

```

## Icon

The `icon` prop allows customization of the **Callout** icon. Provide a custom
icon, or disable it by setting `icon={false}`.

This is a Callout with a custom icon.

This is a Callout with no icon.

```
<Callout icon="clean" intent="primary">  
    This is a Callout with a custom icon.  
</Callout>  
<Callout icon={false} intent="primary">  
    This is a Callout with no icon.  
</Callout>  

```

## Compact

Enable the `compact` prop to reduce the padding of the **Callout** for a more condensed appearance.

This is a Callout with default padding.

This Callout is more compact.

```
<Callout>This is a Callout with default padding.</Callout>  
<Callout compact={true}>This Callout is more compact.</Callout>  

```

## Interactive Playground

##### Title

Long-form information about the important content. This text is styled as ["Running text"](#core/typography.running-text), so it may contain things like headers, links, lists, `code` etc.

##### Props

TitleCompactMinimal

Intent 

NonePrimarySuccessWarningDangerOpen dropdown

Icon

None

##### Children

Example content

Text with formattingSimple text stringButtonEmptyOpen dropdown

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/calloutPlaygroundExample.tsx)

## Props interface

interface CalloutProps extends [IntentProps](#api/IntentProps), [Props](#api/Props)<>, [HTMLDivProps](#api/HTMLDivProps)<>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/callout/callout.tsx#L36)

This component also supports the full range of HTML `<div>` attributes.

| Props | Description |
| --- | --- |
| `children` | `ReactNode` Callout contents. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `compact` | `boolean` Whether to use a compact appearance, which reduces the visual padding around callout content. |
| `icon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon (or an icon element) to render on the left side.  If this prop is omitted or `undefined`, the `intent` prop will determine a default icon. If this prop is explicitly `null`, no icon will be displayed (regardless of `intent`). |
| `intent` | `Intent` Visual intent color to apply to background, title, and icon.  Defining this prop also applies a default icon, if the `icon` prop is omitted. |
| `minimal` | `booleanfalse` Whether the callout should have a minimal appearance with no background color fill. |
| `title` | `string` String content of optional title element.  Due to a conflict with the HTML prop types, to provide JSX content simply pass `<H4>JSX title content</H4>` as first `children` element instead of using this prop (note uppercase tag name to use the Blueprint Heading component). |

## CSS API

##### Deprecated API: use [`<Callout>`](#core/components/callout)

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

Callouts use the same visual intent modifier classes as buttons. If you need a heading, use the `<h5>`
element with a `.bp5-heading` class.

##### Callout Heading

It's dangerous to go alone! Take [this](#).

`.bp5-intent-primary`

Primary intent

`.bp5-intent-success`

Success intent

`.bp5-intent-warning`

Warning intent

`.bp5-intent-danger`

Danger intent

`.bp5-icon-info-sign`

With an icon

```
<div class="bp5-callout {{.modifier}}">  
  <h5 class="bp5-heading">Callout Heading</h5>  
  It's dangerous to go alone! Take <a href="#">this</a>.  
</div>  

```