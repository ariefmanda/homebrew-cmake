SET(CMAKE_LIBRARY_PATH_FLAG "-LIBPATH:")
SET(CMAKE_LINK_LIBRARY_FLAG "")

# create a shared C++ library
SET(CMAKE_CXX_CREATE_SHARED_LIBRARY 
 "link @<<\n  /out:<TARGET> /dll <OBJECTS> <LINK_LIBRARIES> \n<<")

SET(CMAKE_CXX_CREATE_SHARED_MODULE ${CMAKE_CXX_CREATE_SHARED_LIBRARY})

# create a C shared library
SET(CMAKE_C_CREATE_SHARED_LIBRARY ${CMAKE_CXX_CREATE_SHARED_LIBRARY})

# create a C shared module just copy the shared library rule
SET(CMAKE_C_CREATE_SHARED_MODULE ${CMAKE_C_CREATE_SHARED_LIBRARY})


# create a C++ static library
SET(CMAKE_CXX_CREATE_STATIC_LIBRARY  "lib /nologo /out:<TARGET> <OBJECTS> ")

# create a C static library
SET(CMAKE_C_CREATE_STATIC_LIBRARY ${CMAKE_CXX_CREATE_STATIC_LIBRARY})

# compile a C++ file into an object file
SET(CMAKE_CXX_COMPILE_OBJECT
    "<CMAKE_CXX_COMPILER>  @<<\n -DWIN32 /Fo<OBJECT> <FLAGS> -c <SOURCE>\n<<")

# compile a C file into an object file
SET(CMAKE_C_COMPILE_OBJECT
    "<CMAKE_C_COMPILER> @<<\n -DWIN32 /Fo<OBJECT>  <FLAGS> -c <SOURCE>\n<<")


SET(CMAKE_C_LINK_EXECUTABLE
    "<CMAKE_C_COMPILER> @<<\n <CMAKE_C_LINK_FLAGS> <FLAGS> <OBJECTS> /Fe<TARGET> -link <LINK_FLAGS> <LINK_LIBRARIES>\n<<")

SET(CMAKE_COMPILE_RESOURCE "rc <FLAGS> /fo<OBJECT> <SOURCE>")

SET(CMAKE_CXX_LINK_EXECUTABLE
    "<CMAKE_CXX_COMPILER> @<<\n <CMAKE_CXX_LINK_FLAGS> <FLAGS> <OBJECTS> /Fe<TARGET> -link <LINK_FLAGS> <LINK_LIBRARIES>\n<<")

SET (CMAKE_BUILD_TYPE Debug CACHE STRING 
     "Choose the type of build, options are: Debug Release RelWithDebInfo MinSizeRel.")

SET(CMAKE_CREATE_WIN32_EXE /subsystem:windows)

IF(NOT CMAKE_CXX_FLAGS)
  SET (CMAKE_CXX_FLAGS "/nologo /W3 /Zm1000 /GX /GR")
  SET (CMAKE_CXX_FLAGS_DEBUG "/MDd /Zi /Od /GZ")
  SET (CMAKE_CXX_FLAGS_MINSIZEREL "/MD /O1")
  SET (CMAKE_CXX_FLAGS_RELEASE "/MD /O2")
  SET (CMAKE_CXX_FLAGS_RELWITHDEBINFO "/MD /Zi /O2")
ENDIF(NOT CMAKE_CXX_FLAGS)
IF(NOT CMAKE_C_FLAGS)
  SET (CMAKE_C_FLAGS "/nologo /W3 /Zm1000")
ENDIF(NOT CMAKE_C_FLAGS)


SET (CMAKE_STANDARD_LIBRARIES "kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib  kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib" CACHE STRING 
     "Libraries linked by defalut with all applications.")
MARK_AS_ADVANCED(CMAKE_STANDARD_LIBRARIES)

FIND_PROGRAM(CMAKE_MAKE_PROGRAM NAMES nmake )
SET(CMAKE_BUILD_TOOL ${CMAKE_MAKE_PROGRAM} CACHE INTERNAL 
     "What is the target build tool cmake is generating for.")
