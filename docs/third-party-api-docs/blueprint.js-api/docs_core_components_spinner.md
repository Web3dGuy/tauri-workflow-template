# Spinner

**Spinners** indicate progress in a circular fashion. They're great for ongoing operations of indeterminate length and
can also represent known progress.

##### Props

Intent 

NonePrimarySuccessWarningDangerOpen dropdown

Size

0

50

100

150

200

50

Known value

0.0

1.0

0.7

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/spinnerExample.tsx)

## Usage

**Spinner** is a simple stateless component that renders SVG markup. It can be used safely in DOM and SVG containers as
it only renders SVG elements.

The `value` prop determines how much of the track is filled by the head. When this prop is defined, the spinner head
will smoothly animate as `value` changes. Omitting `value` will result in an "indeterminate" spinner where the head
spins indefinitely (this is the default appearance).

The `size` prop determines the pixel width/height of the spinner. Size constants are provided as an enum:`SpinnerSize.SMALL`, `SpinnerSize.STANDARD`, and `SpinnerSize.LARGE`

## Props interface

interface SpinnerProps extends [Props](#api/Props), [IntentProps](#api/IntentProps)<>, HTMLAttributes<T>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/spinner/spinner.tsx#L45)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `intent` | `Intent` Visual intent color to apply to element.  Inherited from `IntentProps.intent` |
| `size` | `numberSpinnerSize.STANDARD = 50` Width and height of the spinner in pixels. The size cannot be less than 10px. Constants are available for common sizes: - `SpinnerSize.SMALL = 20px` - `SpinnerSize.STANDARD = 50px` `SpinnerSize.LARGE = 100px` |
| `tagName` | `keyof IntrinsicElements"div"` HTML tag for the two wrapper elements. If rendering a `<Spinner>` inside an `<svg>`, change this to an SVG element like `"g"`. |
| `value` | `number` A value between 0 and 1 (inclusive) representing how far along the operation is. Values below 0 or above 1 will be interpreted as 0 or 1 respectively. Omitting this prop will result in an "indeterminate" spinner where the head spins indefinitely. |