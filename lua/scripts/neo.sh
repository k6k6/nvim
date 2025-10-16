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
move_curosr_top() {
  printf "\033[H"
}
while true; do
  [ -f "$file" ] || {
    echo "1" >"$file"
  }
  seed=$(cat "$file")
  move_curosr_top
  echo "$neovim" | dotacat -S "$seed" -F 0.05
  seed=$(((seed + 1) % 126))
  if [ $seed -eq 0 ]; then
    seed=1
  fi
  tmp=$(mktemp)
  printf '%s\n' "$seed" >"$tmp"
  mv "$tmp" "$file"
done
