# JsonnetUnit

[![Build Status](https://travis-ci.org/yugui/jsonnetunit.svg?branch=master)](https://travis-ci.org/yugui/jsonnetunit)

Jsonnetunit is a unit test framework for [Jsonnet](http://jsonnet.org/).

[TOC]

## Examples

`example_test.jsonnet`:
```jsonnet
local test = import "path/to/jsonnetunit/test.jsonnet";

test.suite({
    testIdentity: {actual: 1, expect: 1},
    testNeg:      {actual: "YAML", expectNot: "Markup Language"},
    testFact: {
        local fact(n) = if n == 0 then 1 else n * fact(n-1),

        actual: fact(10),
        expect: 3628800
    },
})
```

```console
$ jsonnet example_test.jsonnet
{
    "verify": "Passed 3 test cases"
}
```

See `std_matchers_test.jsonnet` for more examples of other matchers.

## How to install

Just `git clone`.

```console
$ git clone https://github.com/yugui/jsonnetunit.git
```

## Getting started

### How to write tests

1.  Create a test file

    Test files must be `.jsonnet` files which manifestize a result of `test.suite` function.

    ```jsonnet
    local test = import "path/to/jsonnetunit/test.jsonnet";
    test.suite({
    })
    ```

2.  Add test cases

    `test.suite` function takes an object which contains fields prefixed with `test`.
    You can add arbitrary number of such fields.  `test.suite` does not directly use any other fields.

    Individual test fields must have at least two fields:

    * `actual` field: There must be a field named `actual`. This is the actual value to be verified.
    * expectation field: There must be another field which describes an expectation.  This expectation is used to verify the `actual` value.

      ```jsonnet
      test.suite({
          testFoo: {
              actual: std.length('foo'),
              expect: 3,
          },
      })
      ```

      The interpretation of the expectation depends on the name of the expectation field. The name `expect` in the example means that it expects that `actual` field is equal to the given value.

### Simple expectations

Expectation Field Name | Description               | Example
-----------------------|---------------------------|------------------------------
`expect`               | value equality            | `{actual: 1+1, expect: 2}`
`expectNot`            | value inequality          | `{actual: 1+1, expectNot: 3}`
`expectLt`             | less than                 | `{actual: 1+1, expectLt: 3}`
`expectLe`             | less than or equal to     | `{actual: 1+1, expectLe: 3}`
`expectGt`             | greater than              | `{actual: 1+1, expectGt: 1}`
`expectGe`             | greater than or equal to  | `{actual: 1+1, expectGe: 1}`

### expectThat

You can describe an abitrary expectation with `expectThat`.
This expectation field takes a unary function or an object.

The function must take an actual value and it must return if the value satisfies your expectation in a boolean value.

```jsonnet
{
  actual: ultimateAnswerToLifeTheUniverseAndEverything(),
  expectThat: function(x) x == 42,
}
```

When you pass an object, the object must have two fields `actual` and `result`.
The first field `actual` is overridden with the `actual` value of the test case on evaluation.
The second field `result` must be an boolean which describes whether `actual` field satisfies your expectation.
In this case, you can optionally specifies a custom `description` of the expectation.  This is used as a part of error message when the test case fails.

```jsonnet
{
  actual: ultimateAnswerToLifeTheUniverseAndEverything(),
  expectThat: {
    actual: error "to be overridden",
    result: self.actual == 42,
    description: "Expect %d to be equal to the known value" % self.actual,
  },
}
```

### Custom expectation matcher

You can also define your own expectation matcher.

1.  Define a binary function which takes `actual` and `expected` values. This function must return an object
    derived from `matcher.jsonnet` and must have the following three fields.

    * `satisfied`: (boolean) Returns if `self.actual` satisfies your expectation
    * `positiveMessage`: (string) Returns an error message to be returned when `self.actual` does not satisfies your expectation.
    * `negativeMessage`: (string) Returns an error message to be returned when `self.actual` does not satisfies the negation of the expectation.

    e.g.
    ```jsonnet
    local setMatcher(actual, expected) = import "path/to/matcher.jsonnet" {
        satisfied: std.set(actual) == std.set(expected),
        positiveMessage: "Expected " + actual + " to be equal to " + expected + " as a set",
        negativeMessage: "Expected " + actual + " not to be equal to " + expected + " as a set",
    };
    ```
2.  Define your expectation field name in the `matchers` field of the test suite.

    e.g.
    ```jsonnet
    test.suite({
        testEq: {
            actual: [6, 7, 2, 3, 7],
            expectSetEq: [2, 3, 6, 7],
        },
        testNe: {
            actual: [6, 7, 2, 3, 7],
            expectSetNe: [1, 2, 3, 4, 5],
         }
    }) {
        matchers+: {
            // Define a new expectation field name "expectSetEq" for set equality
            expectSetEq: {
                matcher: setMatcher,
                expectationType: true,
            },
             // Define a new expectation field name "expectSetNe" for set inequality
            expectSetNe: {
                matcher: setMatcher,
                expectationType: false,
            },
        },
    }
    ```

# Copyright

Copyright 2016 Yuki Yugui Sonoda

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
