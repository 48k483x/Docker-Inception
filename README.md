# Inception 🐳

## Project Goal  
Create a secure and scalable web infrastructure using **Docker**.

## What You'll Build 🚀  
- **NGINX**: A web server with TLS encryption.  
- **MariaDB**: A reliable and secure database.  
- **WordPress**: A dynamic content management system.

## Directory Structure 🗂️  
```plaintext
project_root/
│
├── Makefile                   # Automates the setup process
│
└── srcs/
    ├── docker-compose.yml     # Orchestrates the containers
    ├── .env                   # Stores environment variables
    └── requirements/
        ├── nginx/
        │   ├── Dockerfile     # Defines the NGINX container
        │   ├── conf/          # Configuration files for NGINX
        │   └── tools/         # Helper scripts/tools
        ├── mariadb/
        │   ├── Dockerfile     # Defines the MariaDB container
        │   ├── conf/          # Configuration files for MariaDB
        │   └── tools/         # Helper scripts/tools
        └── wordpress/
            ├── Dockerfile     # Defines the WordPress container
            ├── conf/          # Configuration files for WordPress
            └── tools/         # Helper scripts/tools

