# Run from the extracted MAEO-AIEF-Showcase directory.
# Create an EMPTY public GitHub repository first. Review every file before publishing.
param([Parameter(Mandatory=$true)][string]$GitHubUser)
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw 'Git is not installed or not in PATH.' }
if (-not (Test-Path '.git')) { git init; if ($LASTEXITCODE -ne 0) { throw 'git init failed' } }
git branch -M main
Write-Host 'Files to consider:'
git status --short --untracked-files=all
Write-Host 'Inspect files before approving. Do not publish confidential materials.'
$answer = Read-Host 'Type PUBLISH to stage, commit, and push'
if ($answer -cne 'PUBLISH') { Write-Host 'Cancelled.'; exit 0 }
git add README.md SECURITY.md .gitignore docs progress demo
if ($LASTEXITCODE -ne 0) { throw 'git add failed' }
git diff --cached --name-only
$answer = Read-Host 'Type CONFIRM after reviewing the staged file list'
if ($answer -cne 'CONFIRM') { Write-Host 'Cancelled; staged files remain for inspection.'; exit 0 }
git commit -m 'Create public MAEO competition showcase'
if ($LASTEXITCODE -ne 0) { throw 'Commit failed; configure git user.name and user.email if needed.' }
$remote = "https://github.com/$GitHubUser/MAEO-AIEF-Showcase.git"
$existing = git remote
if ($existing -notcontains 'origin') { git remote add origin $remote } else { Write-Host "Existing origin: $(git remote get-url origin)" }
git push -u origin main
if ($LASTEXITCODE -ne 0) { throw 'Push failed. Check repository visibility, URL, permissions, and authentication.' }
