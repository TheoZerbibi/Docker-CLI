################################################################################
#                                   CONFIG                                     #
################################################################################

ifndef VERBOSE
	MAKEFLAGS += --no-print-directory --silent
endif

PROJECT_NAME		:=	Inception

################################################################################
#                                  SOURCES                                     #
################################################################################
SOURCES_FOLDER	:=	./srcs/
BUILD_FOLDER	:=  ./build/

SOURCES			:= $(shell find ${SOURCES_FOLDER} -name "*.ts")

DOCKER			:= $(shell command -v docker 2> /dev/null)
################################################################################
#                                 COLORS                                       #
################################################################################

NO_COLOR 		:=	\033[38;5;15m
OK_COLOR		:=	\033[38;5;2m
ERROR_COLOR		:=	\033[38;5;1m
WARN_COLOR		:=	\033[38;5;3m
SILENT_COLOR	:=	\033[38;5;245m
INFO_COLOR		:=	\033[38;5;140m
OBJ_COLOR		:=	\033[0;36m

################################################################################
#                                 RULES                                        #
################################################################################

all: header up

up: header build
	node build/main.js

build:
ifndef DOCKER
	pnpm build && pnpm start:prod
endif
	docker build -f ./docker/Dockerfile -t docker-cli ./
	docker run -it --name tmp docker-cli
	docker cp tmp:/app/build ./
	docker cp tmp:/app/node_modules ./
	docker rm tmp

dev: header
	docker build -f ./docker/Dockerfile -t docker-cli .
	docker run -d --name dev_container -v "./:/app" docker-cli tail -f /dev/null
	docker exec -it dev_container sh

fclean:
	docker system prune -af


re: fclean all

.PHONY: all up build dev fclean re

-include ./Templates/header.mk
