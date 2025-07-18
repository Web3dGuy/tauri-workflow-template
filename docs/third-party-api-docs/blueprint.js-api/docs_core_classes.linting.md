# Classes

Blueprint packages provide React components in JS files and associated styles in
a CSS file. Each package exports a `Classes` constants object in JavaScript that
contains keys of the form `NAMED_CONSTANT` for every CSS class used. This
separation allows us to change CSS classes between versions without breaking
downstream users (although in practice this happens very rarely).

**Avoid referencing hardcoded Blueprint class names in your JS or CSS code.**

```
// Don't do this! Avoid hardcoding Blueprint class names.  
<button className="bp5-button bp5-large">Don't do this!</button>  

```

The **best practice** is to add your own class to an element and then reference
that class whenever needed.

```
<Button className="my-custom-class" text="customized button" />  

```
```
.my-custom-class {  
    width: 4000px;  
}  

```

In cases where adding and styling a new class is impractical or undesirable, use
the `Classes` constants or `$ns` Sass/Less variable. The `Classes` constants can
be particularly useful when writing UI tests.

```
// use Classes constants for forward-compatible custom elements.  
import { Classes } from "@blueprintjs/core";  
<a className={Classes.MENU_ITEM}>custom menu item</a>;  

```
```
// interpolate the $ns variable to generate forward-compatible class names.  
// this approach is *not encouraged* as it increases maintenance cost.  
@import "@blueprintjs/core/lib/scss/variables";  
.bp5-menu-item {  
}  

```

## Modifiers

Blueprint components support a range of **modifiers** to adjust their
appearance. Some commonly used modifiers are `intent`, `large`, and `minimal`.
While modifiers are typically implemented as simple CSS classes, it is always
preferrable to use the corresponding prop on a React component.

```
// Prefer props over modifier classes.  
<Button intent="primary" variant="minimal">Good stuff</Button>  
  
// Don't do this!  
<Button className={classNames(Classes.INTENT_PRIMARY, Classes.MINIMAL)}>Don't do this!</Button>  

```

Another important note: Since modifiers typically correspond directly to CSS classes, they will often
cascade to children and *cannot be disabled* on descendants. If a `<ButtonGroup>`
is marked `variant="outlined"`, then setting `<Button variant="minimal">` on a child
will have *no effect* since `Classes.OUTLINED` cannot be removed or overriden
by a descendant.

## Namespacing

All Blueprint CSS classes begin with a namespace prefix to isolate our styles
from other frameworks: `.button` is a very common name, but only Blueprint
defines `.bp5-button`.

This CSS namespace is versioned by major version of the library so two major versions of Blueprint
can be used together on a single page.

### Custom namespace

The CSS namespace can be changed *at build time* to produce a custom Blueprint build.
With this approach, you will import Blueprint's Sass sources from `/lib/scss/` instead of the CSS files from the
`/lib/css/` folders.

You must use [Dart Sass](https://sass-lang.com/dart-sass) and set up a few important bits of build configuration:

1. Sass `loadPaths` must include the `node_modules` folder where `@blueprintjs` packages are installed
2. A custom function implementation for `svg-icon()` must be defined
3. You must copy the [resources/icons folder](https://github.com/palantir/blueprint/tree/develop/resources/icons) from the Blueprint repo into your project (in the future, this may not be required once Blueprint starts publishing these SVG files in a public NPM package).

The **@blueprintjs/node-build-scripts** package provides some utility functions to help with this. Here's a code example
for a custom Sass compiler that can import Blueprint `.scss` sources:

```
import { sassNodeModulesLoadPaths, sassSvgInlinerFactory } from "@blueprintjs/node-build-scripts";  
import * as sass from "sass";  
  
const result = await sass.compileAsync("path/to/input.scss", {  
    loadPaths: sassNodeModulesLoadPaths,  
    functions: {  
        /**  
         * Sass function to inline a UI icon svg and change its path color.  
         *  
         * Usage:  
         * svg-icon("16px/icon-name.svg", (path: (fill: $color)) )  
         */  
        "svg-icon($path, $selectors: null)": sassSvgInlinerFactory("path/to/resources/icons", {  
            optimize: true,  
            encodingFormat: "uri",  
        }),  
    },  
});  

```

In addition to the JS API, you can specify this configuration with Webpack's sass-loader:

```
// webpack.config.mjs  
  
import { sassNodeModulesLoadPaths, sassSvgInlinerFactory } from "@blueprintjs/node-build-scripts";  
import * as sass from "sass";  
  
const functions = {  
    /**  
     * Sass function to inline a UI icon svg and change its path color.  
     *  
     * Usage:  
     * svg-icon("16px/icon-name.svg", (path: (fill: $color)) )  
     */  
    "svg-icon($path, $selectors: null)": sassSvgInlinerFactory("path/to/resources/icons", {  
        optimize: true,  
        encodingFormat: "uri",  
    }),  
};  
  
export default {  
    module: {  
        rules: [  
            {  
                test: /\.scss$/,  
                use: {  
                    loader: require.resolve("sass-loader"),  
                    options: {  
                        sassOptions: {  
                            loadPaths: sassNodeModulesLoadPaths,  
                            functions,  
                        },  
                    },  
                },  
            },  
        ],  
    },  
};  

```

Once you have this build configuration set up, you can proceed to customize Sass and JS variables:

1. Define the `$ns` Sass variable in your app styles *before* importing `blueprint.scss`.
2. When bundling your JS JS code, define the `BLUEPRINT_NAMESPACE` variable to the same value; this will update the generated `Classes` constants. The easiest way to do is with webpack's [DefinePlugin](https://webpack.js.org/plugins/define-plugin/).

```
plugins: [  
    new webpack.DefinePlugin({  
        BLUEPRINT_NAMESPACE: "my-custom-namespace",  
    }),  
];  

```

## Linting

The [**@blueprintjs/eslint-config**](https://www.npmjs.com/package/@blueprintjs/eslint-config)
NPM package provides advanced configuration for [ESLint](https://eslint.org/). The
[**@blueprintjs/eslint-plugin**](https://www.npmjs.com/package/@blueprintjs/eslint-plugin)
NPM package includes a custom `blueprint-html-components` rule that will warn on usages of
JSX intrinsic elements (`<h1>`) that have a Blueprint alternative (`<H1>`). See
the package's [README](https://www.npmjs.com/package/@blueprintjs/eslint-plugin)
for usage instructions.