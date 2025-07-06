# Compound Tag

**Compound Tag** is a variant of [**Tag**](#core/components/tag) which renders textual information in
a pair (sometimes referred to as a "key-value pair"). The content on the left and right is visually
segmented to signify the pairwise relationship. Just like **Tag**, this component supports a range
of visual modifiers for many different situations and its colors are designed to be accessible in
almost any context.

CityLondonCityNew YorkCitySan FranciscoCitySeattle

##### Props

ActiveFillLargeMinimalInteractiveRemovableRoundStart iconEnd icon

Intent 

NonePrimarySuccessWarningDangerOpen dropdown

##### Example

Reset tags

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/compoundTagExample.tsx)

## Usage

The `<CompoundTag>` component is a stateless wrapper around its content with support for an optional
close button and icons on the left and/or right side. It supports all valid `<span>` DOM attributes.

Content for the left side of the tag is specified with the `leftContent` prop, while the `children` node(s)
are rendered on the right side.

## Props interface

interface CompoundTagProps extends TagSharedProps, RefAttributes<HTMLSpanElement>, HTMLAttributes<HTMLSpanElement>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/tag/compoundTag.tsx#L28)

| Props | Description |
| --- | --- |
| `active` | `booleanfalse` Whether the tag should appear in an active state.  Inherited from `TagSharedProps.active` |
| `children` | `ReactNode` Child nodes which will be rendered on the right side of the tag (e.g. the "value" in a key-value pair).  Required |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `TagSharedProps.className` |
| `endIcon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon (or an icon element) to render at the end of the tag, after the child node(s).  Inherited from `TagSharedProps.endIcon` |
| `fill` | `booleanfalse` Whether the tag should take up the full width of its container.  Inherited from `TagSharedProps.fill` |
| `icon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon (or an icon element) to render on the left side of the tag, before any content.  Inherited from `TagSharedProps.icon` |
| `intent` | `Intent` Visual intent color to apply to element.  Inherited from `TagSharedProps.intent` |
| `interactive` | `booleanfalse` Whether the tag should visually respond to user interactions. If set to `true`, hovering over the tag will change its color and mouse cursor.  Recommended when `onClick` is also defined.  Inherited from `TagSharedProps.interactive` |
| `large` | `booleanfalse` Whether this tag should use large styles.  DeprecatedInherited from `TagSharedProps.large` |
| `leftContent` | `ReactNode` Content to be rendered on the left side of the tag (e.g. the "key" in a key-value pair). This prop must be defined; if you have no content to show here, then use a `<Tag>` instead.  Required |
| `minimal` | `booleanfalse` Whether this tag should use minimal styles.  Inherited from `TagSharedProps.minimal` |
| `onClick` | `(e: MouseEvent<HTMLSpanElement, MouseEvent<>>) => void` Callback invoked when the tag is clicked. Recommended when `interactive` is `true`.  Inherited from `TagSharedProps.onClick` |
| `onRemove` | `(e: MouseEvent<HTMLButtonElement, MouseEvent<>>, tagProps: CompoundTagProps<>) => void` Click handler for remove button. The remove button will only be rendered if this prop is defined. |
| `rightIcon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon (or an icon element) to render on the right side of the tag, after the child node(s).  DeprecatedInherited from `TagSharedProps.rightIcon` |
| `round` | `booleanfalse` Whether this tag should have rounded ends.  Inherited from `TagSharedProps.round` |
| `size` | `NonSmallSize"medium"` The size of the tag.  Inherited from `TagSharedProps.size` |