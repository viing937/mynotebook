FROM ubuntu:18.04

RUN apt-get update; \
    apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        ca-certificates \
        python \
        python-dev \
        python-pip \
        python-setuptools \
        python3 \
        python3-dev \
        python3-pip \
        python3-setuptools; \
    apt-get clean autoclean; \
    apt-get autoremove -y; \
    rm -rf /var/lib/apt/lists/*

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
        beautifulsoup4; \
    python3 -m ipykernel.kernelspec

RUN python2 -m pip --no-cache-dir install \
        ipykernel; \
    python2 -m ipykernel.kernelspec

EXPOSE 8888

WORKDIR /root/shared
CMD jupyter lab \
    --ip='0.0.0.0' \
    --NotebookApp.token='' \
    --allow-root