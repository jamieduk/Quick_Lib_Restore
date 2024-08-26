#!/bin/bash
# (c) J~Net 2024
#
# ./enhanced_restore.sh
#
# This script restores critical system libraries.

# Set the path for the backup
backup_dir="/home/jay/Documents/Settings_Backup/restore_resolve/Backup"

# List of critical libraries to restore
libs=(
    "libresolv.so.2"
    "libc.so.6"
    "libpthread.so.0"
    "libm.so.6"
    "libdl.so.2"
    "libnss_files.so.2"
    "ld-linux-aarch64.so.1"
    "libcrypt.so.1"
)

# Restore the files
echo "Restoring critical libraries..."
for lib in "${libs[@]}"; do
    if [ -f "$backup_dir/$lib" ]; then
        echo "Restoring $lib ..."
        sudo cp "$backup_dir/$lib" "/lib/aarch64-linux-gnu/$lib" && echo "Restored $lib"
    else
        echo "Warning: Backup for $lib not found!"
    fi
done

echo "Restore Completed!"

