# ================================
# IT Troubleshooting Script: Network Test
# Author: Nawaal Mohamed
# Description: Tests connectivity to important websites and local network
# ================================

Write-Host "==============================="
Write-Host "NETWORK TEST SCRIPT"
Write-Host "==============================="

$TestHosts = @("8.8.8.8","google.com","github.com")

foreach ($testHost in $TestHosts) {
    Write-Host "Pinging $testHost..."
    try {
        Test-Connection $testHost -Count 4 -ErrorAction Stop | ForEach-Object {
            Write-Host "$($_.Address) responded in $($_.ResponseTime) ms"
        }
    } catch {
        Write-Host "$testHost is not reachable."
    }
}

Write-Host "==============================="
Write-Host "NETWORK TEST COMPLETE"
Write-Host "==============================="
