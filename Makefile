PROJ=speedle
HOST=0.0.0.0
PORT=5555
DEV=dev

PY_FILES=`find . -name '*.py'`

### REL container used to deploy & run app ###

.PHONY: speedle # Build image & run Speedle container on exposed port
speedle:
	scripts/speedle.sh $(PROJ) $(PORT)

### DEV container used to format & test ###

.PHONY: dev # Build image & open shell into development container
dev:
	scripts/dev.sh  $(PROJ)_$(DEV) $(PORT)

### For use inside DEV container ###

.PHONY: format # Run Black Python code formatter
format:
	black $(PY_FILES)

.PHONY: test # Run unit tests
test:
	python -m pytest -vv

.PHONY: run # Run Speedle in DEBUG
run:
	scripts/run.sh $(HOST) $(PORT)

### Helper targets ####

.PHONY: clean # Remove all build content
clean:
	rm -rf bin build

.PHONY: help # List all available make targets
help:
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1	\2/'
