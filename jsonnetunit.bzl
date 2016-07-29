load("@io_bazel_rules_jsonnet//jsonnet:jsonnet.bzl", "jsonnet_to_json_test")

def jsonnet_test(name, src, deps=[], **kwargs):
  """Runs a jsonnetunit test

  Args:
    name: A unique name for this rule
    src: A `.jsonnet` which contains a jsonnetunit test suite
    deps: List of `jsonnet_library` rules which `src` depends on.

  ### Note
  This rule also accepts other attributes defined in `jsonnet_to_json_test` rule
  except `golden`, `error` or `regex`.
  """
  for key in ["golden", "error", "regex"]:
    if key in kwargs:
      fail("no such attribute in jsonnet_test", key)

  jsonnet_to_json_test(
      name = name,
      src = src,
      deps = deps + ["@com_github_yugui_jsonnetunit//:jsonnetunit"],

      # workaround for https://github.com/bazelbuild/rules_jsonnet/issues/9
      # TODO(yugui) Remove these attributes and :dummy.golden once the issue is
      # fixed.
      golden = "@com_github_yugui_jsonnetunit//:dummy.golden",
      regex = 1,

      **kwargs
  )

