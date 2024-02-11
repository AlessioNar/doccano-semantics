#!/usr/bin/env bash

set -o errexit
set -o nounset

mkdir -p backend/client

# Build frontend
cd frontend
export PUBLIC_PATH="/static/_nuxt/"

git config --global url."https://github".insteadOf ssh://git@github
git config --global url."https://github.com/".insteadOf git@github.com:

yarn install
yarn build
cp -r dist ../backend/client/

# Install backend dependencies and collect static files
cd ../backend
poetry install
poetry run task collectstatic

# Build Python package
cd ..
sed -e "s/, from = \"..\"//g" backend/pyproject.toml > pyproject.toml
poetry build
rm pyproject.toml
