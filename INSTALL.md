# Installation & Setup Guide

Complete installation and setup instructions for both Windows and Linux versions of the Advanced Admin Toolkit.

## Table of Contents

1. [Windows Setup](#-windows-setup)
2. [Linux Setup](#-linux-setup)
3. [Troubleshooting](#-troubleshooting)
4. [Verification](#-verification)

---

## Windows Setup

### System Requirements
- Windows 7, 8, 10, or 11
- Administrator account access
- 50MB free disk space

### Step 1: Download

**Option A: Git Clone**
```powershell
git clone https://github.com/PwnPoint/Advanced-System-Admin-Toolkit.git
cd Advanced-System-Admin-Toolkit
```

**Option B: Direct Download**
- Download ZIP from GitHub
- Extract to preferred location (e.g., `C:\Tools\`)

**Option C: From Command Line**
```cmd
curl -L https://github.com/PwnPoint/Advanced-System-Admin-Toolkit/archive/refs/heads/main.zip -o admin-tool.zip
tar -xf admin-tool.zip
cd Advanced-System-Admin-Toolkit
```

### Step 2: Run the Toolkit

**Method 1: Direct Execution (Easiest)**
1. Navigate to folder containing `AdminToolkit.bat`
2. Right-click on `AdminToolkit.bat`
3. Select "Run as Administrator"
4. Click "Yes" when UAC prompt appears

**Method 2: Command Prompt**
```cmd
# Open Command Prompt as Administrator (Win+R, type: cmd)
cd path\to\admin-tool
AdminToolkit.bat
```

**Method 3: PowerShell**
```powershell
# Open PowerShell as Administrator (Win+R, type: powershell)
cd path\to\admin-tool
.\AdminToolkit.bat
```

### Step 3: Optional - PowerShell Integration

For advanced features, ensure PowerShell 5.0+:
```powershell
# Check PowerShell version
$PSVersionTable.PSVersion

# Update if needed (Windows 10/11 usually has 5.0+)
```

### Step 4: First-Time Use

1. Run `AdminToolkit.bat` as Administrator
2. Select option "1" to test IP configuration
3. Select option "19" to view system information
4. Press "0" to exit
5. Check `%USERPROFILE%\Desktop\AdminToolkit_Report.txt` for output

### Windows Verification

```batch
# Test it works
AdminToolkit.bat

# Should show:
:: 1. Show Full IP Configuration
:: 2. Ping Test (Google + 8.8.8.8)
...

# Reports generated at:
echo %USERPROFILE%\Desktop\AdminToolkit_Report.txt
```

---

## Linux Setup

### System Requirements
- Linux with Bash 4.0+
- Ubuntu 18.04+, Debian 9+, CentOS 7+, or similar
- sudo/root access required
- 50MB free disk space

### Step 1: Download

**Option A: Git Clone (Recommended)**
```bash
git clone https://github.com/PwnPoint/Advanced-System-Admin-Toolkit.git
cd Advanced-System-Admin-Toolkit
```

**Option B: Direct Download**
```bash
# Download ZIP and extract
unzip admin-tool-main.zip
cd admin-tool-main

# Or using curl
curl -L https://github.com/PwnPoint/Advanced-System-Admin-Toolkit/archive/refs/heads/main.zip -o admin-tool.zip
unzip admin-tool.zip
cd Advanced-System-Admin-Toolkit
```

### Step 2: Automated Setup (Recommended)

The setup script automatically installs dependencies and configures permissions:

```bash
# Make setup script executable
chmod +x setup-linux.sh

# Run setup (requires sudo)
sudo bash setup-linux.sh

# The script will:
# 1. Detect your Linux distribution
# 2. Install core and optional dependencies
# 3. Make LinuxAdminToolkit.sh executable
# 4. Create optional system-wide symlink
```

### Step 3: Run the Toolkit

**After Automated Setup:**
```bash
# Standard way
sudo ./LinuxAdminToolkit.sh

# If symlink created:
sudo linux-admin-toolkit

# Or from anywhere in symlink case:
linux-admin-toolkit  # (with sudo if needed)
```

**Manual Setup (if not using setup script):**
```bash
# Install core dependencies (Ubuntu/Debian)
sudo apt update
sudo apt install -y iproute2 curl grep sed gawk coreutils procps

# Make script executable
chmod +x LinuxAdminToolkit.sh

# Run
sudo ./LinuxAdminToolkit.sh
```

### Step 4: Optional - Install Additional Tools

For maximum functionality, install optional dependencies:

**Ubuntu/Debian**
```bash
sudo apt install -y vnstat sysstat lm-sensors smartmontools ncdu nethogs acpi htop
```

**CentOS/RHEL**
```bash
sudo yum install -y vnstat sysstat lm_sensors smartmontools ncdu nethogs acpi htop
```

**Fedora**
```bash
sudo dnf install -y vnstat sysstat lm_sensors smartmontools ncdu nethogs acpi htop
```

**Alpine**
```bash
sudo apk add vnstat sysstat lm_sensors smartmontools ncdu nethogs acpi htop
```

### Step 5: First-Time Use

```bash
# Run the toolkit
sudo ./LinuxAdminToolkit.sh

# Or if symlink created:
sudo linux-admin-toolkit

# Select option 1 to test IP configuration
# Select option 19 to view system information
# Press 0 to exit
# Check ~/Desktop/LinuxAdminToolkit_Report.txt for output
```

### Linux Verification

```bash
# Check permissions
ls -la LinuxAdminToolkit.sh

# Test basic commands
bash -n LinuxAdminToolkit.sh  # Check for syntax errors

# Check dependencies
which ip curl grep sed awk

# Test execution (dry run)
sudo bash -x LinuxAdminToolkit.sh 2>&1 | head -20

# Verify report location
ls ~/Desktop/LinuxAdminToolkit_Report.txt
```

---

## Uninstallation

### Windows Uninstall

1. Delete the folder containing `AdminToolkit.bat`
2. Or: Remove from Program Files if installed there
3. Reports on Desktop can be deleted individually

**Keep or Archive Before Deleting:**
- Report files (if you need audit trail)
- Customized batch files (if you modified the script)

### Linux Uninstall

```bash
# Remove symlink (if created)
sudo rm /usr/local/bin/linux-admin-toolkit

# Remove script
rm LinuxAdminToolkit.sh

# Remove cloned repository
cd ..
rm -rf Advanced-System-Admin-Toolkit

# Optional: Remove dependencies
sudo apt remove iproute2 curl vnstat sysstat  # Ubuntu/Debian
sudo yum remove iproute curl vnstat sysstat   # CentOS/RHEL

# Keep or archive reports
# ~/Desktop/LinuxAdminToolkit_Report.txt
```

---

## Troubleshooting

### Windows Issues

**"Windows protected your PC" message**
- Click "More info"
- Click "Run anyway"
- Or disable SmartScreen temporarily

**"Access Denied" errors**
- Right-click → Run as Administrator
- Verify user has administrator privileges

**Script won't run**
```batch
# Try with explicit batch execution
cmd /c AdminToolkit.bat

# Or PowerShell
powershell -ExecutionPolicy Bypass -File AdminToolkit.bat
```

**Colors not displaying**
- Ensure Command Prompt supports ANSI colors
- Try: Settings → Use legacy console (OFF)

**Reports not saving**
```batch
# Check Desktop path
echo %USERPROFILE%\Desktop

# Verify permissions
icacls %USERPROFILE%\Desktop
```

### Linux Issues

**Permission Denied**
```bash
# Make executable
chmod +x LinuxAdminToolkit.sh

# Run with sudo
sudo ./LinuxAdminToolkit.sh
```

**Command not found errors**
```bash
# Install missing tools
sudo apt install iproute2 curl  # Ubuntu/Debian
sudo yum install iproute curl   # CentOS/RHEL

# Or run full setup
sudo bash setup-linux.sh
```

**Bash version too old**
```bash
# Check version
bash --version

# Need 4.0+
# For older systems, update bash or use newer OS
```

**Report directory doesn't exist**
```bash
# Create Desktop directory
mkdir -p ~/Desktop

# Set permissions
chmod 755 ~/Desktop
```

**Colors not displaying**
- Ensure terminal supports ANSI colors
- Try: export TERM=xterm-256color
- Check terminal emulator settings

---

## Verification

### Windows Verification Checklist

- [ ] Downloaded repository
- [ ] Located AdminToolkit.bat
- [ ] Ran as Administrator
- [ ] Initial menu displayed
- [ ] Selected option 1 (IP Config)
- [ ] Output displayed
- [ ] Report file created
- [ ] Can navigate menus (N, P, 0)
- [ ] Exit works properly (0)
- [ ] File saved to Desktop

**Test All Three Pages:**
```batch
AdminToolkit.bat

# Test Page 1 navigation
Press 1
Press P (to go back, should stay on page 1)
Press N (go to page 2)

# Test Page 2 navigation  
Press P (back to page 1)
Press N (forward to page 2)
Press N (forward to page 3)

# Test Page 3 navigation
Press P (back to page 2)
Press N (forward, wraps to page 1)
Press 0 (exit)
```

### Linux Verification Checklist

- [ ] Downloaded repository
- [ ] Made scripts executable (chmod +x)
- [ ] Ran setup script (sudo bash setup-linux.sh)
- [ ] Dependencies installed
- [ ] Ran LinuxAdminToolkit.sh
- [ ] Initial menu displayed
- [ ] Selected option 1 (IP Config)
- [ ] Output displayed
- [ ] Report file created
- [ ] Can navigate menus (N, P, 0)
- [ ] Exit works properly (0)
- [ ] File saved to Desktop

**Test All Three Pages:**
```bash
sudo ./LinuxAdminToolkit.sh

# Test Page 1 navigation
Select 1
Later press N to go to page 2

# Test Page 2 navigation
Press P to go back to page 1
Press N to forward to page 2
Press N to forward to page 3

# Test Page 3 navigation
Press P to go back to page 2
Press N to forward (wraps to page 1)
Press 0 to exit
```

---

## Next Steps

### After Installation

1. **Read Documentation**
   - Windows: [README.md](README.md)
   - Linux: [LINUX_README.md](LINUX_README.md)

2. **Run First Report**
   - Windows: Option 76 (Complete Report)
   - Linux: Option 72 (Complete Report)

3. **Review Output**
   - Windows: `%USERPROFILE%\Desktop\AdminToolkit_Report.txt`
   - Linux: `~/Desktop/LinuxAdminToolkit_Report.txt`

4. **Bookmark Documentation**
   - Quick Start: [LINUX_QUICKSTART.md](LINUX_QUICKSTART.md) (Linux)
   - Troubleshooting: [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
   - Platform Info: [PLATFORMS.md](PLATFORMS.md)

5. **Schedule Regular Runs**
   - Windows: Task Scheduler for periodic reports
   - Linux: crontab for periodic reports

6. **Archive Reports**
   - Save important reports for compliance
   - Document any actions taken

---

## Getting Help

| Issue | Solution |
|-------|----------|
| Installation fails | See Troubleshooting section above |
| Script won't run | Check permissions, use correct OS version |
| Missing features | Install optional dependencies |
| Needs customization | Edit scripts (both support customization) |
| Want to contribute | See CONTRIBUTING.md |
| Found a bug | Open GitHub issue with details |
| Security concern | Email security@example.com |

---

## Additional Resources

- [README.md](README.md) - Main project documentation
- [LINUX_README.md](LINUX_README.md) - Linux-specific guide
- [LINUX_QUICKSTART.md](LINUX_QUICKSTART.md) - Quick start for Linux
- [PLATFORMS.md](PLATFORMS.md) - Platform comparison
- [TROUBLESHOOTING.md](TROUBLESHOOTING.md) - Detailed troubleshooting
- [CONTRIBUTING.md](CONTRIBUTING.md) - Contributing guidelines
- [SECURITY.md](SECURITY.md) - Security information
- [CHANGELOG.md](CHANGELOG.md) - Version history

---

**Version:** 1.0.0
