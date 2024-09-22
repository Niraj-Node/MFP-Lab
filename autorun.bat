@echo off
rem Assemble the .asm file using TASM
tasm 1(3).asm

rem Link the .obj file using TLINK to create the .exe file
tlink 1(3).obj

rem
type 1(3).map

rem 
cd ../debug125

rem Run the generated .exe file
debug ..\tasm\1(3).exe

rem
cd ../tasm