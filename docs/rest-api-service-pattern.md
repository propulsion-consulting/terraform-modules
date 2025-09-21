# REST API Pattern

* Consistent pattern for building REST web protocol API's using golang & docker containers to deploy and host.
* Integrates with PostgreSQL application database and Clickhouse data warehouse, data stores can be managed using flyway with CI/CD
* Builds docker container with API source for handlers and pushes to local registry. Application deployment pulls down image and hosts API with specified ports.
* Includes user authentication service for managing access for specific API handler routes. 
* Development environment deploys all to local device, staging deploys to local Ubuntu home server, Production is the AWS account using terraform to manage infrastructure.

# Features
| Alias                       | Description                                                                                                         |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **User Management Service** | User authentication service for managing access for specific API handler routes. Uses JWT to provide auth for users |
| **Database Management**     | Manage clickhouse & postgres database at the same time with flyway in CI/CD                                         |
| **CRUD Operations**         | Provided set of operations with sample postgres table entity with CRUD operations & additional bulk operations      |
| **Docker Deployment**       | Docker boilerplate for pushing to image registry and host application with ports exposed.                           |

## CRUD Operations

* List of database operations that will be supported by the API pattern. Includes sample entity that operations will be done on.
* Sample entity represents an account that stores funds, this will be used to test all database operations with unit/integration tests

### Sample Entity (Account)

| Field Name   | Type      | Description                              |
| ------------ | --------- | ---------------------------------------- |
| `ID`         | `INTEGER` | Unique ID associated with account entity |
| `USER_ID`    | `INTEGER` | User ID associated with account          |
| `NAME`       | `VARCHAR` | Text field to associate name to account  |
| `MAX_SELL`   | `FLOAT`   | Maximum price to sell shares             |
| `MIN_BUY`    | `FLOAT`   | Mininumum price to start buying          |
| `BALANCE`    | `FLOAT`   | Current balance of account               |
| `CREATED_AT` | `DATE`    | Date account was created                 |
| `UPDATED_AT` | `DATE`    | Date account information was updated     |
| `ACTIVE`     | `BOOLEAN` | Soft delete field                        |

### Operations
| Operation Name    | HTTP Protocol | Description                                                         |
| ----------------- | ------------- | ------------------------------------------------------------------- |
| **Create**        | `POST`        | Create a single instance of the entity                              |
| **Bulk Create**   | `POST`        | Provide bulk field entries and create multiple entities in one call |
| **Read**          | `GET`         | View all entity records                                             |
| **Read Detail**   | `GET`         | View specific entity record  by unique identifier                   |
| **Update**        | `PATCH`       | Update single entity instance                                       |
| **Bulk Update**   | `PATCH`       | Provide bulk field entries and update multiple entities             |
| **Delete Detail** | `DELETE`      | Delete specific entity record  by unique identifier                 |
| **Bulk Delete**   | `DELETE`      | Provide bulk field entries and delete multiple entities             |

## Docker Deployment
| Operation        | Description                                                                                                                |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------- |
| **Push image**   | Pushes container to local registry, local for dev, to ubuntu home server for staging, AWS cloud for production deployment. |
| **List Image**   | Can list images that are pushed to the repository with this url: `http://localhost:5000/v2/_catalog`                       |
| **Delete Image** | Delete specific image by filtering application name                                                                        |
