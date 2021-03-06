load(
    "//tensorflow:tensorflow.bzl",
    "tf_cc_test",
)
load("//tensorflow:tensorflow.bzl", "get_compatible_with_cloud")

package(
    default_visibility = ["//visibility:public"],
    licenses = ["notice"],
)

cc_library(
    name = "versioning",
    srcs = [
        "op_version.cc",
        "runtime_version.cc",
    ],
    hdrs = [
        "op_version.h",
        "runtime_version.h",
    ],
    compatible_with = get_compatible_with_cloud(),
    deps = [
        ":op_signature",
        "//tensorflow/core:tflite_portable_logging",
        "//tensorflow/lite:builtin_op_data",
        "//tensorflow/lite:minimal_logging",
        "//tensorflow/lite/kernels/internal:compatibility",
        "//tensorflow/lite/schema:schema_fbs",
        "//tensorflow/lite/schema:schema_fbs_with_mutable",
        "//tensorflow/lite/schema:schema_utils",
        "@com_google_absl//absl/memory",
        "@com_google_absl//absl/strings",
        "@flatbuffers",
    ],
)

tf_cc_test(
    name = "versioning_test",
    srcs = [
        "op_version_test.cc",
        "runtime_version_test.cc",
    ],
    deps = [
        ":versioning",
        "//tensorflow/lite:builtin_op_data",
        "//tensorflow/lite/kernels:builtin_ops",
        "//tensorflow/lite/schema:schema_fbs",
        "//tensorflow/lite/schema:schema_fbs_with_mutable",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "op_signature",
    srcs = [
        "op_signature.cc",
    ],
    hdrs = [
        "op_signature.h",
    ],
    compatible_with = get_compatible_with_cloud(),
    deps = [
        "//tensorflow/lite:stderr_reporter",
        "//tensorflow/lite/c:c_api_types",
        "//tensorflow/lite/c:common",
        "//tensorflow/lite/core/api",
        "//tensorflow/lite/kernels:kernel_util",
        "//tensorflow/lite/kernels/internal:compatibility",
        "//tensorflow/lite/schema:schema_fbs",
        "//tensorflow/lite/schema:schema_utils",
    ],
)
