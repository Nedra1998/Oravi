set(SOURCES sample.cpp)

add_library(${PROJECT_TARGET} ${SOURCES})
target_link_libraries(${PROJECT_TARGET} ${PROJECT_TARGET}-options ${PROJECT_TARGET}-warnings)
configure_file("${PROJECT_SOURCE_DIR}/include/version.hpp.in" "${PROJECT_SOURCE_DIR}/include/${PROJECT_TARGET}/version.hpp")
target_include_directories(${PROJECT_TARGET} PUBLIC ${PROJECT_SOURCE_DIR}/include/${PROJECT_TARGET})

configure_utils(${PROJECT_TARGET})


