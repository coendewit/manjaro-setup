#!/bin/bash

# Function to check for and install a package
install_if_not_found() {
  if ! pacman -Q "$1" &>/dev/null; then
    echo "Installing $1..."
    sudo pacman -S --noconfirm "$1"
  else
    echo "$1 is already installed."
  fi
}

# Function to create an idempotent symbolic link. It will create the directory if needed
# Usage: create_symlink <source_file_or_dir> <destination_link>
create_symlink() {
  local source="$1"
  local destination="$2"

  # Extract the directory path of the destination
  local dest_dir=$(dirname "$destination")

  # Create the parent directory if it doesn't exist
  if [ ! -d "$dest_dir" ]; then
    echo "Creating directory: $dest_dir"
    mkdir -p "$dest_dir"
  fi

  # Check if the destination exists and remove it
  if [ -e "$destination" ]; then
    echo "Removing existing item at '$destination'..."
    rm -rf "$destination"
  fi

  # Create the new symbolic link
  echo "Creating symbolic link from '$source' to '$destination'..."
  ln -s "$source" "$destination"
}
