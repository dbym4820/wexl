# WEXL

## What is WEXL

Parenscript transpiler

## Installation

1. Install roswell from [here:https://github.com/roswell/roswell](https://github.com/roswell/roswell)

2. Install via roswell.

```sh:
? ros install dbym4820/wexl
```

3. Add to Path

```sh:
? export PATH=$PATH:~/.roswell/bin/
```

## Usage

Make parenscript file.

```cl:sample.lisp
;;; ~/.wexl/sample.lisp
(defun sample-js ()
  (ps
    (defun sum-two-nums (arg1 arg2)
        (+ arg1 arg2))))
```

Convert sample.lisp to sample.js

```sh:
? wexl ~/.wexl/sample.lisp ~/.wexl/sample.js sample.js
```

Confirm ~/.wexl/sample.js

```js:
function sumTwoNums(arg1, arg2) {
    return arg1 + arg2;
};
```

## Todo

- Convert not only each function but also entire file
- and so on..

## Copyright

Copyright (c) 2017 Tomoki ABURATANI (aburatanitomoki@gmail.com)

## License

Licensed under the MIT License.
