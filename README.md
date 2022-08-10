# pre-commit-golang

Golang pre-commit hooks for http://pre-commit.com/

## install

you need first to install [pre-commit](https://pre-commit.com/#install)

```
brew install pre-commit
```

install pre-commit into your git repo

```
pre-commit install
```

## Usage

Add a file named `.pre-commit-config.yaml` into the root directory of your repository

```yaml
repos:
  - repo: https://github.com/Bahjat/pre-commit-golang
    rev: v1.0.2
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
      - id: go-ruleguard # requires
        args: [--rules=rules/rules.go] # required https://github.com/quasilyte/go-ruleguard
```

## Contributing

- Fork it
- Create your feature branch `git checkout -b my-new-feature`
- Commit your changes `git commit -am 'Add some feature'`
- Push to the branch `git push origin my-new-feature`
- Create new Pull Request

## Credits

This repo is inspired by [dnephin/pre-commit-golang](https://github.com/dnephin/pre-commit-golang)

## Finally

If you like this hooks please give a star
