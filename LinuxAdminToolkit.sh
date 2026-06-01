#!/bin/bash

################################################################################
#                                                                              #
#         ADVANCED LINUX ADMIN TOOLKIT v1.0                                   #
#         A Comprehensive System Diagnostics, Repair, and Optimization Tool    #
#                                                                              #
#         Author: Chisom                                                       #
#         License: MIT                                                         #
#         Requires: sudo/root privileges for full functionality                #
#                                                                              #
################################################################################

set -euo pipefail

# ============================================================
# CONFIGURATION
# ============================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPORT_DIR="${HOME}/Desktop"
REPORT_FILE="${REPORT_DIR}/LinuxAdminToolkit_Report.txt"
TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S')"

# Color codes for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# ============================================================
# UTILITY FUNCTIONS
# ============================================================

# Initialize report file
init_report() {
    mkdir -p "$REPORT_DIR"
    
    if [[ ! -f "$REPORT_FILE" ]]; then
        {
            echo "============================================================"
            echo "  ADVANCED LINUX ADMIN TOOLKIT - REPORT LOG                "
            echo "============================================================"
            echo "Created: $TIMESTAMP"
            echo ""
        } > "$REPORT_FILE"
    fi
    
    {
        echo ""
        echo "============================================================"
        echo "SESSION: $TIMESTAMP"
        echo "============================================================"
        echo ""
    } >> "$REPORT_FILE"
}

# LOG function - print to terminal AND append to report
log() {
    local message="$1"
    echo -e "$message"
    echo -e "$message" | sed 's/\x1b\[[0-9;]*m//g' >> "$REPORT_FILE"
}

# LOG_SECTION function - formatted section header
log_section() {
    local title="$1"
    echo ""
    echo -e "${CYAN}========================================================${NC}"
    echo -e "${CYAN}  $title${NC}"
    echo -e "${CYAN}========================================================${NC}"
    echo ""
    
    {
        echo ""
        echo "========================================================"
        echo "  $title"
        echo "========================================================"
        echo ""
    } >> "$REPORT_FILE"
}

# Check if running as root (not always required but recommended)
check_root() {
    if [[ $EUID -ne 0 ]]; then
        log "${YELLOW}⚠️  Running without root privileges. Some features may be limited.${NC}"
    fi
}

# Display menu and get choice
read_choice() {
    echo -n "Enter Option: " >&2
    read -r CHOICE
    echo "$CHOICE"
}

# ============================================================
# PAGE 1 - NETWORK DIAGNOSTICS (1-18) + SYSTEM INFO (19-26)
# ============================================================

display_menu_1() {
    clear
    echo ""
    echo "  =========================================================="
    echo "  Advanced Linux Admin Toolkit v1.0 By Chisom"
    echo "  PAGE 1 of 3 | N = Next page | 0 = Exit"
    echo "  =========================================================="
    echo ""
    echo "  [NETWORK DIAGNOSTICS]"
    echo "    1.  Show Full IP Configuration"
    echo "    2.  Ping Test (8.8.8.8)"
    echo "    3.  DNS Configuration and Test"
    echo "    4.  Network Interface Details"
    echo "    5.  Routing Table"
    echo "    6.  ARP Table (MAC Address Map)"
    echo "    7.  Netstat - Active Connections"
    echo "    8.  Listening Ports"
    echo "    9.  Traceroute to 8.8.8.8"
    echo "    10. Firewall Status (UFW/iptables)"
    echo "    11. DNS Lookup Test (nslookup)"
    echo "    12. Public IP Address"
    echo "    13. Network Bandwidth Usage"
    echo "    14. SSH Connectivity Test"
    echo "    15. TCP Connection States"
    echo "    16. Network Performance Test"
    echo "    17. Hostname and Domain Info"
    echo "    18. MTU and Network Settings"
    echo ""
    echo "  [SYSTEM INFORMATION]"
    echo "    19. Full System Information"
    echo "    20. CPU Details and Load"
    echo "    21. RAM / Memory Information"
    echo "    22. Disk Space Analysis"
    echo "    23. System Uptime"
    echo "    24. Kernel Information"
    echo "    25. Installed Linux Distribution"
    echo "    26. Hardware Inventory"
    echo ""
    echo "  =========================================================="
    echo "  N = Next Page (27-52)                    0 = Exit"
    echo "  =========================================================="
    echo "  Report: $REPORT_FILE"
}

