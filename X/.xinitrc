#! /bin/sh
# vim:ts=4:sw=4:expandtab

# System xinitrc.d scripts (keyboard layouts, etc.)
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrdb -merge ~/.Xresources

xset s off            # disable screen saver
xset s noblank        # disable blanking
xset -dpms            # disable DPMS (monitor sleep)

# Input
#xset b off            # disable bell (audio beep)
#
# Key repeat rate: xset r rate <delay:milli-sec> <rate:repeats-per-sec>
# You can also test run it: same command
xset r rate 400 25

# manually launching a DBus session inside .xinitrc
# dbus-launch: provides session bus for dunst, xss-lock, logind IPC
# --exit-with-session: bus daemon dies when i3 exits — no orphan processes
#exec dbus-launch --exit-with-session i3
# Problems

#setxkbmap -option caps:swapescape 
# wont work if i plugin my keyboard after login

# Launch i3
exec i3
