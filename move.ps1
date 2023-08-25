param (
    [string]$fileExtension,
    [string]$destinationFolder
)

# Get the current folder's path
$currentFolder = Get-Location

# Create the destination folder if it doesn't exist
if (-not (Test-Path -Path $destinationFolder)) {
    New-Item -Path $destinationFolder -ItemType Directory
}

# Recursively search for files with the given extension and move them to the destination folder
Get-ChildItem -Path $currentFolder -Recurse -File | Where-Object { $_.Extension -eq $fileExtension } | ForEach-Object {
    $destinationPath = Join-Path -Path $destinationFolder -ChildPath $_.Name
    Move-Item -Path $_.FullName -Destination $destinationPath -Force
    Write-Host "Moved $($_.FullName) to $destinationPath"
}

Write-Host "File move completed."
