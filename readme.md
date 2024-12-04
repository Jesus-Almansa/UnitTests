Here is the updated `README.md` with the explanation about having multiple `CMakeLists.txt` files added:

---

# Unit Testing with GoogleTest

This document provides instructions for setting up and running unit tests in this project using the [GoogleTest](https://github.com/google/googletest) framework.

---

## Table of Contents
- [Prerequisites](#prerequisites)
- [Project Structure and CMakeLists.txt Files](#project-structure-and-cmakeliststxt-files)
- [Adding GoogleTest as a Submodule](#adding-googletest-as-a-submodule)
- [Configuring the Build](#configuring-the-build)
- [Running the Tests](#running-the-tests)
- [Debugging Tests](#debugging-tests)

---

## Prerequisites

Ensure the following tools are installed:
- **CMake** (version 3.16 or later)
- A compatible C++ compiler (e.g., GCC or Clang)
- **Git** for version control

---

## Project Structure and `CMakeLists.txt` Files

This project uses multiple `CMakeLists.txt` files to organize the build system. Each file has a specific role:

### **Top-Level `CMakeLists.txt`**
Located in the root directory of the project, this file serves as the entry point for configuring the entire project.

#### Responsibilities:
- Sets global project settings (e.g., project name, minimum required CMake version).
- Includes subdirectories (e.g., `Test`, `src`) using the `add_subdirectory` command.
- Manages external dependencies, such as GoogleTest.

Example:
```cmake
cmake_minimum_required(VERSION 3.16)
project(MyProject)

add_subdirectory(Test)
add_subdirectory(src)
add_subdirectory(external/googletest)
```

### **Subdirectory `CMakeLists.txt`**
Each subdirectory (e.g., `Test`, `src`) contains its own `CMakeLists.txt` file to handle configuration for its specific component.

#### Responsibilities:
- Defines targets (e.g., executables, libraries) for the subdirectory.
- Sets include paths, compiler flags, and links dependencies specific to that component.

Example (from `Test/CMakeLists.txt`):
```cmake
add_executable(my_test my_test.cpp)
target_link_libraries(my_test PRIVATE gtest gtest_main)
```

### Why This Structure?
- **Modularity**: Simplifies management of different components, such as source code and tests.
- **Scalability**: Supports large projects by breaking the build process into manageable sections.
- **Reusability**: Allows independent compilation and testing of components.

---

## Adding GoogleTest as a Submodule

GoogleTest is included as a submodule in this project. If you're adding it for the first time, follow these steps:

1. **Initialize Git Repository** (if not already done):
   ```bash
   git init
   ```

2. **Add GoogleTest as a Submodule**:
   ```bash
   git submodule add https://github.com/google/googletest.git external/googletest
   ```

3. **Initialize and Update Submodules**:
   ```bash
   git submodule update --init --recursive
   ```

4. **Commit Changes**:
   ```bash
   git commit -am "Added GoogleTest as a submodule"
   ```

---

## Configuring the Build

1. **Generate Build Files**:
   Use CMake to configure the project and generate build files:
   ```bash
   cmake -S . -B build
   ```

   - `-S .`: Specifies the source directory containing `CMakeLists.txt`.
   - `-B build`: Specifies the directory where build files will be generated.

2. **Build the Project**:
   Compile the project, including the tests:
   ```bash
   cmake --build build -j12
   ```

   - `-j12`: Runs the build process with 12 parallel jobs for faster compilation.

---

## Running the Tests

1. **Execute Tests with CTest**:
   Run the tests using the `ctest` tool:
   ```bash
   GTEST_COLOR=1 ctest --test-dir build --output-on-failure -j1
   ```

   - `GTEST_COLOR=1`: Enables colored output for GoogleTest results.
   - `--output-on-failure`: Prints detailed information for any failing tests.
   - `-j1`: Runs tests sequentially to avoid interleaved output.

2. **Analyze the Results**:
   The summary output indicates how many tests passed or failed. Use the detailed failure messages to debug any issues.

---

## Debugging Tests

- **Run a Specific Test**:
  To isolate a failing test, use:
  ```bash
  ctest -R <test_name> --output-on-failure
  ```

- **Verbose Output**:
  Add the `-V` flag for more detailed logs:
  ```bash
  ctest --output-on-failure -V
  ```

- **Check Test Logic**:
  Ensure that test assertions (e.g., `EXPECT_EQ`, `ASSERT_TRUE`) match the intended behavior.

---

## Troubleshooting

1. **Submodule Issues**:
   If GoogleTest is not properly added as a submodule, remove the `external/googletest` directory and re-add it:
   ```bash
   git rm -r --cached external/googletest
   rm -rf external/googletest
   git submodule add https://github.com/google/googletest.git external/googletest
   ```

2. **Build Errors**:
   Ensure all source files are properly included in the `CMakeLists.txt` file. For example:
   ```cmake
   add_executable(my_test my_test.cpp)
   ```

3. **Test Failures**:
   Check the implementation of your functions and test cases for discrepancies.

---

Let me know if you have more ideas to include!