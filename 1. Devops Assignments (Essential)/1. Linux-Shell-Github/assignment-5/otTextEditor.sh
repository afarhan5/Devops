#!/bin/bash

cmd="$1"
file="$2"

add_line_top() {
    echo "$3" | cat - "$file" > temp && mv temp "$file"
}

add_line_bottom() {
    echo "$3" >> "$file"
}

add_line_at() {
    line_num="$3"
    new_line="$4"
    awk -v n="$line_num" -v l="$new_line" 'NR==n{print l}1' "$file" > temp && mv temp "$file"
}

update_first_word() {
    sed -i "0,/$3/{s/$3/$4/}" "$file"
}

update_all_words() {
    sed -i "s/$3/$4/g" "$file"
}

insert_word() {
    word1="$3"
    word2="$4"
    insert="$5"
    sed -i "s/\b$word1\b/& $insert/; s/\b$word2\b/$insert &/" "$file"
}

delete_line() {
    if [[ -z "$4" ]]; then
        sed -i "${3}d" "$file"
    else
        sed -i "/$4/ d" "$file"
    fi
}

case "$cmd" in
    addLineTop) add_line_top "$@" ;;
    addLineBottom) add_line_bottom "$@" ;;
    addLineAt) add_line_at "$@" ;;
    updateFirstWord) update_first_word "$@" ;;
    updateAllWords) update_all_words "$@" ;;
    insertWord) insert_word "$@" ;;
    deleteLine) delete_line "$@" ;;
    *) echo "Invalid command"; exit 1 ;;
esac
