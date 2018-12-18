.PHONY: build
build:
	docker build --file multipostgres-image/Dockerfile --tag multipostgres multipostgres-image

clean:
	docker-compose down
