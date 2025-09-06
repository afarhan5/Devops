# Assignment-1.1

This repository contains a simple Bash script `assignment1.sh` that performs basic Linux command operations as part of an assignment or practice task. The script demonstrates file and directory manipulation, content editing, and command-line file reading operations.


# Structure & Purpose

The script executes the following steps in order:

1. **Print Current Directory**  
   Displays the working directory using `pwd`.

2. **Create Directories**  
   - `linux/`
   - `linux/Assignment-01`
   - `/tmp/dir1`
   - Nested structure: `/tmp/dir1/dir2/dir3`

3. **Remove Directory**  
   Deletes `/tmp/dir1/dir2/dir3`.

4. **File Creation and Editing**  
   - Creates `/tmp/firstname` and adds lines to it.
   - Creates `/tmp/lastname` and prepends a line using `cat`.
   - Appends 10 additional lines using a loop.

5. **View File Contents**  
   Uses `head`, `tail` to:
   - View top 5 lines
   - View last 2 lines
   - Extract 6th line
   - View lines 3 to 8

6. **List `/tmp` Contents**  
   - All contents (`ls -a`)
   - Only files using `find`
   - Only directories using `find`

7. **File Copy & Rename**  
   - Copy `lastname` to `/tmp/dir1/dir2/`
   - Copy with a new name: `lastname.copy`
   - Rename `firstname` to `firstfile_renamed`

8. **Move & Delete Files**  
   - Move `lastname` to `/tmp/dir1/`
   - Clear and delete `lastname.copy`

