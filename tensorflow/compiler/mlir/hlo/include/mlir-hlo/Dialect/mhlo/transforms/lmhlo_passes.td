/* Copyright 2020 The TensorFlow Authors. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
==============================================================================*/

include "mlir/Pass/PassBase.td"

def LhloLegalizeToLinalgPass : FunctionPass<"lhlo-legalize-to-linalg"> {
  let summary = "Legalize from LHLO dialect to Linalg dialect.";
  let constructor = "createLegalizeLhloToLinalgPass()";
}


def LhloFuseLinalgPass : FunctionPass<"lhlo-fuse-linalg"> {
  let summary = "Greedily fuse linalg ops obtained after LHLO lowering.";
  let constructor = "createLhloFuseLinalgPass()";
  let options = [
    Option<"use_parallel_loops_", "use-parallel-loops", "bool",
           /*default=*/"false", "Tiles GenericOp consumer to parallel loops before linalg fusion">,
    ListOption<"tile_sizes_", "tile-sizes", "unsigned",
           "Faster memory space number to promote fusion buffers to",
           "llvm::cl::ZeroOrMore, llvm::cl::MiscFlags::CommaSeparated">,
  ];
}


def LhloLegalizeToAffinePass : FunctionPass<"lhlo-legalize-to-affine"> {
  let summary = "Legalize from LHLO dialect to affine dialect.";
  let constructor = "createLhloLegalizeToAffinePass()";
}


def LhloLegalizeToGpuPass : FunctionPass<"lhlo-legalize-to-gpu"> {
  let summary = "Legalize from LHLO dialect to GPU dialect.";
  let constructor = "createLegalizeToGpuPass()";
}


def LhloLegalizeToParallelLoopsPass : FunctionPass<"lhlo-legalize-to-parallel-loops"> {
  let summary = "Legalize from LHLO dialect to parallel loops.";
  let constructor = "createLegalizeLhloToParallelLoopsPass()";
}

def LegalizeTensorLoadOpPass : FunctionPass<"lhlo-legalize-tensor-load-op"> {
  let summary = "Legalize tensor load ops that are inserted during mhlo to lmhlo conversion.";
  let constructor = "createLegalizeTensorLoadOpPass()";
}

def LhloFusionPass : FunctionPass<"lhlo-fusion"> {
  let summary = "Fuse lmhlo ops to kLoop/kInput fusion patterns.";
  let constructor = "createLhloFusionPass()";
  let options = [
    Option<"max_num_arguments_per_kernel_", "max-num-arguments-per-kernel", "int",
           /*default=*/"64", "Maximum allowed number of arguments per fused kernel.">,
  ];
}

