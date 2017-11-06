PROJECT=tech_automation_docker_ecs
REGISTRY=452161641512.dkr.ecr.ap-southeast-2.amazonaws.com

help: ## help target
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / \
		{printf "\033[36m%-30s\033[0m  %s\n", $$1, $$2}' $(MAKEFILE_LIST)

docker-login: ## Login
	@$(aws ecr get-login --no-include-email --region ap-southeast-2)

docker-build: ## Build
	@docker build -t $(PROJECT) .

docker-tag: ## Tag
	@docker tag $(PROJECT):latest $(REGISTRY)/$(PROJECT):latest

docker-push: docker-login ## Publish docker image
	@docker push $(REGISTRY)/$(PROJECT):latest

docker-pull: docker-login ## Pull docker image
	@docker pull $(REGISTRY)/$(PROJECT):latest
