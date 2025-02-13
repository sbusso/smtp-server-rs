FROM debian:buster-slim AS chef 
RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -yq \
        build-essential \
        cmake \
        clang \ 
        curl \
        protobuf-compiler
ENV RUSTUP_HOME=/opt/rust/rustup \
    PATH=/home/root/.cargo/bin:/opt/rust/cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN curl https://sh.rustup.rs -sSf | \
    env CARGO_HOME=/opt/rust/cargo \
        sh -s -- -y --default-toolchain stable --profile minimal --no-modify-path && \
    env CARGO_HOME=/opt/rust/cargo \
        rustup component add rustfmt
RUN env CARGO_HOME=/opt/rust/cargo cargo install cargo-chef && \
    rm -rf /opt/rust/cargo/registry/
WORKDIR /app

FROM chef AS planner
COPY Cargo.toml .
COPY Cargo.lock .
COPY src/ src/
COPY resources/ resources/
RUN cargo chef prepare --recipe-path recipe.json

FROM chef AS builder 
COPY --from=planner /app/recipe.json recipe.json
RUN cargo chef cook --release --recipe-path recipe.json
COPY Cargo.toml .
COPY Cargo.lock .
COPY src/ src/
COPY resources/ resources/
RUN cargo build --release

FROM debian:buster-slim AS runtime

COPY --from=builder /app/target/release/stalwart-smtp /usr/local/bin/stalwart-smtp
RUN useradd stalwart-smtp -s /sbin/nologin -M
RUN mkdir -p /usr/local/stalwart-smtp
RUN chown stalwart-smtp:stalwart-smtp /usr/local/stalwart-smtp

#USER stalwart-smtp

ENTRYPOINT ["/usr/local/bin/stalwart-smtp"]
