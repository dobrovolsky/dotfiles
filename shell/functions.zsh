# Automatically list directory contents on `cd` except home.
auto-ls () {
  if [ $HOME != "$(pwd)" ]; then 
	  ll
  fi
}

# Create a new directory and enter it
function mk() {
  mkdir -p "$@" && cd "$@"
}

# Get length of string
function len(){
  string=$@
  echo ${#string}
}

