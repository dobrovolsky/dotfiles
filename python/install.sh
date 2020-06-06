PYTHON_VERSION=3.8.2

pyenv install "${PYTHON_VERSION}"
pyenv global "${PYTHON_VERSION}"
~/.pyenv/versions/"${PYTHON_VERSION}"/bin/pip install -r ~/.config/dotfiles/python/requirments.txt

# setup virtualenvs in project for poetry
~/.pyenv/shims/poetry config virtualenvs.in-project true

# add completions
~/.pyenv/shims/poetry completions zsh > ~/.config/dotfiles/python/_poetry	
