# zentiff development tasks

# Run tests (default features)
test:
    cargo test

# Run tests with all codecs
test-all:
    cargo test --features all-codecs

# Check all feature permutations
feature-check:
    cargo check
    cargo check --features all-codecs
    cargo check --no-default-features --features std
    cargo check --no-default-features --features "std,fax"
    cargo check --no-default-features --features "std,jpeg"
    cargo check --no-default-features --features "std,webp"
    cargo check --no-default-features --features "std,zstd"
    cargo check --no-default-features --features "std,deflate"
    cargo check --no-default-features --features "std,lzw"

# Clippy
clippy:
    cargo clippy --all-targets --features all-codecs -- -D warnings

# Format
fmt:
    cargo fmt

# Local CI sanity check
ci: fmt clippy feature-check test-all
