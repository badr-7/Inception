all : volume
	cd srcs; \
	sudo docker-compose up -d --build

volume : 
		sudo mkdir -p /home/mel-hous/data/wp
		sudo mkdir -p /home/mel-hous/data/db

stop : 
	cd srcs; \
	sudo docker-compose down
clean :
	cd srcs; \
	sudo docker-compose down --remove-orphans 
	sudo rm -rf /home/mel-hous/data

logs :
	cd srcs; \
	sudo docker-compose logs -f

re : clean all