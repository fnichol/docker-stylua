DOCKERFILE_SOURCES := $(shell find . -type f -name 'Dockerfile*'  -o -name 'Dockerfile.*' -not -path './tmp/*' -and -not -path './vendor/*')
CHECK_TOOLS += hadolint

IMAGE := $${IMAGE_NAME:-fnichol/stylua}

include vendor/mk/base.mk
include vendor/mk/shell.mk
include vendor/mk/release.mk

build: ## Builds Docker image
	@echo "--- $@"
	./build.sh $(IMAGE) $(shell cat VERSION.txt) latest
.PHONY: build

clean:
.PHONY: clean

check: check-shell hadolint ## Checks all linting, styling, & other rules
.PHONY: check

hadolint: ## Checks Dockerfiles for linting rules
	@echo "--- $@"
	hadolint $(DOCKERFILE_SOURCES)
.PHONY: hadolint

test:
	@echo "--- $@"
	@if [ -f /.dockerenv ]; then \
		$(MAKE) version; \
	else \
		$(MAKE) build; \
		docker run --rm -ti -v "$$(pwd):/src" -w /src \
			$(IMAGE) sh -c 'apk add make && make test'; \
	fi
.PHONY: test

update-toc: ## Update README.md table of contents
	markdown-toc -i README.md
.PHONY: update-toc

version: ## Prints the version of key tool
	@echo "--- $@"
	@echo "  - StyLua version"
	@stylua --version | sed 's/^/        /'
.PHONY: version
