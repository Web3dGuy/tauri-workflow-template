# Resize sensor

**ResizeSensor** observes the DOM and provides a callback for `"resize"` events on a single child element.
It is a thin wrapper around [`ResizeObserver`](https://developer.mozilla.org/en-US/docs/Web/API/ResizeObserver) to provide React bindings.

##### DOM ref required

ResizeSensor's implementation relies on a React ref being attached to a DOM element,
so the child of this component *must be a native DOM element* or utilize
[`React.forwardRef()`](https://reactjs.org/docs/forwarding-refs.html) to forward any
injected ref to the underlying DOM element.

## Usage

```
import { ResizeEntry, ResizeSensor } from "@blueprintjs/core";  
  
function handleResize(entries: ResizeEntry[]) {  
    console.log(entries.map(e => `${e.contentRect.width} x ${e.contentRect.height}`));  
}  
  
<ResizeSensor onResize={handleResize}>  
    <div style={{ width: this.props.width }} />  
</ResizeSensor>;  

```

If you attach a `ref` to the child yourself, you must pass the same value to `ResizeSensor`
with the `targetRef` prop (otherwise, the component won't be able to attach one itself).

```
const myRef = React.createRef();  
  
<ResizeSensor targetRef={myRef} onResize={handleResize}>  
    <div ref={myRef} style={{ width: this.props.width }} />  
</ResizeSensor>;  

```

##### Asynchronous behavior

The `onResize` callback is invoked asynchronously after a resize is detected
and typically happens at the end of a frame (after layout, before paint).
Therefore, testing behavior that relies on this component involves setting a
timeout for the next frame.

## Props interface

interface ResizeSensorProps

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/resize-sensor/resizeSensor.tsx#L25)

`ResizeSensor`
requires a single DOM element child and will error otherwise.

| Props | Description |
| --- | --- |
| `children` | `Element` Single child, must be an element and not a string or fragment.  Required |
| `observeParents` | `booleanfalse` If `true`, all parent DOM elements of the container will also be observed for size changes. The array of entries passed to `onResize` will now contain an entry for each parent element up to the root of the document.  Only enable this prop if a parent element resizes in a way that does not also cause the child element to resize. |
| `onResize` | `(entries: ResizeObserverEntry[]) => void` Callback invoked when the wrapped element resizes.  The `entries` array contains an entry for each observed element. In the default case (no `observeParents`), the array will contain only one element: the single child of the `ResizeSensor`.  Note that this method is called *asynchronously* after a resize is detected and typically it will be called no more than once per frame.  Required |
| `targetRef` | `RefObject<HTMLElement>` If you attach a `ref` to the child yourself when rendering it, you must pass the same value here (otherwise, ResizeSensor won't be able to attach its own). |