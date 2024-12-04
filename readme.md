# Unit Testing with GoogleTest

This document provides instructions for setting up and running unit tests in this project using the [GoogleTest](https://github.com/google/googletest) framework.

---

## Table of Contents
- [Prerequisites](#prerequisites)
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

## Example Workflow

1. **Add GoogleTest**:
   ```bash
   git submodule add https://github.com/google/googletest.git external/googletest
   git submodule update --init --recursive
   ```

2. **Configure and Build**:
   ```bash
   cmake -S . -B build
   cmake --build build -j12
   ```

3. **Run Tests**:
   ```bash
   GTEST_COLOR=1 ctest --test-dir build --output-on-failure -j1
   ```

---

## References

- [GoogleTest Documentation](https://github.com/google/googletest/blob/main/googletest/docs/primer.md)
- [CMake Documentation](https://cmake.org/documentation/)
- [Git Submodules Guide](https://git-scm.com/book/en/v2/Git-Tools-Submodules)