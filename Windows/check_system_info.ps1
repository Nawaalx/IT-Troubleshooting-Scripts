# ================================
# IT Troubleshooting Script: System Info
# Author: Nawaal Mohamed
# Description: Collects and displays key system information
# ================================

Write-Host "==============================="
Write-Host "SYSTEM INFORMATION REPORT"
Write-Host "==============================="

$sys = Get-ComputerInfo | Select-Object CsName, OsName, OsArchitecture, WindowsVersion, WindowsBuildLabEx
Write-Host "Computer Name: $($sys.CsName)"
Write-Host "OS Name: $($sys.OsName)"
Write-Host "OS Architecture: $($sys.OsArchitecture)"
Write-Host "Windows Version: $($sys.WindowsVersion)"
Write-Host "Windows Build: $($sys.WindowsBuildLabEx)"
Write-Host "-------------------------------"

# CPU Info
$cpu = Get-CimInstance Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors
Write-Host "CPU: $($cpu.Name)"
Write-Host "Cores: $($cpu.NumberOfCores)"
Write-Host "Logical Processors: $($cpu.NumberOfLogicalProcessors)"
Write-Host "-------------------------------"

# RAM Info
$ram = [math]::Round((Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1GB,2)
Write-Host "Total RAM (GB): $ram"
Write-Host "-------------------------------"

# Disk Info
$disks = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, Size, FreeSpace
foreach ($disk in $disks) {
    $sizeGB = [math]::Round($disk.Size/1GB,2)
    $freeGB = [math]::Round($disk.FreeSpace/1GB,2)
    Write-Host "Drive $($disk.DeviceID): $freeGB GB free of $sizeGB GB"
}
Write-Host "-------------------------------"

# Network Info
$net = Get-NetAdapter | Where-Object {$_.Status -eq "Up"} | Select-Object Name, MacAddress, LinkSpeed
foreach ($adapter in $net) {
    Write-Host "Adapter: $($adapter.Name) | MAC: $($adapter.MacAddress) | Speed: $($adapter.LinkSpeed)"
}

Write-Host "==============================="
Write-Host "REPORT COMPLETE"
Write-Host "==============================="