display_menu_2() {
    clear
    echo ""
    echo "  =========================================================="
    echo "  Advanced Linux Admin Toolkit v1.0 By Chisom"
    echo "  PAGE 2 of 3 | P = Prev page | N = Next page | 0 = Exit"
    echo "  =========================================================="
    echo ""
    echo "  [SYSTEM INFORMATION - continued]"
    echo "    27. Running Processes (Full List)"
    echo "    28. Top Memory Consuming Processes"
    echo "    29. Top CPU Consuming Processes"
    echo "    30. System Services Status"
    echo "    31. Installed Packages List"
    echo "    32. Environment Variables"
    echo ""
    echo "  [MAINTENANCE & OPTIMIZATION]"
    echo "    33. Update Package Manager Cache"
    echo "    34. Check Available Updates"
    echo "    35. Security Updates Only"
    echo "    36. Clean Package Manager Cache"
    echo "    37. Remove Unused Packages"
    echo "    38. Check Disk Health (SMART)"
    echo "    39. File System Check Status"
    echo "    40. Repair File System (fsck)"
    echo "    41. Clear System Logs"
    echo "    42. Optimize Disk Usage"
    echo "    43. Memory Cache Analysis"
    echo "    44. System Temperature"
    echo ""
    echo "  [SECURITY & AUDIT]"
    echo "    45. Local User Accounts"
    echo "    46. Sudo Privileges Audit"
    echo "    47. Failed Login Attempts"
    echo "    48. Security Updates Status"
    echo "    49. SSH Keys Audit"
    echo "    50. File Permissions Audit"
    echo "    51. Security Compliance Check"
    echo "    52. System Audit Log (auditd)"
    echo ""
    echo "  =========================================================="
    echo "  P = Prev Page (1-26)    N = Next Page (53-76)   0 = Exit"
    echo "  =========================================================="
    echo "  Report: $REPORT_FILE"
}

display_menu_3() {
    clear
    echo ""
    echo "  =========================================================="
    echo "  Advanced Linux Admin Toolkit v1.0 By Chisom"
    echo "  PAGE 3 of 3 | P = Prev page | 0 = Exit"
    echo "  =========================================================="
    echo ""
    echo "  [PERFORMANCE & TUNING]"
    echo "    53. CPU Performance Metrics"
    echo "    54. Disk I/O Statistics"
    echo "    55. Memory Performance Tuning"
    echo "    56. Network Performance Tuning"
    echo "    57. Process Priority Management"
    echo "    58. System Load Average"
    echo "    59. CPU Frequency Scaling"
    echo "    60. Power Management Status"
    echo ""
    echo "  [TOOLS & UTILITIES]"
    echo "    61. Package Manager Info"
    echo "    62. Cron Jobs Overview"
    echo "    63. System Service Manager"
    echo "    64. Log File Viewer"
    echo "    65. Process Manager (top)"
    echo "    66. Disk Usage Tool (ncdu)"
    echo "    67. Network Monitor"
    echo "    68. System Resources Monitor"
    echo ""
    echo "  [FULL SUITE REPORTS]"
    echo "    69. Run Full Network Report"
    echo "    70. Run Full System Report"
    echo "    71. Run Full Security Report"
    echo "    72. Run Complete Full Report"
    echo ""
    echo "  =========================================================="
    echo "  P = Prev Page (27-52)                    0 = Exit"
    echo "  =========================================================="
    echo "  Report: $REPORT_FILE"
}

# ============================================================
# NETWORK DIAGNOSTICS (1-18)
# ============================================================

net_ipconfig() {
    log_section "IP CONFIGURATION (Full)"
    {
        ip addr show
        echo ""
        echo "--- IPv6 Information ---"
        ip -6 addr show
    } | tee -a "$REPORT_FILE"
}

net_ping() {
    log_section "PING TEST - 8.8.8.8"
    {
        ping -c 4 8.8.8.8
    } | tee -a "$REPORT_FILE"
}

net_dns() {
    log_section "DNS CONFIGURATION AND TEST"
    {
        echo "--- DNS Servers (from /etc/resolv.conf) ---"
        cat /etc/resolv.conf 2>/dev/null || echo "No /etc/resolv.conf found"
        echo ""
        echo "--- DNS Test (nslookup google.com) ---"
        nslookup google.com 2>/dev/null || echo "nslookup not available"
    } | tee -a "$REPORT_FILE"
}

net_interfaces() {
    log_section "NETWORK INTERFACE DETAILS"
    {
        ip link show
        echo ""
        echo "--- Interface Statistics ---"
        ss -i
    } | tee -a "$REPORT_FILE"
}

