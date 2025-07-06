# Non-ideal state

Non-ideal UI states inform the user that some content is unavailable. There are several types of non-ideal states,
including:

* **Empty state:** a container has just been created and has no data in it yet, or a container's contents have been
  intentionally removed.
* **Loading state:** a container is awaiting data. A good practice is to show a spinner for this state with optional
  explanatory text below the spinner.
* **Error state:** something went wrong (for instance, 404 and 500 HTTP errors). In this case, a good practice is to
  add a call to action directing the user what to do next.

#### No search results

Your search didn't match any files.  
Try searching for something else, or create a new file.

New file

##### Props

Layout 

HorizontalVertical

Visual 

IconSpinner

Icon

search

Visual size 

XSSmallStandard

Show titleShow descriptionShow action

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/nonIdealStateExample.tsx)

## Usage

**NonIdealState** component props are rendered in this order in the DOM, with comfortable spacing between each child:

1. `icon`
2. text (`title` + optional `description`)
3. `action`
4. `children`

By default, a vertical layout is used, but you can make it horizontal with `layout="horizontal"`.

Icons will also take on a muted appearance inside this component, with their shape contrast preserved by adding a small stroke to the SVG paths. This behavior can be disabled by setting `iconMuted={false}`.

## Props interface

interface NonIdealStateProps extends [Props](#api/Props)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/non-ideal-state/nonIdealState.tsx#L33)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `action` | `Element` An action to resolve the non-ideal state which appears after `description`. |
| `children` | `ReactNode` Advanced usage: React `children` will appear last (after `action`). Avoid passing raw strings as they will not receive margins and disrupt the layout flow. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `description` | `ReactNode` A longer description of the non-ideal state. A string or number value will be wrapped in a `<div>` to preserve margins. |
| `icon` | `BlueprintIcons_16Id | MaybeElement` The name of a Blueprint icon or a JSX element (such as `<Spinner/>`) to render above the title. |
| `iconMuted` | `booleantrue` Whether the icon should use a muted style. |
| `iconSize` | `NonIdealStateIconSizeNonIdealStateIconSize.STANDARD` How large the icon visual should be. |
| `layout` | `"horizontal" | "vertical""vertical"` Component layout, either vertical or horizontal. |
| `title` | `ReactNode` The title of the non-ideal state. |

## CSS API

##### Deprecated API: use [`<NonIdealState>`](#core/components/non-ideal-state)

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

Note that you are required to set the `font-size` and `line-height` styles for the icon element to render it properly.

Also, since the CSS API uses the icon font, Blueprint styles cannot adjust the icon visual design to have a muted
appearance like it does with the React component API. This means **NonIdealState** elements rendered with this API will
stand out visually (in a bad way) within the design system.

Apply the `.bp5-non-ideal-state` class to the root container element and wrap the icon element with a
`.bp5-non-ideal-state-visual` container.

The root container should only have direct element children, no grandchildren (except for text, which is enclosed in a
`.bp5-non-ideal-state-text` wrapper element). This constraint ensures proper spacing between each child.

#### This folder is empty

Create a new file to populate the folder.

Create

```
<div class="bp5-non-ideal-state">  
  <div class="bp5-non-ideal-state-visual" style="font-size: 48px; line-height: 48px;">  
    <span class="bp5-icon bp5-icon-muted bp5-icon-folder-open"></span>  
  </div>  
  <div class="bp5-non-ideal-state-text">  
    <h4 class="bp5-heading">This folder is empty</h4>  
    <div>Create a new file to populate the folder.</div>  
  </div>  
  <button class="bp5-button bp5-intent-primary">Create</button>  
</div>  

```