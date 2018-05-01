workspace(name = "com_github_yugui_jsonnetunit")

# jsonnet_test refers an external repository @com_github_yugui_jsonnetunit.
local_repository(
    name = "com_github_yugui_jsonnetunit",
    path = ".",
)

git_repository(
    name = "io_bazel_rules_jsonnet",
    commit = "b44bf8d76e0702ae06fd5422e8397f8162d7f5ca",
    remote = "https://github.com/bazelbuild/rules_jsonnet.git",
)

load("@io_bazel_rules_jsonnet//jsonnet:jsonnet.bzl", "jsonnet_repositories")

jsonnet_repositories()

git_repository(
    name = "io_bazel_rules_sass",
    remote = "https://github.com/bazelbuild/rules_sass.git",
    tag = "0.0.2",
)

load("@io_bazel_rules_sass//sass:sass.bzl", "sass_repositories")

sass_repositories()

git_repository(
    name = "io_bazel_skydoc",
    remote = "https://github.com/bazelbuild/skydoc.git",
    tag = "0.1.3",
)

load("@io_bazel_skydoc//skylark:skylark.bzl", "skydoc_repositories")

skydoc_repositories()
