if(GCOV_EXECUTABLE AND NOT EXISTS "${GCOV_EXECUTABLE}")
  set(GCOV_EXECUTABLE "notfound" CACHE PATH FORCE "")
endif()

find_program(GCOV_EXECUTABLE NAMES gcov)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Gcov DEFAULT_MSG GCOV_EXECUTABLE)

