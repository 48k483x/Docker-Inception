FROM debian:bullseye

# wl
RUN apt update -y && apt install --no-install-recommends nginx openssl gettext -y

# Create directories for SSL Certificates
RUN mkdir -p /etc/ssl/certs /etc/ssl/private

# copy the NGINX site configuration file and the script
COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./tools/script.sh .

# give exec perm to the script
RUN chmod +x script.sh

# expose port 443
EXPOSE 443

CMD ["bash", "script.sh"]
