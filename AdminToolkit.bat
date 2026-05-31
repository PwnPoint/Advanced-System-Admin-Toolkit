@echo off
setlocal EnableDelayedExpansion
title Advanced Windows Admin Toolkit v1.0
color 0A
mode con: cols=80 lines=45

:: ============================================================
:: REPORT FILE SETUP
:: ============================================================
set "REPORT=%USERPROFILE%\Desktop\AdminToolkit_Report.txt"
set "TIMESTAMP=%DATE% %TIME%"

if not exist "%REPORT%" (
    echo ============================================================ > "%REPORT%"
    echo   ADVANCED WINDOWS ADMIN TOOLKIT - REPORT LOG               >> "%REPORT%"
    echo ============================================================ >> "%REPORT%"
    echo Created: %TIMESTAMP% >> "%REPORT%"
    echo. >> "%REPORT%"
)

:: Write session header to report
echo. >> "%REPORT%"
echo ============================================================ >> "%REPORT%"
echo SESSION: %TIMESTAMP% >> "%REPORT%"
echo ============================================================ >> "%REPORT%"
echo. >> "%REPORT%"

goto :MENU

:: ============================================================
:: HELPER: LOG function - prints to terminal AND appends to report
:: Usage: call :LOG "Your message here"
:: ============================================================
:LOG
    echo %~1
    echo %~1 >> "%REPORT%"
    goto :EOF

:: ============================================================
:: HELPER: LOG_CMD - runs a command, tees output to terminal + report
:: ============================================================
:LOG_SECTION
    echo.
    echo --------------------------------------------------------
    echo   %~1
    echo --------------------------------------------------------
    echo. >> "%REPORT%"
    echo -------------------------------------------------------- >> "%REPORT%"
    echo   %~1 >> "%REPORT%"
    echo -------------------------------------------------------- >> "%REPORT%"
    goto :EOF

:: ============================================================
:: PAGE 1 of 3  -  Network (1-18)  +  System Diagnostics (19-26)
:: ============================================================
:MENU
cls
echo.
echo  +==========================================================+
echo  ^|        ADVANCED WINDOWS ADMIN TOOLKIT  v1.0 By Chisom   ^|
echo  ^|           Run as Administrator for full access          ^|
echo  ^|  PAGE 1 of 3  ^|  N = Next page   ^|  0 = Exit            ^|
echo  +==========================================================+
echo.
echo  [NETWORK]
echo    1.  Show Full IP Configuration
echo    2.  Ping Test (Google + 8.8.8.8)
echo    3.  Flush DNS Cache
echo    4.  Release + Renew IP Address
echo    5.  Reset Winsock
echo    6.  Reset TCP/IP Stack
echo    7.  WiFi Profiles + Saved Passwords
echo    8.  Network Firewall Status
echo    9.  Disable / Enable Network Adapter
echo    10. Show IP Route Table
echo    11. Active TCP Connections (netstat)
echo    12. Continuous Ping to 8.8.8.8
echo    13. Trace Route to Google
echo    14. Network Adapter Statistics
echo    15. ARP Table (MAC Address Map)
echo    16. Check Open / Listening Ports
echo    17. DNS Lookup Test (nslookup)
echo    18. Public IP + Location Info
echo.
echo  [SYSTEM DIAGNOSTICS]
echo    19. Full System Information
echo    20. CPU Details
echo    21. RAM / Memory Info
echo    22. GPU / Display Adapter Info
echo    23. Battery Report (HTML on Desktop)
echo    24. Power Efficiency Report (HTML)
echo    25. DirectX Diagnostics (dxdiag)
echo    26. Disk Space - All Drives
echo.
echo  +----------------------------------------------------------+
echo    N = Next Page (27-52)                    0 = Exit
echo  +----------------------------------------------------------+
echo  Report: %REPORT%
set /p CHOICE=  Enter Option (1-26, N, 0): 

if /i "%CHOICE%"=="n" goto :MENU2
if "%CHOICE%"=="0"  goto :EXIT

if "%CHOICE%"=="1"  goto :NET_IPCONFIG
if "%CHOICE%"=="2"  goto :NET_PING
if "%CHOICE%"=="3"  goto :NET_DNS
if "%CHOICE%"=="4"  goto :NET_RELEASE_RENEW
if "%CHOICE%"=="5"  goto :NET_WINSOCK
if "%CHOICE%"=="6"  goto :NET_TCPIP
if "%CHOICE%"=="7"  goto :NET_WIFI
if "%CHOICE%"=="8"  goto :NET_FIREWALL
if "%CHOICE%"=="9"  goto :NET_ADAPTER
if "%CHOICE%"=="10" goto :NET_ROUTE
if "%CHOICE%"=="11" goto :NET_CONNECTIONS
if "%CHOICE%"=="12" goto :NET_PINGCONT
if "%CHOICE%"=="13" goto :NET_TRACE
if "%CHOICE%"=="14" goto :NET_STATS
if "%CHOICE%"=="15" goto :NET_ARP
if "%CHOICE%"=="16" goto :NET_PORTS
if "%CHOICE%"=="17" goto :NET_DNS_LOOKUP
if "%CHOICE%"=="18" goto :NET_IPINFO
if "%CHOICE%"=="19" goto :SYS_INFO
if "%CHOICE%"=="20" goto :SYS_CPU
if "%CHOICE%"=="21" goto :SYS_RAM
if "%CHOICE%"=="22" goto :SYS_GPU
if "%CHOICE%"=="23" goto :SYS_BATTERY
if "%CHOICE%"=="24" goto :SYS_POWER
if "%CHOICE%"=="25" goto :SYS_DX
if "%CHOICE%"=="26" goto :SYS_DISK

echo  Invalid option. Press any key...
pause >nul
goto :MENU

