all:
	@if [[ $(shell uname) == "Linux" ]]; then \
		sudo systemctl start docker; \
	fi
	@if [[ $(shell uname) == "Darwin" ]]; then \
		colima start; \
	fi
	mkdir -p /home/achahrou/data/db/
	mkdir -p /home/achahrou/data/wordpress/
	docker-compose -f ./srcs/docker-compose.yaml up --build

fclean:
	-docker stop $$(docker ps -aq)
	-docker rm $$(docker ps -aq)
	-docker rmi $$(docker images -aq)
	-docker network rm $$(docker network ls -q) 2> /dev/null
	-docker volume rm $$(docker volume ls -q)
	-docker system prune -af --volumes y
	-sudo rm -rf /home/achahrou/data/
