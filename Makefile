CD = cd
COMPOSE = ./srcs/

UP = docker compose up -d
DOWN = docker compose down

CLEAN = docker compose down --rmi all --volumes --remove-orphans

up:
	$(CD) $(COMPOSE) && $(UP)

down:
	$(CD) $(COMPOSE) && $(DOWN)

clean:
	$(CD) $(COMPOSE) && $(CLEAN)

re: clean up

.PHONY: up down clean re