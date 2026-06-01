# Advanced Admin Toolkit Suite v1.0

A comprehensive multi-platform system administration toolkit with both **Windows** and **Linux** versions. Each provides 70+ diagnostic, repair, security audit, and optimization features in an easy-to-navigate menu interface.

## Platform Support

- **Windows** - `AdminToolkit.bat` (76 options)
- **Linux** - `LinuxAdminToolkit.sh` (72 options)

## Documentation

- **Windows Users** → See main [README.md](README.md)
- **Linux Users** → See [LINUX_README.md](LINUX_README.md)
- **Linux Quick Start** → See [LINUX_QUICKSTART.md](LINUX_QUICKSTART.md)

---

# Windows Admin Toolkit v1.0

A comprehensive batch script utility for Windows system administrators and power users. This toolkit provides 76+ diagnostic, repair, security audit, and optimization features in an easy-to-navigate menu interface.

## Features

### Network Diagnostics (18 options)
- Full IP Configuration display
- Ping tests (Google, 8.8.8.8, custom continuous ping)
- DNS cache management and lookups
- IP address release/renewal
- Winsock and TCP/IP stack reset
- WiFi profile and password extraction
- Firewall status and rule export
- Network adapter management
- Route table, ARP table, netstat analysis
- Traceroute and listening ports analysis
- Public IP and geolocation lookup

### System Diagnostics (14 options)
- Full system information
- CPU, RAM, and GPU details
- Battery health report (HTML)
- Power efficiency report (HTML)
- DirectX diagnostics
- Disk space analysis
- Running processes list
- Startup programs
- Installed software inventory
- Windows hotfixes and updates
- Environment variables
- System uptime calculation

### System Repair & Maintenance (12 options)
- System File Checker (SFC /scannow)
- DISM health check and restore
- Check Disk (CHKDSK) scheduling
- Temporary file cleanup
- Prefetch cache clearing
- Icon cache rebuild
- Windows Update component reset
- Print spooler management
- Windows Store app re-registration
- System restore point creation
- Windows Update settings access

### Security & Audit (14 options)
- Windows Defender full scan and signature updates
- Firewall rules export
- Startup malware check
- Scheduled tasks auditing
- Local user and administrator accounts review
- Group Policy updates and reporting
- Audit policy analysis
- Credential Guard status
- BitLocker encryption status

### Performance Optimization (8 options)
- Power plan management (High Performance, Balanced)
- Hibernate enable/disable
- Drive optimization and TRIM
- Visual effects toggle
- Virtual memory (pagefile) information

### Tools & Launchers (10 options)
- Device Manager
- Task Manager
- Network Connections
- Disk Management
- Windows Security Center
- Event Viewer
- Services management
- Registry Editor
- Group Policy Editor
- Windows Explorer restart

### Full Suite Reports (4 options)
- Complete network diagnostic report
- Complete system diagnostic report
- Complete security audit report
- Full comprehensive report (all three combined)

## Requirements

### System Requirements
- **OS:** Windows 7/8/10/11
- **Architecture:** x86 or x64
- **Permissions:** Administrator privileges (Run as Administrator)
- **Shell:** Command Prompt or PowerShell

### Optional Requirements
- `curl` (for public IP lookup feature)
- PowerShell 5.0+ (for some advanced features)

## Installation

### Option 1: Direct Download
1. Download `AdminToolkit.bat` from the repository
2. Save to a convenient location (e.g., Desktop, Program Files)
3. Right-click → **Run as Administrator**

### Option 2: Clone Repository
```bash
git clone https://github.com/PwnPoint/Advanced-System-Admin-Toolkit.git
cd Advanced-System-Admin-Toolkit
```

## Usage

### Basic Operation
1. Run the script with administrator privileges:
   ```
   Right-click AdminTool.bat → Run as Administrator
   ```

2. Navigate through three menu pages using numbers or letters:
   - **1-26** or **N** to go to next page
   - **P** to go to previous page
   - **0** to exit

3. Select an option by entering its number

4. Reports are automatically saved to:
   ```
   %USERPROFILE%\Desktop\AdminToolkit_Report.txt
   ```

