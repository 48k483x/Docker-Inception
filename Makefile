all: build

build:
	mkdir -p /home/achahrou/data/db/
	mkdir -p /home/achahrou/data/wordpress/
	docker-compose -f ./srcs/docker-compose.yaml up --build -d
down:
	docker-compose -f ./srcs/docker-compose.yaml down
clean:
	docker-compose -f ./srcs/docker-compose.yaml down -v

fclean: clean
	sudo rm -rf /home/achahrou/data/db
	sudo rm -rf /home/achahrou/data/wordpress
	docker system prune -a -f

