# Update script for CLI AI tools
Write-Host "`n=== Updating CLI AI tools ===`n" -ForegroundColor Cyan

$tools = @(
    "@google/gemini-cli",
    "@openai/codex",
    "opencode-ai",
    "@qwen-code/qwen-code",
    "openclaw"
)

foreach ($tool in $tools) {
    Write-Host ">>> Updating $tool..." -ForegroundColor Yellow
    try {
        npm install -g "$tool@latest" --silent
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Success: $tool updated." -ForegroundColor Green
        } else {
            Write-Host "Error: Failed to update $tool. Please check manually." -ForegroundColor Red
        }
    } catch {
        Write-Host "Exception: Failed to update $tool. $($_.Exception.Message)" -ForegroundColor Red
    }
    Write-Host ""
}

Write-Host "Finished updating AI tools!`n" -ForegroundColor Cyan
