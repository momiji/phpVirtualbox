# vim:set sw=8 ts=8 noet:

REPOSITORY      ?= mydocker-hosted.osmose.socgen
NAME            ?= osmose/phpvirtualbox
TAG             ?= latest
IMAGE           = ${NAME}:${TAG}

ifeq ($(TAG),latest)
FINAL           = ${IMAGE}
else
FINAL           = ${REPOSITORY}/${IMAGE}
endif

image: phpvirtualbox.zip
	docker build --network host -t $(FINAL) -f Dockerfile . --build-arg HTTPS_PROXY --build-arg HTTP_PROXY

run:
	docker run --network host --rm -it $(FINAL)

phpvirtualbox.zip:
	wget https://github.com/phpvirtualbox/phpvirtualbox/archive/develop.zip -O phpvirtualbox.zip
