notify () {
  echo "-----> protected-site-buildpack: $@"
}

read_env () {
  name=$1

  if [[ -f $ENV_DIR/$name ]]; then
    export "$name=$(cat $ENV_DIR/$name)"
  fi
}

export_env_dir() {
  whitelist_regex=${1:-''}
  blacklist_regex=${2:-'^(PATH|GIT_DIR|CPATH|CPPATH|LD_PRELOAD|LIBRARY_PATH)$'}

  if [ -d "$ENV_DIR" ]; then
    for e in $(ls $ENV_DIR); do
      echo "$e" | grep -E "$whitelist_regex" | grep -qvE "$blacklist_regex" &&
        export "$e=$(cat $ENV_DIR/$e)"
    done
  fi
}
