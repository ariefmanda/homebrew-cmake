if(actual_stdout MATCHES "CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION='([^']+)'")
  set(actual_version "${CMAKE_MATCH_1}")
  if(NOT "${actual_version}" STREQUAL "${expect_version}")
    set(RunCMake_TEST_FAILED "Actual SDK version '${actual_version}' did not match expected '${expect_version}'")
    return()
  endif()
else()
  set(RunCMake_TEST_FAILED "No CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION found in output.")
endif()