:: ============================================================
:: PAGE 2 of 3  -  System cont. (27-32)  +  Repair (33-44)  +  Security (45-52)
:: ============================================================
:MENU2
cls
echo.
echo  +==========================================================+
echo  ^|        ADVANCED WINDOWS ADMIN TOOLKIT  v1.0 By Chisom   ^|
echo  ^|           Run as Administrator for full access          ^|
echo  ^|  PAGE 2 of 3  ^|  N = Next page   ^|  0 = Exit            ^|
echo  +==========================================================+
echo.
echo  [SYSTEM DIAGNOSTICS - continued]
echo    27. Running Processes (Full List)
echo    28. Startup Programs (Registry)
echo    29. Installed Software List
echo    30. Windows Hotfixes / Updates
echo    31. Environment Variables
echo    32. System Uptime
echo.
echo  [REPAIR ^& MAINTENANCE]
echo    33. System File Checker (SFC /scannow)
echo    34. DISM Health Check
echo    35. DISM Restore Health
echo    36. Check Disk C: (schedule on reboot)
echo    37. Clear Temp Files
echo    38. Clear Prefetch Cache
echo    39. Rebuild Icon Cache
echo    40. Reset Windows Update Components
echo    41. Flush Print Spooler
echo    42. Re-register Windows Store Apps
echo    43. Create System Restore Point
echo    44. Open Windows Update Settings
echo.
echo  [SECURITY ^& AUDIT]
echo    45. Windows Defender Full Scan
echo    46. Update Defender Signatures
echo    47. Export Firewall Rules to Desktop
echo    48. Startup Malware Check (Registry)
echo    49. Check All Scheduled Tasks
echo    50. Check Local User Accounts
echo    51. Group Policy Update + HTML Report
echo    52. Audit Policy Report
echo.
echo  +----------------------------------------------------------+
echo    P = Prev Page (1-26)    N = Next Page (53-76)   0 = Exit
echo  +----------------------------------------------------------+
echo  Report: %REPORT%
set /p CHOICE=  Enter Option (27-52, P, N, 0): 

if /i "%CHOICE%"=="p" goto :MENU
if /i "%CHOICE%"=="n" goto :MENU3
if "%CHOICE%"=="0"  goto :EXIT

if "%CHOICE%"=="27" goto :SYS_PROCS
if "%CHOICE%"=="28" goto :SYS_STARTUP
if "%CHOICE%"=="29" goto :SYS_SOFTWARE
if "%CHOICE%"=="30" goto :SYS_HOTFIXES
if "%CHOICE%"=="31" goto :SYS_ENVVARS
if "%CHOICE%"=="32" goto :SYS_UPTIME
if "%CHOICE%"=="33" goto :REP_SFC
if "%CHOICE%"=="34" goto :REP_DISM_CHECK
if "%CHOICE%"=="35" goto :REP_DISM_RESTORE
if "%CHOICE%"=="36" goto :REP_CHKDSK
if "%CHOICE%"=="37" goto :REP_TEMP
if "%CHOICE%"=="38" goto :REP_PREFETCH
if "%CHOICE%"=="39" goto :REP_ICON
if "%CHOICE%"=="40" goto :REP_WINUPDATE
if "%CHOICE%"=="41" goto :REP_PRINT
if "%CHOICE%"=="42" goto :REP_STORE
if "%CHOICE%"=="43" goto :REP_RESTORE
if "%CHOICE%"=="44" goto :REP_UPDATECHECK
if "%CHOICE%"=="45" goto :SEC_SCAN
if "%CHOICE%"=="46" goto :SEC_UPDATE
if "%CHOICE%"=="47" goto :SEC_FIREWALL_EXPORT
if "%CHOICE%"=="48" goto :SEC_STARTUP
if "%CHOICE%"=="49" goto :SEC_TASKS
if "%CHOICE%"=="50" goto :SEC_USERS
if "%CHOICE%"=="51" goto :SEC_GPO
if "%CHOICE%"=="52" goto :SEC_AUDIT

echo  Invalid option. Press any key...
pause >nul
goto :MENU2

:: ============================================================
:: PAGE 3 of 3  -  Security cont. (53-54)  +  Performance (55-62)  +  Tools (63-72)  +  Suite (73-76)
:: ============================================================
:MENU3
cls
echo.
echo  +==========================================================+
echo  ^|        ADVANCED WINDOWS ADMIN TOOLKIT  v1.0 By Chisom   ^|
echo  ^|           Run as Administrator for full access          ^|
echo  ^|  PAGE 3 of 3  ^|  N = Next page   ^|  0 = Exit            ^|
echo  +==========================================================+
echo.
echo  [SECURITY ^& AUDIT - continued]
echo    53. Credential Guard Status
echo    54. BitLocker Encryption Status
echo.
echo  [PERFORMANCE]
echo    55. Set High Performance Power Plan
echo    56. Set Balanced Power Plan
echo    57. Enable Hibernate
echo    58. Disable Hibernate (frees disk)
echo    59. Optimize / TRIM All Drives
echo    60. Disable Visual Effects (speed boost)
echo    61. Enable Visual Effects (best look)
echo    62. Virtual Memory (Pagefile) Info
echo.
echo  [TOOLS ^& LAUNCHERS]
echo    63. Open Device Manager
echo    64. Open Task Manager
echo    65. Open Network Connections
echo    66. Open Disk Management
echo    67. Open Windows Security Center
echo    68. Open Event Viewer
echo    69. Open Services (services.msc)
echo    70. Open Registry Editor
echo    71. Open Local Group Policy Editor
echo    72. Restart Windows Explorer
echo.
echo  [FULL SUITE REPORTS]
echo    73. Run Full Network Diagnostic Report
echo    74. Run Full System Diagnostic Report
echo    75. Run Full Security Audit Report
echo    76. Run EVERYTHING - Complete Full Report
echo.
echo  +----------------------------------------------------------+
echo    P = Prev Page (27-52)                    0 = Exit
echo  +----------------------------------------------------------+
echo  Report: %REPORT%
set /p CHOICE=  Enter Option (53-76, P, 0): 

if /i "%CHOICE%"=="p" goto :MENU2
if "%CHOICE%"=="0"  goto :EXIT

