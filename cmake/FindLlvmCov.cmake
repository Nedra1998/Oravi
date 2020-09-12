if(LLVMCOV_EXECUTABLE AND NOT EXISTS "${LLVMCOV_EXECUTABLE}")
  set(LLVMCOV_EXECUTABLE "notfound" CACHE PATH FORCE "")
endif()

find_program(LLVMCOV_EXECUTABLE NAMES llvm-cov)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LlvmCov DEFAULT_MSG LLVMCOV_EXECUTABLE)

