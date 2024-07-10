# Justfile for FastAPI Project

# Install project dependencies using Poetry
style:
    black .
    isort .
    flake8

install:
	pip install -U pip
	pip install -r requirements.txt
	pip install -e .


# Run the FastAPI development server
run:
    uvicorn main:app --reload

# Run tests using Poetry and pytest
test:
    pytest

# Clean up generated files
clean:
	rm -rf `find . -name __pycache__`
	rm -f `find . -type f -name '*.py[co]' `
	rm -f `find . -type f -name '*~' `
	rm -f `find . -type f -name '.*~' `
	rm -rf .cache
	rm -rf .pytest_cache
	rm -rf htmlcov
	rm -rf *.egg-info
	rm -f .coverage
	rm -f .coverage.*
	rm -rf build

# Run the development environment (install, run, and watch for changes)
dev:
    just install
    just run