# XTTS with Gradio for AI Training

This repository copies most of the files from [Coqui-TTS](https://github.com/coqui-ai/TTS), with some changes that allows the creation of a container with correct dependencies that allows AI voicetraining with a Web UI.

Some of the changes include:

- The `Dockerfile`;
- A file with frozen pip dependencies: `requirements.frozen.txt`;
- `./TTS/demos/xtts_ft_demo/xtts_demo.py` does not create a public link and disables analytics;
- `./TTS/demos/xtts_ft_demo/utils/formatter.py` set to use Whisper's `large-v3` model.


## Creating the Container

Install [Docker](https://www.docker.com/) or [Podman](https://podman.io/). Then run:

### With Podman


```
podman build . -t xtts_gradio
```


### With docker

```
docker build . -t xtts_gradio
```

## Running the container

If you are using Podman, simply run:

```
./run.sh
```

If you are using docker, modify this file so it uses `docker` instead of `podman`.

This commands runs the image with an entrypoint that initializes the Web UI. It will be served on port `5003` on your localhost:

![](gradio_example.png)

## License

Since this repo's purpose is the creation of a working Web UI from the original repo, it will follow MPL-2.0, the same as in [Coqui-TTS](https://github.com/coqui-ai/TTS). For legal questions about the use of this tool, the user must refer to Coqui's page.