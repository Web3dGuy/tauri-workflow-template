# Colors

## Gray scale

Black, white and everything in between.

The gray scale should be used for the main UI frame: containers, headers, sections, boxes, etc.

If you need to call attention to a particular element (buttons, icons, tooltips, etc.),
use one of the [core colors](#core/colors.core-colors) instead.

#111418

#FFFFFF

#1C2127

#252A31

#2F343C

#383E47

#404854

#5F6B7C

#738091

#8F99A8

#ABB3BF

#C5CBD3

#D3D8DE

#DCE0E5

#E5E8EB

#EDEFF2

#F6F7F9

## Core colors

Core colors are used to support user interface design by calling
attention to specific elements, such as buttons, callouts, icons, etc.

Each core color is mapped to what we call a **visual intent**. Intents
are used to convey the status and tone of UI elements:

* *Blue* (intent: primary) elevates elements from the typical gray scale UI frame.
* *Green* (intent: success) indicates successful operations.
* *Orange* (intent: warning) indicates warnings and intermediate states.
* *Red* (intent: danger) indicates errors and potentially destructive operations.

Blueprint's core colors are designed to:

* go well together and be used alongside each other in any application.
* adhere to [WCAG 2.0](https://www.w3.org/TR/WCAG20/) standards, and therefore are highly accessible to visually impaired and color blind users.

Many Blueprint components support the `intent` prop, which may be set to a string
literal constant such as `intent="primary"`.

#184A90

#215DB0

#2D72D2

#4C90F0

#8ABBFF

#165A36

#1C6E42

#238551

#32A467

#72CA9B

#77450D

#935610

#C87619

#EC9A3C

#FBB360

#8E292C

#AC2F33

#CD4246

#E76A6E

#FA999C

## Extended colors

Extended colors should typically be reserved for data visualizations: any time
you need to represent data of some sort, you can use these.
These colors are less strict on [WCAG 2.0](https://www.w3.org/TR/WCAG20/)
accessibility standards and should therefore not be used for typical user
interface design — take a look at [core colors](#colors.core-colors) instead.

#96290D

#B83211

#D33D17

#EB6847

#FF9980

#A82255

#C22762

#DB2C6F

#F5498B

#FF66A1

#5C255C

#7C327C

#9D3F9D

#BD6BBD

#D69FD6

#5642A6

#634DBF

#7961DB

#9881F3

#BDADFF

#0C5174

#0F6894

#147EB3

#3FA6DA

#68C1EE

#004D46

#007067

#00A396

#13C9BA

#7AE1D8

#1D7324

#238C2C

#29A634

#43BF4D

#62D96B

#43501B

#5A701A

#8EB125

#B6D94C

#D4F17E

#5C4405

#866103

#D1980B

#F0B726

#FBD065

#5E4123

#7A542E

#946638

#AF855A

#D0B090

## Usage

Blueprint provides variables for colors in Sass, Less, and JavaScript.
[Semantic aliases for common colors](#core/variables.color-aliases) are also provided in Sass and Less.

Example in Sass:

```
@import "@blueprintjs/core/lib/scss/variables";  
  
.rule {  
    color: $pt-link-color;  
    background: $black;  
}  

```

Example in Less:

```
@import "@blueprintjs/core/lib/less/variables";  
  
.rule {  
    color: @pt-link-color;  
    background: @black;  
}  

```

Hex values for these colors can be accessed in JavaScript through the `Colors` export.
Note that aliases are not currently available in JavaScript.

```
import { Colors } from "@blueprintjs/core";  
  
<div style={{ color: Colors.BLUE3, background: Colors.BLACK }} />;  

```

## Color schemes

Use the following color scheme generators to produce color schemes for your data visualizations.
First, choose the kind of scheme based on the type of your data, then customize the number of values
using the forms below. Finally, copy the colors array into your application and make it live!

The following schemes have been carefully crafted to be visually striking and easily understandable
while remaining accessible to visually impaired and color blind users.

### Sequential color schemes

Sequential color schemes imply order and are best suited for representing data that
ranges from low-to-high values either on an ordinal or on a numerical scale.

Select a color schemeSingle hueMulti-hue

Step count

### Diverging color schemes

Diverging color schemes put equal emphasis on mid-range values and extremes
at both ends of the data range.

Step count

### Qualitative color schemes

Qualitative color schemes use a series of unrelated colors to create a
scheme that does not imply order, merely difference in kind.