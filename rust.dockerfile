####################################################################################################
## Builder
####################################################################################################
FROM rust:latest AS builder

RUN update-ca-certificates

ARG USER

ENV UID=1000

RUN apt-get update && apt-get install zsh sudo git locate -y

RUN adduser \
    --disabled-password \
    --home "/home/rust" \
    --gecos "" \
    --shell "/sbin/nologin" \
    --uid "${UID}" \
    "${USER}"

RUN usermod -aG sudo ${USER} && adduser ${USER} sudo && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ${USER}

WORKDIR /home/rust

RUN sh -c "$(wget -O- https://raw.githubusercontent.com/shaneturner/zsh-in-docker/master/zsh-in-docker.sh)"

WORKDIR /home/rust/projects

ENTRYPOINT [ "/bin/zsh" ]
