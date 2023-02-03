-- +goose Up
--- python modules need to be installed in $PYTHONPATH for the user and server running Postgres
--- and Postgres needs to have read permissions for this path
CREATE EXTENSION plypthon3u;

-- +goose Down
DROP EXTENSION plypthon3u;
