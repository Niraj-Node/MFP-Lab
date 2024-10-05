@echo off
rem Assemble the .asm file using TASM
tasm 1.asm
tasm isr0.asm

rem Link the .obj file using TLINK to create the .exe file
tlink 1.obj isr0.obj

rem
type 1.map

rem 
cd ../debug125

rem Run the generated .exe file
debug ..\tasm\1.exe

rem
cd ../tasm