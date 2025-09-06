#!/bin/bash

# Function to create a directory
create_dir() {
    mkdir -p "$1/$2"
    echo "Directory '$2' created in $1."
}

# Function to delete a directory
delete_dir() {
    rmdir "$1/$2"
    echo "Directory '$2' deleted from $1."
}

# Function to list content of a directory
list_content() {
    ls "$1"
}

# Function to list only files in a directory
list_files() {
    ls -l "$1" | grep -v '^d'
}

# Function to list only directories in a directory
list_dirs() {
    ls -d "$1"/*/
}

# Function to list all contents (files and directories)
list_all() {
    ls -a "$1"
}

# Function to create a file
create_file() {
    touch "$1/$2"
    echo "File '$2' created in $1."
}

# Function to add content to a file
add_content_to_file() {
    echo "$3" >> "$1/$2"
    echo "Added content to '$2'."
}

# Function to add content at the beginning of a file (using cat)
add_content_to_file_beginning() {
    echo "$3" | cat - "$1/$2" > temp && mv temp "$1/$2"
    echo "Added content at the beginning of '$2'."
}

# Function to show top n lines of a file
show_file_begining_content() {
    head -n "$3" "$1/$2"
}

# Function to show last n lines of a file
show_file_end_content() {
    tail -n "$3" "$1/$2"
}

# Function to show content of a specific line number
show_file_content_at_line() {
    sed -n "${3}p" "$1/$2"
}

# Function to show content of a specific line number range
show_file_content_for_line_range() {
    sed -n "${3},${4}p" "$1/$2"
}

# Function to move a file
move_file() {
    mv "$1/$2" "$3/$2"
    echo "Moved '$2' from $1 to $3."
}

# Function to copy a file
copy_file() {
    cp "$1/$2" "$3/$2"
    echo "Copied '$2' from $1 to $3."
}

# Function to clear the content of a file
clear_file_content() {
    > "$1/$2"
    echo "Cleared the content of '$2'."
}

# Function to delete a file
delete_file() {
    rm "$1/$2"
    echo "File '$2' deleted from $1."
}

# Main function to parse the arguments and call the appropriate function
case "$1" in
    addDir)
        create_dir "$2" "$3"
        ;;
    deleteDir)
        delete_dir "$2" "$3"
        ;;
    listContent)
        list_content "$2"
        ;;
    listFiles)
        list_files "$2"
        ;;
    listDirs)
        list_dirs "$2"
        ;;
    listAll)
        list_all "$2"
        ;;
    addFile)
        create_file "$2" "$3"
        ;;
    addContentToFile)
        add_content_to_file "$2" "$3" "$4"
        ;;
    addContentToFileBegining)
        add_content_to_file_beginning "$2" "$3" "$4"
        ;;
    showFileBeginingContent)
        show_file_begining_content "$2" "$3" "$4"
        ;;
    showFileEndContent)
        show_file_end_content "$2" "$3" "$4"
        ;;
    showFileContentAtLine)
        show_file_content_at_line "$2" "$3" "$4"
        ;;
    showFileContentForLineRange)
        show_file_content_for_line_range "$2" "$3" "$4" "$5"
        ;;
    moveFile)
        move_file "$2" "$3" "$4"
        ;;
    copyFile)
        copy_file "$2" "$3" "$4"
        ;;
    clearFileContent)
        clear_file_content "$2" "$3"
        ;;
    deleteFile)
        delete_file "$2" "$3"
        ;;
    *)
        echo "Invalid command. Please use one of the following:"
        echo "./FileManager.sh addDir <dir_path> <dir_name>"
        echo "./FileManager.sh deleteDir <dir_path> <dir_name>"
        echo "./FileManager.sh listContent <dir_path>"
        echo "./FileManager.sh listFiles <dir_path>"
        echo "./FileManager.sh listDirs <dir_path>"
        echo "./FileManager.sh listAll <dir_path>"
        echo "./FileManager.sh addFile <dir_path> <file_name>"
        echo "./FileManager.sh addContentToFile <dir_path> <file_name> <content>"
        echo "./FileManager.sh addContentToFileBegining <dir_path> <file_name> <content>"
        echo "./FileManager.sh showFileBeginingContent <dir_path> <file_name> <lines>"
        echo "./FileManager.sh showFileEndContent <dir_path> <file_name> <lines>"
        echo "./FileManager.sh showFileContentAtLine <dir_path> <file_name> <line_number>"
        echo "./FileManager.sh showFileContentForLineRange <dir_path> <file_name> <start_line> <end_line>"
        echo "./FileManager.sh moveFile <source_path> <file_name> <dest_path>"
        echo "./FileManager.sh copyFile <source_path> <file_name> <dest_path>"
        echo "./FileManager.sh clearFileContent <dir_path> <file_name>"
        echo "./FileManager.sh deleteFile <dir_path> <file_name>"
        ;;
esac

