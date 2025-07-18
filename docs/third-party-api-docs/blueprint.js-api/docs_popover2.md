# Blueprint

#### Blueprint is a React-based UI toolkit for the web.

It is optimized for building complex data-dense interfaces for desktop applications.

[#### Getting started](#blueprint/getting-started)[#### Git repository](https://github.com/palantir/blueprint)[#### Code Sandbox](https://codesandbox.io/p/sandbox/blueprint-v5-x-sandbox-react-16-wy0ojy)[#### Contributing](https://github.com/palantir/blueprint#contributing)

##### Blueprint v5.x is now available

Check out the [migration guides to upgrade from v4.x →](https://github.com/palantir/blueprint/wiki/Blueprint-5.0)

## Quick start

### Install

[**@blueprintjs/core**](https://www.npmjs.com/package/@blueprintjs/core) is the primary Blueprint library package,
home to over 40 UI components.
Install it with your Node.js package manager of choice ([Yarn](https://yarnpkg.com/) is used in this example):

```
yarn add @blueprintjs/core react react-dom  

```

Additional UI components and APIs are available in:

The navigation sidebar lists all the available packages, separated by use case and significant dependencies.
All have peer dependencies on **react** and **react-dom**.

### Import

Import React components from the appropriate package.

```
import { Button } from "@blueprintjs/core";  
  
<Button intent="success" text="button content" onClick={incrementCounter} />;  

```

For this button to be styled correctly in the DOM, it needs its associated CSS to be loaded on the page.
Don't forget to include the **main CSS file from each Blueprint package** and their dependencies!
The following example shows an `index.html` file; the same stylesheets should be loaded if you use a bundler like Webpack.

```
<link href="path/to/node_modules/normalize.css/normalize.css" rel="stylesheet" />  
<link href="path/to/node_modules/@blueprintjs/core/lib/css/blueprint.css" rel="stylesheet" />  
<!-- blueprint-icons.css file must be included alongside blueprint.css for icon font support -->  
<link href="path/to/node_modules/@blueprintjs/icons/lib/css/blueprint-icons.css" rel="stylesheet" />  
<!-- add other blueprint-*.css files here -->  

```