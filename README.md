# Inception 🐳
```js
const Inception = {
  "goal": "Dockerize NGINX, WordPress, MariaDB",
  "setup": "VM + Makefile",
  "rules": ["Custom images", "Env vars only"]
};
```

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

