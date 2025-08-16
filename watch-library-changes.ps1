# PowerShell Script to watch for changes in sa-shared-lib and automatically update the npm package consumer
$libraryPath = "c:\Programming\angular\different-workspace-lib\sa-workspace\projects\sa-shared-lib\src"
$lastChange = Get-Date

Write-Host "=== Watching for changes in sa-shared-lib ===" -ForegroundColor Cyan
Write-Host "This script will automatically rebuild and reinstall the library when changes are detected" -ForegroundColor Yellow
Write-Host "Press Ctrl+C to stop watching" -ForegroundColor Red
Write-Host ""

try {
    while ($true) {
        # Check for changes in the library directory
        $latestFile = Get-ChildItem -Path $libraryPath -Recurse -File | 
                      Sort-Object -Property LastWriteTime -Descending | 
                      Select-Object -First 1
        
        $currentChange = $latestFile.LastWriteTime
        
        # If changes are detected
        if ($currentChange -gt $lastChange) {
            Write-Host "Change detected in file: $($latestFile.FullName)" -ForegroundColor Cyan
            $lastChange = $currentChange
            
            Write-Host "$(Get-Date) - Changes detected in sa-shared-lib!" -ForegroundColor Green
            Write-Host "Rebuilding and reinstalling library..." -ForegroundColor Yellow
            
            # Run the npm-package script with SkipServe flag to rebuild and reinstall without restarting the server
            & "c:\Programming\angular\different-workspace-lib\start-npm-package.ps1" -SkipServe
            
            Write-Host "Library updated successfully!" -ForegroundColor Green
            Write-Host "Continuing to watch for changes..." -ForegroundColor Cyan
            Write-Host ""
        }
        
        # Check every 2 seconds
        Start-Sleep -Seconds 2
    }
} finally {
    Write-Host "File watching stopped." -ForegroundColor Red
}
