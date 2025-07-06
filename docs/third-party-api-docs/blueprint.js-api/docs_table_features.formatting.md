# Table features

## Sorting

Because the table component is **data-agnostic**, you can display complex data in the table and perform arbitrary
operations on it.

For example, this data set of Sumo tournaments in 2015 contains rankings and win-tie-loss results for each competing
rikishi (wrestler). For each column type, we define a different set of sort operations.

In the table below, try:

* Sorting with the menu in each column header
* Selecting cells and copying with the right-click context menu or with `Cmd/Ctrl` + `C` hotkeys

This example utilizes `cellRendererDependencies`; [see why in the section below](#table/features.re-rendering-cells).

Rikishi

Rank - Hatsu Basho

Record - Hatsu Basho

Rank - Haru Basho

Record - Haru Basho

Rank - Natsu Basho

Record - Natsu Basho

Rank - Nagoya Basho

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

21

Hakuho

Y1e

15-0 Y

Y1e

14-1 Y

Y1e

11-4 J

Y1e

Kakuryu

Y1w

10-5

Y2e

0-1-14

Y2e

0-0-15

Y2e

Harumafuji

Y2e

11-4 J

Y1w

10-5

Y1w

11-4 J

Y1w

Kisenosato

O1e

11-4 J

O1e

9-6

O1e

11-4 J

O1e

Kotoshogiku

O1w

9-6

O1w

8-7

O1w

6-9

O2e

Goeido

O2w

8-7

O2w

8-7

O2w

8-6-1

O1w

Aoiyama

S1e

5-10

M3w

5-10

M6w

9-6

M2w

Ichinojo

S1w

6-9

M1w

9-6

K1w

8-7

S1w

Takayasu

K1e

6-9

M3e

3-12

M8w

10-5

M2e

Tochiozan

K1w

7-8

M1e

10-5

K1e

8-7

S1e

Takarafuji

M1e

7-8

M2w

8-7

M1e

9-6

K1e

Tochinoshin

M1w

6-9

M4w

8-7

M1w

9-6

M1e

Terunofuji

M2e

8-7

S1e

13-2 J

S1e

12-3 Y

O2w

Ikioi

M2w

1-14

M13e

8-7

M10e

10-5

M3e

Endo

M3e

6-9

M5w

4-2-9

M9w

6-9

M12e

Aminishiki

M3w

6-9

M6e

8-3-4

M2w

6-9

M4e

Toyonoshima

M4e

7-8

M5e

8-7

M2e

4-11

M7w

Jokoryu

M4w

5-7-3

M9w

5-10

M15e

5-10

J3e

Kaisei

M5e

7-8

M6w

5-10

M11e

10-5

M3w

Chiyotairyu

M5w

1-6-8

J1w

7-8

J2w

9-6

M13w

Okinoumi

M6e

9-6

S1w

0-4-11

M10w

9-6

M5e

Rikishi

Rank - Hatsu Basho

Record - Hatsu Basho

Rank - Haru Basho

Record - Haru Basho

Rank - Natsu Basho

Record - Natsu Basho

Rank - Nagoya Basho

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

21

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/table-examples/tableSortableExample.tsx)

## Re-rendering cells

Sometimes you may need to re-render table cells based on new data or some user interaction, like a sorting operation as
demonstrated in the above example. In these cases, the typical table props which tell the component to re-render
(like `children`, `numRows`, `selectedRegions`, etc) may not change, so the table will not re-run its `<Cell>` children
render methods.

To work around this problem, **Table2** supports a dependency list in its `cellRendererDependencies` prop. Dependency
changes in this list (compared using shallow equality checks) trigger a re-render of all cells in the table.

In the above sortable table example, we keep a `sortedIndexMap` value in state which is updated in the column sort
callback. This "map" is referenced in the cell renderers to determine which data to render at each row index, so by
including it as a dependency in `cellRendererDependencies`, we can guarantee that cell renderers will be re-triggered
after a sorting operation, and those renderers will reference the up-to-date `sortedIndexMap` value.

## Focused cell

You may allow users to focus on a single cell and navigate around the table with arrow keys by setting
`enableFocusedCell={true}`. Try out this interaction in the table above — the table container will also scroll
around if you move focus outside the current viewport. You can expand and shrink the selected cell range using
kbd>Shift + arrow keys. For a full reference of enabled keyboard hotkeys, press `?` to bring up the
hotkeys dialog after you have clicked into the table once.

