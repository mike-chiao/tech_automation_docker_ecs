PROJECT=techautomation
GROUP=techautomation
REGISTRY=rego

build-base:
	@echo "$(INFO) Preparing Docker build env image"
	@git rev-parse --short HEAD > .git-tag
	@docker build -t iag/$(PROJECT)-base .


docker-login:
	@docker login --username "$(bamboo_DOCKER_USERNAME)" --password "$(bamboo_DOCKER_PASSWORD)" $(REGISTRY)


publish-base: docker-login build-base
		@docker tag iag/$(PROJECT)-base $(REGISTRY)/$(GROUP)/$(PROJECT)-base
		@docker push $(REGISTRY)/$(GROUP)/$(PROJECT)-base
