FROM rust:latest AS build

WORKDIR /app

COPY Cargo.toml ./

COPY src src

RUN cargo build --release

FROM debian:bookworm-slim AS prod

COPY --from=build /app/target/release/verbs /verbs

COPY verbs.json verbs.json

CMD ["./verbs"]