time cabal build --ghcjs --ghcjs-options="-j -O0"
echo "$(tput setaf 2)>>> Waiting for changes in ./src/*$(tput sgr0)"
inotifywait -q -m -e close_write $(find src -type f) |
  while read -r; do
    clear
    time cabal build --ghcjs --ghcjs-options="-j -O0" &&
      echo "$(tput setaf 2)>>> Waiting for changes in ./src/*$(tput sgr0)"
  done
