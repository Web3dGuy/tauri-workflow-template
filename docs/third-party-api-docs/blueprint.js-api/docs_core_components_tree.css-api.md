# Tree

**Trees** display hierarchical data.

* Expand group

  Folder 0
* Collapse group

  Folder 1

  + Item 0
  + Organic meditation gluten-free, sriracha VHS drinking vinegar beard man.
  + Expand group

    Folder 2
* Expand groupSuper secret files

##### Props

Compact

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/treeExample.tsx)

## Props interface

**Tree** is a stateless component. Its contents are dictated by the `contents` prop, which is an array of `<TreeNode>`
elements (see [below](#components/tree.tree-node)). The tree is multi-rooted if `contents` contains more than one
top-level object.

A variety of interaction callbacks are also exposed as props. All interaction callbacks supply a parameter `nodePath`,
which is an array of numbers representing a node's position in the tree. For example, `[2, 0]` represents the first
child (`0`) of the third top-level node (`2`).

interface TreeProps extends [Props](#api/Props)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/tree/tree.tsx#L26)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `compact` | `boolean` Whether to use a compact appearance which reduces the visual padding around node content. |
| `contents` | `readonly TreeNodeInfo<T>[]` The data specifying the contents and appearance of the tree.  Required |
| `onNodeClick` | `TreeEventHandler<T>` Invoked when a node is clicked anywhere other than the caret for expanding/collapsing the node. |
| `onNodeCollapse` | `TreeEventHandler<T>` Invoked when caret of an expanded node is clicked. |
| `onNodeContextMenu` | `TreeEventHandler<T>` Invoked when a node is right-clicked or the context menu button is pressed on a focused node. |
| `onNodeDoubleClick` | `TreeEventHandler<T>` Invoked when a node is double-clicked. Be careful when using this in combination with an `onNodeClick` (single-click) handler, as the way this behaves can vary between browsers. See <http://stackoverflow.com/q/5497073/3124288> |
| `onNodeExpand` | `TreeEventHandler<T>` Invoked when the caret of a collapsed node is clicked. |
| `onNodeMouseEnter` | `TreeEventHandler<T>` Invoked when the mouse is moved over a node. |
| `onNodeMouseLeave` | `TreeEventHandler<T>` Invoked when the mouse is moved out of a node. |

### Instance methods

* `Tree.getNodeContentElement(nodeId: string | number): HTMLElement | undefined` –
  Returns the underlying HTML element of the `Tree` node with an id of `nodeId`.
  This element does not contain the children of the node, only its label and controls.
  If the node is not currently mounted, `undefined` is returned.

### Tree node

**TreeNode** elements determine the contents, appearance, and state of each node in the tree.

For example, `icon` controls the icon displayed for the node, and `isExpanded` determines whether the node's children
are shown.

interface TreeNodeProps extends [TreeNodeInfo](#api/TreeNodeInfo)<T>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/tree/treeNode.tsx#L29)

| Props | Description |
| --- | --- |
| `childNodes` | `TreeNodeInfo<T>[]` Child tree nodes of this node.  Inherited from `TreeNodeInfo.childNodes` |
| `children` | `ReactNode` |
| `className` | `string` A space-delimited list of class names for this tree node element.  Inherited from `TreeNodeInfo.className` |
| `contentRef` | `(node: TreeNodeInfo<T>, element: null | HTMLDivElement) => void` |
| `depth` | `number`   Required |
| `disabled` | `boolean` Whether this tree node is non-interactive. Enabling this prop will ignore mouse event handlers (in particular click, down, enter, leave).  Inherited from `TreeNodeInfo.disabled` |
| `hasCaret` | `boolean` Whether the caret to expand/collapse a node should be shown. If not specified, this will be true if the node has children and false otherwise.  Inherited from `TreeNodeInfo.hasCaret` |
| `icon` | `BlueprintIcons_16Id | MaybeElement` The name of a Blueprint icon (or an icon element) to render next to the node's label.  Inherited from `TreeNodeInfo.icon` |
| `id` | `string | number` A unique identifier for the node.  RequiredInherited from `TreeNodeInfo.id` |
| `isExpanded` | `boolean`   Inherited from `TreeNodeInfo.isExpanded` |
| `isSelected` | `booleanfalse` Whether this node is selected.  Inherited from `TreeNodeInfo.isSelected` |
| `key` | `string | number` |
| `label` | `string | Element` The main label for the node.  RequiredInherited from `TreeNodeInfo.label` |
| `nodeData` | `T` An optional custom user object to associate with the node. This property can then be used in the `onClick`, `onContextMenu` and `onDoubleClick` event handlers for doing custom logic per node.  Inherited from `TreeNodeInfo.nodeData` |
| `onClick` | `TreeEventHandler<T>` |
| `onCollapse` | `TreeEventHandler<T>` |
| `onContextMenu` | `TreeEventHandler<T>` |
| `onDoubleClick` | `TreeEventHandler<T>` |
| `onExpand` | `TreeEventHandler<T>` |
| `onMouseEnter` | `TreeEventHandler<T>` |
| `onMouseLeave` | `TreeEventHandler<T>` |
| `path` | `number[]`   Required |
| `secondaryLabel` | `string | MaybeElement` A secondary label/component that is displayed at the right side of the node.  Inherited from `TreeNodeInfo.secondaryLabel` |

## CSS API

##### Deprecated API: use [`<Tree>`](#core/components/tree)

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

* Label
  Secondary label

  + A Document
  + Another Document

```
<div class="bp5-tree bp5-elevation-0">  
  <ul class="bp5-tree-node-list bp5-tree-root">  
    <li class="bp5-tree-node bp5-tree-node-expanded">  
      <div class="bp5-tree-node-content">  
        <span class="bp5-tree-node-caret bp5-tree-node-caret-open bp5-icon-standard"></span>  
        <span class="bp5-tree-node-icon bp5-icon-standard bp5-icon-folder-close"></span>  
        <span class="bp5-tree-node-label">Label</span>  
        <span class="bp5-tree-node-secondary-label">Secondary label</span>  
      </div>  
      <ul class="bp5-tree-node-list">  
        <li class="bp5-tree-node">  
          <div class="bp5-tree-node-content">  
            <span class="bp5-tree-node-caret-none bp5-icon-standard"></span>  
            <span class="bp5-tree-node-icon bp5-icon-standard bp5-icon-document"></span>  
          <span class="bp5-tree-node-label">A Document</span>  
          </div>  
        </li>  
        <li class="bp5-tree-node">  
          <div class="bp5-tree-node-content">  
            <span class="bp5-tree-node-caret-none bp5-icon-standard"></span>  
            <span class="bp5-tree-node-icon bp5-icon-standard bp5-icon-document"></span>  
            <span class="bp5-tree-node-label">Another Document</span>  
          </div>  
        </li>  
      </ul>  
    </li>  
  </ul>  
</div>  

```