if "%CHOICE%"=="53" goto :SEC_CREDGUARD
if "%CHOICE%"=="54" goto :SEC_BITLOCKER
if "%CHOICE%"=="55" goto :PERF_HIGH
if "%CHOICE%"=="56" goto :PERF_BALANCED
if "%CHOICE%"=="57" goto :PERF_HIB_ON
if "%CHOICE%"=="58" goto :PERF_HIB_OFF
if "%CHOICE%"=="59" goto :PERF_TRIM
if "%CHOICE%"=="60" goto :PERF_VISOFF
if "%CHOICE%"=="61" goto :PERF_VISON
if "%CHOICE%"=="62" goto :PERF_VMEM
if "%CHOICE%"=="63" goto :TOOL_DEVMGR
if "%CHOICE%"=="64" goto :TOOL_TASKMGR
if "%CHOICE%"=="65" goto :TOOL_NETCONN
if "%CHOICE%"=="66" goto :TOOL_DISKMGMT
if "%CHOICE%"=="67" goto :TOOL_SECURITY
if "%CHOICE%"=="68" goto :TOOL_EVENTLOG
if "%CHOICE%"=="69" goto :TOOL_SERVICES
if "%CHOICE%"=="70" goto :TOOL_REGEDIT
if "%CHOICE%"=="71" goto :TOOL_GPO
if "%CHOICE%"=="72" goto :TOOL_EXPLORER
if "%CHOICE%"=="73" goto :SUITE_NETWORK
if "%CHOICE%"=="74" goto :SUITE_SYSTEM
if "%CHOICE%"=="75" goto :SUITE_SECURITY
if "%CHOICE%"=="76" goto :SUITE_ALL

echo  Invalid option. Press any key...
pause >nul
goto :MENU3

:: ============================================================
:: NETWORK COMMANDS
:: ============================================================
:NET_IPCONFIG
cls
call :LOG_SECTION "IP CONFIGURATION (Full)"
call :LOG "[Time: %DATE% %TIME%]"
ipconfig /all
ipconfig /all >> "%REPORT%" 2>nul
pause
goto :MENU

:NET_PING
cls
call :LOG_SECTION "PING TEST - Google + 8.8.8.8"
call :LOG "[Time: %DATE% %TIME%]"
echo Pinging google.com...
ping google.com -n 4 2>&1
ping google.com -n 4 >> "%REPORT%" 2>&1
echo.
echo Pinging 8.8.8.8...
ping 8.8.8.8 -n 4 2>&1
ping 8.8.8.8 -n 4 >> "%REPORT%" 2>&1
pause
goto :MENU

:NET_DNS
cls
call :LOG_SECTION "DNS CACHE FLUSH"
call :LOG "[Time: %DATE% %TIME%]"
ipconfig /flushdns
echo DNS Cache Flushed >> "%REPORT%"
call :LOG "DNS cache flushed successfully."
pause
goto :MENU

:NET_RELEASE_RENEW
cls
call :LOG_SECTION "RELEASE AND RENEW IP ADDRESS"
call :LOG "[Time: %DATE% %TIME%]"
call :LOG "Releasing IP address..."
ipconfig /release
echo IP Released >> "%REPORT%"
call :LOG "Renewing IP address..."
ipconfig /renew
echo IP Renewed >> "%REPORT%"
call :LOG "IP address renewed."
ipconfig | findstr /i "IPv4"
ipconfig | findstr /i "IPv4" >> "%REPORT%"
pause
goto :MENU

:NET_WINSOCK
cls
call :LOG_SECTION "WINSOCK RESET"
call :LOG "[Time: %DATE% %TIME%]"
netsh winsock reset
echo Winsock Reset Complete >> "%REPORT%"
call :LOG "Winsock reset complete. A RESTART IS REQUIRED."
pause
goto :MENU

:NET_TCPIP
cls
call :LOG_SECTION "TCP/IP STACK RESET"
call :LOG "[Time: %DATE% %TIME%]"
netsh int ip reset
netsh int ipv6 reset
echo TCP/IP + IPv6 stack reset >> "%REPORT%"
call :LOG "TCP/IP and IPv6 stacks reset. A RESTART IS REQUIRED."
pause
goto :MENU

:NET_WIFI
cls
call :LOG_SECTION "WIFI PROFILES + SAVED PASSWORDS"
call :LOG "[Time: %DATE% %TIME%]"
echo --- Saved WiFi Profiles: ---
netsh wlan show profiles 2>&1
netsh wlan show profiles >> "%REPORT%"
echo.
echo --- Passwords (Key Content): ---
for /f "tokens=2 delims=:" %%a in ('netsh wlan show profiles ^| findstr /i "Profile"') do (
    set "WIFI=%%a"
    set "WIFI=!WIFI: =!"
    echo Profile: !WIFI!
    netsh wlan show profile name="!WIFI!" key=clear 2>&1 | findstr /i "Key Content"
    echo Profile: !WIFI! >> "%REPORT%"
    netsh wlan show profile name="!WIFI!" key=clear 2>&1 | findstr /i "Key Content" >> "%REPORT%"
)
pause
goto :MENU

:NET_FIREWALL
cls
call :LOG_SECTION "WINDOWS FIREWALL STATUS"
call :LOG "[Time: %DATE% %TIME%]"
netsh advfirewall show allprofiles
netsh advfirewall show allprofiles >> "%REPORT%"
pause
goto :MENU

:NET_ADAPTER
cls
call :LOG_SECTION "NETWORK ADAPTER ENABLE/DISABLE"
call :LOG "[Time: %DATE% %TIME%]"
echo Current adapters:
netsh interface show interface
echo.
set /p ADAPT=Enter adapter name to toggle (exact name): 
set /p ACTION=Type ENABLE or DISABLE: 
netsh interface set interface "%ADAPT%" %ACTION%
echo Adapter %ADAPT% set to %ACTION% >> "%REPORT%"
call :LOG "Adapter [%ADAPT%] -> %ACTION%"
pause
goto :MENU

