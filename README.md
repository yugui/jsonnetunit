# JsonnetUnit

Jsonnetunit is a unit test framework for [Jsonnet](http://jsonnet.org/).

## Examples

`example_test.json`:
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
$ jsonnet example_test.jsonet
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
