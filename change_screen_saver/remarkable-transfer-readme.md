# reMarkable File Transfer Script

This script automates the process of transferring files to a reMarkable device.

## Prerequisites

1. Your reMarkable device must be in developer mode. To enable this:

   - Go to Settings > Account > Advanced
   - Enable Developer mode
   - Your device will be factory resetted, so make sure you save your data in the cloud or somewhere else!
   - Go back to the main menu, scroll down, and enable "Developer mode"

2. You need to know your device's IP address and password. Find these in:

   - Settings > About > Copyright and licenses
   - Tap on "Copyright and licenses"
   - Scroll to the bottom and tap on "General information"
   - Tap on GPLv3 Compliance"
   - Find your root password
     Settings > Help > Copyrights and licenses

3. Ensure you have SSH installed on your Linux machine.

## Setup

1. Save the script to a file named `remarkable_transfer.sh`.

2. Make the script executable:
   ```
   chmod +x remarkable_transfer.sh
   ```

## Usage

1. Open a terminal and navigate to the directory containing the script.

2. Run the script:

   ```
   ./remarkable_transfer.sh
   ```

3. Follow the prompts:

   - Enter your reMarkable device's IP address (default is 10.11.99.1)
   - Enter your device's password
   - Enter the path to the file you want to transfer (default is "suspended.png" in the current directory)

4. The script will:
   - SSH into your device
   - Remount the filesystem as writable
   - Transfer the specified file to `/usr/share/remarkable/`

## Notes

- Keep your device in developer mode for this script to work.
- Be aware of the security implications of leaving your device in developer mode.
- The script uses `scp` for file transfer, which is generally more straightforward for single file transfers than `sftp`.
- The script uses `-o StrictHostKeyChecking=no` to avoid host key verification prompts. Be cautious when using this on untrusted networks.

## Troubleshooting

If you encounter any issues:

- Ensure your reMarkable device is connected to the same network as your computer.
- Double-check the IP address and password.
- Make sure the file you're trying to transfer exists at the specified path.

For more detailed information about SSH access to reMarkable, refer to the official reMarkable documentation or community forums.
