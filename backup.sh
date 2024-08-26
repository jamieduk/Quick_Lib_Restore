#!/bin/bash
# (c) J~Net 2024
#
# ./enhanced_backup.sh
#
# This script backs up critical system libraries.

# Set the path for the backup
backup_dir="/home/jay/Documents/Settings_Backup/restore_resolve/Backup"

# List of critical libraries to back up
libs=(
    "/lib/aarch64-linux-gnu/libresolv.so.2"
    "/lib/aarch64-linux-gnu/libc.so.6"
    "/lib/aarch64-linux-gnu/libpthread.so.0"
    "/lib/aarch64-linux-gnu/libm.so.6"
    "/lib/aarch64-linux-gnu/libdl.so.2"
    "/lib/aarch64-linux-gnu/libnss_files.so.2"
    "/lib/aarch64-linux-gnu/ld-linux-aarch64.so.1"
    "/lib/aarch64-linux-gnu/libcrypt.so.1"
)

# Ensure backup directory exists
if [ ! -d "$backup_dir" ]; then
    echo "Backup directory does not exist. Creating it..."
    mkdir -p "$backup_dir"
fi

# Backup the files
echo "Backing up critical libraries..."
for lib in "${libs[@]}"; do
    if [ -f "$lib" ]; then
        echo "Backing up $lib ..."
        sudo cp "$lib" "$backup_dir" && echo "Backed up $lib"
    else
        echo "Warning: $lib not found!"
    fi
done

echo "Backup Completed!"

