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

# Additional Information
- Dev Containers are Linux containers, a configuration that works everywhere windows/mac or Linux.
- The Dev Container ensures a consistent development environment across different machines.
- You can customize the Dev Container by modifying the `devcontainer.json` and `Dockerfile`.

### What is a Dev Container?
  * A Dev Container (Development Container) is a fully-configured, containerized development environment that runs inside a **Docker/Podman** container.

#### .devcontainer folder

    ```
    python-basic-pip/                   
    ├── .devcontainer/                  
    │   ├── devcontainer.json           # specify where docker file and VS code extensions to install
    │   ├── Dockerfile                  # defines a custom container image
    │   ├── docker-compose.yml          # orchestrate services (e.g., app + database + cache)
    │   └── post-create.sh
    ├── .gitignore
    ├── src/
    │   └── main.cpp
    ├── README.md
    └── .git/
    ```

#### Dev Container and Docker Relationship

* Dev Container = The Blueprint
  * specification for how to configure a development environment 
  * eg: The .devcontainer folder 

* Docker/Podman = The container Engine
  * Creates, runs, and manages containers
  * eg: Docker Desktop, Podman

    ```
    Dev Container (the concept/specification): The Blueprint
        ↓
    Container Engine (Docker or Podman): The Engine
        ↓
    Container Runtime (runs the actual container)
        ↓
    Linux Kernel (WSL2 in your case)
    ```

#### Podman
  * This is an <span style="color:red">alternative to Docker</span>.
  * Docker runs a central deamon process (dockerd) with root privileges.
  * Podman is daemonless and can run rootless containers - simple architecture.

#### Why WSL2?
  * Dev Containers run on Linux: Dev Containers are Linux-based containers.
  * WSL2 provides a Linux kernel on Windows

### How to Run Dev Containers

1. Open WSL2 Terminal -> $wsl
2. Navigate to the folder of the Dev Container you want to run, e.g.:
   ```bash
   cd ~/cpp-vaulkan-container
   ```
3. Open the folder in VS Code:
   ```bash
   code .
   ```

    - In VS Code, press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac) to open the Command Palette.
    - Type `Dev Containers: Reopen in Container` and select it.
    - Wait for the container to build and start. This may take a few minutes the first time.

5. VS Code reads the devcontainer.json file to find the Dockerfile path.

        ```
        a) VS Code Reading devcontainer.json
            ↓
        b) VS Code calls Podman to read Dockerfile Line-by-Line
                FROM bamps.king.com/king-dev-ubuntu24.04:1.5.6
            ↓
        c) Uses BAMP_USER and BAMP_TOKEN from your environment
            ↓
        d) Pulls cpp base image from bamps.king.com
            ↓
        e) Podman builds the container image using the Dockerfile instructions
                In devcontainer.json
                "build": {
                    "dockerfile": "Dockerfile",  // ← Points to the Dockerfile
                    "args": {
                        "BAMP_USER": "${localEnv:BAMP_USER}",
                        "BAMP_TOKEN": "${localEnv:BAMP_TOKEN}"
                    }
                }
        ```        

6. Podmas executes remaining Dockerfile commands to set up the environment
    - Installs mingw-w64, g++, cmake, vulkan-sdk, glfw3 
7. Podman Creates Final Image
8. Podman runs container from final image
9. VS Code connects to the running container
10. Now you can start coding inside container

 - ✅ A Linux container running g++ and MinGW toolchains
 - ✅ VS Code connected to the container
 - ✅ Terminal opened inside the container
 - ✅ Your project files mounted and accessible
 - ✅ Ready to run C++ code with g++ and MinGW



#### Why BAMS?
  - This is a custom, private base image hosted on kings's organizational software factory
  - It's NOT a public image from Docker Hub
  - Requires authentication to pull

#### How to install dependencies in Dev Container

  * Using post-create.sh script
  * Using devcontainer.json "postCreateCommand" (Run Time - pip, npm, dotnet)
  * Using Dockerfile RUN commands (Build Time - OS, pip, compilers)

