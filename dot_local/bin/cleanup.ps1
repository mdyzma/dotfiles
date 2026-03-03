# cleanup.ps1 - Quick Clean-up Script
# Cleans: Pip, Conda, NPM, Poetry, Pyenv-win, Scoop, Docker, and .NET

Write-Host "🧹 >>> Starting Development Cache Cleanup..." -ForegroundColor Cyan

# 1. Pip Cache (Python)
if (Get-Command pip -ErrorAction SilentlyContinue) {
    Write-Host "🐍 [1/8] Purging Pip cache..." -ForegroundColor Yellow
    pip cache purge
}

# 2. Conda Cache
if (Get-Command conda -ErrorAction SilentlyContinue) {
    Write-Host "🧊 [2/8] Cleaning Conda cache (removing all unused packages)..." -ForegroundColor Yellow
    conda clean --all --yes
}

# 3. NPM Cache
if (Get-Command npm -ErrorAction SilentlyContinue) {
    Write-Host "📦 [3/8] Forcing NPM cache clean..." -ForegroundColor Yellow
    npm cache clean --force
}

# 4. Poetry Cache (Python)
if (Get-Command poetry -ErrorAction SilentlyContinue) {
    Write-Host "📜 [4/8] Clearing Poetry PyPI cache..." -ForegroundColor Yellow
    poetry cache clear pypi --all --no-interaction
}

# 5. Pyenv-win Install Cache (Python)
$pyenvCache = "$HOME\.pyenv\pyenv-win\install_cache"
if (Test-Path $pyenvCache) {
    Write-Host "🛠️ [5/8] Emptying Pyenv-win install_cache..." -ForegroundColor Yellow
    Remove-Item -Path "$pyenvCache\*" -Recurse -Force -ErrorAction SilentlyContinue
}

# 6. Scoop Cache & Cleanup
if (Get-Command scoop -ErrorAction SilentlyContinue) {
    Write-Host "🍦 [6/8] Removing Scoop cache and cleaning old versions..." -ForegroundColor Yellow
    scoop cache rm *
    scoop cleanup *
}

# 7. Docker System Prune
if (Get-Command docker -ErrorAction SilentlyContinue) {
    Write-Host "🐳 [7/8] Pruning unused Docker data (containers, networks, images)..." -ForegroundColor Yellow
    docker system prune -f
}

# 8. .NET NuGet Cache
if (Get-Command dotnet -ErrorAction SilentlyContinue) {
    Write-Host "🔷 [8/8] Clearing all .NET NuGet cache..." -ForegroundColor Yellow
    dotnet nuget locals all --clear
}

Write-Host "✨ Done! Your development environment is cleaner." -ForegroundColor Green
