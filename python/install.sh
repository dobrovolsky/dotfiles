PYTHON_VERSION=3.8.2

pyenv install "${PYTHON_VERSION}"
pyenv global "${PYTHON_VERSION}"
~/.pyenv/versions/"${PYTHON_VERSION}"/bin/pip install -r ~/dotfiles/python/requirments.txt

# setup virtualenvs in project for poetry
~/.pyenv/shims/poetry config settings.virtualenvs.in-project true
