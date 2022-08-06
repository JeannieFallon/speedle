PROJ=speedle
HOST=0.0.0.0
REL_PORT=5555
DEV_PORT=5050

PY_FILES=`find . -name '*.py'`

### REL container used to deploy & run app ###

.PHONY: speedle # Build image & run Speedle release container
speedle:
	scripts/speedle.sh $(PROJ) $(REL_PORT)

### DEV container used to format & test ###

.PHONY: dev # Build image & open shell into development container
dev:
	scripts/dev.sh  $(PROJ) $(DEV_PORT)

### For use inside DEV container ###

.PHONY: format # Run Black Python code formatter
format:
	black $(PY_FILES)

.PHONY: test # Run unit tests
test:
	python -m pytest -vv

.PHONY: coverage # Run unit tests, and check test coverage
coverage:
	python -m coverage run -m pytest -vv; coverage report

.PHONY: run # Run Speedle in DEBUG mode for development
run:
	scripts/run.sh $(HOST) $(DEV_PORT)

### Helper targets ####

.PHONY: clean # Remove all build content
clean:
	rm -rf bin build

.PHONY: help # List all available make targets
help:
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1	\2/'
