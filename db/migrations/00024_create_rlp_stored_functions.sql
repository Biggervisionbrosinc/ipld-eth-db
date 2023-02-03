-- +goose Up
-- +goose StatementBegin
CREATE OR REPLACE FUNCTION rlp_encode(node BYTEA[])
  RETURNS BYTEA
AS $$
    import rlp -- sys.modules caches import between function calls
    return rlp.encode(node)
$$ LANGUAGE plpython3u;
-- +goose StatementEnd

-- +goose StatementBegin
CREATE OR REPLACE FUNCTION rlp_decode(bytes BYTEA)
  RETURNS BYTEA[]
AS $$
    import rlp
    return rlp.decode(bytes)
$$ LANGUAGE plpython3u;
-- +goose StatementEnd

-- +goose Down
DROP FUNCTION rlp_decode;
DROP FUNCTION rlp_encode;
