# Fetch base image
FROM ubuntu:24.04

# Install C++ development tools and Vulkan SDK
RUN apt-get update && \
    apt-get install -y build-essential gcc g++ gdb cmake make mingw-w64 pkg-config && \
    apt-cache search vulkan | grep -E "^lib|^vulkan" && \
    apt-get install -y \
    libvulkan1 \
    libvulkan-dev \
    vulkan-tools || true
