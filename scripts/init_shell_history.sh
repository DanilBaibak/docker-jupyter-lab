#!/bin/sh

if [ -d "/home/dev/config" ]; then
    if [ ! -f "/home/dev/config/.bash_history" ]; then
        touch /home/dev/config/.bash_history
    fi
    rm -f /home/dev/.bash_history
    ln -sf /home/dev/config/.bash_history /home/dev/.bash_history
fi