### Menu Structure

**Page 1 (Options 1-26):**
- Network diagnostics (1-18)
- System diagnostics (19-26)

**Page 2 (Options 27-52):**
- System diagnostics continued (27-32)
- Repair & maintenance (33-44)
- Security & audit (45-52)

**Page 3 (Options 53-76):**
- Security & audit continued (53-54)
- Performance optimization (55-62)
- Tools & launchers (63-72)
- Full suite reports (73-76)

## ⚠️ Safety & Warnings

### Administrative Actions
- **SFC /scannow** - Requires administrator privileges
- **DISM** - May take 10-20 minutes
- **CHKDSK** - Schedules disk check on reboot
- **Windows Update Reset** - Stops and restarts Windows Update services
- **Registry modifications** - Visual effects settings
- **System files** - Backup created automatically

### Data & Performance
- Temp file clearing removes cached data
- Print spooler flush requires service restart
- Visual effects changes require user re-login
- Continuous ping runs indefinitely (press Ctrl+C to stop)

### Best Practices
1. **Backup first** - Create a system restore point before major operations
2. **Review reports** - Check generated reports for errors or issues
3. **One task at a time** - Complete operations sequentially
4. **Network testing** - Ensure internet connectivity before network tests
5. **Document results** - Save reports for troubleshooting records

## Output & Reporting

All operations automatically log to:
- **Console** - Real-time output display
- **Report file** - %USERPROFILE%\Desktop\AdminToolkit_Report.txt

Additional HTML reports generated:
- Battery_Report.html (Option 23)
- Power_Report.html (Option 24)
- GPO_Report.html (Option 51)
- DxDiag_Report.txt (Option 25)
- Firewall_Rules.wfw (Option 47)

## Troubleshooting

### Script won't run
- **Solution:** Right-click → Run as Administrator
- Check Windows Execution Policy: `Get-ExecutionPolicy`

### Commands not recognized
- **Solution:** Ensure running as Administrator
- Some commands require Windows Pro/Enterprise editions (DISM, GPO, etc.)

### Paths not found
- **Solution:** Verify Windows installation is standard
- Some features may not work on modified Windows installations

### PowerShell errors
- **Solution:** Update PowerShell to version 5.0+
- Ensure ExecutionPolicy allows script execution

### curl command not found
- **Solution:** Install Git for Windows (includes curl)
- Or use alternative IP detection service

## Technical Details

### Language
- Batch script (.bat) with PowerShell integration
- Compatible with Windows 7 and newer

### Key Commands Used
- `ipconfig`, `ping`, `tracert`, `netstat`, `nslookup`
- `net`, `netsh`, `wmic`, `tasklist`, `schtasks`
- `powershell`, `reg`, `sfc`, `dism`, `manage-bde`
- `powercfg`, `defrag`, `curl`

### Logging
- Dual output to console and file
- Timestamped entries
- Session-based organization
- Error suppression for background operations

## License

This project is licensed under the MIT License - see LICENSE file for details.

## Author

**Chisom** - Advanced Windows Admin Toolkit Creator

## 🤝 Contributing

Contributions are welcome! Please feel free to:
- Report bugs
- Suggest new features
- Submit pull requests
- Improve documentation

### How to Contribute
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Support & Feedback

For issues, questions, or suggestions:
- Open an issue on GitHub
- Check existing issues for solutions
- Provide detailed error messages and Windows version

## Version History

### v1.0 (Current)
- 76+ diagnostic and maintenance options
- Dual logging (console + file)
- Three-page menu system
- Network, system, repair, security, and performance tools
- Full suite reporting capabilities

## Acknowledgments

- Windows administration community
- PowerShell documentation and best practices
- System administrators for feedback and testing

## References

- [Microsoft Windows Administration](https://docs.microsoft.com/en-us/windows-server/)
- [PowerShell Documentation](https://docs.microsoft.com/en-us/powershell/)
- [Windows CMD Reference](https://ss64.com/nt/)

---

**⚠️ Disclaimer:** This tool modifies system settings and should only be used by experienced system administrators. 

