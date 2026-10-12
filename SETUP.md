# Setup instructions

1. Extract this folder alongside `FYP`, `MAEO-Local-Organized`, and your existing private/public GitHub workspaces. Keep it independent from all other repositories.
2. Read and edit the public Markdown files. Add researcher names and institutional affiliation only with consent. Correct any status that has changed.
3. Do not copy internal documents, code, results, or full report into this folder.
4. Create an empty **public** repository on GitHub named `MAEO-AIEF-Showcase` (no initial README).
5. Open PowerShell in this folder and run `./CREATE_AND_PUSH.ps1 -GitHubUser YOUR_USERNAME`. If scripts are blocked, inspect the script and use `Unblock-File ./CREATE_AND_PUSH.ps1` if permitted.
6. Inspect both confirmation prompts and confirm the repository is publicly accessible after pushing.

Note: `.gitignore` does not remove previously tracked or committed secrets. This repository should have its own fresh Git history.
