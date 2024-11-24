#!/bin/bash

#1. Check for required envirenement variables
if [-z "$SSL_CERTIFICATE"] || [-z "$SSL_CERTIFICATE_KEY"] || [-z "$LOGIN"]; then
    echo "Error: Some important keys are missing..."
    echo "Ensure SSL_CERTIFICATE, SSL_CERTIFICATE_KEY, and LOGIN are set on .env file"
    exit 1
fi

#2. Generate SSH certificate if it doesn't exist
if [! -f "$SSL_CERTIFICATE"] || [! -f "$SSL_CERTIFICATE_KEY"]; then
    echo "Generating SSL certificate..."
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout "$SSL_CERTIFICATE_KEY" -out "$SSL_CERTIFICATE" \
        -subj "/C=MA/L=Bengurir/O=UM6P/OU=1337/CN=localhost"
fi
#params explained
# -x509: Generate self-signed certificate
# -nodes: don't encrypt the private key
# -days 365: valide for 1 year
# -newkey rsa;2048: generate new 2048-bit RSA key
# -keyout: where to save the private key
# -out: where to save the certificate
# -subj: certificate subject information


#3. Set proper permission for SSL files
chmod 600 /etc/ssl/private/nginx.key
chmod 644 /etc/ssl/certs/nginx.crt

#4. Replace environements variables in NGINX config
echo "Configuring nginx..."
envsubst '${SSL_CERTIFICATE} ${SSL_CERTIFICATE_KEY} ${LOGIN}' \
    < /etc/nginx/sites-enabled/default > /etc/nginx/sites-enabled/default.tmp
mv /etc/nginx/site-enabled/default.tmp /ect/nginx/site-enabled/default

#5. Set proper ownership for web directory 
chown -R www-data:www-data /var/www/html/

#6.Start nginx in !background mode
echo "Starting nginx..."
nginx -g "daemon off;" # run in foreground (required for docker)
