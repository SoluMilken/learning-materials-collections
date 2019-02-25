.DEFAULT_GOAL := all

.PHONY: install
install:
	pip install -r requirements.txt

.PHONY: lint
lint:
	flake8

.PHONY: test
test:
	pytest --cov-report=term-missing --cov=uttut/ --cov-fail-under=80

.PHONY: all
all: 
	lint
	test

.PHONY: clean
clean:
	rm -rf `find . -name __pycache__`
	rm -f `find . -type f -name '*.py[co]' `
	rm -f `find . -type f -name '*~' `
	rm -f `find . -type f -name '.*~' `
	rm -f `find uttut -name *.so`
	rm -rf .cache
	rm -rf htmlcov
	rm -rf *.egg-info
	rm -f .coverage
	rm -f .coverage.*
	rm -rf build
