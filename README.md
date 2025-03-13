# pre-commit-golang

Golang pre-commit hooks for [pre-commit.com](http://pre-commit.com/)

## Installation

You first need to install [pre-commit](https://pre-commit.com/#install):

```bash
brew install pre-commit
```

Then install pre-commit in your Git repository:

```bash
pre-commit install
```

## Usage

Add a file named `.pre-commit-config.yaml` to the root directory of your repository:

```yaml
repos:
  - repo: https://github.com/Bahjat/pre-commit-golang
    rev: v1.0.5
    hooks:
      - id: go-fmt-import
      - id: go-vet
      - id: go-lint
      - id: go-unit-tests
      - id: gofumpt # requires github.com/mvdan/gofumpt
      - id: go-err-check # requires github.com/kisielk/errcheck
      - id: go-static-check # install https://staticcheck.io/docs/
      - id: golangci-lint # requires github.com/golangci/golangci-lint
        args: [--config=.github/linters/.golangci.yml] # optional
      - id: go-ruleguard # requires https://github.com/quasilyte/go-ruleguard
        args: [rules/rules.go]
      - id: go-imports-reviser # requires https://github.com/incu6us/goimports-reviser
```

## Contributing

- Fork it
- Create your feature branch: `git checkout -b my-new-feature`
- Commit your changes: `git commit -am 'Add some feature'`
- Push to the branch: `git push origin my-new-feature`
- Create a new Pull Request

## Credits

This repository is inspired by [dnephin/pre-commit-golang](https://github.com/dnephin/pre-commit-golang).

## Finally

If you like these hooks, please give this repository a star!
