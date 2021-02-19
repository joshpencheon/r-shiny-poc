APPS := $$(find shiny-apps -type d -depth 1)
HEAD := $$(git rev-parse HEAD)

.PHONY: build
build:
	for app in $(APPS); do \
		docker build \
			-f build/Dockerfile \
			-t custom-registry.test/`basename $$app`:$(HEAD) \
			$$app; \
	done
