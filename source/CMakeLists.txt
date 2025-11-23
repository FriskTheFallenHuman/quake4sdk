cmake_minimum_required(VERSION 3.13.0)

set_property(GLOBAL PROPERTY PREDEFINED_TARGETS_FOLDER  "")
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

project(q4sdk VERSION 1.4.4)

set(Q4InstallPath CACHE STRING "C://Program Files (x86)//Steam//steamapps//common//Quake 4")
set(Q4ModSPName CACHE STRING "q4modsp")
set(Q4ModMPName CACHE STRING "q4modmp")

set(OUTPUT_SP_FOLDER ${CMAKE_SOURCE_DIR}/../output/q4modsp)
set(OUTPUT_MP_FOLDER ${CMAKE_SOURCE_DIR}/../output/q4modmp)

if(UNIX)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -w -fpermissive -fno-strict-aliasing -Wno-conversion")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -w")
endif(UNIX)

if(WIN32)
    add_compile_definitions(_WINDOWS)
    add_compile_definitions(_CRT_SECURE_NO_WARNINGS)
endif(WIN32)

if(UNIX)
    add_compile_definitions(__linux__)
    add_compile_definitions(__i386__)
endif(UNIX)

add_compile_definitions(GAME_DLL)
add_compile_definitions(Q4SDK)

# Needed so that VSCode can syntax check correctly.
include_directories(${CMAKE_SOURCE_DIR} PUBLIC)

add_subdirectory(idlib)
add_subdirectory(game)
add_subdirectory(mpgame)
