#!/usr/bin/env sh
set -eu

main() {
  # If the first argument is a flag or option, then invoke program
  if [ "$#" -eq 0 ] || [ "${1#-}" != "$1" ]; then
    exec /usr/local/bin/stylua "$@"
  else
    exec "$@"
  fi
}

main "$@"
