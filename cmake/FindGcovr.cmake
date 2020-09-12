if(GCOVR_EXECUTABLE AND NOT EXISTS "${GCOVR_EXECUTABLE}")
  set(GCOVR_EXECUTABLE "notfound" CACHE PATH FORCE "")
endif()

find_program(GCOVR_EXECUTABLE NAMES gcovr PATHS ${CMAKE_SOURCE_DIR}/scripts/test)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Gcovr DEFAULT_MSG GCOVR_EXECUTABLE)

