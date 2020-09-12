if(ENABLE_STATIC_ANALYSIS)
  if(ENABLE_SA_CLANG_TIDY)
    find_package(ClangTidy)
  endif()
  if(ENABLE_SA_CPPCHECK)
    find_package(CppCheck)
  endif()

  if(CLANGTIDY_FOUND AND CPPCHECK_FOUND)
    add_custom_target(analyze
      COMMAND find ${PROJECT_SOURCE_DIR}/ -path ${PROJECT_BINARY_DIR} -prune -o -iname *.hpp -o -iname *.cpp -exec ${CLANGTIDY_EXECUTABLE} --warnings-as-errors {} + 
      COMMAND ${CPPCHECK_EXECUTABLE} . -i ${PROJECT_BINARY_DIR} -I ${PROJECT_SOURCE_DIR}/include
      WORKING_DIRECTORY ${PROJECT_SOURCE_DIR} 
      COMMENT "Running static analysis tests")
    add_custom_target(analyze-fix
      COMMAND find ${PROJECT_SOURCE_DIR}/ -path ${PROJECT_BINARY_DIR} -prune -o -iname *.hpp -o -iname *.cpp -exec ${CLANGTIDY_EXECUTABLE} --fix --warnings-as-errors {} +
      WORKING_DIRECTORY ${PROJECT_SOURCE_DIR} 
      COMMENT "Fixing static analysis issues")
    add_test(NAME clang-tidy
      COMMAND find ${PROJECT_SOURCE_DIR}/ -path ${PROJECT_BINARY_DIR} -prune -o -iname *.hpp -o -iname *.cpp -exec ${CLANGTIDY_EXECUTABLE} --warnings-as-errors {} + 
      WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})
    add_test(NAME cppcheck
      COMMAND ${CPPCHECK_EXECUTABLE} . -i ${PROJECT_BINARY_DIR} -I ${PROJECT_SOURCE_DIR}/include
      WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})
  elseif(CLANGTIDY_FOUND)
    add_custom_target(analyze
      COMMAND find ${PROJECT_SOURCE_DIR}/ -path ${PROJECT_BINARY_DIR} -prune -o -iname *.hpp -o -iname *.cpp -exec ${CLANGTIDY_EXECUTABLE} --warnings-as-errors {} + 
      WORKING_DIRECTORY ${PROJECT_SOURCE_DIR} 
      COMMENT "Running static analysis tests")
    add_custom_target(analyze-fix
      COMMAND find ${PROJECT_SOURCE_DIR}/ -path ${PROJECT_BINARY_DIR} -prune -o -iname *.hpp -o -iname *.cpp -exec ${CLANGTIDY_EXECUTABLE} --fix --warnings-as-errors {} +
      WORKING_DIRECTORY ${PROJECT_SOURCE_DIR} 
      COMMENT "Fixing static analysis issues")
    add_test(NAME clang-tidy
      COMMAND find ${PROJECT_SOURCE_DIR}/ -path ${PROJECT_BINARY_DIR} -prune -o -iname *.hpp -o -iname *.cpp -exec ${CLANGTIDY_EXECUTABLE} --warnings-as-errors {} + 
      WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})
  elseif(CPPCHECK_FOUND)
    add_custom_target(analyze
      COMMAND ${CPPCHECK_EXECUTABLE} . -i ${PROJECT_BINARY_DIR} -I ${PROJECT_SOURCE_DIR}/include
      WORKING_DIRECTORY ${PROJECT_SOURCE_DIR} 
      COMMENT "Running static analysis tests")
    add_custom_target(analyze-fix
      WORKING_DIRECTORY ${PROJECT_SOURCE_DIR} 
      COMMENT "Fixing static analysis issues")
    add_test(NAME cppcheck
      COMMAND ${CPPCHECK_EXECUTABLE} . -i ${PROJECT_BINARY_DIR} -I ${PROJECT_SOURCE_DIR}/include
      WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})
  else()
    message(STATUS "no static analyzers found for analysis")
  endif()
endif()

function(configure_analyze target)
  if(ENABLE_STATIC_ANALYSIS)
    get_target_property(target_sources ${target} SOURCES)
    get_target_property(target_include_directories ${target} INCLUDE_DIRECTORIES)
    list(JOIN target_include_directories ";-I" cppcheck_include_directories)
    string(PREPEND cppcheck_include_directories "-I")
    set(cppcheck_include_directories ${cppcheck_include_directories})
    if(CLANGTIDY_EXECUTABLE AND CPPCHECK_FOUND)
      add_custom_target(${target}-analyze
        COMMAND find ${target_include_directories} -iname *.hpp -exec ${CLANGTIDY_EXECUTABLE} --warnings-as-errors ${target_sources} {} +
        COMMAND ${CPPCHECK_EXECUTABLE} ${target_sources} ${cppcheck_include_directories}
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        COMMENT "Runnign static analysis tests for ${target}")
      add_custom_target(${target}-analyze-fix 
        COMMAND find ${target_include_directories} -iname *.hpp -exec ${CLANGTIDY_EXECUTABLE} --fix --warnings-as-errors ${target_sources} {} +
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        COMMENT "Fixing static analysis issues for ${target}")
    elseif(CLANGTIDY_EXECUTABLE)
      add_custom_target(${target}-analyze
        COMMAND find ${target_include_directories} -iname *.hpp -exec ${CLANGTIDY_EXECUTABLE} --warnings-as-errors ${target_sources} {} +
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        COMMENT "Runnign static analysis tests for ${target}")
      add_custom_target(${target}-analyze-fix 
        COMMAND find ${target_include_directories} -iname *.hpp -exec ${CLANGTIDY_EXECUTABLE} --fix --warnings-as-errors ${target_sources} {} +
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        COMMENT "Fixing static analysis issues for ${target}")
    elseif(CPPCHECK_FOUND)
      add_custom_target(${target}-analyze
        COMMAND ${CPPCHECK_EXECUTABLE} ${target_sources} ${cppcheck_include_directories}
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        COMMENT "Runnign static analysis tests for ${target}")
      add_custom_target(${target}-analyze-fix 
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        COMMENT "Fixing static analysis issues for ${target}")
    else()
      message(STATUS "no static analyzers found for analysis of ${target}")
    endif()
  endif()
endfunction()
