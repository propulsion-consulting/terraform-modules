# Terraform Modules

These terraform modules are meant to serve as a package of reusable solutions for common infrastructure  patterns that will be used at propulsion consulting. The modules allow for hybrid deployments (on premises & AWS). 

## 🧩 Modules Overview

### ☁️ AWS Modules

| Module                | Description                                          |
| --------------------- | ---------------------------------------------------- |
| `networking`          | Sets up VPCs, subnets, gateways, and security groups |
| `container-app`       | Deploys containerized applications on AWS            |
| `ecr-repository`      | Manages AWS ECR for container images                 |
| `postgres-deployment` | Provisions PostgreSQL instances on AWS               |

---
### 🖥️ On-Prem Modules

| Module                        | Description                                                  |
| ----------------------------- | ------------------------------------------------------------ |
| `application-on-prem`         | On-premise application service deployment                    |
| `clickhouse-on-prem`          | ClickHouse data warehouse setup on-prem                      |
| `container-app-on-prem`       | Local containerized application setup                        |
| `container-registry-on-prem`  | Local container registry configuration                       |
| `postgres-appdb-on-prem`      | Application PostgreSQL database for on-prem environments     |
| `postgres-deployment-on-prem` | Core PostgreSQL infrastructure deployment for on-prem setups |

## Additional Notes

* Refer to the page tree index to see what each module does and how it contributed to the application development lifecycle
* Each module has high level architecture along with the implementation details and how it's used during application/data deployments.