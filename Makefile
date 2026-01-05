.PHONY: install test lint clean build publish

# Install the package and dependencies
install:
	pip install -e ".[dev]"

# Run tests
test:
	pytest tests/ -v --cov=python_code_guardian --cov-report=term-missing

# Run tests with coverage report
test-cov:
	pytest tests/ -v --cov=python_code_guardian --cov-report=html --cov-report=term-missing
	@echo "Coverage report generated in htmlcov/index.html"

# Run linting
lint:
	pylint src/python_code_guardian --max-line-length=100

# Format code
format:
	black src/python_code_guardian tests/

# Check formatting
check-format:
	black --check src/python_code_guardian tests/

# Run pre-commit hooks
pre-commit:
	pre-commit run --all-files

# Clean build artifacts
clean:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	rm -rf .pytest_cache
	rm -rf .coverage
	rm -rf htmlcov/
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete

# Build package
build: clean
	python -m build

# Publish to PyPI (requires TWINE_USERNAME and TWINE_PASSWORD)
publish: build
	twine upload dist/*

# Publish to Test PyPI
publish-test: build
	twine upload --repository testpypi dist/*

# Install from local build
install-local: build
	pip install dist/*.whl

# Run all checks (lint + test)
check: lint test

# Setup development environment
dev-setup:
	pip install -e ".[dev]"
	pre-commit install

# Show help
help:
	@echo "Python Code Guardian MCP - Makefile Commands"
	@echo ""
	@echo "install        - Install package and dependencies"
	@echo "test           - Run tests"
	@echo "test-cov       - Run tests with HTML coverage report"
	@echo "lint           - Run linting checks"
	@echo "format         - Format code with black"
	@echo "check-format   - Check code formatting"
	@echo "pre-commit     - Run pre-commit hooks"
	@echo "clean          - Remove build artifacts"
	@echo "build          - Build package"
	@echo "publish        - Publish to PyPI"
	@echo "publish-test   - Publish to Test PyPI"
	@echo "check          - Run lint and test"
	@echo "dev-setup      - Setup development environment"
	@echo "help           - Show this help message"

