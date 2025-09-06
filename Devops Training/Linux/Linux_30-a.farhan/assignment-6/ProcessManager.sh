#!/bin/bash

DB_FILE="processes.db"
touch "$DB_FILE"

PRIORITY_TO_NICENESS() {
    case "$1" in
        low) echo "10" ;;
        med) echo "0" ;;
        high) echo "-5" ;;
        *) echo "0" ;;
    esac
}

get_pid_by_alias() {
    grep "^$1:" "$DB_FILE" | cut -d':' -f2
}

get_script_by_alias() {
    grep "^$1:" "$DB_FILE" | cut -d':' -f5
}

get_priority_by_alias() {
    grep "^$1:" "$DB_FILE" | cut -d':' -f4
}

get_state_by_pid() {
    if [ -d "/proc/$1" ]; then
        awk '/State:/ {print $2}' /proc/$1/status
    else
        echo "Not running"
    fi
}

start_service() {
    read -p "Enter the command/script to run for alias '$alias': " script
    PRIORITY_LEVEL="med"
    NICENESS=$(PRIORITY_TO_NICENESS "$PRIORITY_LEVEL")

    nice -n "$NICENESS" bash -c "$script" &
    pid=$!
    echo "$alias:$pid:running:$PRIORITY_LEVEL:$script" >> "$DB_FILE"
    echo "Started '$alias' with PID $pid"
}

status_service() {
    pid=$(get_pid_by_alias "$alias")
    if [ -z "$pid" ]; then
        echo "No such alias: $alias"
    elif ps -p "$pid" > /dev/null; then
        echo "Service '$alias' is running (PID: $pid)"
    else
        echo "Service '$alias' is not running"
    fi
}

kill_service() {
    pid=$(get_pid_by_alias "$alias")
    if [ -n "$pid" ]; then
        kill "$pid" && echo "Killed process $pid for alias '$alias'"
        sed -i "/^$alias:/d" "$DB_FILE"
    else
        echo "No such alias: $alias"
    fi
}

change_priority() {
    pid=$(get_pid_by_alias "$alias")
    if [ -z "$pid" ]; then
        echo "Alias '$alias' not found."
        exit 1
    fi
    new_nice=$(PRIORITY_TO_NICENESS "$priority")
    renice "$new_nice" -p "$pid" > /dev/null
    script=$(get_script_by_alias "$alias")
    sed -i "/^$alias:/d" "$DB_FILE"
    echo "$alias:$pid:running:$priority:$script" >> "$DB_FILE"
    echo "Priority for alias '$alias' updated to $priority"
}

list_services() {
    cut -d':' -f1 "$DB_FILE"
}

top_services() {
    if [ -n "$alias" ]; then
        line=$(grep "^$alias:" "$DB_FILE")
        [ -z "$line" ] && { echo "No such alias: $alias"; exit 1; }
        pid=$(echo "$line" | cut -d':' -f2)
        state=$(get_state_by_pid "$pid")
        priority=$(echo "$line" | cut -d':' -f4)
        script=$(echo "$line" | cut -d':' -f5)
        echo "$alias, $pid, $state, $priority, $script"
    else
        while IFS=':' read -r alias pid status priority script; do
            state=$(get_state_by_pid "$pid")
            echo "$alias, $pid, $state, $priority, $script"
        done < "$DB_FILE"
    fi
}

show_usage() {
    echo "Usage:"
    echo "./ProcessManager.sh -o start -a <alias>"
    echo "./ProcessManager.sh -o status -a <alias>"
    echo "./ProcessManager.sh -o kill -a <alias>"
    echo "./ProcessManager.sh -o priority -p <low|med|high> -a <alias>"
    echo "./ProcessManager.sh -o list"
    echo "./ProcessManager.sh -o top [-a <alias>]"
}

# Main logic
if [ "$1" != "-o" ]; then
    show_usage
    exit 1
fi

operation=$2
shift 2

while getopts "a:p:" opt; do
    case $opt in
        a) alias=$OPTARG ;;
        p) priority=$OPTARG ;;
    esac
done

case "$operation" in
    start) start_service ;;
    status) status_service ;;
    kill) kill_service ;;
    priority) change_priority ;;
    list) list_services ;;
    top) top_services ;;
    *) show_usage ;;
esac
