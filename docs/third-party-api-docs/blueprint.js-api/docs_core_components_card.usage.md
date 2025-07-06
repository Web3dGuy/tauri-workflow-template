# Card

A **Card** is a bounded container for grouping related content with a solid
background color. It offers customizable padding, interactivity, and elevation.

## Import

```
import { Card } from "@blueprintjs/core";  

```

## Usage

A **Card** provides a structured container for text, actions, or other content.
Use it to present a cohesive unit of information.

### Adventure Awaits

Embark on an epic journey across uncharted lands. This card outlines your mission.

Start Journey

```
<Card>  
    <H3>Adventure Awaits</H3>  
    <p>Embark on an epic journey across uncharted lands. This card outlines your mission.</p>  
    <Button intent="primary">Start Journey</Button>  
</Card>  

```

## Interactive

The `interactive` prop makes a **Card** appear responsive to hover and click events.
Combine it with an `onClick` handler to perform actions when the card is clicked,
such as navigation or selection.

Additionally, the `selected` prop can be used to indicate a selection state.

This card is interactive. Hover and click it.

This card is selected.

```
<Card interactive={true} onClick={...}>  
    This card is interactive. Hover and click it.  
</Card>  
<Card interactive={true} selected={true}>  
    This card is selected.  
</Card>  

```

## Compact

Enable the `compact` prop to reduce the padding of the **Card**, resulting in a more condensed appearance.

This card has default padding.

This card is more compact.

```
<Card>This card has default padding.</Card>  
<Card compact={true}>This card is more compact.</Card>  

```

## Elevation

The `elevation` prop controls the shadow depth of the **Card**, creating a visual
hierarchy. Five elevations are supported, from 0 to 4. Higher elevation values
make the **Card** appear more prominent.

> Note that the `Classes.ELEVATION_*` classes can be used on any element (not just a `Card`) to apply the box shadow.

0

1

2

3

4

```
<Card elevation={Elevation.ZERO}>0</Card>  
<Card elevation={Elevation.ONE}>1</Card>  
<Card elevation={Elevation.TWO}>2</Card>  
<Card elevation={Elevation.THREE}>3</Card>  
<Card elevation={Elevation.FOUR}>4</Card>  

```

## Interactive Playground

##### Analytical applications

User interfaces that enable people to interact smoothly with data, ask better questions, and make better decisions.

Explore products

##### Props

InteractiveSelectedCompact

Elevation 

0

1

2

3

4

0

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/cardPlaygroundExample.tsx)

## Props interface

interface CardProps extends [Props](#api/Props), [HTMLDivProps](#api/HTMLDivProps)<>, RefAttributes<HTMLDivElement>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/card/card.tsx#L23)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `compact` | `booleanfalse` Whether this component should use compact styles with reduced visual padding. |
| `elevation` | `Elevation0` Controls the intensity of the drop shadow beneath the card: the higher the elevation, the higher the drop shadow. At elevation `0`, no drop shadow is applied. |
| `interactive` | `booleanfalse` Whether the card should respond to user interactions. If set to `true`, hovering over the card will increase the card's elevation and change the mouse cursor to a pointer.  Recommended when `onClick` is also defined. |
| `onClick` | `(e: MouseEvent<HTMLDivElement, MouseEvent<>>) => void` Callback invoked when the card is clicked. Recommended when `interactive` is `true`. |
| `selected` | `booleanundefined` Whether this card should appear selected. |

## CSS API

##### Deprecated API: use [`<Card>`](#core/components/card)

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

Start with `.bp5-card` and add an elevation class `.bp5-elevation-*` to apply a drop shadow that simulates height in
the UI.

Add the `.bp5-interactive` modifier class to make a `.bp5-card` respond to user interactions. When you hover over cards
with this class applied, the mouse changes to a pointer and increases the elevation shadow on the card.

We build products that make people better at their most important work.

`.bp5-elevation-0`

Ground floor. This level provides just a gentle border shadow.

`.bp5-elevation-1`

First. Subtle drop shadow intended for static containers.

`.bp5-elevation-2`

Second. An even stronger shadow, moving on up.

`.bp5-elevation-3`

Third. For containers overlaying content temporarily.

`.bp5-elevation-4`

Fourth. The strongest shadow, usually for overlay containers on top of backdrops.

`.bp5-interactive`

On hover, increase elevation and use pointer cursor.

```
<div class="bp5-card {{.modifier}}">  
  We build products that make people better at their most important work.  
</div>  

```