# BGFX 3D Rendering Demo

A simple 3D rendering project using [bgfx](https://github.com/bkaradzic/bgfx) that displays a rotating cube. The project supports both native (desktop) builds and WebAssembly compilation via Emscripten.

## Requirements

### For Native Builds
- CMake 3.15 or higher
- C++17 compatible compiler (GCC, Clang, MSVC)
- Git

### For WebAssembly/Emscripten Builds
- Everything above, plus:
- Emscripten SDK (emsdk) installed and activated
- Python 3 (required by Emscripten)

## Building

### Native Build (Desktop)

```bash
# Using build script
./build.sh

# Or manually:
mkdir -p build && cd build
cmake ..
cmake --build .
```

### WebAssembly Build (Browser)

```bash
# Using build script
./build.sh wasm

# Or manually:
# First, activate Emscripten environment
source path/to/emsdk/emsdk_env.sh

# Create a build directory for WebAssembly
mkdir -p build_wasm && cd build_wasm

# Configure with Emscripten
emcmake cmake ..

# Build the project
emmake make
```

The CMake configuration automatically downloads and builds bgfx and its dependencies for either platform.

## Running

### Native Application

After building, you can run the native application from the build directory:

```bash
# Run from the build directory
./app

# Or use the build script which builds and runs
./build.sh
```

### WebAssembly Application

For the WebAssembly version, after building:

1. Navigate to the `build_wasm` directory
2. Serve the directory using a local web server:
   ```bash
   # Using Python's built-in server
   python -m http.server

   # Or using Node.js http-server if installed
   http-server .
   ```
3. Open your browser and navigate to `http://localhost:8000` (or the port specified by your server)

## Controls

- Close the window to exit the application
- For WebAssembly version, use your browser's controls

## Project Structure

- `CMakeLists.txt` - CMake build configuration with support for both native and Emscripten builds
- `main.cpp` - Main application code with a 3D cube rendering example
- `build.sh` - Build script that supports both native and WebAssembly compilation
- `shell.html` - HTML template used for the WebAssembly build

## Platform-Specific Notes

### Desktop
- On Windows: The application uses the Windows API for window creation
- On macOS: The application uses Cocoa for window creation
- On Linux: The application requires X11 development libraries

### WebAssembly
- Uses WebGL 2.0 for rendering
- Memory will grow as needed during execution
- Debug assertions are enabled in the current configuration