$source="G:\My Drive\Test data" #Data to back up
$target="G:\Team Drives\Hot Swap\ArchiveTest" #Backup root

# Select all directories that contain 1 or more files:
$dirs = Get-ChildItem -Path $source -Recurse | where {$_.psiscontainer -AND (gci -File $_.fullName).count -ne 0 }

Foreach ($dir in $dirs)
{
      $name = $dir.name
      $newname = $name.replace(" ","_")

      $files = $source + "\" + $name
      $archive = $target + "\" + $name + ".zip" #Add the rest of the path here

      Compress-Archive -Path $source -Update -DestinationPath $archive
}
