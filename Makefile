APPS := $$(find shiny-apps -mindepth 1 -maxdepth 1 -type d)
HEAD := $$(git rev-parse HEAD)

.PHONY: build
build:
	for app in $(APPS); do \
		docker build \
			-f build/Dockerfile \
			-t custom-registry.test/`basename $$app`:$(HEAD) \
			$$app; \
	done
