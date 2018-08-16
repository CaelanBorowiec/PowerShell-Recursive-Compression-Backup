# PowerShell Recursive Compression Backup:
This is a PowerShell script to recursively zip files at each directory level and put the zipped files in the same folder structure elsewhere (for backup or archival use).

## Features
- Recursively back up source directory to target directory, compressing files and preserving directory structure
- *Don't* back up directories inside zips
- *Don't* back up empty directories

## Examples
- backup-root/a folder with files/ becomes: backup-destination/a folder with files.zip
- backup-root/a folder with files/subdirectory with files/ would become: backup-root/a folder with files/subdirectory with files.zip

#### Credits
- Plugin created by [Caelan Borowiec](https://github.com/CaelanBorowiec)
