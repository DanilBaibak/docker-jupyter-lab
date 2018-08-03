FROM python:3.6-slim
LABEL maintainer="Danylo Baibak <danil.baibak@gmail.com>"

# update system
RUN apt-get update && apt-get upgrade -y \
    # install apt packages
    && apt-get install -y sudo vim \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    # setup dev user
    && addgroup --system dev \
    && adduser --system --disabled-password --uid 1000 --shell /bin/bash --home /home/dev dev \
    && adduser dev dev \
    && adduser dev sudo \
    && echo "dev ALL=(ALL)	NOPASSWD: ALL" >> /etc/sudoers

# 'dev' user specific settings
ADD configs/.bashrc /home/dev/.bashrc
ADD configs/.gitconfig /home/dev/.gitconfig
COPY scripts/init_shell_history.sh /home/init_shell_history.sh
RUN echo "source ~/.bashrc" > /home/dev/.profile \
    && mkdir /home/dev/app \
    && chown dev:dev -R /home/dev/ \
    && chmod +x /home/init_shell_history.sh && chown dev:dev /home/init_shell_history.sh

USER dev

ENV PATH /home/dev/.local/bin:$PATH

# install jupyterlab
RUN pip install --user --upgrade pip setuptools wheel \
    && pip install --user --no-cache-dir jupyter -U \
    && pip install --user --no-cache-dir jupyterlab \
    && pip install --user --no-cache-dir jupyter_contrib_nbextensions \
    # setup juptyer
    && jupyter contrib nbextension install --user \
    && jupyter nbextension enable codefolding/main \
    && echo "c.NotebookApp.ip = '*'" >> /home/dev/.jupyter/jupyter_notebook_config.py \
    && echo "c.NotebookApp.port = 8888" >> /home/dev/.jupyter/jupyter_notebook_config.py \
    && echo "c.NotebookApp.token = ''" >> /home/dev/.jupyter/jupyter_notebook_config.py

WORKDIR /home/dev/app
EXPOSE 8888
CMD ["jupyter", "lab", "--no-browser", "--allow-root"]
