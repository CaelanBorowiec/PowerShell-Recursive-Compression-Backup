$source="G:\My Drive\Test data" #Data to back up
$target="G:\Team Drives\Hot Swap\ArchiveTest" #Backup root

# Select all directories that contain 1 or more files:
$dirs = Get-ChildItem -Path $source -Recurse | where {$_.psiscontainer -AND (gci -File $_.fullName).count -ne 0 }

Foreach ($dir in $dirs)
{
      $name = $dir.name
      $oldpath = $dir.FullName
      $newpath = ($oldpath -replace [regex]::Escape($source), $target)

      Write-Host -NoNewline $oldpath " -> " $newpath `r`n

      $newname = $name.replace(" ","_")

      $archive = $newpath + ".zip" #Add the rest of the path here

      New-Item -ItemType Directory -Force -Path (Split-Path -Path $newpath -Parent)
      Compress-Archive -Path $oldpath -Update -DestinationPath $archive
}
