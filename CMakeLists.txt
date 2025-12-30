cmake_minimum_required(VERSION 3.10)
project(HelloCpp)

# Set C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Detect platform
if(WIN32 OR MINGW OR CMAKE_CROSSCOMPILING)
    set(TARGET_PLATFORM "Windows")
    set(EXECUTABLE_SUFFIX ".exe")
else()
    set(TARGET_PLATFORM "Linux")
    set(EXECUTABLE_SUFFIX "")
endif()

message(STATUS "Building for: ${TARGET_PLATFORM}")
message(STATUS "Compiler: ${CMAKE_CXX_COMPILER}")

# Platform-specific compiler flags
if(MINGW OR CMAKE_CROSSCOMPILING)
    add_compile_definitions(PLATFORM_WINDOWS)
    # MinGW-specific flags
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -static-libgcc -static-libstdc++")
else()
    add_compile_definitions(PLATFORM_LINUX)
    # Linux-specific flags
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")
endif()

# Add executable
add_executable(hello hello.cpp)

# Set output name with platform suffix
set_target_properties(hello PROPERTIES OUTPUT_NAME "hello-${TARGET_PLATFORM}${EXECUTABLE_SUFFIX}")
