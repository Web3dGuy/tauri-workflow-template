# Tabs

The **Tabs** component allows you to switch between displaying multiple panels of content.

##### Tabs with passed panels, uncontrolled mode

Use vertical tabs

React

Angular

Ember

Backbone

#### Example panel: React

Lots of people use React as the V in MVC. Since React makes no assumptions about the rest of your technology stack, it's easy to try it out on a small feature in an existing project.

#### Example panel: Angular

HTML is great for declaring static documents, but it falters when we try to use it for declaring dynamic views in web-applications. AngularJS lets you extend HTML vocabulary for your application. The resulting environment is extraordinarily expressive, readable, and quick to develop.

#### Example panel: Ember

Ember.js is an open-source JavaScript application framework, based on the model-view-controller (MVC) pattern. It allows developers to create scalable single-page web applications by incorporating common idioms and best practices into the framework. What is your favorite JS framework?

#### Backbone

##### Tabs with separately rendered panels, controlled mode

Fill height

Page: **Home**

Home

Files

Builds

#### Example panel: Home

The current panel is: "Home"

##### Appearance props

Large sizeAnimate tab indicator

##### Behavior props

Render active tab panel only

##### Tab content props

Show icon

Show tag

Use round tags

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/tabsExample.tsx)

## Usage

Tab selection is managed by `id`, much like the HTML `<select>` element respects `<option value>`. This is more
reliable than using a numeric index as it does not require translating between arbitrary indices and tab names.
It does, however, require that every `<Tab>` have a *locally unique `id` value*.

Arbitrary elements are supported in the tab list, and order is respected. Yes,
you can even insert things *between* `<Tab>` elements.

```
import { Tab, Tabs } from "@blueprintjs/core";  
  
<Tabs id="TabsExample">  
    <Tab id="ng" title="Angular" panel={<AngularPanel />} />  
    <Tab id="mb" title="Ember" panel={<EmberPanel />} panelClassName="ember-panel" />  
    <Tab id="rx" title="React" panel={<ReactPanel />} />  
    <Tab id="bb" disabled title="Backbone" panel={<BackbonePanel />} />  
    <TabsExpander />  
    <input className="bp5-input" type="text" placeholder="Search..." />  
</Tabs>;  

```

### Tabs

`<Tabs>` is the top-level component responsible for rendering the tab list and coordinating selection.
It can be used in controlled mode by providing `selectedTabId` and `onChange` props, or in
uncontrolled mode by optionally providing `defaultSelectedTabId` and `onChange`.

Children of `<Tabs>` are rendered in order in the tab list, which is a flex container.
`<Tab>` child elements are managed by the component; clicking one will change selection.
Other child elements are rendered in order; interactions are your responsibility.

Insert a `<TabsExpander />` between any two children to right-align all subsequent children
(or bottom-align when `vertical`).

