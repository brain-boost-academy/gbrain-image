FROM oven/bun:1.3-slim

RUN apt-get update \
 && apt-get install -y --no-install-recommends git ca-certificates \
 && rm -rf /var/lib/apt/lists/*

ENV BUN_INSTALL=/usr/local
ARG GBRAIN_REF=master
RUN bun install -g "github:garrytan/gbrain#${GBRAIN_REF}" \
 && gbrain --version

ENV GBRAIN_HOME=/gbrain
RUN mkdir -p /gbrain/.gbrain

EXPOSE 3131
ENTRYPOINT ["gbrain"]
