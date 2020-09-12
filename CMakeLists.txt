# ##############################################################################
# Project Declaration
# ##############################################################################
cmake_minimum_required(VERSION 3.11 FATAL_ERROR)
project(Oravi
  VERSION 0.1.0
  DESCRIPTION "Cross-Shell Prompt"
  LANGUAGES C CXX)
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")
set(GITHUB_URL "LuxAter/Oravi")

# Set cmake policies
cmake_policy(SET CMP0079 NEW)

# Include default/custom modules
include(GenerateExportHeader)
include(WriteCompilerDetectionHeader)
include(cmake/GetGitRevisionDescription.cmake)

# Get project identifier for configured files
string(MAKE_C_IDENTIFIER ${PROJECT_NAME} PROJECT_ID)
string(TOUPPER ${PROJECT_ID} PROJECT_ID)
string(TOLOWER ${PROJECT_ID} PROJECT_TARGET)

# TODO: Improve this, and add option to not use github pages
# Parse/Generate github url and github pages url from profided git url
string(REPLACE "/" ";" GITHUB_URL ${GITHUB_URL})
list(GET GITHUB_URL 0 GITHUB_ACCOUNT)
list(GET GITHUB_URL 1 GITHUB_REPO)
set(PROJECT_URL "https://${GITHUB_ACCOUNT}.github.com/${GITHUB_REPO}")
set(PROJECT_GITHUB_URL "https://github.com/${GITHUB_ACCOUNT}/${GITHUB_REPO}")


# Options/Warning targets for configuration
add_library(${PROJECT_TARGET}-options INTERFACE)
add_library(${PROJECT_TARGET}-warnings INTERFACE)
add_library(${PROJECT_TARGET}::options ALIAS ${PROJECT_TARGET}-options)
add_library(${PROJECT_TARGET}::warnings ALIAS ${PROJECT_TARGET}-warnings)

