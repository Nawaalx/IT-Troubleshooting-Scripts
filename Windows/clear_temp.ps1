# ================================
# IT Troubleshooting Script: Clear Temp Files
# Author: Nawaal Mohamed
# Description: Deletes temporary files from Windows temp directories
# ================================

Write-Host "==============================="
Write-Host "CLEAR TEMP FILES SCRIPT"
Write-Host "==============================="

$TempFolders = @(
    "$env:Temp\*",
    "C:\Windows\Temp\*"
)

foreach ($folder in $TempFolders) {
    Write-Host "Clearing: $folder"
    try {
        Remove-Item $folder -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Cleared successfully."
    } catch {
        Write-Host "Failed to clear: $folder"
    }
}

Write-Host "==============================="
Write-Host "TEMP FILE CLEANUP COMPLETE"
Write-Host "==============================="
