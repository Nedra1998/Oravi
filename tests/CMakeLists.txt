add_library(unit-tests-main main.cpp)
target_link_libraries(unit-tests-main PUBLIC ${PROJECT_TARGET} Catch2::Catch2)
target_include_directories(unit-tests-main PUBLIC ${PROJECT_SOURCE_DIR}/include)

set(SOURCE sample.cpp)

add_executable(unit-tests ${SOURCE})
target_include_directories(unit-tests PUBLIC ${PROJECT_SOURCE_DIR}/include)
target_link_libraries(unit-tests PRIVATE unit-tests-main)

include(CTest)
include(Catch)
catch_discover_tests(unit-tests)

include(Coverage)

configure_coverage(TARGET ${PROJECT_TARGET} NAME coverage EXECUTABLE ${PROJECT_BINARY_DIR}/unit-tests DEPENDS unit-tests EXCLUDE "tests/*" "build/*" "_deps/*" FAIL_UNDER_LINE 75)
