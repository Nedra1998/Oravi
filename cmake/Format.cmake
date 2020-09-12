if(ENABLE_FORMATTING)
  find_package(ClangFormat)
  if(CLANGFORMAT_FOUND)
    if(CLANGFORMAT_VERSION VERSION_GREATER_EQUAL "10.0.0")
      set(CLANGFORMAT_DRYRUN "--dry-run" "-Werror")
    else()
      set(CLANGFORMAT_DRYRUN)
    endif()
    add_custom_target(format
      COMMAND find ${PROJECT_SOURCE_DIR}/ -path ${PROJECT_BINARY_DIR} -prune -o -iname *.hpp -o -iname *.cpp -exec ${CLANGFORMAT_EXECUTABLE} ${CLANGFORMAT_DRYRUN} {} +
      WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
      COMMENT "Running formatting tests")
    add_custom_target(format-fix
      COMMAND find ${PROJECT_SOURCE_DIR}/ -path ${PROJECT_BINARY_DIR} -prune -o -iname *.hpp -o -iname *.cpp -exec ${CLANGFORMAT_EXECUTABLE} -i {} +
      WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
      COMMENT "Fixing formatting issues")
    add_test(NAME clang-format
      COMMAND find ${PROJECT_SOURCE_DIR}/ -path ${PROJECT_BINARY_DIR} -prune -o -iname *.hpp -o -iname *.cpp -exec ${CLANGFORMAT_EXECUTABLE} ${CLANGFORMAT_DRYRUN} {} +
      WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})
  else()
    message(STATUS "no formatters found for formatting")
  endif()
endif()
function(configure_format target)
  if(ENABLE_FORMATTING)
    get_target_property(target_sources ${target} SOURCES)
    get_target_property(target_include_directories ${target} INCLUDE_DIRECTORIES)
    if(CLANGFORMAT_FOUND)
      add_custom_target(${target}-format
        COMMAND find ${target_include_directories} -iname *.hpp -exec ${CLANGFORMAT_EXECUTABLE} ${CLANGFORMAT_DRYRUN} ${target_sources} {} +
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        COMMENT "Running formatting tests for ${target}")
      add_custom_target(${target}-format-fix
        COMMAND find ${target_include_directories} -iname *.hpp -exec ${CLANGFORMAT_EXECUTABLE} -i ${target_sources} {} +
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        COMMENT "Fixing formatting issues for ${target}")
    else()
      message(STATUS "No formatters found for formatting of ${target}")
    endif()
  endif()
endfunction()
