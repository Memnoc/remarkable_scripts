# Interactive Brightness Slider Setup Script

This script provides an interactive way to set up and configure the brightness slider on your Linux system. It allows you to set maximum brightness, enable linear mapping, create a systemd service for brightness control, and more.

## Prerequisites

- A Linux system
- Root access (sudo privileges)

## Installation

1. Save the script to a file named `interactive_brightness_setup.sh` in your desired directory.

2. Make the script executable:
   ```
   chmod +x interactive_brightness_setup.sh
   ```

## Usage

1. Open a terminal.

2. Navigate to the directory containing the script:

   ```
   cd /path/to/script/directory
   ```

3. Run the script with root privileges:

   ```
   sudo ./interactive_brightness_setup.sh
   ```

4. Follow the on-screen prompts. The script will ask for confirmation before each major step.

## Creating an Alias (Optional)

To make it easier to run the script in the future, you can create an alias:

1. Open your `.bashrc` or `.bash_aliases` file in a text editor:

   ```
   nano ~/.bashrc
   ```

   or

   ```
   nano ~/.bash_aliases
   ```

2. Add the following line at the end of the file:

   ```
   alias brightness-setup='sudo /path/to/interactive_brightness_setup.sh'
   ```

   Replace `/path/to/` with the actual path where you saved the script.

3. Save the file and exit the editor.

4. Reload your shell configuration:

   ```
   source ~/.bashrc
   ```

   or open a new terminal.

5. Now you can run the script by simply typing:
   ```
   brightness-setup
   ```

## One liner for when you are lazy

You do not need to SSH first, the process will guide you through inputting the password.

```
scp /home/User/Downloads/suspended.png root@ID:/usr/share/remarkable/
```

I am assuming you have the image downloaded in Downloads.

## Caution

This script requires root privileges and modifies system files and services. Always review scripts that require elevated privileges before running them. Use at your own risk.

## Support

If you encounter any issues or have questions, please open an issue in the repository or contact the script maintainer.
