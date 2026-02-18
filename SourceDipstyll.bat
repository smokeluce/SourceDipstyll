@echo off
setlocal

REM ---------------------------------------------------------
REM  Launcher for SourceDipstyll.ps1
REM  Ensures PowerShell runs in the correct working directory
REM  and bypasses execution policy for this session only.
REM ---------------------------------------------------------

REM Get the directory of this .bat file
set SCRIPT_DIR=%~dp0

REM Run the PowerShell script
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_DIR%SourceDipstyll.ps1"

endlocal