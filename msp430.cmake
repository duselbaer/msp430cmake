# TOOLCHAIN FILE for MSP430
#
# Not yet tested with plain C stuff but with C++
#
# Usage:
# cmake .. -DCMAKE_TOOLCHAIN_FILE=../cmake/msp430.cmake

include(CMakeForceCompiler)

set(CMAKE_SYSTEM_NAME none)

# Compiler & Linker Settings
CMAKE_FORCE_C_COMPILER(msp430-gcc GNU)
CMAKE_FORCE_CXX_COMPILER(msp430-g++ GNU)

if(NOT MCU)
  message(STATUS "Setting default MCU type 'msp430g2553'")
  set(MCU "msp430g2553" CACHE STRING "MSP430 MCU TYPE")
else()
  message(STATUS "MCU defined as '${MCU}'")
endif()

set(CMAKE_CXX_FLAGS "-std=c++11 -mmcu=${MCU} -Os -g -ffunction-sections -fdata-sections"
  CACHE STRING "C++ Flags")
set(CMAKE_CXX_LINK_FLAGS "-Wl,-gc-sections"
  CACHE STRING "Linker Flags")

# Use GCC for linking executables to avoid linking to stdlibc++ _BUT_ get all the math libraries etc.
set(CMAKE_CXX_LINK_EXECUTABLE
  "<CMAKE_C_COMPILER> <FLAGS> <CMAKE_CXX_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> ${CMAKE_GNULD_IMAGE_VERSION} <LINK_LIBRARIES>")
