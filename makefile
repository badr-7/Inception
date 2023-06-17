all : volume
	cd srcs; \
	docker-compose up -d --build

volume : 
		 mkdir -p /private/tmp/Inception/data/wp
		 mkdir -p /private/tmp/Inception/data/db

stop : 
	cd srcs; \
	docker-compose down
clean :
	cd srcs; \
	docker-compose down --remove-orphans 
	rm -rf /private/tmp/Inception/data

logs :
	cd srcs; \
	docker-compose logs -f

re : clean all