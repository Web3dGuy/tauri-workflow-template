# Typography

## Usage

Keep in mind these general web typography guidelines when building your applications.

* The default text color in all components is compliant with the recommended [WCAG 2.0](https://www.w3.org/TR/WCAG20/) minimum contrast ratio.
* If you choose to go with a custom text color, make sure the background behind it provides proper contrast.
* Try not to explicitly write pixel values for your font-size or line-height CSS rules. Instead, reference the classes and variables we provide in Blueprint (`.bp5-ui-text`, `$bp5-font-size-large`, etc.).

## UI text

Blueprint does not include any fonts of its own; it will use the default sans-serif operating system font.
A handful of utility CSS classes can be combined freely to further customize a block of text.

The base font size for Blueprint web applications is 14px. This should be the default type size
for most short strings of text which are not headings or titles. If you wish to reset some
element's font size and line height to the default base styles, use the `.bp5-ui-text` class.

For longer blocks of running text, such as articles or documents, see [running text styles](#core/typography.running-text).

More than a decade ago, we set out to create products that would transform
the way organizations use their data. Today, our products are deployed at
the most critical government, commercial, and non-profit institutions in
the world to solve problems we hadn’t even dreamed of back then.

`.bp5-ui-text`

Default Blueprint font styles, applied to the `<body>` tag and available as a class for nested resets.

`.bp5-monospace-text`

Use a monospace font (ideal for code).

`.bp5-running-text`

Increase line height ideal for longform text. See [Running text](#core/typography.running-text) below for additional features.

`.bp5-text-large`

Use a larger font size.

`.bp5-text-small`

Use a smaller font size.

`.bp5-text-muted`

Change text color to a gentler gray. This text color meets [minimum contrast standards of WCAG 2.1](https://www.w3.org/TR/WCAG21/#contrast-minimum) for $white through $light-gray4 in light theme, and $black through $dark-gray4 in dark theme.

`.bp5-text-disabled`

Change text color to a transparent, faded gray. This text color will not meet minimum contrast standards and should only be used on "incidental" text as defined by [WCAG 2.1 Contrast Minimum](https://www.w3.org/TR/WCAG21/#contrast-minimum), either purely decorative, or text of a disabled UI element.

`.bp5-text-overflow-ellipsis`

Truncate a single line of text with an ellipsis if it overflows its container.

```
<div class="{{.modifier}}">  
  More than a decade ago, we set out to create products that would transform  
  the way organizations use their data. Today, our products are deployed at  
  the most critical government, commercial, and non-profit institutions in  
  the world to solve problems we hadn’t even dreamed of back then.  
</div>  

```

## Running text

Longform text, such as rendered Markdown documents, benefit from increased spacing and support for unclassed textual elements.
Apply `.bp5-running-text` to the parent element to apply the following styles to all children:

* `<h*>`, `<ul>`, `<ol>`, `<blockquote>`, `<code>`, `<pre>`, `<kbd>` tags do not require additional CSS classes for styles. This is great for rendered Markdown documents.
* `<h*>` tag margins are adjusted to provide clear separation between sections in a document.
* `<ul>` and `<ol>` tags receive [`.bp5-list`](#core/typography.lists) styles for legibility.

We build products that make people better at their most important
work — the kind of work you read about on the front page of the
newspaper, not just the technology section.

* Item the `first`.
* Item the **second**.
* Item the [third](#core/typography.running-text).

### Scale, Speed, Agility

A successful data transformation requires the whole organization — users, the IT shop, and
leadership — to operate in lockstep. With Foundry, the enterprise comes together to
transform the organization and turn data into a competitive advantage.

`.bp5-text-large`

Use larger font size.

```
<div class="bp5-running-text {{.modifier}}">  
  <p>  
    We build products that make people better at their most important  
    work — the kind of work you read about on the front page of the  
    newspaper, not just the technology section.  
  </p>  
  <ul>  
    <li>Item the <code>first</code>.</li>  
    <li>Item the <strong>second</strong>.</li>  
    <li>Item the <a href="#core/typography.running-text">third</a>.</li>  
  </ul>  
  <h3>Scale, Speed, Agility</h3>  
  <p>  
    A successful data transformation requires the whole organization — users, the IT shop, and  
    leadership — to operate in lockstep. With Foundry, the enterprise comes together to  
    transform the organization and turn data into a competitive advantage.  
  </p>  
</div>  

```

## Headings

Apply the `.bp5-heading` class to one of the six `<h*>` tags (or nest them inside a `.bp5-running-text` container)
to adjust font size and line height.

# H1 heading

## H2 heading

### H3 heading

#### H4 heading

##### H5 heading

###### H6 heading

`.bp5-text-muted`

Change text color to a gentler gray.

```
<div>  
  <h1 class="bp5-heading {{.modifier}}">H1 heading</h1>  
  <h2 class="bp5-heading {{.modifier}}">H2 heading</h2>  
  <h3 class="bp5-heading {{.modifier}}">H3 heading</h3>  
  <h4 class="bp5-heading {{.modifier}}">H4 heading</h4>  
  <h5 class="bp5-heading {{.modifier}}">H5 heading</h5>  
  <h6 class="bp5-heading {{.modifier}}">H6 heading</h6>  
</div>  

```

## Links

Simply use an `<a href="">` tag as you normally would. No class is necessary for Blueprint styles.
Links are underlined only when hovered.

Putting an icon inside a link will cause it to inherit the link's text color.

## Preformatted text

Use `.bp5-code` for inline code elements (typically with the `<code>` tag).
Use `.bp5-code-block` for mulitline blocks of code (typically on a `<pre>` tag).
Note that `<pre>` blocks will retain *all* whitespace so you'll have to format the content accordingly.

When nested inside a `.bp5-running-text` container, use the `<pre>` or `<code>` tags directly without CSS classes.

Use the `<code>` tag for snippets of code.

```
Use the <pre> tag for blocks of code.
```
```
// code sample
export function hasModifier(
  modifiers: ts.ModifiersArray,
  ...modifierKinds: ts.SyntaxKind[],
) {
  if (modifiers == null || modifierKinds == null) {
    return false;
  }
  return modifiers.some(m => modifierKinds.some(k => m.kind === k));
}
```
```
<div>  
  <p>Use the <code class="bp5-code">&lt;code></code> tag for snippets of code.</p>  
  <pre class="bp5-code-block">Use the &lt;pre> tag for blocks of code.</pre>  
  <pre class="bp5-code-block"><code>// code sample  
export function hasModifier(  
  modifiers: ts.ModifiersArray,  
  ...modifierKinds: ts.SyntaxKind[],  
) {  
  if (modifiers == null || modifierKinds == null) {  
    return false;  
  }  
  return modifiers.some(m => modifierKinds.some(k => m.kind === k));  
}</code></pre>  
</div>  

```

## Block quotes

Block quotes receive a left border and padding to distinguish them from body text.

Use the `.bp5-blockquote` class or nest a `<blockquote>` element inside a `.bp5-running-text` container.

> Premium Aerotec is a key supplier for Airbus, producing 30 million parts per year,
> which is huge complexity. Skywise helps us manage all the production steps.
> It gives Airbus much better visibility into where the product is in the supply chain,
> and it lets us immediately see our weak points so we can react on the spot.

```
<blockquote class="bp5-blockquote">  
  Premium Aerotec is a key supplier for Airbus, producing 30 million parts per year,  
  which is huge complexity. Skywise helps us manage all the production steps.  
  It gives Airbus much better visibility into where the product is in the supply chain,  
  and it lets us immediately see our weak points so we can react on the spot.  
</blockquote>  

```

## Lists

Blueprint provides a small amount of global styling and a few modifier classes for list elements.

`<ul>` and `<ol>` elements in blocks with the `.bp5-running-text` modifier class will
automatically assume the `.bp5-list` styles to promote readability.

Use `.bp5-list-unstyled` to remove list item decorations and margins and padding.

Note that these classes must be applied to each nested `<ul>` or `<ol>` element in a tree.

1. Item the first
2. Item the second
3. Item the third
   * Item the fourth
   * Item the fifth

`.bp5-list`

Add a little spacing between items for readability.

`.bp5-list-unstyled`

Remove all list styling (including indicators) so you can add your own.

```
<ol class="{{.modifier}}">  
  <li>Item the first</li>  
  <li>Item the second</li>  
  <li>  
    Item the third  
    <ul class="{{.modifier}}">  
      <li>Item the fourth</li>  
      <li>Item the fifth</li>  
    </ul>  
  </li>  
</ol>  

```

## Internationalization

I18n in Blueprint is straightforward. React components expose props for customizing any strings;
use the library of your choice for managing internationalized strings.

### Right-to-left (RTL) support

Blueprint supports layout and text alignment adjustments for right-to-left (RTL) languages to ensure proper rendering in different writing systems.

#### Logical Properties

To provide better RTL support, many Blueprint components adopt [logical property names](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_logical_properties_and_values) for alignment. Logical properties are direction-relative, meaning their behavior depends on the text direction (LTR or RTL) of the document:

* `start`: Equivalent to `left` in left-to-right context and `right` in right-to-left context.
* `end`: Equivalent to `right` in a left-to-right context and `left` in a right-to-left context.

For example, a [`<Checkbox>`](#core/components/checkbox) component with `alignIndicator="start"` will display the indicator on the left side of text in an LTR context. In an RTL context, the indicator will move to the right side, as the start of the line is on the right.

#### CSS Utility Classes

Use the utility class `.bp5-rtl` to apply right alignment to an element to support RTL text.

##### Arabic:

لكل لأداء بمحاولة من. مدينة الواقعة يبق أي, وإعلان وقوعها، حول كل, حدى عجّل مشروط الخاسرة قد.
من الذود تكبّد بين, و لها واحدة الأراضي. عل الصفحة والروسية يتم, أي للحكومة استعملت شيء. أم وصل زهاء اليا

##### Hebrew:

כדי על עזרה יידיש הבהרה, מלא באגים טכניים דת. תנך או ברית ביולי. כתב בה הטבע למנוע, דת כלים פיסיקה החופשית זכר.
מתן החלל מאמרשיחהצפה ב. הספרות אנציקלופדיה אם זכר, על שימושי שימושיים תאולוגיה עזה

```
<h5 class="bp5-heading">Arabic:</h5>  
<p class="bp5-rtl">  
  لكل لأداء بمحاولة من. مدينة الواقعة يبق أي, وإعلان وقوعها، حول كل, حدى عجّل مشروط الخاسرة قد.  
  من الذود تكبّد بين, و لها واحدة الأراضي. عل الصفحة والروسية يتم, أي للحكومة استعملت شيء. أم وصل زهاء اليا  
</p>  
<h5 class="bp5-heading">Hebrew:</h5>  
<p class="bp5-rtl">  
  כדי על עזרה יידיש הבהרה, מלא באגים טכניים דת. תנך או ברית ביולי. כתב בה הטבע למנוע, דת כלים פיסיקה החופשית זכר.  
  מתן החלל מאמרשיחהצפה ב. הספרות אנציקלופדיה אם זכר, על שימושי שימושיים תאולוגיה עזה  
</p>  

```

## Dark theme

Blueprint provides two UI color themes: light and dark. The light theme is active by default. The
dark theme can be applied by adding the class `bp5-dark` to a container element to theme all nested
elements.

Once applied, the dark theme will cascade to nested `.bp5-*` elements inside a `.bp5-dark` container.
There is no way to nest light-themed elements inside a dark container.

Most elements only support the dark theme when nested inside a `.bp5-dark` container because it does
not make sense to mark individual elements as dark. The dark container is therefore responsible for
setting a dark background color.

The following elements and components support the `.bp5-dark` class directly (i.e, `.bp5-card.bp5-dark`)
and can be used as a container for nested dark children:

* `Card`
* Overlays: `Dialog`, `Popover`, `Tooltip`, `Toast`
* `Popover` and `Tooltip` will automatically detect when their trigger is inside a `.bp5-dark` container and add the same class to themselves.

Rather than illustrating dark components inline, this documentation site provides a site-wide switch
in the sidebar to enable the dark theme. Try it out as you read the docs.