net_routing() {
    log_section "ROUTING TABLE"
    {
        ip route show
        echo ""
        echo "--- IPv6 Routes ---"
        ip -6 route show
    } | tee -a "$REPORT_FILE"
}

net_arp() {
    log_section "ARP TABLE (MAC ADDRESS MAP)"
    {
        ip neigh show
    } | tee -a "$REPORT_FILE"
}

net_netstat() {
    log_section "ACTIVE TCP CONNECTIONS"
    {
        ss -tuan
    } | tee -a "$REPORT_FILE"
}

net_ports() {
    log_section "LISTENING PORTS"
    {
        ss -tulpn
    } | tee -a "$REPORT_FILE"
}

net_traceroute() {
    log_section "TRACEROUTE TO 8.8.8.8"
    {
        traceroute -m 15 8.8.8.8 2>/dev/null || echo "traceroute not available or network unreachable"
    } | tee -a "$REPORT_FILE"
}

net_firewall() {
    log_section "FIREWALL STATUS"
    {
        echo "--- UFW Status ---"
        sudo ufw status verbose 2>/dev/null || echo "UFW not installed"
        echo ""
        echo "--- iptables Rules (IPv4) ---"
        sudo iptables -L -n 2>/dev/null || echo "iptables not available or insufficient privileges"
    } | tee -a "$REPORT_FILE"
}

net_dns_lookup() {
    log_section "DNS LOOKUP TEST"
    read -p "Enter domain to lookup: " domain
    {
        nslookup "$domain" 2>/dev/null || dig "$domain" 2>/dev/null || echo "DNS lookup tools not available"
    } | tee -a "$REPORT_FILE"
}

net_public_ip() {
    log_section "PUBLIC IP ADDRESS"
    {
        echo "--- Attempting to fetch public IP ---"
        curl -s https://checkip.amazonaws.com || curl -s https://ifconfig.me || echo "Unable to fetch public IP (no internet or curl not available)"
        echo ""
    } | tee -a "$REPORT_FILE"
}

net_bandwidth() {
    log_section "NETWORK BANDWIDTH USAGE"
    {
        if command -v vnstat &> /dev/null; then
            vnstat -h
        else
            echo "vnstat not installed. Use: sudo apt install vnstat"
        fi
    } | tee -a "$REPORT_FILE"
}

net_ssh() {
    log_section "SSH CONNECTIVITY TEST"
    {
        echo "--- SSH Service Status ---"
        systemctl status ssh 2>/dev/null || systemctl status sshd 2>/dev/null || echo "SSH service not found"
        echo ""
        echo "--- SSH Configuration ---"
        sudo grep -E "^Port|^PermitRootLogin|^PasswordAuthentication" /etc/ssh/sshd_config 2>/dev/null || echo "Unable to read SSH config"
    } | tee -a "$REPORT_FILE"
}

net_connections() {
    log_section "TCP CONNECTION STATES"
    {
        ss -tan | grep -E "State|ESTABLISHED|LISTEN|TIME-WAIT" | head -30
    } | tee -a "$REPORT_FILE"
}

net_performance() {
    log_section "NETWORK PERFORMANCE TEST"
    {
        if command -v iperf3 &> /dev/null; then
            echo "iperf3 is available for performance testing"
        else
            echo "Install iperf3: sudo apt install iperf3"
        fi
        echo ""
        echo "--- Current Network Load ---"
        uptime
    } | tee -a "$REPORT_FILE"
}

net_hostname() {
    log_section "HOSTNAME AND DOMAIN INFO"
    {
        echo "Hostname: $(hostname)"
        echo "FQDN: $(hostname -f 2>/dev/null || echo 'N/A')"
        echo "Domain: $(hostname -d 2>/dev/null || echo 'N/A')"
        echo ""
        echo "--- /etc/hostname ---"
        cat /etc/hostname
    } | tee -a "$REPORT_FILE"
}

net_mtu() {
    log_section "MTU AND NETWORK SETTINGS"
    {
        ip link show | grep -E "^[0-9]|mtu"
    } | tee -a "$REPORT_FILE"
}

# ============================================================
# SYSTEM INFORMATION (19-26)
# ============================================================

sys_info() {
    log_section "FULL SYSTEM INFORMATION"
    {
        uname -a
        echo ""
        echo "--- System Details ---"
        hostnamectl 2>/dev/null || echo "hostnamectl not available"
    } | tee -a "$REPORT_FILE"
}

