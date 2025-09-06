#  # Assignment-2 :- Docker Node.js Web Server

--------------------------------------------
 Task Objective
----------------------------------------------
Create a Dockerized Node.js web server running on Ubuntu, serving a styled index.html page using http-server.

--------------------------------------------------------------------------------------------------------------
 Requirements
--------------------------------------------------------------------------------------------------------------
Use the Ubuntu latest base image.
Add yourself as a maintainer.
Update system packages.
Install:
nodejs
npm
Create a symlink:
ln -s /usr/bin/nodejs /usr/bin/node (only if it doesn’t already exist)
Globally install:
npm install -g http-server
Add an index.html file with CSS at:
/usr/apps/hello-docker/index.html
Set working directory to:
/usr/apps/hello-docker
On container start, run:
http-server -s
Build the Docker image tagged as:
deepak:docker-web
Run a container, mapping port 8080:8080.
Test via browser:
http://<your-vm-ip>:8080/index.html
Remove container and image afterward.

---------------------------------------
docker build -t farhan:docker-web . |
docker run -d -p 8080:8080 --name Assignment-2 farhan:docker-web

-----------------------------------------------------------------------------------------------------------------------------------------------------------
Here is the Screenshot
--------------------------------------------------------------------------------------------------------------------------------------------------------------

![Screenshot 2025-06-06 001526](https://github.com/user-attachments/assets/a92ed31a-ad82-42fe-9e48-1f659e8b6773)

