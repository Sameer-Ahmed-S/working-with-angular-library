# PowerShell Script to run the NPM package approach demo
# This script builds the shared library, installs it in the consumer app, and starts the Angular app
param (
    [switch]$SkipServe = $false
)

Write-Host "===== NPM Package Approach Demo =====" -ForegroundColor Green
Write-Host "Building and installing shared library..." -ForegroundColor Cyan

# Step 0: Clean Angular cache
Write-Host "Step 0: Cleaning Angular cache..." -ForegroundColor Yellow
if (Test-Path -Path "c:\Programming\angular\different-workspace-lib\sa-workspace\.angular") {
    Write-Host "  Removing .angular cache directory..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force "c:\Programming\angular\different-workspace-lib\sa-workspace\.angular"
}

# Step 1: Build the shared library
Write-Host "Step 1: Building shared library..." -ForegroundColor Yellow
Set-Location -Path "c:\Programming\angular\different-workspace-lib\sa-workspace"

# Clean the dist directory to ensure no cached files remain
if (Test-Path -Path ".\dist") {
    Write-Host "  Cleaning previous build completely..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force ".\dist"
}

# Build with full rebuild flag to ensure everything is rebuilt
Write-Host "  Running build with --deleteOutputPath=true..." -ForegroundColor Yellow
ng build sa-shared-lib --configuration=production

# Step 2: Install the shared library in the consumer app
Write-Host "Step 2: Installing shared library in consumer app..." -ForegroundColor Yellow
Set-Location -Path "c:\Programming\angular\different-workspace-lib\consumer-npm-workspace"

# Clean npm cache for this specific package
Write-Host "  Cleaning npm cache for sa-shared-lib..." -ForegroundColor Yellow
npm cache clean --force

# Remove node_modules
if (Test-Path -Path ".\node_modules\sa-shared-lib") {
    Write-Host "  Removing existing sa-shared-lib from node_modules..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force ".\node_modules\sa-shared-lib"
}

# Uninstall and reinstall with force
Write-Host "  Uninstalling previous version..." -ForegroundColor Yellow
npm uninstall sa-shared-lib

Write-Host "  Installing new version with force flag..." -ForegroundColor Yellow
npm install --save file:../sa-workspace/dist/sa-shared-lib --preserve-symlinks --force

# Step 3: Clean Angular cache in consumer app
Write-Host "Step 3: Cleaning Angular cache in consumer app..." -ForegroundColor Yellow
if (Test-Path -Path ".\node_modules\.cache") {
    Write-Host "  Removing node_modules\.cache directory..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force ".\node_modules\.cache"
}

if (Test-Path -Path ".\.angular") {
    Write-Host "  Removing .angular cache directory..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force ".\.angular"
}

# Step 4: Start the Angular app (unless SkipServe is specified)
if (-not $SkipServe) {
    Write-Host "Step 4: Starting Angular application..." -ForegroundColor Yellow
    Write-Host "  Starting with cache cleared..." -ForegroundColor Yellow
    ng serve --open
    # End of script
    Write-Host "Application stopped." -ForegroundColor Red
} else {
    Write-Host "Skipping Angular server start (running in update-only mode)" -ForegroundColor Yellow
    Write-Host "IMPORTANT: You need to restart the Angular server to see the changes!" -ForegroundColor Red
}
