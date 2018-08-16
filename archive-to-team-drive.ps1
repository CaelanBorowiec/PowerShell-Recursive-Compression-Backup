$source="G:\My Drive\Test data" #Data to back up
$target="G:\Team Drives\Hot Swap\ArchiveTest" #Backup root

# Recursively select all directories that contain 1 or more files:
$dirs = Get-ChildItem -Path $source -Recurse | where {$_.psiscontainer -AND (Get-ChildItem -File $_.fullName).count -ne 0 }

Foreach ($dir in $dirs) # For each selected folder...
{
  $name = $dir.name # Get the folder name
  $oldpath = $dir.FullName # And the path
  $newpath = ($oldpath -replace [regex]::Escape($source), $target) # Build the new path

  #Write-Host -NoNewline $oldpath " -> " $newpath `r`n

  $archive = $newpath + ".zip" #Add .zip here in order to prevent confusing Compress-Archive if the folder name contains a period

  # Make sure the directory structure exists before trying to save a zip into it:
  New-Item -ItemType Directory -Force -Path (Split-Path -Path $newpath -Parent)

  # Select all files in the currently targeted directory:
  $files = Get-ChildItem -File -Path $oldpath
  Foreach ($file in $files)
  {
    # Place the files into a zip with the target directory name, in backup root + the relative path.
    Compress-Archive -Path $file.FullName -Update -DestinationPath $archive
  }
}
