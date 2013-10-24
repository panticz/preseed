Installation chart
=======

* iPXE boot
* http://preseed.panticz.de/ipxe/ipxe.menu.install
    *  |
    *  |   Ubuntu preseed
    *  |---http://preseed.panticz.de/ubuntu-preseed.seed
        *  |
        *  |   autopart (if enabled)
        *  |---[ http://preseed.panticz.de/regular.cfg ] or [ http://preseed.panticz.de/raid1lvm.cfg ]
        *  |
        *  |   client configuration
        *  |---http://preseed.panticz.de/< MAC_HASH >.seed
        *  |
        *  |   client post install configuration
        *  |---https://raw.github.com/panticz/preseed/master/late_command.conf
            *      |
            *      |---https://raw.github.com/panticz/preseed/master/late_command.sh
            *          |
            *          |---http://preseed.panticz.de/lc/< MAC_HASH >
                *              |
                *              |   installit scripts
                *              |---https://github.com/panticz/installit
                    *              |   ...
                    *              |---https://raw.github.com/panticz/installit/master/install.gnome-fallback.sh
                    *                  ...

