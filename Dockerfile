FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    build-essential \
    ca-certificates \
    locales \
    python3 \
    python3-dev \
    python3-pip \
    python3-setuptools && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

RUN python3 -m pip --no-cache-dir install --upgrade pip setuptools

COPY requirements.txt /tmp/requirements.txt

RUN python3 -m pip --no-cache-dir install -r /tmp/requirements.txt && \
    python3 -m ipykernel.kernelspec

EXPOSE 8888

WORKDIR /root/shared
CMD python3 -m jupyter lab \
    --ip='0.0.0.0' \
    --NotebookApp.token='' \
    --allow-root
