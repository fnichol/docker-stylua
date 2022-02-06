FROM rust:1-alpine3.15 as builder
ARG VERSION

# hadolint ignore=DL3018
RUN apk add --no-cache gcc libc-dev
RUN cargo install stylua \
    --version "${VERSION}" --locked --all-features --verbose

FROM alpine:3.15

ARG NAME
ARG VERSION
ARG REVISION
ARG CREATED

ARG SOURCE=https://github.com/fnichol/docker-stylua.git

LABEL \
    name="$NAME" \
    org.opencontainers.image.version="$VERSION" \
    org.opencontainers.image.authors="Fletcher Nichol <fnichol@nichol.ca>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.source="$SOURCE" \
    org.opencontainers.image.revision="$REVISION" \
    org.opencontainers.image.created="$CREATED"

COPY --from=builder /usr/local/cargo/bin/stylua /usr/local/bin/

RUN echo "name=$NAME" > /etc/image-metadata \
    && echo "version=$VERSION" >> /etc/image-metadata \
    && echo "source=$SOURCE" >> /etc/image-metadata \
    && echo "revision=$REVISION" >> /etc/image-metadata \
    && echo "created=$CREATED" >> /etc/image-metadata

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/usr/local/bin/stylua"]