:NET_ROUTE
cls
call :LOG_SECTION "IP ROUTING TABLE"
call :LOG "[Time: %DATE% %TIME%]"
route print
route print >> "%REPORT%"
pause
goto :MENU

:NET_CONNECTIONS
cls
call :LOG_SECTION "ACTIVE TCP CONNECTIONS"
call :LOG "[Time: %DATE% %TIME%]"
netstat -ano
netstat -ano >> "%REPORT%"
pause
goto :MENU

:NET_PINGCONT
cls
call :LOG_SECTION "CONTINUOUS PING 8.8.8.8 (Ctrl+C to stop)"
call :LOG "[Time: %DATE% %TIME%]"
ping 8.8.8.8 -t
pause
goto :MENU

:NET_TRACE
cls
call :LOG_SECTION "TRACEROUTE TO GOOGLE"
call :LOG "[Time: %DATE% %TIME%]"
tracert google.com
tracert google.com >> "%REPORT%"
pause
goto :MENU

:NET_STATS
cls
call :LOG_SECTION "NETWORK ADAPTER STATISTICS"
call :LOG "[Time: %DATE% %TIME%]"
netstat -e
netstat -e >> "%REPORT%"
pause
goto :MENU

:NET_ARP
cls
call :LOG_SECTION "ARP TABLE (MAC ADDRESS MAP)"
call :LOG "[Time: %DATE% %TIME%]"
arp -a
arp -a >> "%REPORT%"
pause
goto :MENU

:NET_PORTS
cls
call :LOG_SECTION "OPEN / LISTENING PORTS"
call :LOG "[Time: %DATE% %TIME%]"
netstat -abno 2>nul | findstr /i "LISTENING"
netstat -abno 2>nul | findstr /i "LISTENING" >> "%REPORT%"
pause
goto :MENU

:NET_DNS_LOOKUP
cls
call :LOG_SECTION "DNS LOOKUP TEST"
call :LOG "[Time: %DATE% %TIME%]"
set /p DNSHOST=Enter domain to lookup: 
nslookup %DNSHOST%
nslookup %DNSHOST% >> "%REPORT%"
pause
goto :MENU

:NET_IPINFO
cls
call :LOG_SECTION "PUBLIC IP + LOCATION INFO"
call :LOG "[Time: %DATE% %TIME%]"
call :LOG "Querying public IP via curl..."
curl -s https://ipinfo.io 2>nul
curl -s https://ipinfo.io >> "%REPORT%" 2>nul
echo.
call :LOG "(curl must be installed for this feature)"
pause
goto :MENU

:: ============================================================
:: SYSTEM DIAGNOSTICS
:: ============================================================
:SYS_INFO
cls
call :LOG_SECTION "FULL SYSTEM INFORMATION"
call :LOG "[Time: %DATE% %TIME%]"
systeminfo
systeminfo >> "%REPORT%"
pause
goto :MENU

:SYS_CPU
cls
call :LOG_SECTION "CPU DETAILS"
call :LOG "[Time: %DATE% %TIME%]"
wmic cpu get Name,NumberOfCores,NumberOfLogicalProcessors,MaxClockSpeed,CurrentClockSpeed,LoadPercentage,Status /format:list
wmic cpu get Name,NumberOfCores,NumberOfLogicalProcessors,MaxClockSpeed,CurrentClockSpeed,LoadPercentage,Status /format:list >> "%REPORT%"
pause
goto :MENU

:SYS_RAM
cls
call :LOG_SECTION "RAM / MEMORY INFORMATION"
call :LOG "[Time: %DATE% %TIME%]"
wmic memorychip get BankLabel,Capacity,Speed,Manufacturer,MemoryType,FormFactor /format:list
wmic memorychip get BankLabel,Capacity,Speed,Manufacturer,MemoryType,FormFactor /format:list >> "%REPORT%"
echo.
echo --- Available Physical Memory ---
wmic OS get FreePhysicalMemory,TotalVisibleMemorySize /format:list
wmic OS get FreePhysicalMemory,TotalVisibleMemorySize /format:list >> "%REPORT%"
pause
goto :MENU

:SYS_GPU
cls
call :LOG_SECTION "GPU / DISPLAY ADAPTER INFO"
call :LOG "[Time: %DATE% %TIME%]"
wmic path win32_videocontroller get Name,DriverVersion,AdapterRAM,VideoModeDescription,CurrentRefreshRate /format:list
wmic path win32_videocontroller get Name,DriverVersion,AdapterRAM,VideoModeDescription,CurrentRefreshRate /format:list >> "%REPORT%"
pause
goto :MENU

:SYS_BATTERY
cls
call :LOG_SECTION "BATTERY REPORT"
call :LOG "[Time: %DATE% %TIME%]"
powercfg /batteryreport /output "%USERPROFILE%\Desktop\Battery_Report.html"
call :LOG "Battery report saved to Desktop: Battery_Report.html"
start "%USERPROFILE%\Desktop\Battery_Report.html"
echo Battery report generated and opened >> "%REPORT%"
pause
goto :MENU

:SYS_POWER
cls
call :LOG_SECTION "POWER EFFICIENCY REPORT"
call :LOG "[Time: %DATE% %TIME%]"
powercfg /energy /output "%USERPROFILE%\Desktop\Power_Report.html" /duration 10
call :LOG "Power report saved to Desktop: Power_Report.html"
start "%USERPROFILE%\Desktop\Power_Report.html"
echo Power efficiency report generated >> "%REPORT%"
pause
goto :MENU

:SYS_DX
cls
call :LOG_SECTION "DIRECTX DIAGNOSTICS"
call :LOG "[Time: %DATE% %TIME%]"
call :LOG "Launching dxdiag..."
dxdiag /t "%USERPROFILE%\Desktop\DxDiag_Report.txt"
call :LOG "DxDiag report saved to Desktop."
echo DxDiag report saved to Desktop >> "%REPORT%"
pause
goto :MENU

