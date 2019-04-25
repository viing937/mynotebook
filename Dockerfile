FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    ca-certificates \
    python3 \
    python3-dev
RUN apt-get clean autoclean
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3 get-pip.py
RUN rm get-pip.py

RUN pip3 --no-cache-dir install \
    ipykernel \
    jupyter \
    matplotlib \
    numpy \
    scipy \
    sklearn \
    pandas \
    Pillow \
    tensorflow
RUN python3 -m ipykernel.kernelspec

# TensorBoard
EXPOSE 6006

# IPython
EXPOSE 8888

WORKDIR /root/shared
CMD jupyter notebook \
    --ip='0.0.0.0' \
    --NotebookApp.token='' \
    --allow-root