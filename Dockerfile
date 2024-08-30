# Use Ubuntu as base image
FROM ubuntu:24.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV FLUTTER_VERSION=3.10.6-stable
ENV FLUTTER_HOME=/opt/flutter
ENV PATH="$FLUTTER_HOME/bin:/root/.pub-cache/bin:$PATH"

# Install required packages
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    clang \
    cmake \
    git \
    ninja-build\
    pkg-config \
    libgtk-3-dev\
    liblzma-dev \
    libstdc++-12-dev \
    rsync \
    && apt-get clean
    
# Download and install Flutter SDK
RUN git clone https://github.com/flutter/flutter.git -b stable $FLUTTER_HOME

# Run Flutter doctor to download Dart and required dependencies
RUN flutter doctor --android-licenses || true
RUN flutter doctor
RUN flutter pub global activate flutterpi_tool
RUN mkdir /app

# Set working directory
WORKDIR /app
