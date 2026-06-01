# Quick Start Guide - Linux Admin Toolkit

## 60-Second Setup

### Step 1: Download
```bash
git clone https://github.com/PwnPoint/Advanced-System-Admin-Toolkit.git
cd Advanced-System-Admin-Toolkit
```

### Step 2: Make Executable
```bash
chmod +x LinuxAdminToolkit.sh
```

### Step 3: Run
```bash
sudo ./LinuxAdminToolkit.sh
```

## First-Time Checklist

- [ ] Clone or download repository
- [ ] Make script executable: `chmod +x LinuxAdminToolkit.sh`
- [ ] Run with sudo: `sudo ./LinuxAdminToolkit.sh`
- [ ] Press 1 to test network config
- [ ] Press 19 to view system info
- [ ] Reports save to: `~/Desktop/LinuxAdminToolkit_Report.txt`

## Common Tasks

### Check System Health
```
Menu 1 → 19 (Full System Info)
Menu 2 → 20 (CPU Details)
Menu 2 → 21 (RAM/Memory)
```

### View Network Status
```
Menu 1 → 1 (IP Configuration)
Menu 1 → 4 (Network Interfaces)
Menu 1 → 8 (Listening Ports)
```

### Audit Security
```
Menu 2 → 45 (Local Users)
Menu 2 → 46 (Sudo Privileges)
Menu 2 → 49 (SSH Keys)
```

### Update System
```
Menu 2 → 33 (Update Cache)
Menu 2 → 34 (Check Updates)
Menu 2 → 35 (Security Updates)
```

### Clean Up
```
Menu 2 → 36 (Clean Cache)
Menu 2 → 37 (Remove Unused)
Menu 2 → 41 (Clear Logs)
```

### Monitor Performance
```
Menu 3 → 53 (CPU Metrics)
Menu 3 → 54 (Disk I/O)
Menu 3 → 65 (Process Manager)
```

### Generate Reports
```
Menu 3 → 69 (Network Report)
Menu 3 → 70 (System Report)
Menu 3 → 71 (Security Report)
Menu 3 → 72 (Complete Report)
```

## Installation Tips

### Ubuntu/Debian
```bash
# Install dependencies
sudo apt update
sudo apt install -y iproute2 curl sysstat

# Optional tools
sudo apt install -y vnstat smartmontools lm-sensors ncdu nethogs
```

### CentOS/RHEL
```bash
# Install dependencies
sudo yum install -y iproute curl sysstat

# Optional tools
sudo yum install -y vnstat smartmontools lm_sensors ncdu nethogs
```

### Fedora
```bash
# Install dependencies
sudo dnf install -y iproute curl sysstat

# Optional tools
sudo dnf install -y vnstat smartmontools lm_sensors ncdu nethogs
```

## Troubleshooting

### "Permission denied" error
```bash
# Make script executable
chmod +x LinuxAdminToolkit.sh

# Run with sudo
sudo ./LinuxAdminToolkit.sh
```

### "Command not found" errors
```bash
# Install missing tools
sudo apt install iproute2 curl

# Install all optional dependencies
sudo apt install -y iproute2 curl vnstat sysstat lm-sensors smartmontools ncdu nethogs
```

### Menu doesn't display correctly
```bash
# Try with explicit bash
bash LinuxAdminToolkit.sh

# Or with sudo
sudo bash LinuxAdminToolkit.sh

# Maximize terminal window first
```

### Report file not found
```bash
# Check Desktop location
ls ~/Desktop/LinuxAdminToolkit_Report.txt

# Or check current user
whoami
ls -la ~/Desktop/
```

## Getting Help

1. Check [LINUX_README.md](LINUX_README.md) for detailed documentation
2. See [TROUBLESHOOTING.md](TROUBLESHOOTING.md) for common issues
3. Review [CONTRIBUTING.md](CONTRIBUTING.md) for support options
4. Open an issue on GitHub

## Pro Tips

1. **Run regular reports**: Schedule with cron for automated audits
2. **Save reports**: Archive important reports for compliance
3. **Share with team**: Reports are text format, easy to share
4. **Test first**: Run on non-production systems first
5. **Read warnings**: Some operations are system-modifying

## Next Steps

- Read [LINUX_README.md](LINUX_README.md) for complete documentation
- Explore all menu options
- Generate your first full report (Option 72)
- Customize for your needs
- Share feedback!

---

**Version:** 1.0.0 
