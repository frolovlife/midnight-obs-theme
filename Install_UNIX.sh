#!/bin/bash -i

CWD="$(dirname "${BASH_SOURCE[0]}")"

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     THEMEDIR="$HOME/.config/obs-studio/themes";;
    Darwin*)    THEMEDIR="$HOME/Library/Application Support/obs-studio/themes";;
    *)          THEMEDIR="$HOME/.config/obs-studio/themes";;
esac

echo -e "Midnight theme for OBS Studio installation\n"

if [ ! -d "$THEMEDIR" ]; then
  echo -e "Creating theme directory for the first time...\n"
  mkdir -p "$THEMEDIR"
fi

if [ -f "$THEMEDIR/Midnight.obt" ]; then
  echo -e "Removing a previous version of Midnight theme...\n"
  rm -rf "$THEMEDIR/HollowDark"
  rm -f "$THEMEDIR/Midnight.obt"
fi

echo -e "Copying theme files...\n"
if ! cp -Rf "$CWD/HollowDark" "$THEMEDIR/" || ! cp -f "$CWD/Midnight.obt" "$THEMEDIR/"; then
  echo -e "\n"
  read -n 1 -r -s -p "An error has occured during installing theme! Press any key to exit..."
  exit
fi

echo -e "Installation has completed!\n Restart OBS Studio, then open OBS Studio settings and set the Midnight theme.\n"
read -n 1 -r -s -p "Press any key to exit..."
exit