# Protect against in source builds
if(PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
    message(FATAL_ERROR "In-source builds not allowed. Please make a new directory (called a build directory) and run CMake from there.")
endif()

# Declare/Validate CMake build type
set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  set(CMAKE_BUILD_TYPE "Debug" CACHE STRING "Build Mode" FORCE)
elseif(NOT CMAKE_CONFIGURATION_TYPES AND (NOT CMAKE_BUILD_TYPE STREQUAL "Debug" OR NOT CMAKE_BUILD_TYPE STREQUAL "Release" OR NOT CMAKE_BUILD_TYPE STREQUAL "MinSizeRel" OR NOT CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo"))
  # message(FATAL_ERROR "Invalid build type, must be one of Debug, Release, MinSizeRel, or RelWithDebInfo not ${CMAKE_BUILD_TYPE}")
endif()

# Generate all targets to the build directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR})

# Enable CTest targets
enable_testing()

# ##############################################################################
# Options
# ##############################################################################

# Target generation options
option(BUILD_DOCS "Generate documentation target" ON)
option(BUILD_TESTS "Generate testing target" ON)
option(BUILD_SHARED_LIBS "Compile as shared libraries instead of static ones" OFF)
set(CXX_VERSION "11" CACHE STRING "C++ version to use when compiling")
set(RELEASE "" CACHE STRING "Mark a release type (alpha/beta/gamma/etc.)")

# Compile time optimization options
option(ENABLE_PCH "Enable Precompiled Headers" ON)
option(ENABLE_CCACHE "Enable ccache if available" ON)

# Allow IPO only during release
if(CMAKE_BUILD_TYPE STREQUAL "Release" OR CMAKE_BUILD_TYPE STREQUAL "MinSizeRel" OR CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo")
  option(ENABLE_IPO "Enable Interprocedural Optimization, aka Link Time Optimization (LTO)" ON)
else()
  set(ENABLE_IPO OFF)
endif()

# Allow profiling/static analysis only with debug/release with debug info
if(CMAKE_BUILD_TYPE STREQUAL "Debug" OR CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo")
  option(ENABLE_PROFILING "Enable code profiling" ON)
  option(ENABLE_STATIC_ANALYSIS "Use static analysis tools at build time" ON)
else()
  set(ENABLE_PROFILING OFF)
  set(ENABLE_STATIC_ANALYSIS OFF)
endif()

# Allow coverage only during debug, and with GNU or Clang
if(CMAKE_BUILD_TYPE STREQUAL "Debug" AND (CMAKE_CXX_COMPILER_ID MATCHES "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "(Apple)?[Cc]lang"))
  option(ENABLE_COVERAGE "Enable coverage reporting" ON)
else()
  set(ENABLE_COVERAGE OFF)
endif()

# Allow automated formatting/fixing during debuging only
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
  option(ENABLE_FORMATTING "Enable formatting targets" ON)
else()
  set(ENABLE_FORMATTING OFF)
endif()

# Configure available static analizers
if(ENABLE_STATIC_ANALYSIS)
  option(ENABLE_SA_CPPCHECK "Enable Static Analyzer cppcheck if available" ON)
  option(ENABLE_SA_CLANG_TIDY "Enable Static Analyzer clang-tidy if available" ON)
else()
  set(ENABLE_SA_CPPCHECK OFF)
  set(ENABLE_SA_CLANG_TIDY OFF)
endif()

# ##############################################################################
# Version Configuration
# ##############################################################################

# Determine git commit has for versioning
get_git_head_revision(GIT_REFSPEC GIT_SHA1)
string(SUBSTRING "${GIT_SHA1}" 0 7 PROJECT_VERSION_COMMIT)
set(PROJECT_VERSION_COMMIT_FULL "${GIT_SHA1}")
if(NOT GIT_SHA1)
  set(PROJECT_VERSION_COMMIT "null")
  set(PROJECT_VERSION_COMMIT_FULL "null")
endif()

set(PROJECT_VERSION_BUILD "${PROJECT_VERSION_COMMIT}")
set(PROJECT_VERSION_CORE "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH}")

if(RELEASE STREQUAL "prod")
  set(PROJECT_VERSION_RELEASE "")
  set(PROJECT_SEMVER "${PROJECT_VERSION_CORE}+${PROJECT_VERSION_BUILD}")
elseif(RELEASE)
  set(PROJECT_VERSION_RELEASE "${RELEASE}")
  set(PROJECT_SEMVER "${PROJECT_VERSION_CORE}-${PROJECT_VERSION_RELEASE}+${PROJECT_VERSION_BUILD}")
else()
  string(TOLOWER "${CMAKE_BUILD_TYPE}" PROJECT_VERSION_RELEASE)
  set(PROJECT_SEMVER "${PROJECT_VERSION_CORE}-${PROJECT_VERSION_RELEASE}+${PROJECT_VERSION_BUILD}")
endif()

# ##############################################################################
# Build Configuration
# ##############################################################################

# Generate compile_commands.json if in debug mode
if(CMAKE_BUILD_TYPE STREQUAL "Debug" OR CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo")
  message(STATUS "Enabling compile_commands.json generation")
  set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
  if(NOT EXISTS "${PROJECT_SOURCE_DIR}/compile_commands.json")
    execute_process(COMMAND ${CMAKE_COMMAND} -E create_symlink ${PROJECT_BINARY_DIR}/compile_commands.json ${PROJECT_SOURCE_DIR}/compile_commands.json)
  endif()
endif()

# Configure ccache for compile time improvements
if(ENABLE_CCACHE)
  # TODO: Convert to find_package
  find_program(CCACHE ccache)
  if (CCACHE)
    message(STATUS "found ccache(${CCACHE})")
    set(CMAKE_CXX_COMPILER_LAUNCHER ${CCACHE})
  else()
    message(STATUS "could not find ccache")
  endif()
endif()

# Configure Interprocedural Optimization
if(ENABLE_IPO)
  include(CheckIPOSupported)
  check_ipo_supported(RESULT IPO_SUPPORT OUTPUT IPO_SUPPORT_MSG)
  if(IPO_SUPPORT)
    message(STATUS "Enabling Interprocedural Optimizations")
    set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)
  else()
    message(STATUS "IPO is not supported: ${IPO_SUPPORT_MSG}")
  endif()
endif()

# Configure the desired c++ version
if(CXX_VERSION STREQUAL "98")
  target_compile_features(${PROJECT_TARGET}-options INTERFACE cxx_std_98)
elseif(CXX_VERSION STREQUAL "11")
  target_compile_features(${PROJECT_TARGET}-options INTERFACE cxx_std_11)
elseif(CXX_VERSION STREQUAL "14")
  target_compile_features(${PROJECT_TARGET}-options INTERFACE cxx_std_14)
elseif(CXX_VERSION STREQUAL "17")
  target_compile_features(${PROJECT_TARGET}-options INTERFACE cxx_std_17)
elseif(CXX_VERSION STREQUAL "20")
  target_compile_features(${PROJECT_TARGET}-options INTERFACE cxx_std_20)
endif()

# ##############################################################################
# Warnings
# ##############################################################################

# Enable all warnings
set(MSVC_WARNINGS /W4 /w14242 /w14254 /w14263 /w14265 /w14287 /we4289 /w14296 /w14311 /w14545 /w14546 /w14547 /w14549 /w14555 /w14619 /w14640 /w14826 /w14905 /w14906 /w14928)
set(CLANG_WARNINGS -Wall -Wextra -Wno-shadow -Wnon-virtual-dtor -Wno-old-style-cast -Wno-cast-align -Wunused -Woverloaded-virtual -Wpedantic -Wconversion -Wno-implicit-int-conversion -Wno-sign-conversion -Wno-sign-compare -Wnull-dereference -Wno-double-promotion -Wno-implicit-float-conversion -Wno-shorten-64-to-32 -Wno-float-conversion -Wno-unused-parameter -Wno-macro-redefined -Wformat=2)

# Configure warnings as errors
if(WARNINGS_AS_ERRORS)
  set(CLANG_WARNINGS ${CLANG_WARNINGS} -Werror)
  set(MSVC_WARNIGNS ${MSVC_WARNINGS} /Wx)
endif()

# Additional GCC warnings
set(GCC_WARNINGS ${CLANG_WARNINGS} -Wmisleading-indentation -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wuseless-cast)

if(MSVC)
  target_compile_options(${PROJECT_TARGET}-warnings INTERFACE ${MSVC_WARNINGS})
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
  target_compile_options(${PROJECT_TARGET}-warnings INTERFACE ${GCC_WARNINGS})
else()
  target_compile_options(${PROJECT_TARGET}-warnings INTERFACE ${CLANG_WARNINGS})
endif()

# Enable coverage reporting compile commands
if(ENABLE_COVERAGE)
  target_compile_options(${PROJECT_TARGET}-options INTERFACE -g -fprofile-arcs -ftest-coverage)
endif()

# ##############################################################################
# Static Analysis/Formatting
# ##############################################################################

# Include modules defining targets and functions
include(cmake/Format.cmake)
include(cmake/StaticAnalysis.cmake)

# Configure function that supplies both static analysis and formatting as available
function(configure_utils target)
  configure_analyze(${target})
  configure_format(${target})
  if(TARGET ${target}-analyze AND TARGET ${target}-format)
    add_custom_target(${target}-util DEPENDS ${target}-format ${target}-analyze COMMENT "Running automated checks for ${target}")
    add_custom_target(${target}-util-fix DEPENDS ${target}-format-fix ${target}-analyze-fix COMMENT "Fixing automated issues for ${target}")
  elseif(TARGET ${target}-analyze)
    add_custom_target(${target}-util DEPENDS ${target}-analyze COMMENT "Running automated checks for ${target}")
    add_custom_target(${target}-util-fix DEPENDS ${target}-analyze-fix COMMENT "Fixing automated issues for ${target}")
  elseif(TARGET ${target}-format)
    add_custom_target(${target}-util DEPENDS ${target}-format COMMENT "Running automated checks for ${target}")
    add_custom_target(${target}-util-fix DEPENDS ${target}-format-fix COMMENT "Fixing automated issues for ${target}")
  else()
    message(STATUS "not automated utilities found for static analysis or formatting of ${target}")
  endif()
endfunction()

# ##############################################################################
# Dependencies
# ##############################################################################

# Include fetch content module, for content retrival at configure time
include(FetchContent)

# Custom FetchContent_MakeAvailable macro
macro(FetchContent_MakeAvailable)
  foreach(contentName IN ITEMS ${ARGV})
    string(TOLOWER ${contentName} contentNameLower)
    FetchContent_GetProperties(${contentName})
    if(NOT ${contentNameLower}_POPULATED)
      message(STATUS "Fetching content: ${contentName}")
      FetchContent_Populate(${contentName})
      set(__fc_srcdir "${${contentNameLower}_SOURCE_DIR}")
      __FetchContent_getSavedDetails(${contentName} contentDetails)
      if("${contentDetails}" STREQUAL "")
        message(FATAL_ERROR "No details have been set for content: ${contentName}")
      endif()
      cmake_parse_arguments(__fc_arg "" "SOURCE_SUBDIR" "" ${contentDetails})
      if(NOT "${__fc_arg_SOURCE_SUBDIR}" STREQUAL "")
        string(APPEND __fc_srcdir "/${__fc_arg_SOURCE_SUBDIR}")
      endif()
      if(EXISTS ${__fc_srcdir}/CMakeLists.txt)
        add_subdirectory(${__fc_srcdir} ${${contentNameLower}_BINARY_DIR})
      endif()
      unset(__fc_srcdir)
    endif()
  endforeach()
endmacro()

# Catch2 for testing
FetchContent_Declare(Catch2 GIT_REPOSITORY https://github.com/catchorg/Catch2.git GIT_TAG v2.12.4 GIT_PROGRESS TRUE)
FetchContent_MakeAvailable(Catch2)

# ##############################################################################
# Targets
# ##############################################################################

# Main source code/library target
add_subdirectory(source)
# Testing target
if(BUILD_TESTS)
add_subdirectory(tests)
endif()
# Documentation target
if(BUILD_DOCS)
add_subdirectory(docs)
endif()

# ##############################################################################
# Configuration Report
# ##############################################################################

# Report project version at configure time
message(STATUS "${PROJECT_NAME} v${PROJECT_SEMVER}")
