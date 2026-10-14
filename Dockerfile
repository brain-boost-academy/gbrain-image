# gbrain >= 0.60.27.0 refuses to run on Bun < 1.4 (UNSUPPORTED_RUNTIME);
# 1.4.0-1.4.2 have a spawnSync hang (gbrain 0.60.195.0), so default to 1.4.3.
# Older gbrain refs can be built with BUN_VERSION=1.3.
ARG BUN_VERSION=1.4.3
FROM oven/bun:${BUN_VERSION}-slim

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
