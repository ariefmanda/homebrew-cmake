set(SPHINX_INFO ON CACHE BOOL "")
set(SPHINX_MAN ON CACHE BOOL "")
set(SPHINX_HTML ON CACHE BOOL "")
set(SPHINX_SINGLEHTML ON CACHE BOOL "")
set(SPHINX_QTHELP ON CACHE BOOL "")
set(SPHINX_TEXT ON CACHE BOOL "")
if(NOT "$ENV{CMAKE_CI_NIGHTLY}" STREQUAL "")
  set(SPHINX_LINKCHECK ON CACHE BOOL "")
endif()