## Editing

To make your table editable, use the [**EditableCell2**](#table/table2.editablecell2) and **EditableName** components
to create editable table cells and column names.

To further extend the interactivity of the column headers, you can add children components to each **ColumnHeaderCell**
defined in the `columnHeaderCellRenderer` prop of **Column**.

The following example renders a table with editable column names (single click), editable table cells (double click),
and selectable column types. In this example, the editable values are validated against an alpha character-only
regular expression (`[a-zA-Z]`). If the content is invalid, a `Intent.DANGER` style is applied to the cell.

Please

Rename

Me

1

2

3

4

5

6

7

editable

validation 123

Please

Rename

Me

1

2

3

4

5

6

7

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/table-examples/tableEditableExample.tsx)

## Reordering

The table supports drag-reordering of columns and rows via the `enableColumnReordering` and `enableRowReordering`
props, respectively.

### Reordering columns

When `enableColumnReordering={true}`, a drag handle will appear in the column header (or in the interaction bar,
if `enableColumnInteractionBar={true}`).

#### Single column

To reorder a single column, click and drag the desired column's drag handle to the left or right, then release.
This will work whether or not column selection is enabled.

#### Multiple columns

To allow reordering of multiple contiguous columns at once, first set the following additional props:

* `enableMultipleSelection={true}`
* `selectionModes={[RegionCardinality.FULL_COLUMNS, ...]}`

Then drag-select the desired columns into a single selection, and grab any selected column's drag handle to reorder the
entire selected block.

#### Edge cases

With disjoint column selections (specified via `Cmd` or `Ctrl` + click), only the selection containing
the target drag handle will be reordered. All other selections will be cleared afterward.

Reordering a column contained in two overlapping selections will currently result in undefined behavior.

### Reordering rows

Rows do not have a drag handle, so they must be selected before reordering. To reorder a selection of one or more rows,
click and drag anywhere in a selected row header, then release. Note that the following props must be set for row
reordering to work:

* `enableRowHeader={true}`
* `enableRowReordering={true}`
* `selectionModes={[RegionCardinality.FULL_ROWS, ...]}`
* `enableMultipleSelection={true}` (to optionally enable multi-row reordering)

### Example

Press down to drag

Letter

Press down to drag

Fruit

Press down to drag

Animal

Press down to drag

Country

Press down to drag

City

1

2

3

4

5

A

Apple

Ape

Albania

Anchorage

B

Banana

Boa

Brazil

Boston

C

Cranberry

Cougar

Croatia

Chicago

D

Dragonfruit

Deer

Denmark

Denver

E

Eggplant

Elk

Eritrea

El Paso

Press down to drag

Letter

Press down to drag

Fruit

Press down to drag

Animal

Press down to drag

Country

Press down to drag

City

1

2

3

4

5

Interaction bar

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/table-examples/tableReorderableExample.tsx)

## Loading states

When fetching or updating data, it may be desirable to show a loading state. The table components provide fine-grain
loading control of loading row headers, column headers, or individual cells. Several table components expose a
`loading` or `loadingOptions` prop, but loading-related rendering is computed with components lower in the hierarchy
taking priority. For example, a cell with `loading` set to `false` will never render its loading state even if the
**Column** component to which it belongs has a `loadingOptions` value of `[ ColumnLoadingOption.CELLS ]`. The following
examples display a table of the largest potentially hazardous asteroid (based on absolute magnitude) discovered in a
given year.

### Table loading states

**Table2** exposes a `loadingOptions` prop that allows you to control the loading state behavior of all column header,
row header, and body cells. Try toggling the different options.

CellsColumn headersRow headers

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/table-examples/tableLoadingExample.tsx)

### Column loading states

**Column** exposes a `loadingOptions` prop that allows you to control the loading state behavior of an individual
column's header and body cells. Try selecting a different column in the dropdown below.

Number

Year

Absolute Magnitude

Discoverer

Observatory

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

21

4179

1989

15.3

Pollas, C.

Caussols

4953

1990

14.1

McNaught, R. H.

Siding Spring

7341

1991

16.7

Helin, E. F., Lawrence, K. J.

Palomar

5604

1992

16.4

McNaught, R. H

