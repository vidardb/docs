# VidarDB Documentation

## Requirement

- Only tested with Python3.7

## Environment Setup

- Install all the packages listed in `requirements.txt`:

```sh
pip3 install -r requirements.txt
```

- Install `mkdocs-rtd-dropdown` from my forked repo:

```sh
git clone https://github.com/xingweitian/mkdocs-rtd-dropdown.git

cd mkdocs-rtd-dropdown

python3 setup.py install
```

## Naming rule

We need to be careful that there is a special naming rule using this theme:
the name of a markdown file should be consistent with the heading of that file.

For example:

We create a markdown file `quick_start_with_docker.md` under `docs/`.
Then in that file, the first line should be (case insensitive):

```markdown
# Quick Start with Docker
```

## Deploy

When you want to generate the new documentations on github page, try the following command in the root folder of this project:

```sh
mkdocs gh-deploy
```