sys_cpu() {
    log_section "CPU DETAILS AND LOAD"
    {
        echo "--- CPU Information ---"
        lscpu
        echo ""
        echo "--- CPU Load ---"
        uptime
        echo ""
        echo "--- Top CPU Consumers ---"
        ps aux --sort=-%cpu | head -6
    } | tee -a "$REPORT_FILE"
}

sys_memory() {
    log_section "RAM / MEMORY INFORMATION"
    {
        echo "--- Memory Summary ---"
        free -h
        echo ""
        echo "--- Detailed Memory ---"
        cat /proc/meminfo | head -15
    } | tee -a "$REPORT_FILE"
}

sys_disk() {
    log_section "DISK SPACE ANALYSIS"
    {
        echo "--- Disk Usage ---"
        df -h
        echo ""
        echo "--- Disk Partitions ---"
        lsblk
    } | tee -a "$REPORT_FILE"
}

sys_uptime() {
    log_section "SYSTEM UPTIME"
    {
        echo "Uptime: $(uptime -p 2>/dev/null || uptime)"
        echo ""
        echo "--- Last Boot ---"
        who -b 2>/dev/null || echo "Unable to determine last boot"
    } | tee -a "$REPORT_FILE"
}

sys_kernel() {
    log_section "KERNEL INFORMATION"
    {
        echo "Kernel Version: $(uname -r)"
        echo "Kernel Release: $(uname -s)"
        echo ""
        echo "--- Installed Kernels ---"
        ls /boot/vmlinuz-* 2>/dev/null | xargs -I {} basename {}
    } | tee -a "$REPORT_FILE"
}

sys_distro() {
    log_section "INSTALLED LINUX DISTRIBUTION"
    {
        if [[ -f /etc/os-release ]]; then
            cat /etc/os-release
        else
            lsb_release -a 2>/dev/null || echo "Distribution info not available"
        fi
    } | tee -a "$REPORT_FILE"
}

sys_hardware() {
    log_section "HARDWARE INVENTORY"
    {
        echo "--- CPU ---"
        grep -m1 "model name" /proc/cpuinfo
        echo ""
        echo "--- Memory (Total) ---"
        grep MemTotal /proc/meminfo
        echo ""
        echo "--- PCI Devices ---"
        lspci | head -20
    } | tee -a "$REPORT_FILE"
}

# ============================================================
# PAGE 2 - SYSTEM CONTINUED (27-32) + MAINTENANCE (33-44) + SECURITY (45-52)
# ============================================================

sys_processes() {
    log_section "RUNNING PROCESSES (FULL)"
    {
        ps aux --sort=-%cpu | head -30
    } | tee -a "$REPORT_FILE"
}

sys_top_memory() {
    log_section "TOP MEMORY CONSUMING PROCESSES"
    {
        ps aux --sort=-%mem | head -20
    } | tee -a "$REPORT_FILE"
}

sys_top_cpu() {
    log_section "TOP CPU CONSUMING PROCESSES"
    {
        ps aux --sort=-%cpu | head -20
    } | tee -a "$REPORT_FILE"
}

sys_services() {
    log_section "SYSTEM SERVICES STATUS"
    {
        systemctl list-units --type=service --state=running --all | head -30
    } | tee -a "$REPORT_FILE"
}

sys_packages() {
    log_section "INSTALLED PACKAGES LIST"
    {
        if command -v apt &> /dev/null; then
            dpkg -l | wc -l
            echo "Total packages installed (showing first 30):"
            dpkg -l | head -30
        elif command -v rpm &> /dev/null; then
            rpm -qa | wc -l
            echo "Total packages installed (showing first 30):"
            rpm -qa | head -30
        else
            echo "Package manager not recognized"
        fi
    } | tee -a "$REPORT_FILE"
}

sys_envvars() {
    log_section "ENVIRONMENT VARIABLES"
    {
        env | sort
    } | tee -a "$REPORT_FILE"
}

# ============================================================
# MAINTENANCE & OPTIMIZATION (33-44)
# ============================================================

maint_update_cache() {
    log_section "UPDATE PACKAGE MANAGER CACHE"
    {
        if command -v apt &> /dev/null; then
            sudo apt update -qq
            echo "apt cache updated"
        elif command -v yum &> /dev/null; then
            sudo yum check-update -q
            echo "yum cache updated"
        else
            echo "No supported package manager found"
        fi
    } | tee -a "$REPORT_FILE"
}

