PYTHON_VERSION=3.8.5

pyenv install "${PYTHON_VERSION}"
pyenv global "${PYTHON_VERSION}"
~/.pyenv/versions/"${PYTHON_VERSION}"/bin/pip install -r ~/.dotfiles/python/requirments.txt
pyenv rehash

# setup virtualenvs in project for poetry
~/.pyenv/shims/poetry config virtualenvs.in-project true

# add completions
~/.pyenv/shims/poetry completions zsh > ~/.dotfiles/python/_poetry	
