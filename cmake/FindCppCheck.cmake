if(CPPCHECK_EXECUTABLE AND NOT EXISTS "${CPPCHECK_EXECUTABLE}")
  set(CPPCHECK_EXECUTABLE "notfound" CACHE PATH FORCE "")
endif()

find_program(CPPCHECK_EXECUTABLE NAMES cppcheck)

if(CPPCHECK_EXECUTABLE)
  execute_process(COMMAND ${CPPCHECK_EXECUTABLE} "--version" OUTPUT_VARIABLE CPPCHECK_VERSION OUTPUT_STRIP_TRAILING_WHITESPACE)
  string(REGEX REPLACE "Cppcheck " "" CPPCHECK_VERSION "${CPPCHECK_VERSION}")
  string(STRIP CPPCHECK_VERSION CPPCHECK_VERSION)
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(CppCheck DEFAULT_MSG CPPCHECK_EXECUTABLE CPPCHECK_VERSION)

