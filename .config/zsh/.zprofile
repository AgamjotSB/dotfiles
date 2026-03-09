if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
    # Start the daemon and export the necessary variables
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"
    exec start-hyprland &> /tmp/hyprland.log
fi