interface TabsProps extends [Props](#api/Props)

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/tabs/tabs.tsx#L38)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `animate` | `booleantrue` Whether the selected tab indicator should animate its movement. |
| `children` | `ReactNode` Tab elements. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `defaultSelectedTabId` | `TabIdfirst tab` Initial selected tab `id`, for uncontrolled usage. Note that this prop refers only to `<Tab>` children; other types of elements are ignored. |
| `fill` | `booleanfalse` Whether to make the tabs list fill the height of its parent.  This has no effect when `vertical={true}`. This is not recommended when tab panels are defined within this component subtree, as the height computation will include the panel height, which is usually not intended. Instead, it works well if the panels are rendered elsewhere in the React tree. |
| `id` | `TabId` Unique identifier for this `Tabs` container. This will be combined with the `id` of each `Tab` child to generate ARIA accessibility attributes. IDs are required and should be unique on the page to support server-side rendering.  Required |
| `large` | `booleanfalse` If set to `true`, the tab titles will display with larger styling. This will apply large styles only to the tabs at this level, not to nested tabs.  Deprecated |
| `onChange` | `(newTabId: TabId, prevTabId: undefined | TabId, event: MouseEvent<HTMLElement, MouseEvent<>>) => void` A callback function that is invoked when a tab in the tab list is clicked. |
| `renderActiveTabPanelOnly` | `booleanfalse` Whether inactive tab panels should be removed from the DOM and unmounted in React. This can be a performance enhancement when rendering many complex panels, but requires careful support for unmounting and remounting. |
| `selectedTabId` | `TabId` Selected tab `id`, for controlled usage. Providing this prop will put the component in controlled mode. Unknown ids will result in empty selection (no errors). |
| `size` | `NonSmallSize"medium"` The size of the tab titles. |
| `vertical` | `booleanfalse` Whether to show tabs stacked vertically on the left side. |

### Tab

The **Tab** component is a minimal wrapper with no functionality of its own—it is managed entirely by its
parent **Tabs** component. Tab title text can be set either via `title` prop or via React children
(for more complex content).

The associated tab `panel` will be visible when the *Tab* is active. Omitting the `panel` prop is supported; this can
be useful when you want the associated panel to appear elsewhere in the DOM (by rendering it yourself as needed—see *TabPanel*).

interface TabProps extends [Props](#api/Props), Omit<[HTMLDivProps](#api/HTMLDivProps), "id" | "title" | "onClick">

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/tabs/tab.tsx#L40)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `children` | `ReactNode` Content of tab title, rendered in a list above the active panel. Can also be set via the `title` prop. |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `disabled` | `booleanfalse` Whether the tab is disabled. |
| `icon` | `BlueprintIcons_16Id | MaybeElement` Name of a Blueprint UI icon (or an icon element) to render before the children. |
| `id` | `TabId` Unique identifier used to control which tab is selected and to generate ARIA attributes for accessibility.  Required |
| `panel` | `Element | (props: TabIdProps) => Element<>` Panel content, rendered by the parent `Tabs` when this tab is active. If omitted, no panel will be rendered for this tab. Can either be an element or a renderer. |
| `panelClassName` | `string` Space-delimited string of class names applied to tab panel container. |
| `tagContent` | `ReactNode` Content to render inside a `<Tag>` after the children. The tag is `minimal` by default; it can be further modified by using `tagProps`. |
| `tagProps` | `Omit<TagProps, "children">` Props to customize the `<Tag>` rendered after the children. This has no effect if `tagContent` is `undefined`. |
| `title` | `ReactNode` Content of tab title element, rendered in a list above the active panel. Can also be set via React `children`. |

### TabPanel

**TabPanel** wraps a passed `panel` in proper aria attributes, `id`, and `role`, for proper accessibility. A **TabPanel** gets automatically rendered by a *Tab* when `panel` is supplied and the *Tab* is active, but **TabPanel** is also exported for cases where you want to render the panel yourself elsewhere in the DOM, while using *Tabs* in controlled mode:

```
import * as React from "react";  
import { Tab, Tabs, TabPanel, type TabId } from "@blueprintjs/core";  
  
function TabsControlledExample() {  
    const TABS_PARENT_ID = React.useId();  
    const [selectedTabId, setSelectedTabId] = React.useState<TabId>("Home");  
  
    return (  
        <>  
            <Tabs id={TABS_PARENT_ID} onChange={setSelectedTabId} selectedTabId={selectedTabId}>  
                <Tab id="Home" title="Home" />  
                <Tab id="Files" title="Files" />  
            </Tabs>  
            <TabPanel  
                id={selectedTabId}  
                selectedTabId={selectedTabId}  
                parentId={TABS_PARENT_ID}  
                panel={<p>The current panel id is: "{selectedTabId}"</p>}  
            />  
        </>  
    );  
}  

```

interface TabPanelProps extends Pick<[TabProps](#api/TabProps), "className" | "id" | "panel">, Pick<[TabsProps](#api/TabsProps), "renderActiveTabPanelOnly" | "selectedTabId">, Pick<TabTitleProps, "parentId">

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/tabs/tabPanel.tsx#L26)

| Props | Description |
| --- | --- |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Pick.className` |
| `id` | `TabId` Unique identifier used to control which tab is selected and to generate ARIA attributes for accessibility.  RequiredInherited from `Pick.id` |
| `panel` | `Element | (props: TabIdProps) => Element<>` Panel content, rendered by the parent `Tabs` when this tab is active. If omitted, no panel will be rendered for this tab. Can either be an element or a renderer.  Inherited from `Pick.panel` |
| `parentId` | `TabId` ID of the parent `Tabs` to which this tab belongs. Used to generate ID for ARIA attributes.  RequiredInherited from `Pick.parentId` |
| `renderActiveTabPanelOnly` | `booleanfalse` Whether inactive tab panels should be removed from the DOM and unmounted in React. This can be a performance enhancement when rendering many complex panels, but requires careful support for unmounting and remounting.  Inherited from `Pick.renderActiveTabPanelOnly` |
| `selectedTabId` | `undefined | TabId` Used for setting visibility. This `TabPanel` will be visibile when `selectedTabId === id`, with proper accessibility attributes set.  Required |

## CSS API

##### Deprecated API: use [`<Tabs>`](#core/components/tabs)

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

Blueprint offers tab styles with the class `bp5-tabs`. You should add the proper accessibility attributes
(`role`, `aria-selected`, and `aria-hidden`) as necessary if you choose to implement tabs with CSS.

`.bp5-tab-panel` elements with `aria-hidden="true"` are hidden automatically by the Blueprint CSS. You may also
omit hidden tabs from your markup to improve performance (the `Tabs` JavaScript component supports this through the
`renderActiveTabPanelOnly` prop).

* Selected tab
* Another tab
* Disabled tab

Selected panel

Another panel

Disabled panel

`.bp5-large`

Large tabs

```
<div class="bp5-tabs">  
    <ul class="bp5-tab-list {{.modifier}}" role="tablist">  
        <li class="bp5-tab" role="tab" aria-selected="true">Selected tab</li>  
        <li class="bp5-tab" role="tab">Another tab</li>  
        <li class="bp5-tab" role="tab" aria-disabled="true">Disabled tab</li>  
    </ul>  
    <div class="bp5-tab-panel" role="tabpanel">Selected panel</div>  
    <div class="bp5-tab-panel" role="tabpanel" aria-hidden="true">Another panel</div>  
    <div class="bp5-tab-panel" role="tabpanel" aria-hidden="true">Disabled panel</div>  
</div>  

```