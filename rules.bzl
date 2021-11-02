def _hangs_on_fetch_repository_impl(repository_ctx):
    repository_ctx.report_progress("Will sleep now...")
    repository_ctx.execute(["sleep", "600"])
    repository_ctx.file("BUILD.bazel")
    repository_ctx.file("foobar.bzl", "baz = 5")

hangs_on_fetch_repository = repository_rule(
    implementation = _hangs_on_fetch_repository_impl,
)

def _bool_flag_impl(ctx):
    pass

bool_flag = rule(
    implementation = _bool_flag_impl,
    build_setting = config.bool(flag = True),
)
