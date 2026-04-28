# ~/.bashrc

if [ -d "$HOME/.config/bash" ]; then
  for file in "$HOME/.config/bash/"*.sh; do
    [ -r "$file" ] && source "$file"
  done
fi
