#!/bin/bash -i

CWD="$(dirname "${BASH_SOURCE[0]}")"

function readResponse() {
	echo -e "\n"
	case "$1" in
    	[Yy]*)
			rm -rf "$THEMEDIR/Midnight"
			;;
    	[Nn]*)
			read -n 1 -r -s -p "Press any key to exit..."
			exit
			;;
    	*)
			read -n 1 -r -s -p "Invalid input. Overwrite? [Y/N]" response
			readResponse $response
			;;
	esac
}

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     THEMEDIR="$HOME/.config/obs-studio/themes";;
    Darwin*)    THEMEDIR="$HOME/Library/Application Support/obs-studio/themes";;
    *)          THEMEDIR="$HOME/.config/obs-studio/themes";;
esac

echo -e "\n"
read -n 1 -r -s -p "Press any key to begin installation..."

echo -e "\n\nChecking for theme directory...\n"
if [ ! -d "$THEMEDIR" ]; then
	echo -e "Generating theme directory for the first time...\n"
	mkdir -p "$THEMEDIR"
fi

if [ -d "$THEMEDIR/Midnight" ]; then
	read -n 1 -r -s -p "An existing copy of this theme is already installed. Overwrite? [Y/N]" response
	readResponse $response
fi

echo -e "Preparing to copy files...\n"
if ! cp -Rf "$CWD/Midnight/*" "$THEMEDIR/"; then
	echo -e "\n"
	read -n 1 -r -s -p "An error has occured during a move! Press any key to exit..."
	exit
fi

echo -e "Installation has completed!"
echo -e "Restart OBS Studio, then open OBS Studio settings and set the Midnight theme."
echo -e "\n"
read -n 1 -r -s -p "Press any key to continue..."
exit