Siding Spring

39572

1993

16.4

Spacewatch

Kitt Peak

136618

1994

16.6

Spacewatch

Kitt Peak

243556

1995

17.3

Spacewatch

Kitt Peak

8566

1996

16.5

JPL/GEODSS NEAT

Haleakala

35396

1997

16.9

Spacewatch

Kitt Peak

16960

1998

14.3

LINEAR

Socorro

137427

1999

15

LINEAR

Socorro

23187

2000

16.1

LINEAR

Socorro

111253

2001

14.9

LINEAR

Socorro

89830

2002

14.7

LINEAR

Socorro

242216

2003

15.7

LONEOS

Anderson Mesa

242450

2004

14.7

Siding Spring Survey

Siding Spring

308242

2005

16.4

Siding Spring Survey

Siding Spring

374851

2006

16.8

LINEAR

Socorro

214869

2007

16.2

LINEAR

Socorro

294739

2008

17.2

CSS

Catalina

369264

2009

16

Mt. Lemmon Survey

Mount Lemmon

Number

Year

Absolute Magnitude

Discoverer

Observatory

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

21

Loading column 

Open dropdown

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/table-examples/columnLoadingExample.tsx)

### Cells

**Cell**, **EditableCell2**, **ColumnHeaderCell**, and **RowHeaderCell** expose a `loading` prop for granular
control of which cells should show a loading state. Try selecting a different preset loading
configuration.

Example cell loading configurationsAll cellsFirst columnFirst rowRandomNone

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/table-examples/cellLoadingExample.tsx)

## Formatting

To display long strings or native JavaScript objects, the table package provides **TruncatedFormat** and **JSONFormat**
components. These are designed to be used within a **Cell**, where they will render a
[**Popover**](#core/components/popover) to show the full cell contents on click.

Below is a table of timezones including the local time when this page was rendered. It uses a
`<TruncatedFormat detectTruncation={true}>` component to show the long date string and a
`<JSONFormat detectTruncation={true}>` component to show the timezone info object.

Timezone

UTC Offset

Local Time

Timezone JSON

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

21

Etc/GMT+12

-12:00

Tuesday, April 01, 2025 at 11:32:27 AM

{
"name": "Etc/GMT+12",
"offsetMsec": -18000000,
"offsetString": "-12:00"
}

Pacific/Midway

-11:00

Tuesday, April 01, 2025 at 12:32:27 PM

{
"name": "Pacific/Midway",
"offsetMsec": -14400000,
"offsetString": "-11:00"
}

Pacific/Honolulu

-10:00

Tuesday, April 01, 2025 at 01:32:27 PM

{
"name": "Pacific/Honolulu",
"offsetMsec": -10800000,
"offsetString": "-10:00"
}

Pacific/Marquesas

-09:30

Tuesday, April 01, 2025 at 02:02:27 PM

{
"name": "Pacific/Marquesas",
"offsetMsec": -9000000,
"offsetString": "-09:30"
}

America/Anchorage

-09:00

Tuesday, April 01, 2025 at 02:32:27 PM

{
"name": "America/Anchorage",
"offsetMsec": -7200000,
"offsetString": "-09:00"
}

America/Los\_Angeles

-08:00

Tuesday, April 01, 2025 at 03:32:27 PM

{
"name": "America/Los\_Angeles",
"offsetMsec": -3600000,
"offsetString": "-08:00"
}

America/Denver

-07:00

Tuesday, April 01, 2025 at 04:32:27 PM

{
"name": "America/Denver",
"offsetMsec": 0,
"offsetString": "-07:00"
}

America/Chicago

-06:00

Tuesday, April 01, 2025 at 05:32:27 PM

{
"name": "America/Chicago",
"offsetMsec": 3600000,
"offsetString": "-06:00"
}

America/New\_York

-05:00

Tuesday, April 01, 2025 at 06:32:27 PM

{
"name": "America/New\_York",
"offsetMsec": 7200000,
"offsetString": "-05:00"
}

America/Caracas

-04:30

Tuesday, April 01, 2025 at 07:02:27 PM

{
"name": "America/Caracas",
"offsetMsec": 9000000,
"offsetString": "-04:30"
}

America/Puerto\_Rico

-04:00

Tuesday, April 01, 2025 at 07:32:27 PM

{
"name": "America/Puerto\_Rico",
"offsetMsec": 10800000,
"offsetString": "-04:00"
}

America/St\_Johns

-03:30

Tuesday, April 01, 2025 at 08:02:27 PM

{
"name": "America/St\_Johns",
"offsetMsec": 12600000,
"offsetString": "-03:30"
}

America/Buenos\_Aires

-03:00

Tuesday, April 01, 2025 at 08:32:27 PM

{
"name": "America/Buenos\_Aires",
"offsetMsec": 14400000,
"offsetString": "-03:00"
}

America/Noronha

-02:00

Tuesday, April 01, 2025 at 09:32:27 PM

{
"name": "America/Noronha",
"offsetMsec": 18000000,
"offsetString": "-02:00"
}

Atlantic/Azores

-01:00

Tuesday, April 01, 2025 at 10:32:27 PM

{
"name": "Atlantic/Azores",
"offsetMsec": 21600000,
"offsetString": "-01:00"
}

UTC

+00:00

Tuesday, April 01, 2025 at 11:32:27 PM

{
"name": "UTC",
"offsetMsec": 25200000,
"offsetString": "+00:00"
}

Europe/Berlin

+01:00

Wednesday, April 02, 2025 at 12:32:27 AM

{
"name": "Europe/Berlin",
"offsetMsec": 28800000,
"offsetString": "+01:00"
}

Africa/Cairo

+02:00

Wednesday, April 02, 2025 at 01:32:27 AM

{
"name": "Africa/Cairo",
"offsetMsec": 32400000,
"offsetString": "+02:00"
}

Asia/Baghdad

+03:00

Wednesday, April 02, 2025 at 02:32:27 AM

{
"name": "Asia/Baghdad",
"offsetMsec": 36000000,
"offsetString": "+03:00"
}

Asia/Dubai

+04:00

Wednesday, April 02, 2025 at 03:32:27 AM

{
"name": "Asia/Dubai",
"offsetMsec": 39600000,
"offsetString": "+04:00"
}

Asia/Kabul

+04:30

Wednesday, April 02, 2025 at 04:02:27 AM

{
"name": "Asia/Kabul",
"offsetMsec": 41400000,
"offsetString": "+04:30"
}

Timezone

UTC Offset

Local Time

Timezone JSON

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

21

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/table-examples/tableFormatsExample.tsx)

