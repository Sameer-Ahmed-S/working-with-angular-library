# PowerShell Script to demonstrate both approaches for consuming Angular libraries
# This script provides options for running either the path mapping or NPM package approach

function Show-Menu {
    Clear-Host
    Write-Host "===== Angular Shared Library Demo =====" -ForegroundColor Magenta
    Write-Host "This script demonstrates different approaches for consuming Angular libraries:" -ForegroundColor White
    Write-Host ""
    Write-Host "1: Path Mapping Approach" -ForegroundColor Green
    Write-Host "   Uses TypeScript path mapping to reference the library directly from source" -ForegroundColor Gray
    Write-Host ""
    Write-Host "2: NPM Package Approach" -ForegroundColor Cyan
    Write-Host "   Builds the library and installs it as an NPM package" -ForegroundColor Gray
    Write-Host ""
    Write-Host "3: Auto-Updating NPM Package Approach" -ForegroundColor Yellow
    Write-Host "   Like option 2, but automatically updates when library changes are detected" -ForegroundColor Gray
    Write-Host ""
    Write-Host "4: Exit" -ForegroundColor Red
    Write-Host ""
}

function Start-PathMappingDemo {
    Write-Host "Starting Path Mapping Demo..." -ForegroundColor Green
    & "c:\Programming\angular\different-workspace-lib\start-path-mapping.ps1"
}

function Start-NpmPackageDemo {
    Write-Host "Starting NPM Package Demo..." -ForegroundColor Cyan
    & "c:\Programming\angular\different-workspace-lib\start-npm-package.ps1"
}

function Start-AutoUpdatingNpmDemo {
    Write-Host "Starting Auto-Updating NPM Package Demo..." -ForegroundColor Yellow
    & "c:\Programming\angular\different-workspace-lib\start-auto-updating-npm.ps1"
}

# Main script execution
Show-Menu

$selection = Read-Host "Please choose an option (1-4)"

switch ($selection) {
    '1' {
        Start-PathMappingDemo
    }
    '2' {
        Start-NpmPackageDemo
    }
    '3' {
        Start-AutoUpdatingNpmDemo
    }
    '4' {
        Write-Host "Exiting..." -ForegroundColor Red
        Exit
    }
    default {
        Write-Host "Invalid selection. Please enter a number between 1 and 4." -ForegroundColor Red
        Pause
    }
}
