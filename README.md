# helm-docker

[![Docker Pulls](https://img.shields.io/docker/pulls/mtizima/ycli-helm.svg?style=flat-square)](https://hub.docker.com/r/mtizima/ycli-helm/)

## Usage

This Docker image includes `helm` along with:

- `yc` - [CLI Yandex.Cloud](https://cloud.yandex.ru/docs/cli/) 
- `kubectl`
- `envsubst`
- `jq`

And `helm` plugins:

- `viglesiasce/helm-gcs.git`
- `databus23/helm-diff`
- `helm/helm-2to3`

## Docker

Docker images are automatically build on [Docker
Hub](https://hub.docker.com/r/mtizima/ycli-helm/):

### Building

For local build:

```bash
docker build -t mtizima/ycli-helm .
```
