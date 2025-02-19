#!/bin/bash

# WARN: Asking before any execution
confirm() {
	read -r -p "${1:-Are you sure?} [y/N] " response
	case "$response" in
	[yY][eE][sS] | [yY])
		true
		;;
	*)
		false
		;;
	esac
}

# NOTE: Check root or crash the program
check_root() {
	if [ "$(id -u)" != "0" ]; then
		echo "This script must be run as root" 1>&2
		exit 1
	fi
}

# INFO: Logic extracted by the article:
# https://raqami.io/tips-tricks/remarkable-paper-pro-hack-for-brighter-frontlight-tutorial/
main() {
	check_root

	echo "=== Remarkable Paper Pro Brightness Hack Script ==="
	echo "This script will guide you through increasing the brightness of your device beyond its factory limits"
	echo "!!! *** Use at your own risk *** !!!"
	echo

	if confirm "Do you want to set maximum brightness and enable linear mapping?"; then
		echo " -> Setting maximum brightness and enabling linear mapping..."
		cat /sys/class/backlight/rm_frontlight/max_brightness >/sys/class/backlight/rm_frontlight/brightness
		echo yes >/sys/class/backlight/rm_frontlight/linear_mapping
		echo "Done!"
	fi

	echo

	if confirm "Do you want to remount /etc as read-write?"; then
		echo " -> Remounting /etc as read-write..."
		umount -l /etc
		mount -o remount,rw /
		echo "Done!"
	fi

	echo

	if confirm "Do you want to create and enable a systemd service for brightness control?"; then
		echo "Creating systemd service file..."
		cat <<EOF >/etc/systemd/system/tweak-brightness-slider.service
[Unit]
Description=Set linear_mapping to 'yes' for backlight
After=multi-user.target

[Service]
Type=oneshot
ExecStart=/bin/sh -c 'echo yes > /sys/class/backlight/rm_frontlight/linear_mapping'
ExecStartPost=/bin/sh -c 'cat /sys/class/backlight/rm_frontlight/max_brightness > /sys/class/backlight/rm_frontlight/brightness'

[Install]
WantedBy=multi-user.target
EOF
		echo "Reloading systemd and enabling the new service..."
		systemctl daemon-reload
		systemctl enable --now tweak-brightness-slider.service
		echo "Done."
	fi

	echo
	echo "Script execution completed!"
}

# INFO: Reducing the chances of running main() elsewhere
main
