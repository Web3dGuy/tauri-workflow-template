# Card List

**CardList** is a lightweight wrapper around the [**Card**](#core/components/card) component.
It groups cards visually into a list without adding extra visual weight or spacing between them.
Long lists can be styled with CSS for vertical scrolling.

## Import

```
import { CardList } from "@blueprintjs/core";  

```

## Usage

Use **CardList** to group multiple cards together in a vertical list.

Apples

Oranges

Bananas

```
<CardList>  
    <Card>Apples</Card>  
    <Card>Oranges</Card>  
    <Card>Bananas</Card>  
</CardList>  

```

## Bordered

To remove borders, set `bordered={false}`. This creates a seamless appearance
when nesting **CardList** within other components.

Bread

Cheese

Butter

Honey

Jam

Peanut Butter

```
<CardList bordered={true}>  
    <Card>Bread</Card>  
    <Card>Cheese</Card>  
    <Card>Butter</Card>  
</CardList>  
<CardList bordered={false}>  
    <Card>Honey</Card>  
    <Card>Jam</Card>  
    <Card>Peanut Butter</Card>  
</CardList>  

```

## Compact

Enable the `compact` prop to reduce the padding inside each card in the list.

Spaghetti

Lasagna

Ravioli

Penne

Fettuccine

Rigatoni

```
<CardList compact={false}>  
    <Card>Spaghetti</Card>  
    <Card>Lasagna</Card>  
    <Card>Ravioli</Card>  
</CardList>  
<CardList compact={true}>  
    <Card>Penne</Card>  
    <Card>Fettuccine</Card>  
    <Card>Rigatoni</Card>  
</CardList>  

```

## Combining with section

The **CardList** component can be embedded in a [**Section**](#core/components/section)
component to add a title or description above the list.

Set the same value for `<SectionCard padded>` and `<CardList bordered>`
(either `true` or `false` for both) to get two different kinds of appearances.

###### Fresh Ingredients

Tomatoes

Garlic

Olive Oil

Basil

Parmesan

Pine Nuts

```
<Section title="Fresh Ingredients">  
    <SectionCard padded={false}>  
        <CardList bordered={false}>  
            <Card>Tomatoes</Card>  
            <Card>Garlic</Card>  
            <Card>Olive Oil</Card>  
            <Card>Basil</Card>  
            <Card>Parmesan</Card>  
            <Card>Pine Nuts</Card>  
        </CardList>  
    </SectionCard>  
</Section>  

```

## Interactive Playground

Basil

Olive oil

Kosher salt

Garlic

Pine nuts

Parmigiano Reggiano

##### CardList Props

Bordered

Compact

##### Card Props

Interactive

##### Layout

Use `Section` container

##### SectionCard

Use paddingUse scrollable container

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/cardListPlaygroundExample.tsx)

## Props interface

interface CardListProps extends [Props](#api/Props), [HTMLDivProps](#api/HTMLDivProps)<>, RefAttributes<HTMLDivElement>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/card-list/cardList.tsx#L23)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `bordered` | `booleantrue` Whether this container element should have a visual border.  Set this to `false` to remove elevation and border radius styles, which allows this element to be a child of another bordered container element without padding (like SectionCard). Note that this also sets a 1px margin *in dark theme* to account for inset box shadows in that theme used across the design system. Be sure to test your UI in both light and dark theme if you modify this prop value. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `compact` | `booleanfalse` Whether this component should use compact styles with reduced visual padding.  Note that this prop affects styling for all Cards within this CardList and you do not need to set the `compact` prop individually on those child Cards. |