# PowerShell Script to run the path mapping approach demo
# This script starts the Angular app that uses TypeScript path mapping to reference the shared library

Write-Host "===== Path Mapping Approach Demo =====" -ForegroundColor Green
Write-Host "Starting consumer app with path mapping..." -ForegroundColor Cyan

# Navigate to the consumer app workspace
Set-Location -Path "c:\Programming\angular\different-workspace-lib\consumer-app-workspace"

# Start the Angular app
Write-Host "Starting Angular application..." -ForegroundColor Yellow
ng serve --open

# End of script
Write-Host "Application stopped." -ForegroundColor Red
