# otssh Utility

- Manage SSH connections: add, list, update, delete, and connect.
  

# Commands:-

- Add SSH Connection:  
  $ otssh -a -n <name> -h <host> -u <user> [-p <port>] [-i <key>]
- List Connections:  
  $ otssh -l (names)  
  $ otssh -ld (details)
- Edit Connection:  
  $ otssh -e -n <name> [-h <host>] [-u <user>] [-p <port>] [-i <key>]
- Delete Connection:  
  $ otssh -r <name>
- Connect to Server:
  $ otssh <name>

# Example Usage:-
- Add: $ otssh -a -n server1 -h 192.168.21.30 -u user
- List: $ otssh -ld
- Edit: $ otssh -e -n server1 -h newhost -u newuser
- Delete: $ otssh -r server1
- Connect: $ otssh server1
