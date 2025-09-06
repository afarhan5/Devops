# Linux Assignment-1.2

- This repository contains Bash script utilities created for Linux command practice assignments:

# FileManager.sh
- A utility script for basic **file and directory operations**.

# Features
- Create/Delete directories
- List files, directories, or all contents of a directory
- Create files with or without content
- Add content to files (beginning or end)
- View specific lines from a file
- Move, copy, clear, or delete files

# Usage Examples
- ./FileManager.sh addDir /tmp dir1
- ./FileManager.sh listFiles /tmp
- ./FileManager.sh addFile /tmp/dir1 file.txt "Initial content"
- ./FileManager.sh addContentToFile /tmp/dir1 file.txt "More content"
- ./FileManager.sh showFileBeginingContent /tmp/dir1 file.txt 5
