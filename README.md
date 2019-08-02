# pre-commit-golang
Golang pre-commit hooks for http://pre-commit.com/
## install
- you need first to install (pre-commit) [https://pre-commit.com/#install]
- Add this .pre-commit-config.yaml into the root directory of your repository 
```yaml
repos:
  - repo: git://github.com/Bahjat/pre-commit-golang
    rev: master
    hooks:
      - id: go-fmt-import
      - id: go-vet
      - id: go-lint
      - id: go-unit-tests
``` 