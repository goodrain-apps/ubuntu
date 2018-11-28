all: build

build:
	@docker build -t rainbond/baseimage:ubuntu1604 .

base:
	@docker pull ubuntu:16.04

rebuild: base
	@docker build -t goodrainapps/ubuntu:latest .

release: rebuild
	@docker build -t goodrainapps/ubuntu:16.04.$(shell date +%Y%m%d) .
