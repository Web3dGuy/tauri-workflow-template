# Reading the documentation

## Understanding TypeScript

Blueprint is written in [TypeScript](https://www.typescriptlang.org/), a statically typed superset
of JavaScript that compiles to plain JavaScript. All the code samples throughout this site and
all interactive examples are also written in TypeScript. TypeScript code looks exactly like ES2015+
code with the addition of type signatures, which typically appear after colons and are *italicized*
in our syntax theme.

```
// variables  
const variableName: varType;  
const name: string;  
const disabled: boolean;  
  
// functions (and function variables)  
function funcName(arg1: argType, arg2: argType): returnType {}  
const funcName: (arg1: argType) => returnType;  
function split(str: string, delim: string): string[] {}  
function map<T, U>(array: T[], iterator: (item: T, index: number) => U): U[];  
  
// interfaces describe plain objects  
// (we use the convention that interfaces begin with "I")  
interface Option {  
    label: string;  
    value: string;  
}  
const option: Option = { label: "Name", value: "Gilad" };  

```

**You do not need to use TypeScript to consume Blueprint** (but major "props" if you do).
Simply ignoring the type annotations (any italics in code blocks) will produce valid ES2015 code.
Familiarity with the syntax is suggested so you can follow our examples source code.

For more information, see the TypeScript Handbook for [basic types](https://www.typescriptlang.org/docs/handbook/basic-types.html)
and [consuming declaration files](https://www.typescriptlang.org/docs/handbook/declaration-files/consumption.html).