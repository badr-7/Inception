all : volume
	cd srcs; \
	sudo docker-compose up -d --build

volume : 
		sudo mkdir -p $(shell pwd)/srcs/data/wp
		sudo mkdir -p $(shell pwd)/srcs/data/db

stop : 
	cd srcs; \
	sudo docker-compose down
clean :
	cd srcs; \
	sudo docker-compose down --remove-orphans 
	sudo rm -rf srcs/data

logs :
	cd srcs; \
	sudo docker-compose logs -f

re : clean all