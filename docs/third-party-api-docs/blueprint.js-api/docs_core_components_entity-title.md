# Entity Title

**EntityTitle** is a component that handles rendering a common UI pattern consisting of title, icon, subtitle and tag.

Buy groceries on my way home

##### Props

Heading 

DefaultH1H2H3H4H5H6Open dropdown

EllipsizeFillDisplay iconLoadingDisplay subtitleDisplay tag

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/entityTitleExample.tsx)

## Props interface

interface EntityTitleProps extends [Props](#api/Props)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/entity-title/entityTitle.tsx#L27)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `ellipsize` | `booleanfalse` Whether the overflowing text content should be ellipsized. |
| `fill` | `boolean` Whether the component should expand to fill its container. |
| `heading` | `FC<any>Text` React component to render the main title heading. This defaults to Blueprint's `<Text>` component, \* which inherits font size from its containing element(s).  To render larger, more prominent titles, Use Blueprint's heading components instead (e.g. `{ H1 } from "@blueprintjs/core"`). |
| `icon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon (or an icon element) to render in the section's header. Note that the header will only be rendered if `title` is provided. |
| `loading` | `booleanfalse` Whether to render as loading state. |
| `subtitle` | `string | Element` The content to render below the title. Defaults to render muted text. |
| `tags` | `ReactNode` components work best - if multiple, wrap in <React.Fragment> |
| `title` | `string | Element` The primary title to render.  Required |
| `titleURL` | `string` If specified, the title will be wrapped in an anchor with this URL. |