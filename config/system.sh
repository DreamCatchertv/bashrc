distribution() {
    local distro="unknown"
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        distro="${ID:-unknown}"
    elif [ -f /etc/debian_version ]; then
        distro="debian"
    elif [ -f /etc/redhat-release ]; then
        distro="rhel"
    elif [ -f /etc/arch-release ]; then
        distro="arch"
    fi
    echo "$distro"
}

DISTRO=$(distribution)

case "$DISTRO" in
    debian|ubuntu)
        alias cat='batcat'
        ;;
    *)
        alias cat='bat'
        ;;
esac
