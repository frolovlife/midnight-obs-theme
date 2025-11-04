@echo off
title Midnight theme for OBS Studio installation
@setlocal enableextensions
@cd /d "%~dp0"

echo Checking for theme directory...
mkdir "%AppData%\obs-studio\themes\"
echo.

echo Copying theme files...
xcopy /e /i /f /y "%cd%\Midnight\*" "%AppData%\obs-studio\themes\"
echo.

echo Installation has completed!
echo Restart OBS Studio, then open OBS Studio settings and set the Midnight theme.
echo.
echo Press any key to exit...
pause > nul