cmake_minimum_required(VERSION 3.16..3.24)
project(try_googletest VERSION 0.0.1
                    DESCRIPTION "Try googletest"
                    LANGUAGES CXX)
# Enable testing for this project
include(CTest)
# Add subdirectories with code
add_subdirectory(external)
add_subdirectory(UnitTests)