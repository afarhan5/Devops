#!/bin/bash

while getopts ":u:d:" opt; do
  case $opt in
    u) url="$OPTARG";;
    d) days="$OPTARG";;
  esac
done

repo_name=$(basename "$url" .git)
report_file="commit_report.csv"

git clone "$url"
cd "$repo_name" || exit

echo "Commit ID,Author,Email,Date,Message,Files Changed,Valid Commit" > ../$report_file

git log --since="$days days ago" --pretty=format:'%H|%an|%ae|%ad|%s' --date=short | while IFS="|" read -r hash name email date msg; do
  files=$(git show --name-only --pretty="" "$hash" | paste -sd "," -)
  valid=$(echo "$msg" | grep -qE '^JIRA-[0-9]{4}:' && echo "Yes" || echo "No")
  echo "$hash,$name,$email,$date,\"$msg\",\"$files\",$valid" >> ../$report_file
done

cd ..
echo "Report generated: $report_file"

