#!/bin/bash
config_path=$(echo $XDG_CONFIG_HOME)
neovim='
                                                                      
        ████ ██████           █████      ██                     
       ███████████             █████                             
       █████████ ███████████████████ ███   ███████████   
      █████████  ███    █████████████ █████ ██████████████   
     █████████ ██████████ █████████ █████ █████ ████ █████   
   ███████████ ███    ███ █████████ █████ █████ ████ █████  
  ██████  █████████████████████ ████ █████ █████ ████ ██████ 
'
file="${config_path}/nvim/lua/scripts/seed.txt"
[ -f "$file" ] || {
  echo "1" >"$file"
}
seed=$(cat "$file")
move_curosr_top() {
  printf "\033[H"
}
sava_seed() {
  tmp=$(mktemp)
  echo "$seed" >"$tmp"
  mv "$tmp" "$file"
}
trap sava_seed EXIT
while true; do
  move_curosr_top
  echo "$neovim" | dotacat -S "$seed" -F 0.05
  seed=$(((seed + 1) % 126))
  if [ $seed -eq 0 ]; then
    seed=1
  fi
done
