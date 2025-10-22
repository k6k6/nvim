#!/bin/bash
config_path=$XDG_CONFIG_HOME
neovim='                                                                      
        ████ ██████           █████      ██                     
       ███████████             █████                             
       █████████ ███████████████████ ███   ███████████   
      █████████  ███    █████████████ █████ ██████████████   
     █████████ ██████████ █████████ █████ █████ ████ █████   
   ███████████ ███    ███ █████████ █████ █████ ████ █████  
  ██████  █████████████████████ ████ █████ █████ ████ ██████ '
file="${config_path}/nvim/lua/utils/seed.txt"
[ -f "$file" ] || {
  echo "1" >"$file"
}
seed=$(cat "$file")
move_curosr_top() {
  printf "\033[H"
}
sava_seed() {
  tmp=$(mktemp)
  printf '%d' "$seed" >"$tmp"
  mv "$tmp" "$file"
}
trap sava_seed EXIT
while true; do
  move_curosr_top
  if [ -z "$seed" ]; then
    seed=1
  fi
  echo "$neovim" | dotacat -S "$seed" -F 0.02
  seed=$(((seed + 1) % 315))
  if [ $seed -eq 0 ]; then
    seed=1
  fi
done
