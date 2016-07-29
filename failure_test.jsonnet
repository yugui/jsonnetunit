local test = import "test.jsonnet";

test.suite({
    testFailure: {actual: 1+1, expect: 3},
})
