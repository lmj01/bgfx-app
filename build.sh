#!/bin/bash

# Check if the "wasm" parameter was provided
if [ "$1" == "wasm" ]; then
    echo "Building for WebAssembly..."

    # Activate Emscripten environment
     source "/Users/paulo/Developer/workspaces/cpp/emsdk/emsdk_env.sh"

    # Create and navigate to WebAssembly build directory
    rm -rf build/
    mkdir -p build
    cd build

    # Configure and compile using Emscripten
    emcmake cmake ..
    emmake make

    mv *.html index.html

    echo "Application build completed"
else
    # Original native compilation
    echo "Building native version..."
    rm -rf build/
    mkdir build
    cd build
    cmake ..
    make
    echo "Application build completed"
    ./app
fi
