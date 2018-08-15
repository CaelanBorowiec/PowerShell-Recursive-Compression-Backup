$source="G:\My Drive\Test data\*"
$target="G:\Team Drives\Hot Swap\ArchiveTest"

$dirs = Get-ChildItem -Path $source -Recurse | Where-Object { $_.Attributes -eq "Directory" }

# Creates zip files based on the parent folders name and drops it inside the archive folder
Foreach ($dir in $dirs)
{
      $name = $dir.name
      Write-Output $dir
      $newname = $name.replace(" ","_")
      $archive = $target + "\" + $name + ".zip"
      Compress-Archive -Path $source -Update -DestinationPath $archive
}
