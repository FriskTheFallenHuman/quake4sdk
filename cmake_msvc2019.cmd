@echo off
cls
mkdir build\msvc2019
pushd build\msvc2019
cmake -G "Visual Studio 16" -A Win32 %* ../../source
popd
@pause