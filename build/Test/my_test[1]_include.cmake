if(EXISTS "/usr/src/app/workspace/UnitTests/build/Test/my_test[1]_tests.cmake")
  include("/usr/src/app/workspace/UnitTests/build/Test/my_test[1]_tests.cmake")
else()
  add_test(my_test_NOT_BUILT my_test_NOT_BUILT)
endif()