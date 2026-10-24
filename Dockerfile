# --- Versions gérées par Renovate ---
# PostGIS base image version (Docker Hub)
ARG POSTGIS_VERSION=18-3.6-alpine

# pgvector extension version (GitHub releases)
ARG PGVECTOR_VERSION=v0.8.7

# --- Build ---
FROM postgis/postgis:${POSTGIS_VERSION}

# Set labels for the image
LABEL base_image="postgis/postgis:${POSTGIS_VERSION}"
LABEL authors="Florentin Munsch <flo.m68@gmail.com>"
LABEL maintainer="Florentin Munsch <flo.m68@gmail.com>"
LABEL company="KMSF"
LABEL website="www.munschflorentin.fr"
LABEL version="1.0"
LABEL date="2026-10-20"
LABEL description="PostGIS with pgvector support"
LABEL license="Unlicense"
#LABEL repository="https://github.com/Florentin68/docker-postgis-pgvector"

# pgvector installation
RUN apk add --no-cache --virtual .build-deps \
        git \
        build-base \
        clang21 \
        llvm21 \
        make \
    # Clonage et compilation de pgvector
    && git clone --branch ${PGVECTOR_VERSION} --depth 1 https://github.com/pgvector/pgvector.git /tmp/pgvector \
    && cd /tmp/pgvector \
    && make clean \
    && make OPTFLAGS="" \
    && make install \
    # Nettoyage
    && rm -rf /tmp/pgvector \
    && apk del .build-deps