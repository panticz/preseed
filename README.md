Installation chart
=======

* NET PXE boot (http://dl.panticz.de/ipxe/ipxe.pxe)
* USB boot (http://dl.panticz.de/ipxe/ipxe.usb)
* CD boot (http://dl.panticz.de/ipxe/ipxe.iso)
  * |
  * iPXE boot (Compile iPXE: https://github.com/panticz/preseed/blob/master/ipxe/scripts/build_ipxe.sh)
  * http://preseed.panticz.de/< MAC_ADDRESS >
   * |
   * https://raw.github.com/panticz/preseed/master/ipxe/menu.netinstall.ipxe
      * |
      * | Minimal Ubuntu preseed configuration  
      * |--- https://raw.github.com/panticz/preseed/master/ubuntu-minimal.seed
         * |
         * | Automatic partitioning, if enabled (RAID1, LVM, ...)
         * |--- [ https://raw.github.com/panticz/preseed/master/regular.seed ]
         * |--- [ https://raw.github.com/panticz/preseed/master/raid1lvm.seed ]
         * |--- [ https://raw.github.com/panticz/preseed/master/raid5lvm.seed ]
         * |
         * | Additional client specific configuration (partitioning, languages, user, ...)
         * |--- http://preseed.panticz.de/< MAC_HASH >.seed
         * |
         * |--- REBOOT
         * |
         * | Additional client specific post installation (init script)
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

