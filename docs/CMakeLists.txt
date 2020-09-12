
set(DOC_ADDITIONAL ${PROJECT_SOURCE_DIR}/README.md ${PROJECT_SOURCE_DIR}/LICENSE)
set(DOC_PAGE_DIRS ${PROJECT_SOURCE_DIR}/docs)
set(DOC_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/include)
set(DOC_SOURCE_DIRS ${PROJECT_SOURCE_DIR}/source)

if(BUILD_DOCS)
  find_package(Doxygen OPTIONAL_COMPONENTS dot mscgen dia)
  if(DOXYGEN_FOUND)
    set(DOXYGEN_DOT_IMAGE_FORMAT svg)
    set(DOXYGEN_DOT_FONTNAME "Iosevka")
    set(DOXYGEN_USE_MDFILE_AS_MAINPAGE ${PROJECT_SOURCE_DIR}/README.md)
    set(DOXYGEN_HTML_STYLESHEET ${CMAKE_CURRENT_SOURCE_DIR}/doxygen/scss-doxygen.css)
    set(DOXYGEN_HTML_HEADER ${CMAKE_CURRENT_SOURCE_DIR}/doxygen/header.html)
    set(DOXYGEN_HTML_FOOTER ${CMAKE_CURRENT_SOURCE_DIR}/doxygen/footer.html)
    set(DOXYGEN_DOT_TRANSPARENT "YES")
    set(DOXYGEN_EXTRACT_ALL "YES")
    set(DOXYGEN_STRIP_FROM_PATH "${PROJECT_SOURCE_DIR}")
    set(DOXYGEN_STRIP_FROM_INC_PATH "${PROJECT_SOURCE_DIR}/include")
    set(extra_css 
      ${CMAKE_CURRENT_SOURCE_DIR}/doxygen/scss-doxygen.css
      ${CMAKE_CURRENT_SOURCE_DIR}/doxygen/scss-search.css
      ${CMAKE_CURRENT_SOURCE_DIR}/doxygen/scss-svg.css)
    file(GLOB_RECURSE extra_icons ${CMAKE_CURRENT_SOURCE_DIR}/doxygen/icons *.svg)
    set(DOXYGEN_HTML_EXTRA_FILES ${extra_css} ${extra_icons})

    doxygen_add_docs(docs ${DOC_ADDITIONAL} ${DOC_PAGE_DIRS} ${DOC_INCLUDE_DIRS} ${DOC_SOURCE_DIRS})

    find_package(Sass)
    if(SASS_FOUND)
      add_custom_command(
        TARGET docs PRE_BUILD
        COMMAND ${SASS_EXECUTABLE} --style=compressed --no-source-map
          ${CMAKE_CURRENT_SOURCE_DIR}/doxygen/scss/doxygen.scss:${CMAKE_CURRENT_SOURCE_DIR}/doxygen/scss-doxygen.css
          ${CMAKE_CURRENT_SOURCE_DIR}/doxygen/scss/search.scss:${CMAKE_CURRENT_SOURCE_DIR}/doxygen/scss-search.css
          ${CMAKE_CURRENT_SOURCE_DIR}/doxygen/scss/svg.scss:${CMAKE_CURRENT_SOURCE_DIR}/doxygen/scss-svg.css
        COMMENT "Generating documentation css")
    else()
      message(WARNING "Could not find sass compiler, using default css")
    endif()
  else()
    message(STATUS "No documentation generators found")
  endif()
endif()
