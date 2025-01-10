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
├── Makefile                # Automates setup
└── srcs/
    ├── docker-compose.yml  # Manages containers
    ├── .env                # Environment variables
    └── requirements/
        ├── nginx/          # NGINX setup
        ├── mariadb/        # MariaDB setup
        └── wordpress/      # WordPress setup 
