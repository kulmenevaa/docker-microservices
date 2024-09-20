# Microservice architecture deployment example

<details>
<summary>Structure</summary>

##### Backend (folder)
- .docker - configuration files for each application and Dockerfile for both php and nginx (laravel commands are used)
- events  - events service (laravel project)
- gateway - distributor (laravel project)
- users   - users service (laravel project)

##### Frontend (folder)
- .docker - configuration files and Dockerfile for the frontend part

##### docker-compose.yml (file) - microservice architecture dependency provider