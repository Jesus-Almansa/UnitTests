add_test([=[TestTopic.TrivialEquality]=]  /usr/src/app/workspace/UnitTests/build/UnitTests/my_test [==[--gtest_filter=TestTopic.TrivialEquality]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[TestTopic.TrivialEquality]=]  PROPERTIES WORKING_DIRECTORY /usr/src/app/workspace/UnitTests/build/UnitTests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test([=[TestTopic.MoreEqualityTests]=]  /usr/src/app/workspace/UnitTests/build/UnitTests/my_test [==[--gtest_filter=TestTopic.MoreEqualityTests]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[TestTopic.MoreEqualityTests]=]  PROPERTIES WORKING_DIRECTORY /usr/src/app/workspace/UnitTests/build/UnitTests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
set(  my_test_TESTS TestTopic.TrivialEquality TestTopic.MoreEqualityTests)
