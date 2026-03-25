# zentiff development tasks

default:
    @just --list

# Run tests (default features, includes zencodec)
test:
    cargo test
    cargo test --features all-codecs

# Check all feature permutations
feature-check:
    cargo check
    cargo check --features "all-codecs,zencodec"
    cargo check --no-default-features --features std
    cargo check --no-default-features --features "std,zencodec"

# Clippy
clippy:
    cargo clippy --all-targets --features "all-codecs,zencodec" -- -D warnings
    cargo clippy --all-targets --no-default-features --features std -- -D warnings

# Format
fmt:
    cargo fmt

# Format check
fmt-check:
    cargo fmt --check

# Local CI sanity check
ci: fmt-check clippy feature-check test
