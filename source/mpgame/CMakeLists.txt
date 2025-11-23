project(MPGame CXX)
add_library(${PROJECT_NAME} SHARED)

file(GLOB_RECURSE src_mpgame
	"*.def"
	"*.cpp"
	"*.h")
list(REMOVE_ITEM src_mpgame "${CMAKE_SOURCE_DIR}/mpgame/gamesys/Callbacks.cpp")
source_group(TREE ${CMAKE_SOURCE_DIR} PREFIX "" FILES ${src_mpgame})
target_sources(${PROJECT_NAME} PRIVATE ${src_mpgame})

target_compile_definitions(${PROJECT_NAME} PRIVATE GAME_DLL GAME_MPAPI)
target_link_libraries(${PROJECT_NAME} idLib)
target_precompile_headers(${PROJECT_NAME} PRIVATE "${CMAKE_SOURCE_DIR}/idlib/precompiled.h")
if(UNIX)
	set_target_properties(${PROJECT_NAME} PROPERTIES COMPILE_OPTIONS "-m32" LINK_FLAGS "-m32") # Force 32 bit compilation in GCC
endif()
set_target_properties(${PROJECT_NAME} PROPERTIES PREFIX "" OUTPUT_NAME "gamex86" LINK_FLAGS "/PDB:\"gamex86.pdb\"" RUNTIME_OUTPUT_DIRECTORY $<1:>${OUTPUT_MP_FOLDER})
set_target_properties(${PROJECT_NAME} PROPERTIES FOLDER "dlls")

if(WIN32)
	set_target_properties(${PROJECT_NAME} PROPERTIES VS_DEBUGGER_COMMAND ${Q4InstallPath}//Quake4.exe)
	set_target_properties(${PROJECT_NAME} PROPERTIES VS_DEBUGGER_WORKING_DIRECTORY "${Q4InstallPath}")
	set_target_properties(${PROJECT_NAME} PROPERTIES VS_DEBUGGER_COMMAND_ARGUMENTS "+set fs_game ${Q4ModMPName} +set com_allowConsole 1  +set win_allowmultipleInstances 1")
endif(WIN32)
