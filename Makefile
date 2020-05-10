reset-psql: stop-psql start-psql

start-psql:
	docker run --name some-postgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres

stop-psql:
	docker kill some-postgres || echo not running
	docker rm some-postgres || echo no image

db-create:
	mix ecto.create

db-migrate:
	mix ecto.migrate

run:
	iex -S mix phx.server

seed:
	mix run priv/repo/seeds.exs

data/ol_dump_works_latest.txt.gz:
	cd data && wget -c https://openlibrary.org/data/ol_dump_works_latest.txt.gz

data/ol_dump_works_authors_latest.txt.gz:
	cd data && wget -c https://openlibrary.org/data/ol_dump_authors_latest.txt.gz

data/ol_dump_editions_latest.txt.gz:
	cd data && wget -c https://openlibrary.org/data/ol_dump_editions_latest.txt.gz

load-data: data/ol_dump_works_latest.txt.gz data/ol_dump_works_authors_latest.txt.gz data/ol_dump_editions_latest.txt.gz
