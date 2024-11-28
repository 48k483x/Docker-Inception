FROM debian:buster

RUN apt-get -y update && apt install redis-server -y

# Set redis memory limit to prevent overutilization
RUN echo "maxmemory 256mb" >> /etc/redis/redis.conf

# Configure Redis to remove latest used data when memory is full
RUN echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf

# Allow redis to accept connections from other containers
RUN sed -i -r "s/bind 127.0.0.1/bind 0.0.0.0/" /etc/redis/redis.conf

# Start Redis server with open network config
CMD ["redis-server", "--protected-mode", "no"]
