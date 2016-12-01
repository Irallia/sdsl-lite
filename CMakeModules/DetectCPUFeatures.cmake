include(CheckCXXSourceRuns)
include(AppendCompilerFlags)

if(NOT WIN32)
  string(ASCII 27 Esc)
  set(ColourReset "${Esc}[m")
  set(ColourBold  "${Esc}[1m")
  set(Red         "${Esc}[31m")
  set(Green       "${Esc}[32m")
  set(Yellow      "${Esc}[33m")
  set(Blue        "${Esc}[34m")
  set(Magenta     "${Esc}[35m")
  set(Cyan        "${Esc}[36m")
  set(White       "${Esc}[37m")
  set(BoldRed     "${Esc}[1;31m")
  set(BoldGreen   "${Esc}[1;32m")
  set(BoldYellow  "${Esc}[1;33m")
  set(BoldBlue    "${Esc}[1;34m")
  set(BoldMagenta "${Esc}[1;35m")
  set(BoldCyan    "${Esc}[1;36m")
  set(BoldWhite   "${Esc}[1;37m")
endif()

set(CMAKE_REQUIRED_FLAGS "-msse4.2")
file(READ "CMakeModules/SSE42.cpp" test_source_sse42)
CHECK_CXX_SOURCE_RUNS("${test_source_sse42}" HAVE_SSE42)
set(CMAKE_REQUIRED_FLAGS "")

if(HAVE_SSE42)
  message(STATUS "${Green}Compiler supports SSE4.2${ColourReset}")
  if(NOT MSVC)
    CheckAndAppendCompilerFlags(${CMAKE_BUILD_TYPE} "-msse4.2")
  endif()
else()
  message(STATUS "${Red}Compiler does NOT supports SSE4.2${ColourReset}")
endif()

file(READ "CMakeModules/MODETI.cpp" test_source_modeti)
CHECK_CXX_SOURCE_RUNS("${test_source_modeti}" HAVE_MODETI)

if(HAVE_MODETI)
  message(STATUS "${Green}Compiler supports 128 bit integers${ColourReset}")
  if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
    add_definitions("/DMODE_TI")
  else()
    add_definitions("-DMODE_TI")
  endif()
else()
  message(STATUS "${Red}Compiler supports 128 bit integers${ColourReset}")
endif()