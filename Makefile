COMPOSE := docker compose

up: $(COMPOSE) up -d

down: $(COMPOSE) down

restart: $(COMPOSE) restart mc

logs: $(COMPOSE) logs -f mc