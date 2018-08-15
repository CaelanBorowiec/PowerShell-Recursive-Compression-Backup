# Borrowed this piece. Tests for 7Zip and if it exists creates an alias
if (-not (test-path "$env:ProgramFiles\7-Zip\7z.exe")) {throw "$env:ProgramFiles\7-Zip\7z.exe needed"}
set-alias sz "$env:ProgramFiles\7-Zip\7z.exe"
$files="G:\My Drive\Test data"
$target="G:\Team Drives\Hot Swap\ArchiveTest"
$dirs = Get-ChildItem -Path $files | Where-Object { $_.Attributes -eq "Directory" }

# Creates 7z files based on the parent folders name and drops it inside the archive folder
Foreach ($dir in $dirs)
{
      $name = $dir.name
      $newname = $name.ToLower() -replace(" ","")
      sz a -t7z "$target\$newname" "$files\$dir"

}
