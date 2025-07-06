# Datetime2

The [**@blueprintjs/datetime2** package](https://www.npmjs.com/package/@blueprintjs/datetime2)
provides next-generation components for interacting with dates & times:

There are also legacy APIs which are re-exported aliases for components from [**@blueprintjs/datetime**](#datetime).
These "V2" names are backwards-compatible with the previous major version of @blueprintjs/datetime2:

* **DateInput2** (alias for [**DateInput**](#datetime/date-input)) (DEPRECATED)
* **DateRangeInput2** (alias for [**DateRangeInput**](#datetime/date-range-input)) (DEPRECATED)

### Motivation

**DatePicker3** and its related "V3" components are next-generation variants of components currently available in the
[**@blueprintjs/datetime2**](#datetime2) package. They will become the standard date & time components in a
future major version of Blueprint. You are encouraged to try out the new APIs, provide feedback, and set yourself
up for forward compatibility in the Blueprint ecosystem.

Compared to their "V1" and "V2" counterparts, these components:

* use [react-day-picker](https://daypicker.dev/v8) v8 instead of v7 (this unblocks React 18 compatibility)
* are easier to internationalize & localize since date-fns is now a dependency (instead of `localeUtils`, you can specify a locale code and we'll automatically load the date-fns locale object)

### Installation

Make sure to review the [getting started docs for installation info](#blueprint/getting-started).

```
npm install --save @blueprintjs/datetime2  

```

##### Multiple copies of react-day-picker

Installing the datetime2 package will transitively install two copies of react-day-picker: v7.x and v8.x.
Note that these two major versions can happily exist together in a single JS bundle, and with the help of tree-shaking,
you can avoid bundling both if you *only* use the deprecated "V1" / "V2" datetime components or *only* use the new
"V3" APIs.

Import the package stylesheet (for example, in Sass):

```
@import "~@blueprintjs/datetime2/lib/css/blueprint-datetime2.css";  

```

##### Additional CSS required

This library relies on some components from other Blueprint packages, so you will need to pull in those
packages' CSS files as well (if you are not doing this already):

```
@import "~@blueprintjs/datetime/lib/css/blueprint-datetime.css";  
@import "~@blueprintjs/select/lib/css/blueprint-select.css";  

```