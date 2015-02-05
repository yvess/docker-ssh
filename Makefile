.PHONY:

default: build_ssh

build_ssh:
	docker build -t yvess/ssh .
