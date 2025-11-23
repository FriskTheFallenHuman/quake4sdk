project(idLib CXX)
add_library(${PROJECT_NAME} STATIC)

file(GLOB src_idlib
	"*.cpp"
	"*.h"
	"algorithms/*.h"
	"bv/*.cpp"
	"bv/*.h"
	"containers/*.cpp"
	"containers/*.h"
	"geometry/*.cpp"
	"geometry/*.h"
	"hashing/*.cpp"
	"hashing/*.h"
	"math/*.cpp"
	"math/*.h"
	"threads/*.h")
source_group(TREE ${CMAKE_SOURCE_DIR} PREFIX "" FILES ${src_idlib})
target_sources(${PROJECT_NAME} PRIVATE ${src_idlib})

target_precompile_headers(${PROJECT_NAME} PRIVATE "${CMAKE_SOURCE_DIR}/idlib/precompiled.h")
target_compile_definitions(${PROJECT_NAME} PRIVATE NAME=$<TARGET_FILE_NAME:idLib>)
if(UNIX)
    set_target_properties(${PROJECT_NAME} PROPERTIES COMPILE_OPTIONS "-m32" LINK_FLAGS "-m32") # Force 32 bit compilation in GCC
endif()
set_target_properties(${PROJECT_NAME} PROPERTIES PREFIX "" LINK_FLAGS "/PDB:\"idlib.pdb\"")
set_target_properties(${PROJECT_NAME} PROPERTIES FOLDER "libs")
