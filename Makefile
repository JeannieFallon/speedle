PROJ=speedle
PORT=8080

PY_FILES=`find . -name '*.py'`

.PHONY: image # Build Docker development image
image:
	scripts/image.sh $(PROJ)

.PHONY: shell # Run shell into dev container with port exposed
shell:
	scripts/shell.sh $(PROJ) $(PORT)

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
