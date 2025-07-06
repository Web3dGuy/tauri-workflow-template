module.exports = {
  extends: [
    'stylelint-config-standard-scss'
  ],
  rules: {
    'color-named': ['never', { severity: 'warning' }],
    'declaration-no-important': [true, { severity: 'warning' }],
    'no-descending-specificity': [true, { severity: 'warning' }],
    'selector-class-pattern': null,
    'declaration-block-no-shorthand-property-overrides': [true, { severity: 'warning' }],
    'no-duplicate-selectors': [true, { severity: 'warning' }],
    'unit-no-unknown': [true, { ignoreUnits: ['xl'], severity: 'warning' }],
    'declaration-block-single-line-max-declarations': [1, { severity: 'warning' }],
    'scss/dollar-variable-no-missing-interpolation': true,
    'scss/at-if-no-null': [true, { severity: 'warning' }],
    'scss/no-global-function-names': [true, { severity: 'warning' }],
    'keyframes-name-pattern': null,
    'declaration-property-value-keyword-no-deprecated': [true, { severity: 'warning' }]
  }
};