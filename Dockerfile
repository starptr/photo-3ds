FROM devkitpro/devkitarm

# TODO: replace devkitarm/bin with envvar/bin
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:/opt/devkitpro/devkitARM/bin:$PATH

RUN apt-get install -y build-essential

RUN set -eux; \
    dpkgArch="$(dpkg --print-architecture)"; \
    case "${dpkgArch##*-}" in \
        amd64) rustArch='x86_64-unknown-linux-gnu' ;; \
        arm64) rustArch='aarch64-unknown-linux-gnu' ;; \
        *) echo >&2 "unsupported architecture: ${dpkgArch}"; exit 1 ;; \
    esac; \
    \
    url="https://static.rust-lang.org/rustup/dist/${rustArch}/rustup-init"; \
    wget "$url"; \
    chmod +x rustup-init; \
    ./rustup-init -y --no-modify-path --default-toolchain nightly; \
    rm rustup-init; \
    chmod -R a+w $RUSTUP_HOME $CARGO_HOME; \
    rustup --version; \
    cargo --version; \
    rustc --version;

# Needed to build std
RUN rustup component add rust-src --toolchain nightly-x86_64-unknown-linux-gnu

# Install cargo 3ds
RUN git clone https://github.com/rust3ds/cargo-3ds.git /home/cargo-3ds; \
    cargo install --path /home/cargo-3ds;

# Examples
RUN git clone https://github.com/rust3ds/ctru-rs.git /home/ctru-rs

RUN mkdir -p /home/wkdir

# docker-compose will bind the source
WORKDIR /home/wkdir/
