PROJ=speedle
PY_FILES=`find . -name '*.py'`

.PHONY: image # Build Docker development image
image:
	scripts/image.sh $(PROJ)

.PHONY: shell # Run shell into Docker development container
shell:
	scripts/shell.sh $(PROJ)

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
