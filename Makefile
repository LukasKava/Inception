
up:
	sudo bash ./srcs/requirements/wordpress/tools/create_dir.sh
	docker compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker compose -f ./srcs/docker-compose.yml down

rm:
	docker compose -f ./srcs/docker-compose.yml down -v
	docker rmi $$(docker images -q) || true
	sudo rm -rf /home/lkavalia/data/wordpress
	sudo rm -rf /home/lkavalia/data/mariadb

re:rm
	sudo bash ./srcs/requirements/wordpress/tools/create_dir.sh
	docker compose -f ./srcs/docker-compose.yml up --build -d

info:
	docker ps

startEval:
	sudo bash ./srcs/requirements/wordpress/tools/remove_prepare_for_eval.sh
