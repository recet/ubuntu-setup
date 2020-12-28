#!/usr/bin/env bash

# Activate Night Light based on sunrise (true or false)
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

# Make Linux Use Local Time - fixing dual-boot windows showing wrong time
# instructions from https://www.howtogeek.com/323390/how-to-fix-windows-and-linux-showing-different-times-when-dual-booting/
# If you ever want to undo this change, run the following command: timedatectl set-local-rtc 0 --adjust-system-clock
timedatectl set-local-rtc 1 --adjust-system-clock