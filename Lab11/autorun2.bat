@echo off
rem Assemble the .asm file using TASM
tasm 2.asm
tasm isr4.asm

rem Link the .obj file using TLINK to create the .exe file
tlink 2.obj isr4.obj

rem
type 2.map

rem 
cd ../debug125

rem Run the generated .exe file
debug ..\tasm\2.exe

rem
cd ../tasm