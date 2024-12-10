#SECURITY HARDENING COMMAND-LIST by IT SGRC


#Update & Upgrade all packages and updates
sudo apt-get update -y && sudo apt-get upgrade -y

#enable NTP
echo "Enabling NTP"
timedatectl set-ntp true

#Disable SSH root Login
echo "Disabling root login via SSH"
sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart sshd

#Lock root account
passwd -l root

#Update password policy
echo "Updating password policy"
sed -i 's/^#\?minlen.*/minlen=14/' /etc/security/pwquality.conf
sed -i 's/^#\?minclass.*/minclass=3/' /etc/security/pwquality.conf

#Display sudo group members
echo "Listing sudo group members"
grep '^sudo' /etc/group

## Add /tmp to fstab with required options
echo "Configuring /tmp in /etc/fstab"
echo "/tmp tmpfs defaults,nosuid,nodev,noexec 0 0" >> /etc/fstab
mount -o remount,noexec,nodev,nosuid /tmp

# Update sysctl configuration
echo "Disabling IPv6 and setting accept_redirects=0 in /etc/sysctl.conf"
echo "net.ipv6.conf.all.disable_ipv6=1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6=1" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.accept_redirects=0" >> /etc/sysctl.conf
sysctl -p

# Install and enable auditd
echo "Installing and enabling auditd"
apt update
apt install -y auditd
systemctl enable auditd

# Update logrotate configuration
echo "Updating logrotate configuration for log management"
sed -i 's/^#\?weekly/daily/' /etc/logrotate.conf
sed -i 's/^#\?rotate [0-9]*/rotate 14/' /etc/logrotate.conf

# Install rsyslog
echo "Installing rsyslog"
apt install -y rsyslog
systemctl enable rsyslog

#Remove GUI
echo "Removing GUI packages"
apt purge -y xserver-xorg*

# Install and configure unattended-upgrades
echo "Installing and configuring unattended-upgrades"
apt install -y unattended-upgrades
dpkg-reconfigure --priority=low unattended-upgrades

# Clean unused packages
echo "Cleaning up unused packages"
apt autoremove -y

# Set permissions for sensitive files
echo "Setting permissions for /etc/passwd and /etc/shadow"
chmod 644 /etc/passwd
chmod 600 /etc/shadow

# Find files with no owner or group
echo "Finding files with no owner or group"
find / -nouser -o -nogroup

echo "Setup Complete"
