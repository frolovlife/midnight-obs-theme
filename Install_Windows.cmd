@echo off
title Midnight theme for OBS Studio installation
@setlocal enableextensions
@cd /d "%~dp0"
echo Midnight theme for OBS Studio installation
echo.

if not exist "%AppData%\obs-studio\themes\" (
	echo Creating themes directory for the first time...
	md "%AppData%\obs-studio\themes\"
	echo.
)

if exist "%AppData%\obs-studio\themes\Midnight.obt" (
	echo Removing a previous version of Midnight theme...
	rd /s /q "%AppData%\obs-studio\themes\HollowDark\"
	del /q "%AppData%\obs-studio\themes\Midnight*.o?t"
	echo.
)

echo Copying theme files...
xcopy /e /i /f /y "%cd%\Midnight\*" "%AppData%\obs-studio\themes\"
echo.
echo Installation has completed!
echo Restart OBS Studio, then open OBS Studio settings and set the Midnight theme.
echo.
echo Press any key to exit...
pause > nul
