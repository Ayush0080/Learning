# Docker

1. Docker : 

   - Docker is a tool that packages an application and all its dependencies into a single, portable unit called a container. It makes sure that the application runs exactly the same way, everywhere, regardless of the environment.

2. Container :

   - container is a lightweight, standalone package of software that includes everything an application needs to run: the code, a runtime, system tools, and libraries. Containers are isolated from each other and the host system, making them secure and consistent.


3. Image :
   - Docker Image is a read-only template used to create containers. Think of an image as a blueprint for an application. It contains all the instructions and files needed to build a running container. You can create multiple containers from a single image.



4. Dockerfile :

   - Dockerfile is a simple text file that contains the step-by-step instructions for building a Docker image. It's like a recipe for your application's environment.


- Installing Dcoker on Ubuntu vm [REF](https://docs.docker.com/engine/install/ubuntu/)
![alt text](image.png)
![alt text](image-1.png)


### Docker Commands :

- Run – start a container

  ![alt text](image-2.png)
  ![alt text](image-3.png)
  ![alt text](image-5.png)
  

- ps – list containers

  ![alt text](image-4.png)

- STOP – stop a container

  ![alt text](image-6.png)
  
- Rm – Remove a container

  ![alt text](image-7.png)

- images – List images

  ![alt text](image-8.png)

- rmi – Remove images
  ![alt text](image-9.png)
  
- Pull – download an image
  ![alt text](image-10.png)

- Exec – execute a command
  ![alt text](image-11.png) 


### Docker Run :

- Run – tag
  - if we not specify any tag , Docker will consider the default tag to be latest.

   ![alt text](image-12.png)

- Run – PORT mapping

  ![alt text](image-13.png)
  ![alt text](image-14.png)

- RUN – Volume mapping

  ![alt text](image-15.png)

- Inspect Container

  ![alt text](image-16.png)

- Container Logs

  ![alt text](image-17.png)

### Docker Images :
  [REF](https://github.com/mmumshad/simple-webapp-flask)

  - creating a new docker images
    ![alt text](image-18.png)
    ![alt text](image-19.png)
    ![alt text](image-20.png)
    ![alt text](image-21.png)
    ![alt text](image-22.png)
    ![alt text](image-23.png)
    ![alt text](image-24.png)


### Docker Compose :
 - Docker Compose is a tool that simplifies the process of defining and running multi-container Docker applications. It allows you to use a single YAML file (docker-compose.yml) to configure and manage all the services, networks, and volumes that make up your application.
   - Instead of running separate, long docker run commands for each container, Docker Compose lets you launch your entire application stack with a single command.

- links: used to allow containers to communicate with each other

 - installing docker-compose on VM : 
   [REF](https://docs.docker.com/compose/install/linux/)

   ![alt text](image-25.png)

   - cloning repo [Git](https://github.com/dockersamples/example-voting-app)

     ![alt text](image-26.png)
     ![alt text](image-27.png)
     ![alt text](image-28.png)
     ![alt text](image-29.png)
     ![alt text](image-30.png)
     ![alt text](image-31.png)
     ![alt text](image-33.png)


### Docker Engine,Storage and Networking

- by default docker stores data  in  /var/lib/docker
- create new volume in docker file system 
     ```bash
     docker volume create volumme_name
    ```
- mount the volume if we do not created volume1 than they automatically created 
    ```bash
     docker run -v volume1:/var/lib/mysql mysql
    ```
    ![alt text](image-34.png)    

    
 


