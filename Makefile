APPS := $$(find shiny-apps -mindepth 1 -maxdepth 1 -type d)
HEAD := $$(git rev-parse HEAD)
REGISTRY := 'ghcr.io/joshpencheon'

.PHONY: build
build:
	for app in $(APPS); do \
		docker build \
			-f build/Dockerfile \
			-t $(REGISTRY)/`basename $$app`:$(HEAD) \
			$$app; \
	done

push:
	for app in $(APPS); do \
		docker push $(REGISTRY)/`basename $$app`:$(HEAD); \
	done
