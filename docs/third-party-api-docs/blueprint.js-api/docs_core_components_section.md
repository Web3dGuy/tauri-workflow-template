# Section

The **Section** component can be used to contain, structure, and create hierarchy for information in your UI. It makes use of some concepts from other more atomic Blueprint components:

* The overall appearance looks like a [**Card**](#core/components/card) (with limited `elevation` options)
* Contents may be collapsible like the [**Collapse**](#core/components/collapse) component

###### Basil

Edit description

Ocimum basilicum, also called great basil, is a culinary herb of the family Lamiaceae (mints). It is a tender plant, and is used in cuisines worldwide. In Western cuisine, the generic term "basil" refers to the variety also known as sweet basil or Genovese basil. Basil is native to tropical regions from Central Africa to Southeast Asia.

##### Section Props

CompactIconSub-titleRight elementCollapsible

Elevation 

0

1

0

##### Collapse Props

Default is openIs controlledOpen

##### Children

Multiple section cards

##### SectionCard Props

Padded

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/sectionExample.tsx)

## Props interface

interface SectionProps extends [Props](#api/Props), Omit<[HTMLDivProps](#api/HTMLDivProps), "title">, RefAttributes<HTMLDivElement>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/section/section.tsx#L63)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `collapseProps` | `SectionCollapseProps` Subset of props to forward to the underlying Collapse component, with the addition of a `defaultIsOpen` option which sets the default open state of the component when in uncontrolled mode. |
| `collapsible` | `booleanfalse` Whether this section's contents should be collapsible. |
| `compact` | `booleanfalse` Whether this section should use compact styles. |
| `elevation` | `SectionElevationElevation.ZERO` Visual elevation of this container element. |
| `icon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon (or an icon element) to render in the section's header. Note that the header will only be rendered if `title` is provided. |
| `rightElement` | `Element` Element to render on the right side of the section header. Note that the header will only be rendered if `title` is provided. |
| `subtitle` | `string | Element` Sub-title of the section. Note that the header will only be rendered if `title` is provided. |
| `title` | `string | Element` Title of the section. Note that the header will only be rendered if `title` is provided. |
| `titleRenderer` | `FC<HTMLAttributes<HTMLElement>>H6` Optional title renderer function. If provided, it is recommended to include a Blueprint `<H6>` element as part of the title. The render function is supplied with `className` and `id` attributes which you must forward to the DOM. The `title` prop is also passed along to this renderer via `props.children`. |

## Section card

Multiple **SectionCard** child components can be added under one **Section**, they will be stacked vertically. This layout can be used to further group information.

```
<Section>  
    <SectionCard>{/* ... */}</SectionCard>  
    <SectionCard>{/* ... */}</SectionCard>  
</Section>  

```

interface SectionCardProps extends [Props](#api/Props), [HTMLDivProps](#api/HTMLDivProps)<>, RefAttributes<HTMLDivElement>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/section/sectionCard.tsx#L23)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `padded` | `booleantrue` Whether to apply visual padding inside the content container element. |