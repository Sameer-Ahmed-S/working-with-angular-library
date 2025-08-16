# PowerShell Script to start the consumer-npm app and watch for library changes
# This script runs both processes in separate PowerShell windows

Write-Host "===== Auto-updating NPM Package Demo =====" -ForegroundColor Magenta
Write-Host "This script will start the consumer app and automatically update it when library changes are detected" -ForegroundColor Cyan
Write-Host ""

# First, build and install the initial version of the library
Write-Host "Setting up initial library build..." -ForegroundColor Yellow
& "c:\Programming\angular\different-workspace-lib\start-npm-package.ps1" -SkipServe

# Start the watcher in a new PowerShell window
Write-Host "Starting library watcher in a new window..." -ForegroundColor Green
Start-Process PowerShell -ArgumentList "-NoExit", "-Command", "& 'c:\Programming\angular\different-workspace-lib\watch-library-changes.ps1'"

# Start the consumer app
Write-Host "Starting consumer application..." -ForegroundColor Cyan
Set-Location -Path "c:\Programming\angular\different-workspace-lib\consumer-npm-workspace"
ng serve --open

Write-Host "Application stopped. The watcher window will remain open until you close it." -ForegroundColor Yellow
