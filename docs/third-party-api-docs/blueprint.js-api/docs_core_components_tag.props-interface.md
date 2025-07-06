# Tag

**Tag** is a lightweight visual container for short strings of text. This flexible component may be used to label an
entity, display a list of selected items, and much more. **Tag** supports a range of visual modifiers for many
different situations; its colors are designed to be accessible in almost any context.

LondonNew YorkSan FranciscoSeattle

##### Props

ActiveFillLargeMinimalInteractiveRemovableRoundStart iconEnd icon

Intent 

NonePrimarySuccessWarningDangerOpen dropdown

##### Example

Reset tags

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/tagExample.tsx)

## Usage

The `<Tag>` component is a stateless wrapper around its children with support for an optional close button.
It supports all valid `<span>` DOM attributes.

## Props interface

interface TagProps extends [Props](#api/Props), [IntentProps](#api/IntentProps)<>, TagSharedProps<>, RefAttributes<HTMLSpanElement>, HTMLAttributes<HTMLSpanElement>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/tag/tag.tsx#L39)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `active` | `booleanfalse` Whether the tag should appear in an active state.  Inherited from `TagSharedProps.active` |
| `children` | `ReactNode` Child nodes which will be rendered inside a `<Text>` element. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `endIcon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon (or an icon element) to render at the end of the tag, after the child node(s).  Inherited from `TagSharedProps.endIcon` |
| `fill` | `booleanfalse` Whether the tag should take up the full width of its container.  Inherited from `TagSharedProps.fill` |
| `htmlTitle` | `string` HTML title to be passed to the  component |
| `icon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon (or an icon element) to render on the left side of the tag, before the child nodes. |
| `intent` | `Intent` Visual intent color to apply to element.  Inherited from `IntentProps.intent` |
| `interactive` | `booleanfalse` Whether the tag should visually respond to user interactions. If set to `true`, hovering over the tag will change its color and mouse cursor.  Tags will be marked as interactive automatically if an onClick handler is provided and this prop is not. |
| `large` | `booleanfalse` Whether this tag should use large styles.  DeprecatedInherited from `TagSharedProps.large` |
| `minimal` | `booleanfalse` Whether this tag should use minimal styles.  Inherited from `TagSharedProps.minimal` |
| `multiline` | `booleanfalse` Whether tag content should be allowed to occupy multiple lines. If `false`, a single line of text will be truncated with an ellipsis if it overflows. Note that icons will be vertically centered relative to multiline text. |
| `onClick` | `(e: MouseEvent<HTMLSpanElement, MouseEvent<>>) => void` Callback invoked when the tag is clicked. Recommended when `interactive` is `true`.  Inherited from `TagSharedProps.onClick` |
| `onRemove` | `(e: MouseEvent<HTMLButtonElement, MouseEvent<>>, tagProps: TagProps<>) => void` Click handler for remove button. The remove button will only be rendered if this prop is defined. |
| `rightIcon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon (or an icon element) to render on the right side of the tag, after the child node(s).  DeprecatedInherited from `TagSharedProps.rightIcon` |
| `round` | `booleanfalse` Whether this tag should have rounded ends.  Inherited from `TagSharedProps.round` |
| `size` | `NonSmallSize"medium"` The size of the tag.  Inherited from `TagSharedProps.size` |

## CSS API

##### Deprecated API: use [`<Tag>`](#core/components/tag)

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

Create a tag with a `span.bp5-tag`. An optional "remove" button can be added with a `button.bp5-tag-remove` as the last
child.

125
Done

Tracking

Crushed

A rather long string of text that wraps to multiple lines
demonstrates the position of the remove button.

`.bp5-large`

Large

`.bp5-minimal`

Minimal appearance

`.bp5-round`

Rounded corners, ideal for badges

`.bp5-interactive`

Hover and active effects

`.bp5-intent-primary`

Primary intent

`.bp5-intent-success`

Success intent

`.bp5-intent-warning`

Warning intent

`.bp5-intent-danger`

Danger intent

```
<span class="bp5-tag {{.modifier}}">125</span>  
<span class="bp5-tag {{.modifier}}">Done</span>  
<span class="bp5-tag {{.modifier}}">  
  Tracking  
  <button class="bp5-tag-remove"></button>  
</span>  
<span class="bp5-tag {{.modifier}}">  
  Crushed  
  <button class="bp5-tag-remove"></button>  
</span>  
<span class="bp5-tag {{.modifier}}">  
  A rather long string of text that wraps to multiple lines  
  demonstrates the position of the remove button.  
  <button class="bp5-tag-remove"></button>  
</span>  

```