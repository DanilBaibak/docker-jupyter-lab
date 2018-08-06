# JupyterLab for data scientists and researchers

## Features
* Lightweight docker image with [JupyterLab](https://jupyterlab.readthedocs.io/en/stable/), [Python 3.6](https://docs.python.org/3.6/);
* Well organised bash environment (bash history, non root user, etc.);
* *Makefile* for fast and easy everyday using;

## Docker instalation
Please follow [installation instructions](https://docs.docker.com/install/) from the official site.

## Using
Prebuilt image is available from the [docker hub](https://hub.docker.com/r/dbaibak/jupyter-lab/)

### With makefile:
* **make pull** - pull latest image;
* **make build local=*__path_to_the_project_folder__* name=*__name_of_the_container__*** - build a new container and mount local project folder;
* **make start *__name_of_the_container__*** - start specific container
* **make stop *__name_of_the_container__*** - stop specific container
* **make stop_all** - stop all containers
* **make remove *__name_of_the_container__*** - remove specific container
* **make bash *__name_of_the_container__*** - run bash for specific container
