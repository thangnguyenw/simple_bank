createdb: 
	docker exec -it postgres16 createdb --username=root --owner=root simple_bank

dropdb: 
	docker exec -it postgres16 dropdb simple_bank

postgres_run: 
	docker run --name postgres16 -p 5432:5432 -e POSTGRES_PASSWORD=secret -e POSTGRES_USER=root -d postgres:16-alpine

migrate_up: 
	migrate -path db/migration -database "postgresql://root:15082003Pt@localhost:5432/simple_bank?sslmode=disable" -verbose up

migrate_down: 
	migrate -path db/migration -database "postgresql://root:15082003Pt@localhost:5432/simple_bank?sslmode=disable" -verbose down	

postgres: 
	docker start postgres16

sqlc:
	sqlc generate

test:
	go test -v -cover ./...
	

.PHONY: 
	createdb dropdb postgres_run postgres sqlc test
