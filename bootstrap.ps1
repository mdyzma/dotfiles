# Requires Administrator Privileges
if (-not (::GetCurrent()).IsInRole( "Administrator"))
{
    Write-Warning "This script requires Administrator privileges to enable WSL2."
    Write-Warning "Please right-click and 'Run as Administrator'."
    Break
}

Write-Host "Starting Windows Bootstrap..." -ForegroundColor Cyan

# === 1. WSL2 and Virtualization Enablement ===
# This is required for Docker Desktop and generic Linux compatibility.
$features = @(
    "Microsoft-Windows-Subsystem-Linux",
    "VirtualMachinePlatform"
)

foreach ($feature in $features)
{
    $status = Get-WindowsOptionalFeature -Online -FeatureName $feature
    if ($status.State -ne 'Enabled')
    {
        Write-Host "Enabling $feature..."
        Enable-WindowsOptionalFeature -Online -FeatureName $feature -All -NoRestart
        $restartRequired = $true
    }
}

# Update WSL Kernel
Write-Host "Updating WSL Kernel..."
wsl --update

# === 2. Package Manager Setup (Winget) ===
# Winget is usually present, but we ensure source pointers are valid.
winget source update

# === 3. Install Core Tools ===
# Git and Chezmoi are prerequisites for the rest of the automation.
$coreTools = @("Git.Git", "twpayne.chezmoi")

foreach ($tool in $coreTools)
{
    Write-Host "Installing $tool..."
    winget install --id $tool -e --source winget --accept-package-agreements --accept-source-agreements
}

# === 4. Refresh Environment ===
# Reload PATH so git and chezmoi are available immediately without restarting the shell.
$env:Path =::GetEnvironmentVariable("Path","Machine") + ";" +::GetEnvironmentVariable("Path","User")

# === 5. Chezmoi Initialization ===
Write-Host "Initializing Dotfiles with Chezmoi..."
chezmoi init --apply https://github.com/GITHUB_USERNAME/dotfiles.git

if ($restartRequired)
{
    Write-Warning "A system restart is required to finalize WSL2 features."
}
