#!/bin/bash

CONFIG_FILE="$HOME/.otssh_config"

# Ensure config file exists
touch "$CONFIG_FILE"

print_usage() {
    echo "Usage: otssh [options] [connection_name]"
    echo "Options:"
    echo "  -a              Add SSH connection"
    echo "  -e              Edit SSH connection"
    echo "  -r <name>       Remove SSH connection"
    echo "  -l              List connection names"
    echo "  -ld             List connection details"
    echo "  -n <name>       Connection name"
    echo "  -h <host>       Host/IP"
    echo "  -u <user>       SSH Username"
    echo "  -p <port>       Port (default: 22)"
    echo "  -i <keyfile>    Identity file (optional)"
    exit 1
}

# Add or update a connection
add_or_update_connection() {
    local name="$1" host="$2" user="$3" port="$4" key="$5"

    # Remove old entry if exists
    grep -v "^${name}|" "$CONFIG_FILE" > "$CONFIG_FILE.tmp" && mv "$CONFIG_FILE.tmp" "$CONFIG_FILE"

    echo "${name}|${host}|${user}|${port}|${key}" >> "$CONFIG_FILE"
    echo "[INFO] Connection '$name' saved."
}

# List names
list_names() {
    cut -d'|' -f1 "$CONFIG_FILE"
}

# List details
list_details() {
    while IFS="|" read -r name host user port key; do
        cmd="ssh"
        [ -n "$key" ] && cmd="$cmd -i $key"
        [ -n "$port" ] && cmd="$cmd -p $port"
        cmd="$cmd $user@$host"
        echo "$name: $cmd"
    done < "$CONFIG_FILE"
}

# Delete connection
remove_connection() {
    local name="$1"
    if grep -q "^${name}|" "$CONFIG_FILE"; then
        grep -v "^${name}|" "$CONFIG_FILE" > "$CONFIG_FILE.tmp" && mv "$CONFIG_FILE.tmp" "$CONFIG_FILE"
        echo "[INFO] Connection '$name' removed."
    else
        echo "[ERROR] Connection '$name' not found."
    fi
}

# Connect to a server
connect_to_server() {
    local name="$1"
    conn=$(grep "^${name}|" "$CONFIG_FILE")
    if [ -z "$conn" ]; then
        echo "[ERROR]: Server information is not available, please add server first"
        exit 1
    fi

    IFS="|" read -r _ host user port key <<< "$conn"
    cmd="ssh"
    [ -n "$key" ] && cmd="$cmd -i $key"
    [ -n "$port" ] && cmd="$cmd -p $port"
    cmd="$cmd $user@$host"

    echo "[INFO] Connecting to $name..."
    eval "$cmd"
}

# Main logic
if [ $# -eq 0 ]; then
    print_usage
fi

while getopts ":aelrn:h:u:p:i:d" opt; do
    case $opt in
        a) action="add" ;;
        e) action="edit" ;;
        l) list_only=true ;;
        d) list_detail=true ;;
        r) action="remove"; remove_name="$OPTARG" ;;
        n) name="$OPTARG" ;;
        h) host="$OPTARG" ;;
        u) user="$OPTARG" ;;
        p) port="$OPTARG" ;;
        i) identity_file="$OPTARG" ;;
        *) print_usage ;;
    esac
done

shift $((OPTIND -1))

# Handle actions
case $action in
    add)
        [ -z "$name" ] || [ -z "$host" ] || [ -z "$user" ] && print_usage
        port=${port:-22}
        add_or_update_connection "$name" "$host" "$user" "$port" "$identity_file"
        ;;
    edit)
        [ -z "$name" ] || [ -z "$host" ] || [ -z "$user" ] && print_usage
        port=${port:-22}
        add_or_update_connection "$name" "$host" "$user" "$port" "$identity_file"
        ;;
    remove)
        [ -z "$remove_name" ] && print_usage
        remove_connection "$remove_name"
        ;;
esac

if [ "$list_only" = true ]; then
    list_names
elif [ "$list_detail" = true ]; then
    list_details
elif [ -n "$1" ]; then
    connect_to_server "$1"
fi
