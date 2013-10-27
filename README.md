Installation chart
=======

* NET iPXE boot / USB boot / CD boot
* http://preseed.panticz.de/< MAC_ADDRESS >
* |
* https://raw.github.com/panticz/preseed/master/ipxe/menu.ipxe
   * |
   * https://raw.github.com/panticz/preseed/master/ipxe/menu.netinstall.ipxe
      * |
      * | Default Ubuntu preseed
      * |--- http://preseed.panticz.de/ubuntu-preseed.seed
         * |
         * | Automatic partitioning, if enabled (RAID1, LVM, ...)
         * |--- [ http://preseed.panticz.de/regular.cfg ] or [ http://preseed.panticz.de/raid1lvm.cfg ]
         * |
         * | Client specific configuration (partitioning, languages, user, ...)
         * |--- http://preseed.panticz.de/< MAC_HASH >.seed
         * |
         * |--- REBOOT
         * |
         * | Client post installation init script (init script)
         * |--- https://raw.github.com/panticz/preseed/master/late_command.conf
            * |
            * | Post installation script (applications, hardware configuration, ...)
            * |--- https://raw.github.com/panticz/preseed/master/late_command.sh
                  * |
                  * | Client specific post installation script
                  * |--- http://preseed.panticz.de/lc/< MAC_HASH >
                     * |
                     * | Installit: Automatic installation scripts (https://github.com/panticz/installit) e.g.
                     * |--- https://raw.github.com/panticz/installit/master/install.gnome-fallback.sh
                     * |
                     * |--- REBOOT
                     * |
                     * Installation completed, login to new system

