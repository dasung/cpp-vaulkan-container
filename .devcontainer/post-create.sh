#!/bin/bash

# Exit on error
set -e

echo "Starting post-create setup..."

# Verify C++ compiler environment
echo "Verifying C++ compiler environment..."
which gcc
gcc --version
which g++
g++ --version

echo "Verifying CMake..."
which cmake
cmake --version

echo "Verifying MinGW cross-compiler..."
which x86_64-w64-mingw32-g++
x86_64-w64-mingw32-g++ --version

echo "Verifying Vulkan SDK..."
if command -v pkg-config &> /dev/null && pkg-config --exists vulkan; then
    echo "Vulkan version: $(pkg-config --modversion vulkan)"
    which vulkaninfo || echo "Warning: vulkaninfo not found"
else
    echo "Warning: Vulkan SDK not fully installed or pkg-config not available"
    echo "You may need to install Vulkan SDK manually for graphics development"
fi

echo "Post-create setup completed successfully"
