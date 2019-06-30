build: .mk/build
.mk/build: Dockerfile $(wildcard scripts/*) .mk
	docker build --tag mayeu/postgres-dev:latest .
	touch $@

.PHONY: run
run: .mk/build
	docker run mayeu/postgres-dev

.PHONY: clean
clean:
	docker-compose down

.mk:
	mkdir -p $@
