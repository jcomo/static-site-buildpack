notify () {
  echo "-----> protected-site-buildpack: $@"
}

read_env () {
  name=$1

  if [[ -f $ENV_DIR/$name ]]; then
    export "$name=$(cat $ENV_DIR/$name)"
  fi
}