maint_check_updates() {
    log_section "CHECK AVAILABLE UPDATES"
    {
        if command -v apt &> /dev/null; then
            apt list --upgradable 2>/dev/null
        elif command -v yum &> /dev/null; then
            yum check-update
        else
            echo "No supported package manager found"
        fi
    } | tee -a "$REPORT_FILE"
}

maint_security_updates() {
    log_section "SECURITY UPDATES ONLY"
    {
        if command -v apt &> /dev/null; then
            sudo apt list --upgradable 2>/dev/null | grep -i security || echo "No security updates available"
        else
            echo "Check your package manager for security updates"
        fi
    } | tee -a "$REPORT_FILE"
}

maint_clean_cache() {
    log_section "CLEAN PACKAGE MANAGER CACHE"
    {
        if command -v apt &> /dev/null; then
            sudo apt clean && sudo apt autoclean
            echo "apt cache cleaned"
        elif command -v yum &> /dev/null; then
            sudo yum clean all
            echo "yum cache cleaned"
        else
            echo "No supported package manager found"
        fi
    } | tee -a "$REPORT_FILE"
}

maint_remove_unused() {
    log_section "REMOVE UNUSED PACKAGES"
    {
        if command -v apt &> /dev/null; then
            sudo apt autoremove -y
            echo "Unused packages removed"
        elif command -v yum &> /dev/null; then
            sudo yum autoremove -y
            echo "Unused packages removed"
        else
            echo "No supported package manager found"
        fi
    } | tee -a "$REPORT_FILE"
}

maint_disk_health() {
    log_section "CHECK DISK HEALTH (SMART)"
    {
        if command -v smartctl &> /dev/null; then
            sudo smartctl --scan | head -10
            echo ""
            echo "Install smartmontools: sudo apt install smartmontools"
        else
            echo "smartmontools not installed"
            echo "Install with: sudo apt install smartmontools"
        fi
    } | tee -a "$REPORT_FILE"
}

maint_filesystem() {
    log_section "FILE SYSTEM CHECK STATUS"
    {
        sudo tune2fs -l /dev/root 2>/dev/null | grep -E "Last mount time|Last checked" || echo "File system info not available"
    } | tee -a "$REPORT_FILE"
}

maint_fsck() {
    log_section "REPAIR FILE SYSTEM (fsck)"
    {
        echo "⚠️  WARNING: File system check should be done in single-user mode"
        echo "Schedule check at next boot: sudo touch /forcefsck"
        echo "Then reboot"
    } | tee -a "$REPORT_FILE"
}

maint_clear_logs() {
    log_section "CLEAR SYSTEM LOGS"
    {
        sudo journalctl --vacuum=1w 2>/dev/null || echo "journalctl not available"
        echo "Logs cleared (1 week retention)"
    } | tee -a "$REPORT_FILE"
}

maint_optimize_disk() {
    log_section "OPTIMIZE DISK USAGE"
    {
        if command -v fstrim &> /dev/null; then
            echo "Available mount points for TRIM:"
            df -t ext4 -t xfs | tail -n +2 | awk '{print $6}'
        else
            echo "fstrim not available"
        fi
    } | tee -a "$REPORT_FILE"
}

maint_memory_cache() {
    log_section "MEMORY CACHE ANALYSIS"
    {
        echo "--- Memory Cache Info ---"
        cat /proc/meminfo | grep -E "Cached|Buffers|MemAvailable"
        echo ""
        echo "--- Cache Pressure ---"
        cat /proc/sys/vm/swappiness
    } | tee -a "$REPORT_FILE"
}

maint_temperature() {
    log_section "SYSTEM TEMPERATURE"
    {
        if command -v sensors &> /dev/null; then
            sensors
        else
            echo "lm-sensors not installed"
            echo "Install with: sudo apt install lm-sensors"
        fi
    } | tee -a "$REPORT_FILE"
}

# ============================================================
# SECURITY & AUDIT (45-52)
# ============================================================

sec_users() {
    log_section "LOCAL USER ACCOUNTS"
    {
        echo "--- Local Users ---"
        cut -d: -f1,3,6 /etc/passwd | grep -E ":[1-9][0-9]{2,}:"
        echo ""
        echo "--- Sudo Group Members ---"
        getent group sudo 2>/dev/null || getent group wheel 2>/dev/null || echo "No sudo group found"
    } | tee -a "$REPORT_FILE"
}

