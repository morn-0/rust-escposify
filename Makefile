fmt:
	cargo fmt --all -- --check

clippy:
	RUSTFLAGS='-D warnings' cargo clippy --all --tests --all-features

example:
	cargo build --examples

test:
	RUSTFLAGS='-D warnings' RUST_BACKTRACE=full cargo test --all --all-features

ci: fmt clippy example test
	git diff --exit-code Cargo.lock
