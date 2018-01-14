FROM := nginx:alpine
IMAGE := lazyfrosch/jekyll-hook

.PHONY: dep

build: dep
	docker build --rm -t $(IMAGE) .

all: build push

dep:
	docker pull $(FROM)

push:
	docker push $(IMAGE)
