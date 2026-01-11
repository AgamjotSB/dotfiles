if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
    # Start the daemon and export the necessary variables
    eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK
    
    exec start-hyprland
fi

# [[ $(tty) == /dev/tty1 ]]&&exec Hyprland
