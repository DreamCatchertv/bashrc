extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2|*.tbz2) tar xjf "$1" ;;
      *.tar.gz|*.tgz) tar xzf "$1" ;;
      *.tar.xz|*.txz) tar xJf "$1" ;;
      *.tar) tar xf "$1" ;;
      *.bz2) bunzip2 "$1" ;;
      *.gz) gunzip "$1" ;;
      *.zip) unzip "$1" ;;
      *.7z) 7z x "$1" ;;
      *.rar) unrar x "$1" ;;
      *.Z) uncompress "$1" ;;
      *) echo "Unknown archive format: $1" ;;
    esac
  else
    echo "File not found: $1"
  fi
}
