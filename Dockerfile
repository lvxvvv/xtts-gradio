ARG BASE=nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04
FROM ${BASE}

RUN apt-get update && apt-get upgrade -y &&  apt install git git-lfs python3 python3-pip coreutils vim -y
RUN git lfs install

WORKDIR /root/tts

COPY . .

RUN pip install --no-cache-dir -r requirements.frozen.txt
RUN pip install --no-cache-dir -e .[all,dev,notebooks]
RUN make system-deps && make install

RUN apt autoremove -y && apt clean && rm -rf /var/lib/apt/lists

EXPOSE 5003

RUN rm -rf /tmp/xtts_ft/run/training/XTTS_v2.0_original_model_files
RUN git clone https://huggingface.co/coqui/XTTS-v2 /tmp/xtts_ft/run/training/XTTS_v2.0_original_model_files