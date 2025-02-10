#!/bin/bash

podman run -it --gpus all -p 5003:5003 --entrypoint python3 xtts_gradio /root/tts/TTS/demos/xtts_ft_demo/xtts_demo.py