# JupyterLab for data scientists and researchers

## Features
* Lightweight docker image with [JupyterLab](https://jupyterlab.readthedocs.io/en/stable/), [Python 3.6](https://docs.python.org/3.6/);
* Well organised bash environment (bash history, non root user, etc.);
* *Makefile* for fast and easy everyday using;

## Docker instalation
Please follow [installation instructions](https://docs.docker.com/install/) from the official site.

## Using
Prebuilt image is available from the [docker hub](https://hub.docker.com/r/dbaibak/jupyter-lab/)

### [With makefile](#using-with-makefile):
* `make pull` - pull latest image;
* `make build local=path_to_the_project_folder name=name_of_the_container` - build a new container and mount local project folder. The container is available by the url http://127.0.0.1:8888/;
* `make start name_of_the_container` - start specific container
* `make stop name_of_the_container` - stop specific container
* `make stop_all` - stop all containers
* `make remove name_of_the_container` - remove specific container
* `make bash name_of_the_container` - run bash for specific container

## Examples

### [Workflow](#workflow)
* `make pull` - pull image from the docker hub;
* `make build local=$PWD name=my-lab` - create container with name *my-lab* and mount it to the *current directory*;
* got to the url http://127.0.0.1:8888/ - use JupyterLab;
* `make bash my-lab` - if you need access to the bash;
* `pip install --user matplotlib` - install new package;
* `make stop my-lab` - stop container;
* `make start my-lab` - start container;

### Build container with specific enviroment
[Dockerfile](https://github.com/DanilBaibak/docker-jupyter-lab/blob/master/examples/ml_env/Dockerfile) that installs a list of the specific requirements. Can be useful if you are using few containers with the same list of the libraries.
