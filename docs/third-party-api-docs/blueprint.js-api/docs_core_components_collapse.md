# Collapse

The **Collapse** component reveals and hides content with a smooth sliding animation.
It is commonly used to create expandable sections, like settings panels, sub-sections, or FAQs.

## Import

```
import { Collapse } from "@blueprintjs/core";  

```

## Usage

The **Collapse** component wraps its children and toggles their visibility with a sliding animation.
The `isOpen` prop controls whether the content is visible. Content must be in the normal document
flow (i.e., avoid `position: absolute;`), as **Collapse** calculates height to animate the transition.

Show Details

This is content below the collapse. It remains in the document flow and adjusts its position as the collapse opens and closes.

```
function CollapseExample() {  
    const [isOpen, setIsOpen] = React.useState(false);  
  
    return (  
        <div>  
            <Button intent="primary" onClick={() => setIsOpen(!isOpen)}>  
                {isOpen ? "Hide Details" : "Show Details"}  
            </Button>  
            <Collapse isOpen={isOpen}>  
                <p>  
                    This is an example of collapsible content. It could include detailed explanations, extra  
                    information, or supporting text for the primary content on the page. When expanded, the content is  
                    fully visible and takes up space in the document layout. When collapsed, it smoothly slides out of  
                    view.  
                </p>  
            </Collapse>  
            <p className={Classes.TEXT_MUTED}>  
                This is content below the collapse. It remains in the document flow and adjusts its position as the  
                collapse opens and closes.  
            </p>  
        </div>  
    );  
}  

```

## Keeping children mounted

By default, **Collapse** removes its children from the DOM when the collapse is closed.
This improves performance, especially when there are many collapsible elements on a page.
To keep the content mounted (but hidden) when collapsed, use the `keepChildrenMounted` prop.
This can be useful when preserving the internal state of child components.

Show Form

This form content stays mounted in the DOM, even when collapsed. This means that any input fields, text areas, or components inside the collapse will maintain their state between toggles.

Name

Submit

```
function CollapseMountedExample() {  
    const [isOpen, setIsOpen] = React.useState(false);  
  
    return (  
        <div>  
            <Button onClick={() => setIsOpen(!isOpen)}>{isOpen ? "Hide Form" : "Show Form"}</Button>  
            <Collapse isOpen={isOpen} keepChildrenMounted={true}>  
                <p>  
                    This form content stays mounted in the DOM, even when collapsed. This means that any input fields,  
                    text areas, or components inside the collapse will maintain their state between toggles.  
                </p>  
                <form onSubmit={event => event.preventDefault()}>  
                    <FormGroup label="Name" labelFor="name">  
                        <InputGroup id="name" placeholder="Enter your name" />  
                    </FormGroup>  
                    <Button intent="primary" type="submit">  
                        Submit  
                    </Button>  
                </form>  
            </Collapse>  
        </div>  
    );  
}  

```

## Interactive Playground

Show build logs

##### Props

Keep children mounted

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/collapsePlaygroundExample.tsx)

## Props interface

interface CollapseProps extends [Props](#api/Props)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/collapse/collapse.tsx#L23)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `children` | `ReactNode` Contents to collapse. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `component` | `ElementType<any, keyof IntrinsicElements>"div"` Component to render as the root element. Useful when rendering a `Collapse` inside a `<table>`, for instance. |
| `isOpen` | `booleanfalse` Whether the component is open or closed. |
| `keepChildrenMounted` | `booleanfalse` Whether the child components will remain mounted when the `Collapse` is closed. Setting to true may improve performance by avoiding re-mounting children. |
| `transitionDuration` | `number200` The length of time the transition takes, in milliseconds. This must match the duration of the animation in CSS. Only set this prop if you override Blueprint's default transitions with new transitions of a different length. |