cmake_minimum_required(VERSION 3.22)

project(CppProjectTemplate VERSION 1.0.0 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

option(ENABLE_TEST "Enable Unit Test Build" OFF)

option(ENABLE_WARNINGS "Enable Warnings" ON)
option(ENABLE_WARNINGS_AS_ERRORS "Enable Warnings as Errors" ON)

set(LIBRARY_NAME Library)
set(EXECUTABLE_NAME Executable)

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")
include(AddGitSubmodule)
include(FetchContent)

if(ENABLE_WARNINGS)
  include(Warnings)
endif()

FetchContent_Declare(
  nlohmann_json
  GIT_REPOSITORY https://github.com/nlohmann/json
  GIT_TAG v3.11.3
  GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(nlohmann_json)

FetchContent_Declare(
  fmt
  GIT_REPOSITORY https://github.com/fmtlib/fmt
  GIT_TAG 9.1.0
  GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(fmt)

FetchContent_Declare(
  spdlog
  GIT_REPOSITORY https://github.com/gabime/spdlog
  GIT_TAG v1.11.0
  GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(spdlog)

FetchContent_Declare(
  cxxopts
  GIT_REPOSITORY https://github.com/jarro2783/cxxopts
  GIT_TAG v3.0.0
  GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(cxxopts)


if (ENABLE_TEST)
  FetchContent_Declare(
    Catch2
    GIT_REPOSITORY https://github.com/catchorg/Catch2
    GIT_TAG v3.5.3
    GIT_SHALLOW TRUE
  )
  FetchContent_MakeAvailable(Catch2)
  list(APPEND CMAKE_MODULE_PATH ${catch2_SOURCE_DIR}/extras)
endif()


add_subdirectory(configured)
add_subdirectory(external)
add_subdirectory(src)

if (ENABLE_TEST)
  include(CTest)
  enable_testing()
  add_subdirectory(tests)
endif()


option(COMPILE_EXECUTABLE "Wheter to compile the executable" ON)
if (COMPILE_EXECUTABLE)
  add_subdirectory(app)
else()
  message("Without executable compilation")
endif()