@echo off
rem Assemble the .asm file using TASM
tasm main.asm
tasm print.asm

rem Link the .obj file using TLINK to create the .exe file
tlink main.obj print.obj

rem
type main.map

rem 
cd ../debug125

rem Run the generated .exe file
debug ..\tasm\main.exe

rem
cd ../tasm