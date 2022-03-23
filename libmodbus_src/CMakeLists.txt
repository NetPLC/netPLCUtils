cmake_minimum_required(VERSION 3.0.0)

# CMake build for OpenPLC st_optimizer.
project(libmodbus)

include(cmake/GenVersion.cmake)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

set(LIBMODBUS_VERSION_MAJOR 1)
set(LIBMODBUS_VERSION_MINOR 2)
set(LIBMODBUS_VERSION_MICRO 3)
set(LIBMODBUS_VERSION ${LIBMODBUS_VERSION_MAJOR}.${LIBMODBUS_VERSION_MINOR}.${LIBMODBUS_VERSION_MICRO})

GenerateVersionHeader(${PROJECT_BINARY_DIR}/config.h)
GenerateVersionHeader(${PROJECT_BINARY_DIR}/modbus-version.h)

include_directories(src ${PROJECT_BINARY_DIR})

aux_source_directory(src main_srcs)

if(BUILD_SHARED_LIBS)
    # setup shared lib
    set_target_properties(modbus PROPERTIES CLEAN_DIRECT_OUTPUT 1)
    # setup lib version
    set_target_properties(modbus PROPERTIES VERSION ${LIBMODBUS_VERSION} SOVERSION 1)
endif()

# generate library
add_library(modbus ${main_srcs})

# The main application that we always build
#add_executable(st_optimizer st_optimizer.cpp)

