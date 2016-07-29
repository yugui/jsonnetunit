local baseMatcher = import "matcher.jsonnet";

local equalMatcher(actual, expectation) = baseMatcher {
    satisfied: actual == expectation,
    positiveMessage: "Expected " + actual + " to be " + expectation,
    negativeMessage: "Expected " + actual + " not to be " + expectation,
};

{
    expect: {
        matcher: equalMatcher,
        expectationType: true,
    },
    expectNot: {
        matcher: equalMatcher,
        expectationType: false,
    },
}
