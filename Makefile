PROJ=speedle
PORT=8080
DEV=dev

PY_FILES=`find . -name '*.py'`

### REL container used to deploy app ###

.PHONY: speedle # Build & run Speedle Docker container on exposed port
speedle:
	scripts/speedle.sh $(PROJ) $(PORT)

### DEV container used to format & test ###

.PHONY: dev # Build Docker development image
dev:
	scripts/dev.sh  $(PROJ)_$(DEV)

.PHONY: shell # Run shell into dev container with port exposed
shell:
	scripts/shell.sh $(PROJ)_$(DEV) $(PORT)

### For use inside DEV container ###

.PHONY: format # Run Black Python code formatter
format:
	black $(PY_FILES)

.PHONY: test # Run unit tests
test:
	python -m pytest -vv

.PHONY: clean # Remove all build content
clean:
	rm -rf bin build

.PHONY: help # List all available make targets
help:
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1	\2/'
