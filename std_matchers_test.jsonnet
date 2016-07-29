local test = import "test.jsonnet";

test.suite({
    testExpectNull:   {actual: null, expect: null},
    testExpectBool:   {actual: true, expect: true},
    testExpectString: {actual: "str", expect: "str"},
    testExpectNumber: {actual: 1, expect: 1},
    testExpectArray: {
        actual: [null, true, "str", 1],
        expect: [null, true, "str", 1],
    },
    testExpectObject: {
        actual: {a: null, b: true, c: "str", d: 1},
        expect: {a: null, b: true, c: "str", d: 1},
    },
} + {
    testExpectNotNull:      {actual: 1, expectNot: null},
    testExpectNotStringInt: {actual: "1", expectNot: 1},
    testExpectNotBoolInt:   {actual: true, expectNot: 1},
    testExpectNotArray: {
        actual:    [1, 2, 3],
        expectNot: [1, 4, 3],
    },
    testExpectNotObject: {
        actual:    {a: 1, b: 2, c: 3},
        expectNot: {a: 1, b: 4, c: 3},
    },
})