sec_sudo() {
    log_section "SUDO PRIVILEGES AUDIT"
    {
        echo "--- Sudoers File Summary ---"
        sudo grep -v "^#" /etc/sudoers 2>/dev/null | grep -v "^$" || echo "Unable to read sudoers"
    } | tee -a "$REPORT_FILE"
}

sec_failed_login() {
    log_section "FAILED LOGIN ATTEMPTS"
    {
        echo "--- Recent Failed Logins (last 20) ---"
        sudo grep "Failed password" /var/log/auth.log 2>/dev/null | tail -20 || echo "No auth.log available"
    } | tee -a "$REPORT_FILE"
}

sec_updates() {
    log_section "SECURITY UPDATES STATUS"
    {
        maint_security_updates
    } | tee -a "$REPORT_FILE"
}

sec_ssh_keys() {
    log_section "SSH KEYS AUDIT"
    {
        echo "--- SSH Key Summary ---"
        for user in $(cut -d: -f1 /etc/passwd); do
            home_dir=$(eval echo "~$user")
            if [[ -d "$home_dir/.ssh" ]]; then
                echo "$user has SSH keys:"
                ls -la "$home_dir/.ssh/" 2>/dev/null | grep -E "^-|^d"
            fi
        done
    } | tee -a "$REPORT_FILE"
}

sec_permissions() {
    log_section "FILE PERMISSIONS AUDIT"
    {
        echo "--- World-Writable Files ---"
        sudo find / -xdev -type f -perm -002 2>/dev/null | head -20 || echo "Check skipped"
        echo ""
        echo "--- SUID/SGID Binaries ---"
        sudo find / -xdev \( -perm -4000 -o -perm -2000 \) -type f 2>/dev/null | head -20 || echo "Check skipped"
    } | tee -a "$REPORT_FILE"
}

sec_compliance() {
    log_section "SECURITY COMPLIANCE CHECK"
    {
        echo "--- Basic Security Checks ---"
        echo "1. SELinux Status:"
        getenforce 2>/dev/null || echo "SELinux not available"
        echo ""
        echo "2. Firewall Status:"
        sudo ufw status 2>/dev/null || echo "UFW not available"
        echo ""
        echo "3. SSH Server Running:"
        systemctl is-active ssh 2>/dev/null || echo "SSH not running"
    } | tee -a "$REPORT_FILE"
}

sec_audit() {
    log_section "SYSTEM AUDIT LOG (auditd)"
    {
        if command -v auditctl &> /dev/null; then
            echo "--- Audit Rules ---"
            sudo auditctl -l 2>/dev/null | head -10
        else
            echo "auditd not installed"
            echo "Install with: sudo apt install auditd"
        fi
    } | tee -a "$REPORT_FILE"
}

# ============================================================
# PAGE 3 - PERFORMANCE (53-60) + TOOLS (61-68) + SUITE (69-72)
# ============================================================

perf_cpu() {
    log_section "CPU PERFORMANCE METRICS"
    {
        echo "--- CPU Info ---"
        nproc
        echo ""
        echo "--- CPU Load ---"
        cat /proc/loadavg
    } | tee -a "$REPORT_FILE"
}

perf_disk_io() {
    log_section "DISK I/O STATISTICS"
    {
        if command -v iostat &> /dev/null; then
            iostat -x 1 2
        else
            echo "sysstat not installed. Install with: sudo apt install sysstat"
        fi
    } | tee -a "$REPORT_FILE"
}

perf_memory() {
    log_section "MEMORY PERFORMANCE TUNING"
    {
        echo "--- Memory Tuning Parameters ---"
        cat /proc/sys/vm/swappiness
        echo ""
        echo "--- Virtual Memory ---"
        free -h
    } | tee -a "$REPORT_FILE"
}

perf_network() {
    log_section "NETWORK PERFORMANCE TUNING"
    {
        echo "--- TCP Settings ---"
        cat /proc/sys/net/ipv4/tcp_max_tw_buckets 2>/dev/null
        echo ""
        echo "--- Network Interface Speed ---"
        if command -v ethtool &> /dev/null; then
            for iface in $(ip link show | grep "^[0-9]" | awk '{print $2}' | sed 's/:$//' | grep -v '^lo$'); do
                ethtool "$iface" 2>/dev/null | grep -E "Speed|Duplex" && break
            done || echo "ethtool check skipped"
        else
            echo "ethtool not available"
        fi
    } | tee -a "$REPORT_FILE"
}

