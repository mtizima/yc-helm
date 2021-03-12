# CLI Yandex.Cloud Helm Docker

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

## GitHub Packages

You can use github packages:

- Pull image from the command line: `docker pull docker.pkg.github.com/mtizima/yc-helm/ycli-helm:<version>`
- Use as base image in DockerFile: `FROM docker.pkg.github.com/mtizima/yc-helm/ycli-helm:<version>`

### Building

For local build:

```bash
docker build -t mtizima/ycli-helm .
```
