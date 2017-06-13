all: build

build:
	@docker build -t goodrainapps/ubuntu:latest .

base:
	@docker pull ubuntu:14.04

rebuild: base
	@docker build -t goodrainapps/ubuntu:latest .

release: rebuild
	@docker build -t goodrainapps/ubuntu:14.04.$(shell date +%Y%m%d) .