perf_priority() {
    log_section "PROCESS PRIORITY MANAGEMENT"
    {
        echo "--- Process Scheduling ---"
        ps -eL -o pid,tid,class,rtprio,comm | head -10
    } | tee -a "$REPORT_FILE"
}

perf_load() {
    log_section "SYSTEM LOAD AVERAGE"
    {
        echo "Load Average: $(cat /proc/loadavg)"
        echo ""
        echo "--- Historical Load ---"
        uptime
    } | tee -a "$REPORT_FILE"
}

perf_cpu_freq() {
    log_section "CPU FREQUENCY SCALING"
    {
        if [[ -d /sys/devices/system/cpu/cpufreq ]]; then
            cat /sys/devices/system/cpu/cpufreq/policy0/scaling_governor 2>/dev/null || echo "CPU frequency scaling not available"
        else
            echo "CPU frequency scaling not available on this system"
        fi
    } | tee -a "$REPORT_FILE"
}

perf_power() {
    log_section "POWER MANAGEMENT STATUS"
    {
        echo "--- Power Profile ---"
        systemctl status power-profiles-daemon 2>/dev/null || echo "power-profiles-daemon not running"
        echo ""
        echo "--- Battery Info ---"
        acpi -i 2>/dev/null || echo "acpi not available or no battery"
    } | tee -a "$REPORT_FILE"
}

# ============================================================
# TOOLS & UTILITIES (61-68)
# ============================================================

tool_package() {
    log_section "PACKAGE MANAGER INFO"
    {
        if command -v apt &> /dev/null; then
            apt --version
            echo ""
            dpkg -l | wc -l
            echo "total packages installed"
        elif command -v yum &> /dev/null; then
            yum --version
            echo ""
            rpm -qa | wc -l
            echo "total packages installed"
        else
            echo "No supported package manager found"
        fi
    } | tee -a "$REPORT_FILE"
}

tool_cron() {
    log_section "CRON JOBS OVERVIEW"
    {
        echo "--- User Cron Jobs ---"
        for user in $(cut -d: -f1 /etc/passwd); do
            crontab -u "$user" -l 2>/dev/null && echo "User: $user" && echo ""
        done
        echo ""
        echo "--- System Cron Jobs ---"
        ls /etc/cron.* 2>/dev/null || echo "No system cron jobs found"
    } | tee -a "$REPORT_FILE"
}

tool_services() {
    log_section "SYSTEM SERVICE MANAGER"
    {
        echo "--- Active Services ---"
        systemctl list-units --type=service --state=active --no-pager | head -20
    } | tee -a "$REPORT_FILE"
}

tool_logs() {
    log_section "LOG FILE VIEWER"
    {
        echo "--- Recent System Logs (last 20 lines) ---"
        sudo journalctl -n 20 2>/dev/null || tail -20 /var/log/syslog
    } | tee -a "$REPORT_FILE"
}

tool_top() {
    log_section "PROCESS MANAGER (top)"
    {
        echo "Use: top"
        echo "To run interactively, use: top"
        echo ""
        echo "--- Quick snapshot ---"
        top -n 1 -b | head -15
    } | tee -a "$REPORT_FILE"
}

tool_disk_usage() {
    log_section "DISK USAGE TOOL (ncdu)"
    {
        if command -v ncdu &> /dev/null; then
            echo "ncdu is installed"
            echo "Run interactively: ncdu /"
        else
            echo "ncdu not installed. Install with: sudo apt install ncdu"
        fi
    } | tee -a "$REPORT_FILE"
}

tool_network_monitor() {
    log_section "NETWORK MONITOR"
    {
        if command -v nethogs &> /dev/null; then
            echo "nethogs is available"
            echo "Run: sudo nethogs"
        else
            echo "nethogs not installed. Install with: sudo apt install nethogs"
        fi
    } | tee -a "$REPORT_FILE"
}

tool_resources() {
    log_section "SYSTEM RESOURCES MONITOR"
    {
        echo "--- Current Resources ---"
        free -h
        echo ""
        df -h
        echo ""
        ps aux --sort=-%cpu | head -5
    } | tee -a "$REPORT_FILE"
}

# ============================================================
# SUITE REPORTS (69-72)
# ============================================================

suite_network() {
    log_section "FULL NETWORK DIAGNOSTIC REPORT"
    log "Running network diagnostics..."
    net_ipconfig
    net_interfaces
    net_routing
    net_ports
    net_firewall
    log "Network report complete."
}