:SYS_DISK
cls
call :LOG_SECTION "DISK SPACE - ALL DRIVES"
call :LOG "[Time: %DATE% %TIME%]"
wmic logicaldisk get DeviceID,Size,FreeSpace,FileSystem,VolumeName /format:list
wmic logicaldisk get DeviceID,Size,FreeSpace,FileSystem,VolumeName /format:list >> "%REPORT%"
pause
goto :MENU

:SYS_PROCS
cls
call :LOG_SECTION "RUNNING PROCESSES (FULL)"
call :LOG "[Time: %DATE% %TIME%]"
tasklist /v
tasklist /v >> "%REPORT%"
pause
goto :MENU2

:SYS_STARTUP
cls
call :LOG_SECTION "STARTUP PROGRAMS"
call :LOG "[Time: %DATE% %TIME%]"
echo --- HKLM Run: ---
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" 2>&1
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" >> "%REPORT%" 2>&1
echo --- HKCU Run: ---
reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" 2>&1
reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" >> "%REPORT%" 2>&1
pause
goto :MENU2

:SYS_SOFTWARE
cls
call :LOG_SECTION "INSTALLED SOFTWARE LIST"
call :LOG "[Time: %DATE% %TIME%]"
wmic product get Name,Version,Vendor,InstallDate /format:csv 2>nul | sort
wmic product get Name,Version,Vendor /format:list >> "%REPORT%" 2>nul
pause
goto :MENU2

:SYS_HOTFIXES
cls
call :LOG_SECTION "INSTALLED WINDOWS HOTFIXES"
call :LOG "[Time: %DATE% %TIME%]"
wmic qfe get HotFixID,InstalledOn,Description /format:list
wmic qfe get HotFixID,InstalledOn,Description /format:list >> "%REPORT%"
pause
goto :MENU2

:SYS_ENVVARS
cls
call :LOG_SECTION "SYSTEM ENVIRONMENT VARIABLES"
call :LOG "[Time: %DATE% %TIME%]"
set
set >> "%REPORT%"
pause
goto :MENU2

:SYS_UPTIME
cls
call :LOG_SECTION "SYSTEM UPTIME"
call :LOG "[Time: %DATE% %TIME%]"
for /f "tokens=*" %%a in ('powershell -command "(Get-Date) - (gcim Win32_OperatingSystem).LastBootUpTime | Select-Object -ExpandProperty TotalHours"') do (
    call :LOG "System has been running for approximately %%a hours."
)
wmic os get LastBootUpTime /format:list
wmic os get LastBootUpTime /format:list >> "%REPORT%"
pause
goto :MENU2

:: ============================================================
:: REPAIR & MAINTENANCE
:: ============================================================
:REP_SFC
cls
call :LOG_SECTION "SYSTEM FILE CHECKER (SFC /SCANNOW)"
call :LOG "[Time: %DATE% %TIME%]"
call :LOG "Running SFC - this may take several minutes..."
sfc /scannow
echo SFC Scan completed >> "%REPORT%"
findstr /c:"[SR]" %windir%\Logs\CBS\CBS.log | more >> "%REPORT%" 2>nul
call :LOG "SFC complete. CBS log tail appended to report."
pause
goto :MENU2

:REP_DISM_CHECK
cls
call :LOG_SECTION "DISM - CHECK HEALTH"
call :LOG "[Time: %DATE% %TIME%]"
Dism /Online /Cleanup-Image /CheckHealth
echo DISM CheckHealth ran >> "%REPORT%"
pause
goto :MENU2

:REP_DISM_RESTORE
cls
call :LOG_SECTION "DISM - RESTORE HEALTH"
call :LOG "[Time: %DATE% %TIME%]"
call :LOG "Running DISM RestoreHealth - may take 10-20 minutes..."
Dism /Online /Cleanup-Image /RestoreHealth
echo DISM RestoreHealth completed >> "%REPORT%"
pause
goto :MENU2

:REP_CHKDSK
cls
call :LOG_SECTION "CHECK DISK C: (Scheduled for Next Reboot)"
call :LOG "[Time: %DATE% %TIME%]"
call :LOG "WARNING: Scheduling CHKDSK for next startup."
echo Y | chkdsk C: /f /r /x
echo CHKDSK scheduled for C: >> "%REPORT%"
call :LOG "CHKDSK scheduled. Restart your PC to run it."
pause
goto :MENU2

:REP_TEMP
cls
call :LOG_SECTION "CLEAR TEMPORARY FILES"
call :LOG "[Time: %DATE% %TIME%]"
del /q /f /s "%TEMP%\*" 2>nul
del /q /f /s "C:\Windows\Temp\*" 2>nul
for /d %%x in ("%TEMP%\*") do rd /s /q "%%x" 2>nul
for /d %%x in ("C:\Windows\Temp\*") do rd /s /q "%%x" 2>nul
call :LOG "Temp files cleared: %TEMP% and C:\Windows\Temp"
echo Temp files cleared >> "%REPORT%"
pause
goto :MENU2

:REP_PREFETCH
cls
call :LOG_SECTION "CLEAR PREFETCH CACHE"
call :LOG "[Time: %DATE% %TIME%]"
del /q /f /s "C:\Windows\Prefetch\*" 2>nul
call :LOG "Prefetch cache cleared."
echo Prefetch cache cleared >> "%REPORT%"
pause
goto :MENU2

:REP_ICON
cls
call :LOG_SECTION "REBUILD ICON CACHE"
call :LOG "[Time: %DATE% %TIME%]"
taskkill /im explorer.exe /f >nul 2>&1
del /a /q "%localappdata%\IconCache.db" 2>nul
del /a /q "%localappdata%\Microsoft\Windows\Explorer\iconcache*" 2>nul
start explorer.exe
call :LOG "Icon cache rebuilt and Explorer restarted."
echo Icon cache rebuilt >> "%REPORT%"
pause
goto :MENU2

