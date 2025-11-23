@echo off
cls
mkdir build\msvc2022
pushd build\msvc2022
cmake -G "Visual Studio 17" -A Win32 %* ../../source
popd
@pause