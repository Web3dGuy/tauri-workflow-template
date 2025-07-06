# HTML table

**HTMLTable** provides Blueprint styling to native HTML tables.

##### This is not @blueprintjs/table

This component is a simple CSS-only skin for HTML `<table>` elements.
It is ideal for basic static tables. If you're looking for more complex
spreadsheet-like features, check out [**@blueprintjs/table**](#table).

## Props interface

The `<HTMLTable>` component provides modifier props to apply styles to an HTML `<table>` element. Note that you are
responsible for rendering `<thead>` and `<tbody>` elements as children.

interface HTMLTableProps extends TableHTMLAttributes<HTMLTableElement>, RefAttributes<HTMLTableElement>

[@blueprintjs/core](https://github.com/palantir/blueprint/blob/d356c8eea/packages/core/src/components/html-table/htmlTable.tsx#L22)

| Props | Description |
| --- | --- |
| `bordered` | `boolean` Enable borders between rows and cells. |
| `compact` | `boolean` Use compact appearance with less padding. |
| `interactive` | `boolean` Enable hover styles on rows. |
| `striped` | `boolean` Use an alternate background color on odd-numbered rows. |

## CSS API

##### Deprecated API: use [`<HTMLTable>`](#core/components/html-table)

CSS APIs for Blueprint components are considered deprecated, as they are verbose, error-prone, and they
often fall out of sync as the design system is updated. You should use the React component APIs instead.

Apply the `bp5-html-table` class to a `<table>` element. You can apply modifiers as additional classes.

| Project | Description | Technologies | Contributors |
| --- | --- | --- | --- |
| Blueprint | CSS framework and UI toolkit | Sass, TypeScript, React | 268 |
| TSLint | Static analysis linter for TypeScript | TypeScript | 403 |
| Plottable | Composable charting library built on top of D3 | SVG, TypeScript, D3 | 737 |
|  |  |  |  |
| --- | --- | --- | --- |
| Total | | | 1408 |

`.bp5-compact`

Compact appearance

`.bp5-html-table-bordered`

Bordered appearance

`.bp5-html-table-striped`

Striped appearance

`.bp5-interactive`

Enables hover styles on rows

```
<table class="bp5-html-table {{.modifier}}">  
  <thead>  
    <tr>  
      <th>Project</th>  
      <th>Description</th>  
      <th>Technologies</th>  
      <th>Contributors</th>  
    </tr>  
  </thead>  
  <tbody>  
    <tr>  
      <td>Blueprint</td>  
      <td>CSS framework and UI toolkit</td>  
      <td>Sass, TypeScript, React</td>  
      <td>268</td>  
    </tr>  
    <tr>  
      <td>TSLint</td>  
      <td>Static analysis linter for TypeScript</td>  
      <td>TypeScript</td>  
      <td>403</td>  
    </tr>  
    <tr>  
      <td>Plottable</td>  
      <td>Composable charting library built on top of D3</td>  
      <td>SVG, TypeScript, D3</td>  
      <td>737</td>  
    </tr>  
  </tbody>  
  <tfoot>  
    <tr>  
      <td colspan=3>Total</td>  
      <td>1408</td>  
    </tr>  
  </tfoot>  
</table>  

```