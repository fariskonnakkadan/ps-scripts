## Delete selected extension from current folder:
PS D:\Recovered> .\delete.ps1 -targetExtension ".py", ".txt", ".h", ".html", ".java", ".png", ".xml", ".pyc", ".plist", ".ini", ".deb", ".cab", ".jar", ".php", ".jsp", ".zip", ".gif", ".webp", ".webm", ".dll", ".a", ".pl", ".csv", ".rar", ".gz", ".sqlite", ".f", ".exe", ".c", ".vmdk", ".svg", ".woff", ".ttf", ".elf", ".pcap", ".icns", ".bz2", ".sh", ".hdf", ".jks", ".shp", ".wav", ".rb", ".go", ".asp", ".pm", ".sxw", ".ico", ".tz", ".gpg", ".json", ".class", ".apple", ".apk", ".3gp", ".avi", ".vdi", ".DS_Store", ".xlsx", ".xls"

## BAsh Search File extension:
`find . -type f -name "*.kdbx"`

## Move selected extension files recursively from current folder
PS D:\Recovered> .\move.ps1 -fileExtension ".mov" -destinationFolder "D:\mov\"


## Get Count of each type (by extension) of files in current directory.
`Get-ChildItem -File -Recurse -Path . | Group-Object Extension | Sort-Object Count -Descending | ForEach-Object { "{0}: {1}" -f $_.Name.TrimStart('.'), $_.Count }`


## List given file format files
`Get-ChildItem -Path . -Recurse -File -Filter "*.heic" | Select-Object -ExpandProperty FullName`

## Get sorted file types based on size from the current directory:

`Get-ChildItem -File -Recurse -Path . |
    Group-Object Extension |
    ForEach-Object {
        $extension = $_.Name.TrimStart('.')
        $totalSizeBytes = ($_.Group | Measure-Object Length -Sum).Sum
        $totalSizeMB = $totalSizeBytes / 1MB  # Convert bytes to megabytes
        [PSCustomObject]@{
            Extension = $extension
            FileCount = $_.Count
            TotalSizeMB = $totalSizeMB
        }
    } |
    Sort-Object TotalSizeMB -Descending |
    ForEach-Object {
        "{0}: {1} files, Total Size: {2:N2} MB" -f $_.Extension, $_.FileCount, $_.TotalSizeMB
    }`



