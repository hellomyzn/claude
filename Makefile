IMAGE_NAME := claude-code
CONTAINER_NAME := claude-code

.PHONY: claude build

claude: build
	docker run -it --rm \
		--name $(CONTAINER_NAME) \
		-e ANTHROPIC_API_KEY=$(ANTHROPIC_API_KEY) \
		-v $(PWD):/workspace \
		-v $(HOME)/.claude:/root/.claude \
		$(IMAGE_NAME)

build:
	docker build -t $(IMAGE_NAME) .
