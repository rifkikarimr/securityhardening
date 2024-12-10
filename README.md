# Linux Server Security Hardening Script

This repository contains a shell script designed to enhance the security and performance of a Linux server. It automates several essential system hardening tasks, ensuring compliance with basic security best practices.

## Features

The script performs the following actions:

1. **System Update and Upgrade**:
   - Updates and upgrades all installed packages to their latest versions.

2. **NTP Configuration**:
   - Enables Network Time Protocol (NTP) to keep system time synchronized.

3. **SSH Hardening**:
   - Disables root login via SSH to reduce attack vectors.
   - Locks the root account to prevent unauthorized access.

4. **Password Policy Enforcement**:
   - Updates password policies to enforce minimum length and character class requirements.

5. **User and Group Management**:
   - Lists members of the `sudo` group for administrative auditing.

6. **Filesystem Security**:
   - Configures `/tmp` with secure mount options to prevent unauthorized execution.
   - Ensures sensitive files (`/etc/passwd` and `/etc/shadow`) have proper permissions.

7. **Kernel and Network Security**:
   - Disables IPv6 and sets `accept_redirects` to `0` in `sysctl.conf`.

8. **Audit and Logging**:
   - Installs and enables `auditd` for system auditing.
   - Configures `logrotate` for better log management.
   - Installs and enables `rsyslog` for centralized logging.

9. **System Cleanup**:
   - Removes unnecessary GUI packages for servers.
   - Cleans up unused packages to free up disk space.

10. **Unattended Upgrades**:
    - Installs and configures `unattended-upgrades` to automate security updates.

11. **Orphaned Files Check**:
    - Scans for files without an owner or group for better file system hygiene.

## Prerequisites

- This script is designed for Debian-based Linux distributions (e.g., Ubuntu).
- Ensure you have root or `sudo` access to execute the script.

## Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/your_username/linux-security-hardening.git
   cd linux-security-hardening
2. Run script:
   ```bash
   sudo sh security-hardening.sh
