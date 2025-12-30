# C++ Hello World app in a Dev Container

This repository contains a development environment setup for C++ projects using VS Code Dev Containers.

## Features

- Develop in a consistent environment using Dev Containers.
- Basic Hello World C++ application.
- The application supported the following target platforms.
    - Compiled for Windows using the MinGW toolchain.
    - Compiled for Native Linux using the g++ toolchain.
- installed vulkan sdk and glfw3 for future graphics programming.

## Pre-requisites

Make sure you follow the guide in the root of this project

## Dev Container Configuration

The Dev Container is configured using the [.devcontainer]folder, which contains:

- `devcontainer.json`: Configuration file for the Dev Container.
- `Dockerfile`: Defines the Docker image used for the Dev Container.

## How to Run the Hello World App

To run the hello world, use:

```sh
    mkdir -p build && cd build
    # For Windows
    cmake -DCMAKE_TOOLCHAIN_FILE=../mingw-toolchain.cmake ..
    make
    ./hello-world-windows.exe

    # For Linux
    cmake ..
    make
    ./hello-world-linux

```

## Additional Information

- The Dev Container ensures a consistent development environment across different machines.
- You can customize the Dev Container by modifying the `devcontainer.json` and `Dockerfile`.