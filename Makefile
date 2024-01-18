VERSION = $(shell git rev-parse --short HEAD)

.PHONY: default
default: help

# generate help info from comments: thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help: ## help information about make commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build: ## build the bot's Docker image
	docker image build --tag eaglerock/marks.dev:${VERSION} .

.PHONY: push
push: ## push the version to Docker hub
	docker image tag eaglerock/marks.dev:${VERSION} eaglerock/marks.dev:latest
	docker image push eaglerock/marks.dev:${VERSION}
	docker image push eaglerock/marks.dev:latest
