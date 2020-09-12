if(SASS_EXECUTABLE AND NOT EXISTS "${SASS_EXECUTABLE}")
  set(SASS_EXECUTABLE "notfound" CACHE PATH FORCE "")
endif()

find_program(SASS_EXECUTABLE NAMES sass)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Sass DEFAULT_MSG SASS_EXECUTABLE)