suite_system() {
    log_section "FULL SYSTEM DIAGNOSTIC REPORT"
    log "Running system diagnostics..."
    sys_info
    sys_cpu
    sys_memory
    sys_disk
    sys_processes
    sys_services
    log "System report complete."
}

suite_security() {
    log_section "FULL SECURITY AUDIT REPORT"
    log "Running security audit..."
    sec_users
    sec_sudo
    sec_updates
    sec_compliance
    log "Security audit complete."
}

suite_all() {
    log_section "COMPLETE FULL SYSTEM REPORT"
    log "Running complete diagnostics..."
    suite_network
    suite_system
    suite_security
    log "============================================="
    log "ALL REPORTS COMPLETE"
    log "Saved to: $REPORT_FILE"
    log "============================================="
}

# ============================================================
# MAIN MENU LOGIC
# ============================================================

main_loop() {
    while true; do
        display_menu_1
        choice=$(read_choice)
        
        case $choice in
            0) exit 0 ;;
            n|N) show_menu_2 ;;
            1) net_ipconfig ;;
            2) net_ping ;;
            3) net_dns ;;
            4) net_interfaces ;;
            5) net_routing ;;
            6) net_arp ;;
            7) net_netstat ;;
            8) net_ports ;;
            9) net_traceroute ;;
            10) net_firewall ;;
            11) net_dns_lookup ;;
            12) net_public_ip ;;
            13) net_bandwidth ;;
            14) net_ssh ;;
            15) net_connections ;;
            16) net_performance ;;
            17) net_hostname ;;
            18) net_mtu ;;
            19) sys_info ;;
            20) sys_cpu ;;
            21) sys_memory ;;
            22) sys_disk ;;
            23) sys_uptime ;;
            24) sys_kernel ;;
            25) sys_distro ;;
            26) sys_hardware ;;
            *) log "${RED}Invalid option. Press Enter...${NC}"; read -r ;;
        esac
        
        read -p "Press Enter to continue..." || true
    done
}

show_menu_2() {
    while true; do
        display_menu_2
        choice=$(read_choice)
        
        case $choice in
            0) exit 0 ;;
            p|P) break ;;
            n|N) show_menu_3 ;;
            27) sys_processes ;;
            28) sys_top_memory ;;
            29) sys_top_cpu ;;
            30) sys_services ;;
            31) sys_packages ;;
            32) sys_envvars ;;
            33) maint_update_cache ;;
            34) maint_check_updates ;;
            35) maint_security_updates ;;
            36) maint_clean_cache ;;
            37) maint_remove_unused ;;
            38) maint_disk_health ;;
            39) maint_filesystem ;;
            40) maint_fsck ;;
            41) maint_clear_logs ;;
            42) maint_optimize_disk ;;
            43) maint_memory_cache ;;
            44) maint_temperature ;;
            45) sec_users ;;
            46) sec_sudo ;;
            47) sec_failed_login ;;
            48) sec_updates ;;
            49) sec_ssh_keys ;;
            50) sec_permissions ;;
            51) sec_compliance ;;
            52) sec_audit ;;
            *) log "${RED}Invalid option. Press Enter...${NC}"; read -r ;;
        esac
        
        read -p "Press Enter to continue..." || true
    done
    main_loop
}

show_menu_3() {
    while true; do
        display_menu_3
        choice=$(read_choice)
        
        case $choice in
            0) exit 0 ;;
            p|P) show_menu_2 ;;
            53) perf_cpu ;;
            54) perf_disk_io ;;
            55) perf_memory ;;
            56) perf_network ;;
            57) perf_priority ;;
            58) perf_load ;;
            59) perf_cpu_freq ;;
            60) perf_power ;;
            61) tool_package ;;
            62) tool_cron ;;
            63) tool_services ;;
            64) tool_logs ;;
            65) tool_top ;;
            66) tool_disk_usage ;;
            67) tool_network_monitor ;;
            68) tool_resources ;;
            69) suite_network ;;
            70) suite_system ;;
            71) suite_security ;;
            72) suite_all ;;
            *) log "${RED}Invalid option. Press Enter...${NC}"; read -r ;;
        esac
        
        read -p "Press Enter to continue..." || true
    done
}

# ============================================================
# ENTRY POINT
# ============================================================

main() {
    init_report
    check_root
    main_loop
}

# Trap Ctrl+C to exit gracefully
trap 'echo ""; log "${YELLOW}Toolkit terminated${NC}"; exit 0' INT

# Run main function
main "$@"
