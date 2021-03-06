SHELL=/bin/bash

args = `arg="$(filter-out $@,$(MAKECMDGOALS))" && echo $${arg:-${1}}`

%:
	@:

pull:
	@docker pull dbaibak/jupyter-lab:latest

run:
	@docker run -it -d -v $(local):/home/dev/app -p 127.0.0.1:8888:8888 --name $(name) dbaibak/jupyter-lab
	@open http://127.0.0.1:8888/

start:
	@docker start $(call args, defaultstring)
	@open http://127.0.0.1:8888/

stop:
	@docker stop $(call args, defaultstring)

stop_all:
	@docker ps -q | xargs docker stop

remove:
	@docker rm -f $(call args, defaultstring)

bash:
	@docker exec -it --user dev $(call args, defaultstring) bash
