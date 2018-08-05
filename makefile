SHELL=/bin/bash

args = `arg="$(filter-out $@,$(MAKECMDGOALS))" && echo $${arg:-${1}}`

%:
	@:

pull:
	@docker pull dbaibak/jupyter-lab:latest

build:
	@docker run -it -d -v $(local):/home/dev/app -p 127.0.0.1:8888:8888 --name $(name) dbaibak/jupyter-lab

start:
	@docker start $(call args, defaultstring)

stop:
	@docker stop $(call args, defaultstring)

stop_all:
	@docker ps -q | xargs docker stop

remove:
	@docker rm -f $(call args, defaultstring)

bash:
	@docker exec -it --user dev $(call args, defaultstring) bash