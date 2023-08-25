# Function to recursively get image files from a directory
function Get-ImageFilesRecursively {
    param([string]$path)
    Get-ChildItem -Path $path -Recurse -Include *.jpg,*.jpeg,*.png,*.gif,*.bmp,*.tif,*.tiff | Where-Object { $_.Attributes -eq 'Archive' }
}

# Main script
$imageFiles = Get-ImageFilesRecursively -path $PWD

foreach ($imageFile in $imageFiles) {
    $dateTaken = $null
    try {
        $dateTaken = [System.Drawing.Image]::FromFile($imageFile.FullName).GetPropertyItem(36867).Value -as [string]
        $dateTaken = [datetime]::ParseExact($dateTaken, 'yyyy:MM:dd HH:mm:ss', $null)
    } catch {
        Write-Host "Error getting 'Date Taken' property for $($imageFile.FullName)"
    }

    if ($dateTaken -ne $null) {
        Write-Host "File: $($imageFile.FullName)"
        Write-Host "Date Taken: $dateTaken"
        Write-Host ""
    }
}
