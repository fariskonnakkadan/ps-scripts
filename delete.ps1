param (
    [string[]]$targetExtensions
)

# Get the current directory
$currentDirectory = Get-Location

# Get a list of files with the specified extensions
$filesToDelete = Get-ChildItem -Recurse -Path $currentDirectory -File | Where-Object { $targetExtensions -contains $_.Extension }

# Delete each file
foreach ($file in $filesToDelete) {
    Remove-Item -Path $file.FullName -Force
    Write-Host "Deleted: $($file.FullName)"
}

Write-Host "Deletion of files with extensions '$($targetExtensions -join ', ' )' complete."
