# Text

The **Text** component adds accessible overflow behavior to a line of text by conditionally adding the title attribute
and truncating with an ellipsis when content overflows its container.

You can change the text in the input below. Hover to see full text. If the text is long enough, then the content will overflow. This is done by setting ellipsize to true.

You can change the text in the input below. Hover to see full text. If the text is long enough, then the content will overflow. This is done by setting ellipsize to true.Text is used in MenuItems, and is performant at scale in long lists

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/textExample.tsx)

## Props interface

**Text** accepts and renders arbitrary children. It is intended that these children render as text.

interface TextProps extends [Props](#api/Props), RefAttributes<HTMLElement>, Omit<React.HTMLAttributes<HTMLElement>, "title">

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/text/text.tsx#L24)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `children` | `ReactNode` |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `ellipsize` | `booleanfalse` Indicates that this component should be truncated with an ellipsis if it overflows its container. The `title` attribute will also be added when content overflows to show the full text of the children on hover. |
| `tagName` | `keyof IntrinsicElements"div"` HTML tag name to use for rendered element. |
| `title` | `string` HTML title of the element |