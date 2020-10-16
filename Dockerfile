FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get -y upgrade \
    && apt install -y build-essential libboost-all-dev llvm-dev liblld-10-dev \
    && apt install -y curl wget git vim pkg-config libssl-dev
RUN wget https://www.secondstate.io/download/ssvm-0.6.9.tar.gz \
    && tar -xzf ssvm-0.6.9.tar.gz
RUN wget https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-gpu-linux-x86_64-1.15.0.tar.gz \
    && tar -C /usr/ -xzf libtensorflow-gpu-linux-x86_64-1.15.0.tar.gz
RUN wget https://www.secondstate.io/download/commands-0.1.0.tar.gz \
    && tar -C /usr/local/bin/ -xzf commands-0.1.0.tar.gz

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog
