# Navbar

**Navbar** presents useful navigation controls at the top of an application.

Blueprint

HomeFiles

##### Props

Align end

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/core-examples/navbarExample.tsx)

## Usage

The **Navbar** API includes four stateless React components:

* **Navbar**
* **NavbarGroup** (aliased as `Navbar.Group`)
* **NavbarHeading** (aliased as `Navbar.Heading`)
* **NavbarDivider** (aliased as `Navbar.Divider`)

These components are simple containers for their children. Each of them supports the full range of HTML `<div>`
DOM attributes.

```
<Navbar>  
    <Navbar.Group align={Alignment.START}>  
        <Navbar.Heading>Blueprint</Navbar.Heading>  
        <Navbar.Divider />  
        <Button className="bp5-minimal" icon="home" text="Home" />  
        <Button className="bp5-minimal" icon="document" text="Files" />  
    </Navbar.Group>  
</Navbar>  

```

### Fixed to viewport top

Enable the `fixedToTop` prop to attach a navbar to the top of the viewport using `position: fixed; top: 0;`. This is
so-called "sticky" behavior: the navbar stays at the top of the screen as the user scrolls through the document.

This modifier is not illustrated here because it breaks the document flow.

##### Body padding required

The fixed navbar will lie on top of your other content unless you add padding to the top of the `<body>` element equal
to the height of the navbar. Use the `$pt-navbar-height` Sass variable.

### Fixed width

If your application is inside a fixed-width container (instead of spanning the entire viewport), you can align the
navbar to match by wrap your navbar groups in an element with your desired `width` and `margin: 0 auto;` to horizontally
center it.

Blueprint

Home
Files

```
<nav class="bp5-navbar bp5-dark">  
  <div style="margin: 0 auto; width: 480px;"> <!-- ADD ME -->  
    <div class="bp5-navbar-group bp5-align-left">  
      <div class="bp5-navbar-heading">Blueprint</div>  
    </div>  
    <div class="bp5-navbar-group bp5-align-right">  
      <button class="bp5-button bp5-minimal bp5-icon-home">Home</button>  
      <button class="bp5-button bp5-minimal bp5-icon-document">Files</button>  
      <span class="bp5-navbar-divider"></span>  
      <button class="bp5-button bp5-minimal bp5-icon-user"></button>  
      <button class="bp5-button bp5-minimal bp5-icon-notifications"></button>  
      <button class="bp5-button bp5-minimal bp5-icon-cog"></button>  
    </div>  
  </div>  
</nav>  

```

## Props interface

interface NavbarProps extends [Props](#api/Props), [HTMLDivProps](#api/HTMLDivProps)<>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/navbar/navbar.tsx#L27)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `children` | `ReactNode` |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |
| `fixedToTop` | `boolean` Whether this navbar should be fixed to the top of the viewport (using CSS `position: fixed`). |

interface NavbarGroupProps extends [Props](#api/Props), [HTMLDivProps](#api/HTMLDivProps)<>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/navbar/navbarGroup.tsx#L25)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `align` | `AlignmentAlignment.START` The side of the navbar on which the group should appear. The `Alignment` enum provides constants for these values. |
| `children` | `ReactNode` |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |

interface NavbarHeadingProps extends [Props](#api/Props), [HTMLDivProps](#api/HTMLDivProps)<>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/navbar/navbarHeading.tsx#L23)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `children` | `ReactNode` |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |

interface NavbarDividerProps extends [Props](#api/Props), [HTMLDivProps](#api/HTMLDivProps)<>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/navbar/navbarDivider.tsx#L24)

A shared base interface for all Blueprint component props.

| Props | Description |
| --- | --- |
| `className` | `string` A space-delimited list of class names to pass along to a child element.  Inherited from `Props.className` |

## CSS API

##### Deprecated API: use `<Navbar>`

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

Use the following classes to construct a navbar:

* `nav.bp5-navbar` – The parent element. Use a `<nav>` element for accessibility.
* `.bp5-navbar-group.bp5-align-(left|right)` – Left- or right-aligned group.
* `.bp5-navbar-heading` – Larger text for your application title.
* `.bp5-navbar-divider` – Thin vertical line that can be placed between groups of elements.

Blueprint

Home
Files

`.bp5-dark`

Dark theme

```
<nav class="bp5-navbar {{.modifier}}">  
  <div class="bp5-navbar-group bp5-align-left">  
    <div class="bp5-navbar-heading">Blueprint</div>  
    <input class="bp5-input" placeholder="Search files..." type="text" />  
  </div>  
  <div class="bp5-navbar-group bp5-align-right">  
    <button class="bp5-button bp5-minimal bp5-icon-home">Home</button>  
    <button class="bp5-button bp5-minimal bp5-icon-document">Files</button>  
    <span class="bp5-navbar-divider"></span>  
    <button class="bp5-button bp5-minimal bp5-icon-user"></button>  
    <button class="bp5-button bp5-minimal bp5-icon-notifications"></button>  
    <button class="bp5-button bp5-minimal bp5-icon-cog"></button>  
  </div>  
</nav>  

```