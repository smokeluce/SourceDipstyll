<#
    This powershell script creates a clean, portable snapshot of your project
    by copying every .cs, .axaml, and .csproj file from the source directory
    into a new folder on the Desktop.

    Key behaviors:
      • Recursively scans the project directory for .cs, .axaml, and .csproj files.
      • Preserves the original directory structure inside the destination.
      • Appends ".txt" to each copied file so the contents can be safely
        shared, viewed, or pasted without IDE interference.
      • Excludes build and IDE-generated directories such as:
            /bin
            /obj
            /.vs
            /.idea
            /.vscode
            /packages
        ensuring only real source files are included.
      • Generates a projecttree.txt file listing every exported file in its
        preserved directory structure, making reconstruction trivial.

    This is intended to produce a clean, batch analysis‑ready version of the
    project for debugging, review, or sharing with AI or dev team members.
#>

# Set the Project Source Directory
$source = "E:\Programming\psYirc"

# Set the Destination Folder
$dest   = "$([Environment]::GetFolderPath('Desktop'))\psyircforcopilot"

# Create destination root
New-Item -ItemType Directory -Path $dest -Force | Out-Null

# Prepare project tree log
$treeFile = Join-Path $dest "projecttree.txt"
"Project Tree for psYirc Snapshot" | Out-File $treeFile -Encoding UTF8
"Generated: $(Get-Date)" | Out-File $treeFile -Append -Encoding UTF8
"" | Out-File $treeFile -Append -Encoding UTF8

# Get all .cs, .axaml, and .csproj files recursively but skip the following:
Get-ChildItem -Path $source -Recurse -Include *.cs, *.axaml, *.csproj |
Where-Object {
    $_.FullName -notmatch "\\bin\\" -and
    $_.FullName -notmatch "\\obj\\" -and
    $_.FullName -notmatch "\\.vs\\" -and
    $_.FullName -notmatch "\\.idea\\" -and
    $_.FullName -notmatch "\\.vscode\\" -and
    $_.FullName -notmatch "\\packages\\"
} |
    ForEach-Object {

        # Compute relative path
        $relative = $_.FullName.Substring($source.Length).TrimStart('\')

        # Append .txt extension
        $newName = "$($_.Name).txt"

        # Build destination directory path
        $destDir = Join-Path $dest (Split-Path $relative -Parent)

        # Ensure directory exists
        New-Item -ItemType Directory -Path $destDir -Force | Out-Null

        # Copy file contents to new .txt file
        $destFile = Join-Path $destDir $newName
        Copy-Item $_.FullName $destFile -Force

        # Log directory and file to projecttree.txt
        $logPath = Join-Path (Split-Path $relative -Parent) $newName
        $logPath | Out-File $treeFile -Append -Encoding UTF8
    }

Write-Host "Done! Files copied to $dest"