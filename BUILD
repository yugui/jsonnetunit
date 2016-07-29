load("@io_bazel_rules_jsonnet//jsonnet:jsonnet.bzl", "jsonnet_library", "jsonnet_to_json_test")
load("@io_bazel_skydoc//skylark:skylark.bzl", "skylark_doc")
load("//:jsonnetunit.bzl", "jsonnet_test")

licenses(["notice"])  # Apache 2.0

jsonnet_library(
    name = "jsonnetunit",
    srcs = [
        "matcher.jsonnet",
        "std_matchers.jsonnet",
        "test.jsonnet",
    ],
    visibility = ["//visibility:public"],
)

# Tests jsonnet_test rule
jsonnet_test(
    name = "test_test",
    src = "test_test.jsonnet",
)

# Tests :jsonnetunit
jsonnet_to_json_test(
    name = "test_golden_test",
    src = "test_test.jsonnet",
    golden = "golden/test_test.golden",
    deps = [":jsonnetunit"],
)

jsonnet_to_json_test(
    name = "failure_golden_test",
    src = "failure_test.jsonnet",
    error = 1,
    golden = "golden/failure_test.golden",
    regex = 1,
    deps = [":jsonnetunit"],
)

jsonnet_test(
    name = "std_matchers_test",
    src = "std_matchers_test.jsonnet",
)

exports_files(["dummy.golden"])

skylark_doc(
    name = "jsonnetunit-docs",
    srcs = ["jsonnetunit.bzl"],
)
