include(CMakeParseArguments)

if(ENABLE_COVERAGE)
  if(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    find_package(Gcov)
  elseif (CMAKE_CXX_COMPILER_ID MATCHES "(Apple)?[Cc]lang")
    find_package(LlvmCov)
  endif()
  find_package(Gcovr)
endif()

function(configure_coverage)
  if(NOT ENABLE_COVERAGE)
    return()
  elseif(NOT GCOVR_FOUND OR ((CMAKE_CXX_COMPILER_ID MATCHES "GNU" AND NOT GCOV_FOUND) OR (CMAKE_CXX_COMPILER_ID MATCHES "(Apple)?[Cc]lang" AND NOT LLVMCOV_FOUND)))
    message(WARNING "No valid coverage reporting tools available")
    return()
  endif()

  set(options NONE)
  set(oneValueArgs NAME TARGET FAIL_UNDER_LINE FAIL_UNDER_BRANCH)
  set(multiValueArgs EXCLUDE EXECUTABLE EXECUTABLE_ARGS DEPENDS)
  cmake_parse_arguments(Coverage "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})
  if(NOT Coverage_NAME)
    set(Coverage_NAME "${Coverage_TARGET}-coverage")
  endif()

  if(GCOV_FOUND)
    set(GCOVR_GCOV "${GCOV_EXECUTABLE}")
  elseif(LLVMCOV_FOUND)
    set(GCOVR_GCOV "${LLVMCOV_EXECUTABLE} gcov")
  endif()

  set(BASEDIR ${PROJECT_SOURCE_DIR})

  set(GCOVR_EXCLUDES "")
  foreach(EXCLUDE ${Coverage_EXCLUDE} ${COVERAGE_EXCLUDES} ${COVERAGE_GCOVR_EXCLUDES})
    if(CMAKE_VERSION VERSION_GREATER 3.4)
      get_filename_component(EXCLUDE ${EXCLUDE} ABSOLUTE BASE_DIR ${BASEDIR})
    endif()
    list(APPEND GCOVR_EXCLUDES "${EXCLUDE}")
  endforeach()
  list(REMOVE_DUPLICATES GCOVR_EXCLUDES)

  set(GCOVR_EXCLUDE_ARGS "")
  foreach(EXCLUDE ${GCOVR_EXCLUDES})
    list(APPEND GCOVR_EXCLUDE_ARGS "-e")
    list(APPEND GCOVR_EXCLUDE_ARGS "${EXCLUDE}")
  endforeach()

  set(GCOVR_FAILURE_CONDITIONS "")
  if(${Coverage_FAIL_UNDER_LINE})
    list(APPEND GCOVR_FAILURE_CONDITIONS "--fail-under-line")
    list(APPEND GCOVR_FAILURE_CONDITIONS "${Coverage_FAIL_UNDER_LINE}")
  endif()
  if(${Coverage_FAIL_UNDER_BRANCH})
    list(APPEND GCOVR_FAILURE_CONDITIONS "--fail-under-line")
    list(APPEND GCOVR_FAILURE_CONDITIONS "${Coverage_FAIL_UNDER_BRANCH}")
  endif()

  if (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    target_link_libraries(${Coverage_TARGET} gcov)
  elseif(CMAKE_CXX_COMPILER_ID MATCHES "(Apple)?[Cc]lang")
    target_link_options(${Coverage_TARGET} PUBLIC -fprofile-instr-generate -fcoverage-mapping)
  endif()

  add_custom_target(${Coverage_NAME}-summary
    COMMAND ${Coverage_EXECUTABLE} ${Coverage_EXECUTABLE_ARGS}
    COMMAND ${GCOVR_EXECUTABLE} --gcov-executable ${GCOVR_GCOV} --print-summary ${GCOVR_FAILURE_CONDITIONS} -f ${BASEDIR} ${GCOVR_EXCLUDE_ARGS} --object-directory=${PROJECT_BINARY_DIR} --delete
    BYPRODUCTS ${PROJECT_BINARY_DIR}/${Coverage_NAME}
    WORKING_DIRECTORY ${PROJECT_BINARY_DIR}
    DEPENDS ${Coverage_DEPENDS}
    VERBATIM
    COMMENT "Running coverage reporting to produce summary for ${Coverage_NAME}"
  )
  add_custom_target(${Coverage_NAME}-html
    COMMAND ${Coverage_EXECUTABLE} ${Coverage_EXECUTABLE_ARGS}
    COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR}/${Coverage_NAME}
    COMMAND ${GCOVR_EXECUTABLE} --gcov-executable ${GCOVR_GCOV} --html --html-details -f ${BASEDIR} ${GCOVR_EXCLUDE_ARGS} --object-directory=${PROJECT_BINARY_DIR} -o ${PROJECT_BINARY_DIR}/${Coverage_NAME}/index.html --delete
    BYPRODUCTS ${PROJECT_BINARY_DIR}/${Coverage_NAME}
    WORKING_DIRECTORY ${PROJECT_BINARY_DIR}
    DEPENDS ${Coverage_DEPENDS}
    VERBATIM
    COMMENT "Running coverage reporting to produce HTML for ${Coverage_NAME}"
  )
  add_custom_target(${Coverage_NAME} DEPENDS ${Coverage_NAME}-summary)

  add_test(NAME ${Coverage_NAME}
    COMMAND ${CMAKE_COMMAND} --build ${PROJECT_BINARY_DIR} --target ${Coverage_NAME}-summary
    WORKING_DIRECTORY ${PROJECT_BINARY_DIR})
endfunction()
