# Skeleton

Skeletons provide a loading state that mimics the shape of your yet-to-load content.

This "component" is a single constant `Classes.SKELETON` that, when applied to
an element through `className`, will cover its content with a loading animation.
The skeleton inherits the dimensions of whatever element the class is applied
to, so you should supply a placeholder while awaiting real content.

##### [Card heading](#)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eget tortor felis.
Fusce dapibus metus in dapibus mollis. Quisque eget ex diam.

Submit

`.bp5-skeleton`

Render this element as a skeleton, an outline of its true self.

```
<div class="bp5-card">  
  <h5 class="bp5-heading"><a class="{{.modifier}}" href="#" tabindex="-1">Card heading</a></h5>  
  <p class="{{.modifier}}">  
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eget tortor felis.  
    Fusce dapibus metus in dapibus mollis. Quisque eget ex diam.  
  </p>  
  <button type="button" class="bp5-button bp5-icon-add {{.modifier}}" tabindex="-1">Submit</button>  
</div>  

```

## CSS

Apply the class `.bp5-skeleton` to elements that you would like to cover up with
a loading animation.

##### Manually disable focusable elements

When using the `.bp5-skeleton` class on focusable elements such as inputs and buttons, be sure to disable the element,
via either the `disabled` or `tabindex="-1"` attributes. Failing to do so will allow these skeleton elements to be
focused when they shouldn't be.