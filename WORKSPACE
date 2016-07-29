workspace(name = "com_github_yugui_jsonnetunit")

git_repository(
    name = "io_bazel_rules_jsonnet",
    remote = "https://github.com/bazelbuild/rules_jsonnet.git",
    tag = "0.0.2",
)

load("@io_bazel_rules_jsonnet//jsonnet:jsonnet.bzl", "jsonnet_repositories")

jsonnet_repositories()

# jsonnet_test refers an external repository @com_github_yugui_jsonnetunit.
local_repository(
    name = "com_github_yugui_jsonnetunit",
    path = ".",
)