:REP_WINUPDATE
cls
call :LOG_SECTION "RESET WINDOWS UPDATE COMPONENTS"
call :LOG "[Time: %DATE% %TIME%]"
call :LOG "WARNING: Stopping update services and clearing cache..."
net stop wuauserv >nul 2>&1
net stop cryptSvc >nul 2>&1
net stop bits >nul 2>&1
net stop msiserver >nul 2>&1
ren "C:\Windows\SoftwareDistribution" "SoftwareDistribution.old" 2>nul
ren "C:\Windows\System32\catroot2" "catroot2.old" 2>nul
net start wuauserv >nul 2>&1
net start cryptSvc >nul 2>&1
net start bits >nul 2>&1
net start msiserver >nul 2>&1
call :LOG "Windows Update components reset."
echo Windows Update reset completed >> "%REPORT%"
pause
goto :MENU2

:REP_PRINT
cls
call :LOG_SECTION "FLUSH PRINT SPOOLER"
call :LOG "[Time: %DATE% %TIME%]"
net stop spooler
del /q /f /s "%systemroot%\System32\spool\PRINTERS\*.*" 2>nul
net start spooler
call :LOG "Print spooler flushed and restarted."
echo Print spooler flushed >> "%REPORT%"
pause
goto :MENU2

:REP_STORE
cls
call :LOG_SECTION "RE-REGISTER WINDOWS STORE APPS"
call :LOG "[Time: %DATE% %TIME%]"
call :LOG "Re-registering all AppX packages (may take a few minutes)..."
powershell -Command "Get-AppXPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"$($_.InstallLocation)\AppXManifest.xml\"}" 2>&1
echo Store Apps re-registered >> "%REPORT%"
pause
goto :MENU2

:REP_RESTORE
cls
call :LOG_SECTION "CREATE SYSTEM RESTORE POINT"
call :LOG "[Time: %DATE% %TIME%]"
powershell -Command "Checkpoint-Computer -Description 'AdminToolkit_%DATE%' -RestorePointType 'MODIFY_SETTINGS'"
call :LOG "Restore point created: AdminToolkit_%DATE%"
echo System restore point created >> "%REPORT%"
pause
goto :MENU2

:REP_UPDATECHECK
cls
call :LOG_SECTION "WINDOWS UPDATE - OPEN SETTINGS"
call :LOG "[Time: %DATE% %TIME%]"
start ms-settings:windowsupdate
call :LOG "Windows Update settings opened."
echo Windows Update settings opened >> "%REPORT%"
pause
goto :MENU2

:: ============================================================
:: SECURITY & AUDIT
:: ============================================================
:SEC_SCAN
cls
call :LOG_SECTION "WINDOWS DEFENDER FULL SCAN"
call :LOG "[Time: %DATE% %TIME%]"
call :LOG "Starting full scan - this may take a long time..."
powershell -Command "Start-MpScan -ScanType FullScan" 2>&1
echo Defender full scan completed >> "%REPORT%"
pause
goto :MENU2

:SEC_UPDATE
cls
call :LOG_SECTION "UPDATE DEFENDER SIGNATURES"
call :LOG "[Time: %DATE% %TIME%]"
powershell -Command "Update-MpSignature" 2>&1
echo Defender signatures updated >> "%REPORT%"
pause
goto :MENU2

:SEC_FIREWALL_EXPORT
cls
call :LOG_SECTION "EXPORT FIREWALL RULES"
call :LOG "[Time: %DATE% %TIME%]"
netsh advfirewall export "%USERPROFILE%\Desktop\Firewall_Rules.wfw"
call :LOG "Firewall rules exported to Desktop: Firewall_Rules.wfw"
echo Firewall rules exported to Desktop >> "%REPORT%"
pause
goto :MENU2

:SEC_STARTUP
cls
call :LOG_SECTION "STARTUP MALWARE CHECK (Unusual Entries)"
call :LOG "[Time: %DATE% %TIME%]"
echo --- All Run keys: ---
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" >> "%REPORT%" 2>&1
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" >> "%REPORT%" 2>&1
reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" >> "%REPORT%" 2>&1
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"
echo --- Scheduled at startup via Tasks: ---
schtasks /query /fo LIST /v 2>&1 | findstr /i "status\|task name\|run as"
schtasks /query /fo LIST /v 2>&1 | findstr /i "status\|task name\|run as" >> "%REPORT%"
pause
goto :MENU2

:SEC_TASKS
cls
call :LOG_SECTION "SCHEDULED TASKS (ALL)"
call :LOG "[Time: %DATE% %TIME%]"
schtasks /query /fo LIST /v 2>&1
schtasks /query /fo LIST /v >> "%REPORT%" 2>&1
pause
goto :MENU2

:SEC_USERS
cls
call :LOG_SECTION "LOCAL USER ACCOUNTS"
call :LOG "[Time: %DATE% %TIME%]"
net user
net user >> "%REPORT%"
echo.
echo --- Administrators group: ---
net localgroup administrators
net localgroup administrators >> "%REPORT%"
pause
goto :MENU2

:SEC_GPO
cls
call :LOG_SECTION "GROUP POLICY UPDATE + REPORT"
call :LOG "[Time: %DATE% %TIME%]"
gpupdate /force
gpresult /h "%USERPROFILE%\Desktop\GPO_Report.html" /f
call :LOG "GPO report saved to Desktop: GPO_Report.html"
echo GPO report generated >> "%REPORT%"
start "%USERPROFILE%\Desktop\GPO_Report.html"
pause
goto :MENU2

:SEC_AUDIT
cls
call :LOG_SECTION "AUDIT POLICY REPORT"
call :LOG "[Time: %DATE% %TIME%]"
auditpol /get /category:*
auditpol /get /category:* >> "%REPORT%"
pause
goto :MENU2

:SEC_CREDGUARD
cls
call :LOG_SECTION "CREDENTIAL GUARD STATUS"
call :LOG "[Time: %DATE% %TIME%]"
reg query "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v EnableVirtualizationBasedSecurity 2>&1
reg query "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v LsaCfgFlags 2>&1
reg query "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" >> "%REPORT%" 2>&1
reg query "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v LsaCfgFlags >> "%REPORT%" 2>&1
pause
goto :MENU3

