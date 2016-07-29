local test = import "test.jsonnet";

test.suite({
    testExpectNull:   {actual: null, expect: null},
    testExpectBool:   {actual: true, expect: true},
    testExpectString: {actual: "str", expect: "str"},
    testExpectNumber: {actual: 1, expect: 1},
    testExpectArray:  {
        actual: [null, true, "str", 1],
        expect: [null, true, "str", 1],
    },
    testExpectObject:  {
        actual: {a: null, b: true, c: "str", d: 1},
        expect: {a: null, b: true, c: "str", d: 1},
    },
})
