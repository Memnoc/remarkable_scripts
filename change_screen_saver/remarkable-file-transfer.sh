#!/bin/bash

# Function to prompt for input with a default value
prompt_with_default() {
    local prompt="$1"
    local default="$2"
    local input
    read -p "$prompt [$default]: " input
    echo "${input:-$default}"
}

# Prompt for device IP and password
DEVICE_IP=$(prompt_with_default "Enter your reMarkable device IP" "10.11.99.1")
DEVICE_PASSWORD=$(prompt_with_default "Enter your reMarkable device password" "")

# Prompt for file path
FILE_PATH=$(prompt_with_default "Enter the path to the file you want to transfer" "suspended.png")

# SSH into the device and remount as writable
echo "Remounting the device as writable..."
ssh -o StrictHostKeyChecking=no root@$DEVICE_IP "mount -o remount,rw /"

# Transfer the file using scp
echo "Transferring file to the device..."
scp -o StrictHostKeyChecking=no "$FILE_PATH" root@$DEVICE_IP:/usr/share/remarkable/

# Optionally, you can add a step to restart xochitl (the reMarkable interface)
# Uncomment the following lines if you want to restart xochitl after file transfer
# echo "Restarting xochitl..."
# ssh -o StrictHostKeyChecking=no root@$DEVICE_IP "systemctl restart xochitl"

echo "File transfer complete!"
