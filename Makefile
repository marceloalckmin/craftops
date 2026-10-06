.PHONY: up down restart logs add-mods

COMPOSE := docker compose

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

restart:
	$(COMPOSE) restart mc

reset:
	$(COMPOSE) down
	rm -rf minecraft-data

logs:
	$(COMPOSE) logs -f mc

add-mods:
	scripts/add-mods.sh $(FILE)

pack-serve:
	cd pack && packwiz serve

pack-refresh:
	cd pack && packwiz refresh