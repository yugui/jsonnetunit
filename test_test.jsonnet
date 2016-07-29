local test = import "test.jsonnet";
local matcher = import "matcher.jsonnet";

local stubMatcher(actual, expected) = matcher {
    satisfied: true,
};

test.suite({
    testDummy: {actual: 'something', expectStub: 'something'},
}) {
    matchers+: {
        expectStub: {
            matcher: stubMatcher,
            expectationType: true,
        },
    },
}