:SEC_BITLOCKER
cls
call :LOG_SECTION "BITLOCKER ENCRYPTION STATUS"
call :LOG "[Time: %DATE% %TIME%]"
manage-bde -status
manage-bde -status >> "%REPORT%"
pause
goto :MENU3

:: ============================================================
:: PERFORMANCE
:: ============================================================
:PERF_HIGH
cls
call :LOG_SECTION "SET HIGH PERFORMANCE POWER PLAN"
call :LOG "[Time: %DATE% %TIME%]"
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
call :LOG "Power plan set to: High Performance"
echo Power plan -> High Performance >> "%REPORT%"
pause
goto :MENU3

:PERF_BALANCED
cls
call :LOG_SECTION "SET BALANCED POWER PLAN"
call :LOG "[Time: %DATE% %TIME%]"
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e
call :LOG "Power plan set to: Balanced"
echo Power plan -> Balanced >> "%REPORT%"
pause
goto :MENU3

:PERF_HIB_ON
cls
call :LOG_SECTION "ENABLE HIBERNATE"
call :LOG "[Time: %DATE% %TIME%]"
powercfg -h on
call :LOG "Hibernate enabled."
echo Hibernate enabled >> "%REPORT%"
pause
goto :MENU3

:PERF_HIB_OFF
cls
call :LOG_SECTION "DISABLE HIBERNATE"
call :LOG "[Time: %DATE% %TIME%]"
powercfg -h off
call :LOG "Hibernate disabled. Disk space freed from hiberfil.sys"
echo Hibernate disabled >> "%REPORT%"
pause
goto :MENU3

:PERF_TRIM
cls
call :LOG_SECTION "OPTIMIZE / TRIM ALL DRIVES"
call :LOG "[Time: %DATE% %TIME%]"
powershell -Command "Optimize-Volume -DriveLetter C,D,E,F -Defrag -Verbose" 2>&1
echo Optimization completed >> "%REPORT%"
pause
goto :MENU3

:PERF_VISOFF
cls
call :LOG_SECTION "DISABLE VISUAL EFFECTS (Best Performance)"
call :LOG "[Time: %DATE% %TIME%]"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
call :LOG "Visual effects disabled for best performance. Re-login to apply."
echo Visual effects disabled >> "%REPORT%"
pause
goto :MENU3

:PERF_VISON
cls
call :LOG_SECTION "ENABLE VISUAL EFFECTS (Best Appearance)"
call :LOG "[Time: %DATE% %TIME%]"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 1 /f
call :LOG "Visual effects enabled for best appearance. Re-login to apply."
echo Visual effects enabled >> "%REPORT%"
pause
goto :MENU3

:PERF_VMEM
cls
call :LOG_SECTION "VIRTUAL MEMORY (PAGEFILE) INFO"
call :LOG "[Time: %DATE% %TIME%]"
wmic pagefile list /format:list
wmic pagefile list /format:list >> "%REPORT%"
wmic OS get TotalVirtualMemorySize,FreeVirtualMemory /format:list
wmic OS get TotalVirtualMemorySize,FreeVirtualMemory /format:list >> "%REPORT%"
pause
goto :MENU3

:: ============================================================
:: LAUNCHERS
:: ============================================================
:TOOL_DEVMGR
call :LOG "Launching Device Manager..."
echo Launched Device Manager >> "%REPORT%"
devmgmt.msc
goto :MENU3

:TOOL_TASKMGR
call :LOG "Launching Task Manager..."
echo Launched Task Manager >> "%REPORT%"
start taskmgr
goto :MENU3

:TOOL_NETCONN
call :LOG "Launching Network Connections..."
echo Launched Network Connections >> "%REPORT%"
start ncpa.cpl
goto :MENU3

:TOOL_DISKMGMT
call :LOG "Launching Disk Management..."
echo Launched Disk Management >> "%REPORT%"
start diskmgmt.msc
goto :MENU3

:TOOL_SECURITY
call :LOG "Launching Windows Security..."
echo Launched Windows Security >> "%REPORT%"
start windowsdefender:
goto :MENU3

:TOOL_EVENTLOG
call :LOG "Launching Event Viewer..."
echo Launched Event Viewer >> "%REPORT%"
start eventvwr.msc
goto :MENU3

:TOOL_SERVICES
call :LOG "Launching Services..."
echo Launched Services >> "%REPORT%"
start services.msc
goto :MENU3

:TOOL_REGEDIT
call :LOG "Launching Registry Editor..."
echo Launched Registry Editor >> "%REPORT%"
start regedit
goto :MENU3

:TOOL_GPO
call :LOG "Launching Local Group Policy Editor..."
echo Launched Group Policy Editor >> "%REPORT%"
start gpedit.msc
goto :MENU3

:TOOL_EXPLORER
cls
call :LOG_SECTION "RESTART WINDOWS EXPLORER"
call :LOG "[Time: %DATE% %TIME%]"
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
call :LOG "Explorer.exe restarted."
echo Explorer restarted >> "%REPORT%"
pause
goto :MENU3

:: ============================================================
:: FULL SUITE RUNNERS
:: ============================================================
:SUITE_NETWORK
cls
call :LOG_SECTION "FULL NETWORK DIAGNOSTIC REPORT"
call :LOG "[Time: %DATE% %TIME%]"
call :LOG "--- IP Config ---"
ipconfig /all >> "%REPORT%"
ipconfig /all
call :LOG "--- Ping Google ---"
ping google.com -n 4 >> "%REPORT%"
ping google.com -n 4
call :LOG "--- Ping 8.8.8.8 ---"
ping 8.8.8.8 -n 4 >> "%REPORT%"
ping 8.8.8.8 -n 4
call :LOG "--- Route Table ---"
route print >> "%REPORT%"
route print
call :LOG "--- Active Connections ---"
netstat -ano >> "%REPORT%"
call :LOG "--- Firewall Status ---"
netsh advfirewall show allprofiles >> "%REPORT%"
netsh advfirewall show allprofiles
call :LOG "--- ARP Table ---"
arp -a >> "%REPORT%"
arp -a
call :LOG "--- Open Listening Ports ---"
netstat -ano | findstr LISTENING >> "%REPORT%"
netstat -ano | findstr LISTENING
call :LOG "Network report complete."
pause
goto :MENU3

