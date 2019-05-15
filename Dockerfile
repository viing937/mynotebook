FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        ca-certificates \
        locales \
        python \
        python-dev \
        python-pip \
        python-setuptools \
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

RUN python3 -m pip --no-cache-dir install \
        ipykernel \
        jupyterlab \
        matplotlib \
        seaborn \
        tqdm \
        numpy \
        scipy \
        scikit-learn \
        pandas \
        tensorflow \
        lightgbm \
        s2sphere \
        requests \
        beautifulsoup4 && \
    python3 -m ipykernel.kernelspec

RUN python2 -m pip --no-cache-dir install \
        ipykernel && \
    python2 -m ipykernel.kernelspec

EXPOSE 8888

WORKDIR /root/shared
CMD jupyter lab \
    --ip='0.0.0.0' \
    --NotebookApp.token='' \
    --allow-root