#!/bin/bash

# Function to create a team
add_team() {
    groupadd "$2"
    echo "Team '$2' created."
}

# Function to delete a team
del_team() {
    groupdel "$2"
    echo "Team '$2' deleted."
}

# Function to create a user and add them to a team
add_user() {
    # Create user with the specified group
    useradd -m -G "$3" "$2"

    # Set the appropriate permissions for home directory
    chmod 700 /home/"$2"
    chown "$2":"$3" /home/"$2"

    # Create the shared directories (team and ninja)
    mkdir /home/"$2"/team
    mkdir /home/"$2"/ninja

    # Set the permissions for team and ninja directories
    chmod 770 /home/"$2"/team
    chmod 770 /home/"$2"/ninja
    chown "$2":"$3" /home/"$2"/team
    chown "$2":"$3" /home/"$2"/ninja

    # Set group permissions for other users in the same team
    chmod g+rx /home/"$2"/team
    chmod g+rx /home/"$2"/ninja

    echo "User '$2' added to team '$3'."
}

# Function to delete a user
del_user() {
    userdel -r "$2"
    echo "User '$2' deleted."
}

# Function to change user password
change_passwd() {
    passwd "$2"
    echo "Password for user '$2' changed."
}

# Function to change user shell
change_shell() {
    chsh -s "$3" "$2"
    echo "Shell for user '$2' changed to $3."
}

# Function to list all users
list_users() {
    echo "Listing all users:"
    cut -d: -f1 /etc/passwd
}

# Function to list all teams (groups)
list_teams() {
    echo "Listing all teams:"
    cat /etc/group | cut -d: -f1
}

# Main function to parse the arguments and call the appropriate function
case "$1" in
    addTeam)
        add_team "$2" "$3"
        ;;
    delTeam)
        del_team "$2" "$3"
        ;;
    addUser)
        add_user "$2" "$3" "$4"
        ;;
    delUser)
        del_user "$2" "$3"
        ;;
    changePasswd)
        change_passwd "$2" "$3"
        ;;
    changeShell)
        change_shell "$2" "$3" "$4"
        ;;
    lsUser)
        list_users
        ;;
    lsTeam)
        list_teams
        ;;
    *)
        echo "Invalid command. Please use one of the following:"
        echo "./UserManager.sh addTeam <team_name>"
        echo "./UserManager.sh delTeam <team_name>"
        echo "./UserManager.sh addUser <username> <team_name>"
        echo "./UserManager.sh delUser <username>"
        echo "./UserManager.sh changePasswd <username>"
        echo "./UserManager.sh changeShell <username> <new_shell>"
        echo "./UserManager.sh lsUser"
        echo "./UserManager.sh lsTeam"
        ;;
esac
