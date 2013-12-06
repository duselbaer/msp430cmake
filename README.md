CMake Files to use MSP430 and CMake
===================================

   * add this repository as a submodule (let's say as /cmake/)
   * create your top-level CMakeLists.txt file which might look like this (note that the example is a specific one but it shows how simple it is to use CMake here)

<pre>
<code>
project(NRF24NetworkingModule)
cmake_minimum_required(VERSION 2.8)

# Configuration
# =============
#
set(CONF_FREQUENCY_IN_HZ "1000000UL" CACHE STRING "CPU frequency used")

# Compiler Settings
add_definitions("-DF_CPU=${CONF_FREQUENCY_IN_HZ}")

# MSP430Lib
add_subdirectory(msp430lib)

# NRF24NetworkingModule
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/msp430lib/include)
add_executable(
  NRF24NetworkingModule
    main.cpp
)
target_link_libraries(
  NRF24NetworkingModule
    msp430lib
)
</code>
</pre>

   * go to your build-directory
   * cmake .. -DCMAKE_TOOLCHAIN_FILE=../cmake/msp430.cmake
   * make
