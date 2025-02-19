# 🌟 reMarkable Brightness Control - Script

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub issues](https://img.shields.io/github/issues/yourusername/remarkable-brightness.svg)](https://github.com/yourusername/remarkable-brightness/issues)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/yourusername/remarkable-brightness/graphs/commit-activity)
[![made-for-remarkable](https://img.shields.io/badge/Made%20for-reMarkable-blue.svg)](https://remarkable.com/)

> 💡 Enhance your reMarkable Paper Pro experience with customizable brightness controls

> ⚠️ **WARNING**

> This hack is provided 'as-is' and without warranty. We assume no liability for any damage resulting from hardware modifications. This project is neither affiliated with nor endorsed by reMarkable AS. Modifying your device may void your warranty and official support may refuse to help you. Proceed at your own risk!

## 📋 Table of Contents

- [Features](#-features)
- [Prerequisites](#-prerequisites)
- [Installation](#-installation)
- [Usage](#-usage)
- [Safety](#-safety)
- [Troubleshooting](#-troubleshooting)
- [Support](#-support)

## ✨ Features

- 🔆 Maximum brightness configuration
- 📊 Linear brightness mapping
- 🔄 Persistent settings across reboots
- ⚙️ System service integration

## 🔧 Prerequisites

- reMarkable Paper Pro tablet
  - root credentials
  - developer mode enabled
- Computer with terminal access
- Local network connection
- Basic command line knowledge

## 📥 Installation

### Step 1: Enable SSH on reMarkable

1. 📱 On your reMarkable tablet:
   ```
   Settings ➜ About ➜ Copyrights and licenses (grab your ssh passwords)
   Settings ➜ Software ➜ Developer Mode(enable)
   ```
2. 📝 Note down the IP address shown

### Step 2: Transfer the Script

> ⚠️ **Important**: You'll need two terminal windows open:
>
> - Terminal 1: For SSH connection
> - Terminal 2: For file transfer

1. 💾 Save the script as `brightness.sh`
2. 📂 Open Terminal 2 and navigate to script location
3. 📤 Transfer to reMarkable:
   ```bash
   scp brightness.sh root@<your-remarkable-ip>:/home/root/
   ```

### Step 3: Execute the Script

1. 🔌 In Terminal 1, connect via SSH:

   ```bash
   ssh root@<your-remarkable-ip>
   ```

2. 🚀 Run the script:
   ```bash
   cd /home/root
   chmod +x brightness.sh
   ./brightness.sh
   ```

## 🎯 Usage

The script will prompt you for three options:

1. 🔆 **Brightness Settings**

   ```
   Set maximum brightness and enable linear mapping
   ```

2. 💾 **System Configuration**

   ```
   Remount /etc as read-write
   ```

3. ⚙️ **Service Creation**
   ```
   Create and enable systemd service
   ```

## 🛡️ Safety Considerations

- 🔐 Root access required
- 📑 System-level modifications
- 💾 Backup recommended
- ↩️ Reversible via factory reset
- ✅ Brightness-focused changes only

## 🔍 Troubleshooting

| Issue                | Solution                    |
| -------------------- | --------------------------- |
| 🔴 Connection Failed | Check network & IP          |
| 🔴 Permission Denied | Verify SSH is enabled       |
| 🔴 Script Error      | Check execution permissions |

## 💬 Support

- 📮 Open an issue for bug reports
- 💡 Feature requests welcome
- 🤝 Community contributions appreciated

## 📜 License

MIT © [Matteo Stara](https://github.com/Memnoc/remarkable_scripts/blob/main/LICENSE)

---

<div align="center">

🌟 **Made with love for the reMarkable community** 🌟

</div>
