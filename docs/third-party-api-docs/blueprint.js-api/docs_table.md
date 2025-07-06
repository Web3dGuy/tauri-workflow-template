# Table

The [**@blueprintjs/table** package](https://www.npmjs.com/package/@blueprintjs/table) provides components
to build a highly interactive table or spreadsheet UI.

If you are looking for the simpler Blueprint-styled HTML `<table>` instead, see
[**HTMLTable**](#core/components/html-table).

Make sure to review the [getting started docs for installation info](#blueprint/getting-started).

```
npm install --save @blueprintjs/table  

```

Do not forget to include `table.css` on your page:

```
@import "@blueprintjs/table/lib/css/table.css";  

```

### Features

* High-scale, data-agnostic
* Customizable cell and header rendering
* Virtualized viewport rendering
* Selectable rows, columns and cells
* Resizable rows and columns
* Editable headers and cells
* Integrated header and context menus

## Basic usage

There is an updated version of the table component with some new features and compatibility with the
[new hotkeys API](#core/components/hotkeys-target2): see [**Table2**](#table/table2).

To create a table, you must define the rows and columns. Add children to the `Table` to create columns,
and change the `numRows` prop on the `Table` to set the number of rows.

For example, this code creates an empty table with three columns and five rows:

```
import { Column, Table } from "@blueprintjs/table";  
  
<Table numRows={5}>  
    <Column />  
    <Column />  
    <Column />  
</Table>;  

```

The table is **data-agnostic**. It doesn't store any data internally, so it is up to you to bind the table to your data.

You can specify how the data is displayed by defining the `cellRenderer` prop on each `Column` component.
This is useful when working with typed columnar data, like database results.

For example, this creates a table that renders dollar and euro values:

```
import { Cell, Column, Table } from "@blueprintjs/table";  
  
const dollarCellRenderer = (rowIndex: number) => <Cell>{`$${(rowIndex * 10).toFixed(2)}`}</Cell>;  
const euroCellRenderer = (rowIndex: number) => <Cell>{`€${(rowIndex * 10 * 0.85).toFixed(2)}`}</Cell>;  
  
<Table numRows={10}>  
    <Column name="Dollars" cellRenderer={dollarCellRenderer} />  
    <Column name="Euros" cellRenderer={euroCellRenderer} />  
</Table>;  

```

**Dollars**

Number

**Euros**

Number

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

$0.00

€0.00

$10.00

€8.50

$20.00

€17.00

$30.00

€25.50

$40.00

€34.00

$50.00

€42.50

$60.00

€51.00

$70.00

€59.50

$80.00

€68.00

$90.00

€76.50

$100.00

€85.00

$110.00

€93.50

$120.00

€102.00

$130.00

€110.50

$140.00

€119.00

$150.00

€127.50

$160.00

€136.00

$170.00

€144.50

$180.00

€153.00

$190.00

€161.50

**Dollars**

Number

**Euros**

Number

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/table-examples/tableDollarExample.tsx)