## Freezing

The table supports column and row freezing via the `numFrozenColumns` and `numFrozenRows` props, respectively.
Passing `numFrozenColumns={n}` will freeze the `n` leftmost columns in place, while all other columns remain scrollable.
Likewise, passing `numFrozenRows={m}` will freeze the `m` topmost rows in place, while all other rows remain scrollable.

Here's an example of a table with 1 frozen columns and 2 frozen rows:

Column A

Column B

Column C

Column D

Column E

Column F

Column G

Column H

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

B3

C3

D3

E3

F3

G3

H3

B4

C4

D4

E4

F4

G4

H4

B5

C5

D5

E5

F5

G5

H5

B6

C6

D6

E6

F6

G6

H6

B7

C7

D7

E7

F7

G7

H7

B8

C8

D8

E8

F8

G8

H8

B9

C9

D9

E9

F9

G9

H9

B10

C10

D10

E10

F10

G10

H10

B11

C11

D11

E11

F11

G11

H11

B12

C12

D12

E12

F12

G12

H12

B13

C13

D13

E13

F13

G13

H13

B14

C14

D14

E14

F14

G14

H14

B15

C15

D15

E15

F15

G15

H15

B16

C16

D16

E16

F16

G16

H16

B17

C17

D17

E17

F17

G17

H17

B18

C18

D18

E18

F18

G18

H18

B19

C19

D19

E19

F19

G19

H19

B20

C20

D20

E20

F20

G20

H20

Column A

Column B

Column C

Column D

Column E

Column F

Column G

Column H

1

2

B1

C1

D1

E1

F1

G1

H1

B2

C2

D2

E2

F2

G2

H2

Column A

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

A3

A4

A5

A6

A7

A8

A9

A10

A11

A12

A13

A14

A15

A16

A17

A18

A19

A20

Column A

1

2

A1

A2

[View source on GitHub](https://github.com/palantir/blueprint/blob/develop/packages/docs-app/src/examples/table-examples/tableFreezingExample.tsx)