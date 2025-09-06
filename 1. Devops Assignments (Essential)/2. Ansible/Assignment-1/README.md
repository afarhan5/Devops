# Assignment-1 :-

# This assignment perform using ad-hoc and module commands
1. Create a group
```bash
   ansible node -i inventory -m group -a "name=ninjaTeam" -b
```
![Screenshot 2025-04-27 025532](https://github.com/user-attachments/assets/31aa691f-1900-4763-b566-c104e20f1d09)

   
2. Create a user
```bash
   ansible node -i inventory -m user -a "name=nitish group=ninjaTeam" -b
```

![Screenshot 2025-04-27 025608](https://github.com/user-attachments/assets/cf5a4ea1-815d-423f-8b07-7eacdc40fdd3)

   
3. create user home & User Permissions on Home Directory
```bash
   ansible node -i inventory -m file -a "path=/home/nitish owner=nitish group=ninjaTeam mode=0750" -b
   
```

![Screenshot 2025-04-27 025704](https://github.com/user-attachments/assets/b9051fc0-bcf3-4682-962f-e802eb8e7fc9)

4. Same team members will have full access
```bash

ansible node -i inventory -m file -a "path=/home/nitish/Team state=directory owner=nitish group=ninjaTeam mode=0770" -b

ansible node -i inventory -m file -a "path=/home/nitish/Ninja state=directory owner=nitish group=ninjaTeam mode=0770" -b

```

![Screenshot 2025-04-27 025817](https://github.com/user-attachments/assets/ab2d97b5-b6f0-4186-9b3e-6e841173bcfd)


![Screenshot 2025-04-27 025849](https://github.com/user-attachments/assets/9c15467a-cd25-49b7-af10-74bf14c97e03)


5. Change user Shell
```bash

ansible node -i inventory -m user -a "name=nitish shell=/bin/sh" -b

```

![Screenshot 2025-04-27 025939](https://github.com/user-attachments/assets/648b4af6-ebf7-4af2-883c-4e488a7c240e)


6. Change user password
```bash

ansible node -i inventory -m user -a "name=nitish state=absent remove=yes" -b

```

![Screenshot 2025-04-27 030001](https://github.com/user-attachments/assets/a8e801bc-f90b-404a-a515-2e1c9213635d)


7. Delete user and group
```bash

ansible node -i inventory -m group -a "name=ninjaTeam state=absent" -b

```


![Screenshot 2025-04-27 030021](https://github.com/user-attachments/assets/4bc345bf-e313-4845-842d-4b52218e791a)


8. List user or Team
```bash

ansible node -i inventory -m command -a "cat /etc/passwd"

ansible node -i inventory -m command -a "cat /etc/group"

```

![Screenshot 2025-04-27 030045](https://github.com/user-attachments/assets/1af240a4-b4b8-42c7-bdc3-72ff618c3cf9)


![Screenshot 2025-04-27 030106](https://github.com/user-attachments/assets/f9a7318f-0bf9-4589-8de6-996034e22b96)


![Screenshot 2025-04-27 030127](https://github.com/user-attachments/assets/3aa7b281-41a4-48a9-a95b-f8b8ffe78f33)


![Screenshot 2025-04-27 030210](https://github.com/user-attachments/assets/ed09e4fc-9afd-495c-9206-ee2239e1b535)

