# Publishing Guide

This guide explains how to publish Python Code Guardian MCP to various platforms.

## 📦 Publishing to PyPI

### Prerequisites

1. Create accounts on:
   - [PyPI](https://pypi.org/) - Production
   - [TestPyPI](https://test.pypi.org/) - Testing

2. Get API tokens:
   - Go to Account Settings → API tokens
   - Create a new token for this project

### Steps

1. **Test Build Locally**
   ```bash
   make build
   # or
   python -m build
   ```

2. **Test on TestPyPI First**
   ```bash
   twine upload --repository testpypi dist/*
   # Test installation
   pip install --index-url https://test.pypi.org/simple/ python-code-guardian-mcp
   ```

3. **Publish to PyPI**
   ```bash
   make publish
   # or
   twine upload dist/*
   ```

4. **Create GitHub Release**
   - Go to GitHub Releases
   - Create a new release with tag (e.g., v0.1.0)
   - Auto-publish workflow will trigger

## 🌐 Publishing to mcpservers.org

To list your MCP server on [mcpservers.org](https://mcpservers.org):

### 1. Prepare Repository

Ensure your GitHub repository has:
- ✅ Clear README.md with usage instructions
- ✅ LICENSE file (MIT recommended)
- ✅ Examples directory with configurations
- ✅ Proper pyproject.toml with metadata

### 2. Create MCP Server Manifest

Create a file `mcp-server.json` in your repository root:

```json
{
  "name": "python-code-guardian",
  "displayName": "Python Code Guardian",
  "description": "Comprehensive code quality checks for Python projects including linting, complexity, typos, structure, and test coverage",
  "version": "0.1.0",
  "author": "Priyanshi Jajoo",
  "license": "MIT",
  "repository": "https://github.com/priyanshi9692/py-sage-mcp",
  "homepage": "https://github.com/priyanshi9692/py-sage-mcp",
  "categories": [
    "code-quality",
    "linting",
    "testing",
    "python"
  ],
  "installation": {
    "pip": "python-code-guardian-mcp"
  },
  "configuration": {
    "command": "python",
    "args": ["-m", "python_code_guardian.server"]
  },
  "tools": [
    {
      "name": "check_code",
      "description": "Run comprehensive code quality checks"
    },
    {
      "name": "get_report",
      "description": "Get detailed or summary report"
    },
    {
      "name": "validate_pr",
      "description": "Validate pull request changes"
    },
    {
      "name": "configure_rules",
      "description": "Update configuration rules"
    },
    {
      "name": "fix_issues",
      "description": "Auto-fix detected issues"
    }
  ],
  "features": [
    "Pylint integration",
    "Complexity analysis",
    "Typo detection",
    "Structure validation",
    "Test coverage tracking",
    "Duplicate code detection",
    "Custom rules support",
    "Pre-commit hooks",
    "PR validation"
  ]
}
```

### 3. Submit to MCP Servers Registry

1. **Fork the MCP Servers Repository**
   ```bash
   git clone https://github.com/modelcontextprotocol/servers.git
   cd servers
   ```

2. **Add Your Server**
   - Create a directory: `src/servers/python-code-guardian/`
   - Add README.md with:
     - Description
     - Installation instructions
     - Usage examples
     - Configuration options

3. **Submit Pull Request**
   - Follow the registry's contribution guidelines
   - Include `mcp-server.json` in your PR description
   - Reference your GitHub repository

### 4. Example Submission PR Description

```markdown
# Add Python Code Guardian MCP Server

## Description
Python Code Guardian is a comprehensive MCP server for Python code quality checks.

## Features
- Linting with Pylint
- Code complexity analysis
- Typo detection
- Structure validation
- Test coverage (75% threshold)
- Duplicate code detection

## Installation
```bash
pip install python-code-guardian-mcp
```

## Configuration
```json
{
  "mcpServers": {
    "python-code-guardian": {
      "command": "python",
      "args": ["-m", "python_code_guardian.server"]
    }
  }
}
```

## Repository
https://github.com/priyanshi9692/py-sage-mcp

## License
MIT
```

## 📢 Promoting Your MCP Server

### Social Media

Share on:
- Twitter/X with #MCP #Python #CodeQuality
- LinkedIn with detailed post
- Dev.to or Medium article
- Reddit (r/Python, r/programming)

### Community

- Announce in MCP Discord/Slack
- Share in Python communities
- Write blog post about the project
- Create demo video/GIF

### Documentation Sites

- Submit to Awesome MCP list
- Add to Python Package Index showcase
- List on GitHub Topics: mcp, code-quality, python

## 🔄 Updating Published Versions

### Version Bumping

1. Update version in `pyproject.toml`
2. Update `__version__` in `src/python_code_guardian/__init__.py`
3. Update CHANGELOG.md
4. Commit changes
5. Create Git tag: `git tag v0.2.0`
6. Push with tags: `git push --tags`
7. Create GitHub Release
8. Auto-publish to PyPI via workflow

### Update mcpservers.org Listing

After new release:
1. Update mcp-server.json version
2. Submit PR to update your listing
3. Announce new features

## 📊 Monitoring

Track your server's usage:
- PyPI download stats
- GitHub stars and forks
- Issue/PR activity
- Community feedback

## 🆘 Support

For publishing help:
- MCP Community: [Discord/Forums]
- PyPI Support: packaging-problems@python.org
- GitHub Issues: Community support

---

Good luck with your launch! 🚀

