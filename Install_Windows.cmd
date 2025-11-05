@echo off
title Midnight theme for OBS Studio installation
@setlocal enableextensions
@cd /d "%~dp0"
echo Midnight theme for OBS Studio installation
echo.

if exist "%AppData%\obs-studio\themes\" (
	echo Theme directory exists.
	echo.

	if exist "%AppData%\obs-studio\themes\Midnight.obt" (
		echo Previos version of Midnight theme exists.
		echo Deleting previos version...
		rd /s /q "%AppData%\obs-studio\themes\HollowDark\"
		del /q "%AppData%\obs-studio\themes\Midnight*.o?t"
		echo.
	) else (
		rem hello world
	)

	echo Copying theme files...
	xcopy /e /i /f /y "%cd%\Midnight\*" "%AppData%\obs-studio\themes\"
	echo.
	echo Installation has completed!
	echo Restart OBS Studio, then open OBS Studio settings and set the Midnight theme.
) else (
	echo Theme directory not found. OBS Studio is probably not installed.
	echo Install OBS Studio first, then install the theme.
	echo.
	echo Installation aborted.
)

echo.
echo Press any key to exit...
pause > nul
