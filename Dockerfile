# Base (with work directory)
FROM lukemathwalker/cargo-chef:0.1.35-rust-buster AS chef
WORKDIR /usr/src/app


# Extract dependancies
FROM chef as planner
COPY . .
RUN cargo chef prepare --recipe-path recipe.json


# Build layer
FROM chef as builder

# Build dependancies
COPY --from=planner /usr/src/app/recipe.json recipe.json
RUN cargo chef cook --release --recipe-path recipe.json

# Build bin
COPY . .
RUN cargo build --release

CMD ["target/release/app"]
