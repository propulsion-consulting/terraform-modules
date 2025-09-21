# Application Service Module

* General module for deploying infrastructure for new "full stack" applications. 
* Deployment for infrastructure is separated between home development server and AWS cloud infrastructure. Github actions will deploy to both environments. 
* Includes data storage, API integrations and a client side module for hosting front end applications. 

# On Premises Application Service

![application-service-on-prem](../assets/application-service-on-prem.jpg)

* Infrastructure for managing deployments on the on premises server (ubuntu home server) will be version controlled in GitHub with terraform templates/modules
* Terraform modules will manage docker containers and the application database (postgreSQL). Pushing API source code to the docker container might also be managed by terraform
* The application database migrations will be done using Flyway to keep track of all schema changes/database management.

# On Premise Container Registry

![container-registry-on-prem](../assets/container-registry-on-prem.jpg)

* Hosting a container registry on home server for development and staging of applications before going to production AWS account
* Container registry will have 2 volumes, primary and second volumes for backup recovery and application migrations. 
* Registry will have a namespace organization mechanism, `api` for rest API's, `site` for front end application source code, `model` for machine learning models
#  Cloud Application Service

![application-service-cloud](../assets/application-service-cloud.jpg)

* Infrastructure for managing deployments to AWS account will be version controlled in GitHub with terraform templates/modules, authorized to deploy to AWS using open ID connect role. 
* Terraform will manage an AWS stack that contains docker containers on ECS and postgreSQL databases using RDS. Each application will contain this stack of resources. 
* The application database migrations will be done using Flyway to keep track of all schema changes/database management.
# Features
| Feature Alias               | Description                                                                                                                                             |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Application database module | Module for creating postgres database infrastructure and local docker container for development.                                                        |
| REST service module         | Module for deploying REST API's. Includes container deployment for API source code with AWS and home server.                                            |
| Client side module          | Module for hosting infrastructure needed for front end web applications. Includes deployment to S3 for cloud storage and home server docker container.  |