:SUITE_SYSTEM
cls
call :LOG_SECTION "FULL SYSTEM DIAGNOSTIC REPORT"
call :LOG "[Time: %DATE% %TIME%]"
call :LOG "--- System Info ---"
systeminfo >> "%REPORT%"
call :LOG "--- CPU ---"
wmic cpu get Name,NumberOfCores,NumberOfLogicalProcessors,MaxClockSpeed,LoadPercentage /format:list >> "%REPORT%"
wmic cpu get Name,NumberOfCores,NumberOfLogicalProcessors,MaxClockSpeed,LoadPercentage /format:list
call :LOG "--- Memory ---"
wmic memorychip get Capacity,Speed,Manufacturer /format:list >> "%REPORT%"
wmic memorychip get Capacity,Speed,Manufacturer /format:list
call :LOG "--- Disk Space ---"
wmic logicaldisk get DeviceID,Size,FreeSpace,FileSystem /format:list >> "%REPORT%"
wmic logicaldisk get DeviceID,Size,FreeSpace,FileSystem /format:list
call :LOG "--- GPU ---"
wmic path win32_videocontroller get Name,DriverVersion,AdapterRAM /format:list >> "%REPORT%"
wmic path win32_videocontroller get Name,DriverVersion,AdapterRAM /format:list
call :LOG "--- Uptime ---"
wmic os get LastBootUpTime /format:list >> "%REPORT%"
wmic os get LastBootUpTime /format:list
call :LOG "System report complete."
pause
goto :MENU3

:SUITE_SECURITY
cls
call :LOG_SECTION "FULL SECURITY AUDIT REPORT"
call :LOG "[Time: %DATE% %TIME%]"
call :LOG "--- Local Users ---"
net user >> "%REPORT%"
net user
call :LOG "--- Administrators ---"
net localgroup administrators >> "%REPORT%"
net localgroup administrators
call :LOG "--- Firewall ---"
netsh advfirewall show allprofiles >> "%REPORT%"
netsh advfirewall show allprofiles
call :LOG "--- Audit Policy ---"
auditpol /get /category:* >> "%REPORT%"
auditpol /get /category:*
call :LOG "--- Startup Registry Keys ---"
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" >> "%REPORT%" 2>&1
reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" >> "%REPORT%" 2>&1
call :LOG "--- Open Ports ---"
netstat -ano | findstr LISTENING >> "%REPORT%"
netstat -ano | findstr LISTENING
call :LOG "--- BitLocker ---"
manage-bde -status >> "%REPORT%" 2>&1
manage-bde -status 2>&1
call :LOG "Security audit complete."
pause
goto :MENU3

:SUITE_ALL
cls
call :LOG_SECTION "FULL SYSTEM + NETWORK + SECURITY REPORT"
call :LOG "Running ALL diagnostics. This will take several minutes..."
call :LOG "[Time: %DATE% %TIME%]"
echo. >> "%REPORT%"
echo *** FULL SUITE RUN *** >> "%REPORT%"
echo. >> "%REPORT%"
call :SUITE_NETWORK_SILENT
call :SUITE_SYSTEM_SILENT
call :SUITE_SECURITY_SILENT
call :LOG "======================================="
call :LOG " ALL REPORTS COMPLETE"
call :LOG " Saved to: %REPORT%"
call :LOG "======================================="
pause
goto :MENU3

:SUITE_NETWORK_SILENT
call :LOG_SECTION "NETWORK SECTION"
ipconfig /all >> "%REPORT%"
ping google.com -n 4 >> "%REPORT%"
ping 8.8.8.8 -n 4 >> "%REPORT%"
route print >> "%REPORT%"
netstat -ano >> "%REPORT%"
netsh advfirewall show allprofiles >> "%REPORT%"
arp -a >> "%REPORT%"
netstat -ano | findstr LISTENING >> "%REPORT%"
goto :EOF

:SUITE_SYSTEM_SILENT
call :LOG_SECTION "SYSTEM SECTION"
systeminfo >> "%REPORT%"
wmic cpu get Name,NumberOfCores,MaxClockSpeed,LoadPercentage /format:list >> "%REPORT%"
wmic memorychip get Capacity,Speed,Manufacturer /format:list >> "%REPORT%"
wmic logicaldisk get DeviceID,Size,FreeSpace,FileSystem /format:list >> "%REPORT%"
wmic path win32_videocontroller get Name,DriverVersion,AdapterRAM /format:list >> "%REPORT%"
wmic os get LastBootUpTime,TotalVisibleMemorySize,FreePhysicalMemory /format:list >> "%REPORT%"
tasklist /v >> "%REPORT%"
goto :EOF

:SUITE_SECURITY_SILENT
call :LOG_SECTION "SECURITY SECTION"
net user >> "%REPORT%"
net localgroup administrators >> "%REPORT%"
netsh advfirewall show allprofiles >> "%REPORT%"
auditpol /get /category:* >> "%REPORT%"
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" >> "%REPORT%" 2>&1
reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" >> "%REPORT%" 2>&1
netstat -ano | findstr LISTENING >> "%REPORT%"
manage-bde -status >> "%REPORT%" 2>&1
goto :EOF

:: ============================================================
:: EXIT
:: ============================================================
:EXIT
cls
echo.
echo  +==========================================================+
echo  ^|   Session complete. Report saved to:                    ^|
echo  ^|   %REPORT%
echo  ^|                                                          ^|
echo  ^|   Thank you for using Advanced Windows Admin Toolkit     ^|
echo  +==========================================================+
echo.
echo Session ended: %DATE% %TIME% >> "%REPORT%"
echo ============================================================ >> "%REPORT%"
echo. >> "%REPORT%"
timeout /t 5
exit
