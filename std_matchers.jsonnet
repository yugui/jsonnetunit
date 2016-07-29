local baseMatcher = import "matcher.jsonnet";

local equalMatcher(actual, expectation) = baseMatcher {
    satisfied: actual == expectation,
    positiveMessage: "Expected " + actual + " to be " + expectation,
    negativeMessage: "Expected " + actual + " not to be " + expectation,
};

local thatMatcher(actual, expectation) = baseMatcher {
    satisfied: (
        if std.type(expectation) == "function" then
            expectation(actual)
        else 
            (expectation {actual: actual}).result
    ),
    positiveMessage: "Expected " + actual + " to satisfy " + self.description,
    negativeMessage: "Expected " + actual + " not to satisfy " + self.description,
    description:: (
        if std.type(expectation) == "function" then
            "the function"
        else
            local evaluation = expectation{actual: actual};
            if std.objectHas(evaluation, "description") then
                evaluation.description
            else
                evaluation
    ),
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
    expectThat: {
        matcher: thatMatcher,
        expectationType: true,
    },
}
