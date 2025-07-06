# Divider

**Divider** visually separate contents with a thin line and margin on all sides.
It works best in flex layouts where they will adapt to orientation without
additional styles. Otherwise, a **Divider** will appear as a full-width 1px-high block element.

## Import

```
import { Divider } from "@blueprintjs/core";  

```

## Usage

Use **Divider** to separate blocks of content within a page or container. By default, it spans the full width of its container.

Content aboveContent below

```
Content above  
<Divider />  
Content below  

```

## Vertical

When used inside a flex container, **Divider** adapts to the layout's direction. It becomes a vertical divider when placed between flex items.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis aliquam elit. Quisque ultricies dolor non sapien dictum semper.Praesent auctor eros vitae lacus porttitor elementum. Curabitur dolor dolor, sodales eget mi eget, convallis scelerisque eros.

```
<div style={{ display: "flex" }}>  
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis aliquam elit. Quisque ultricies  
    dolor non sapien dictum semper.  
    <Divider />  
    Praesent auctor eros vitae lacus porttitor elementum. Curabitur dolor dolor, sodales eget mi eget,  
    convallis scelerisque eros.  
</div>  

```

## Interactive Playground

FileEditCreateDelete

##### Example props

Vertical

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/dividerPlaygroundExample.tsx)

## Props interface

interface DividerProps extends [Props](#api/Props), HTMLAttributes<HTMLElement>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/divider/divider.tsx#L23)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `tagName` | `keyof IntrinsicElements"div"` HTML tag to use for element. |