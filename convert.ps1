# Get a list of all HEIC files in the current directory
$heicFiles = Get-ChildItem -Filter *.heic

# Set the output format and progress counter
$outputFormat = "jpg"
$totalFiles = $heicFiles.Count
$currentFile = 0

# Iterate through each HEIC file and convert it to JPG
foreach ($heicFile in $heicFiles) {
    $currentFile++
    $outputFileName = [System.IO.Path]::ChangeExtension($heicFile.Name, $outputFormat)
    
    $remainingFiles = $totalFiles - $currentFile
    Write-Host ("Converting file ${currentFile} of ${totalFiles}: $($heicFile.Name) -> ${outputFileName} (${remainingFiles} remaining)")
    
    # Execute the magick command to perform the conversion (magick.exe is in PATH)
    magick convert "$heicFile" "$outputFileName"
    
    Write-Host ("Conversion complete: ${outputFileName}")
}
