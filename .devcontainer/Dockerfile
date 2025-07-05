FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

# Habilita arquitectura i386 para Wine
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
        build-essential \
        mingw-w64 \
        wine \
        pkg-config \
        git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

CMD ["/bin/bash"]