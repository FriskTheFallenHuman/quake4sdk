@echo off
cls
mkdir build\msvc2026
pushd build\msvc2026
cmake -G "Visual Studio 18" -A Win32 %* ../../source
popd
@pause