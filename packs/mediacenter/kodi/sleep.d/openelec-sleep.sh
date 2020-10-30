#!/bin/sh

. /etc/profile

run_scripts()
{
    list_scripts $1
    for script in $SCRIPTS ; do
        progress "running sleep script $script ($1)..."
        sh /usr/lib/systemd/system-sleep.serial/$script $1
    done
}

list_scripts()
{
    case $1 in
        pre)
            SCRIPTS=$(ls /usr/lib/systemd/system-sleep.serial/ | sort)
        ;;
        post)
            SCRIPTS=$(ls /usr/lib/systemd/system-sleep.serial/ | sort -r)
        ;;
    esac
}

run_scripts $1

exit 0
