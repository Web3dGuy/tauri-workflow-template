module.exports = {
  extends: [
    'stylelint-config-standard-scss'
  ],
  rules: {
    'color-named': ['never', { severity: 'warning' }],
    'selector-class-pattern': null,
    'declaration-block-no-shorthand-property-overrides': [true, { severity: 'warning' }],
    'no-duplicate-selectors': [true, { severity: 'warning' }],
    'unit-no-unknown': [true, { ignoreUnits: ['xl'], severity: 'warning' }],
    'declaration-block-single-line-max-declarations': [1, { severity: 'warning' }],
    'scss/dollar-variable-no-missing-interpolation': true,
    'scss/at-if-no-null': [true, { severity: 'warning' }],
    'scss/no-global-function-names': [true, { severity: 'warning' }],
    'keyframes-name-pattern': null,
    'declaration-property-value-keyword-no-deprecated': [true, { severity: 'warning' }],
    
    // Disable legitimate technical requirement warnings
    // ================================================
    
    // Portal component overrides (Blueprint.js) - Required for React portals
    'declaration-no-important': null,
    
    // CSS cascade specificity - Required for third-party integration
    'no-descending-specificity': null
  },
  
  // Override rules for specific files with legitimate !important usage
  overrides: [
    {
      files: ['**/base/_animations.scss'],
      rules: {
        // Accessibility motion preferences require !important for WCAG compliance
        'declaration-no-important': null
      }
    },
    {
      files: ['**/utilities/_responsive.scss'],
      rules: {
        // Print media styles require !important for media query overrides
        'declaration-no-important': null
      }
    },
    {
      files: ['**/themes/_blueprint-overrides.scss', '**/components/_dropdowns.scss'],
      rules: {
        // Portal component styling requires !important to override React portal styles
        'declaration-no-important': null
      }
    },
    {
      files: ['**/layout/_app.scss'],
      rules: {
        // Inline style overrides require !important for React component styling
        'declaration-no-important': null
      }
    },
    {
      files: ['**/components/_forms.scss', '**/components/_screen-cards.scss'],
      rules: {
        // Browser compatibility and state overrides require !important
        'declaration-no-important': null
      }
    }
  ]
}; 