#!/usr/bin/env python

import dbus
import dbus.service
import subprocess

BusName = '_0xdc.powersave'


class Powersave(dbus.service.Object):
    def __init__(self):
        self.bus = dbus.SystemBus()
        name = dbus.service.BusName(BusName, bus=self.bus)
        super().__init__(name, '/io/0xdc/powersave')

    @dbus.service.method(BusName, out_signature='s')
    def xps(self):
        return subprocess.getoutput("/usr/libexec/powersave/xps")

    @dbus.service.method(BusName, out_signature='s')
    def hpc(self):
        return subprocess.getoutput("/usr/libexec/powersave/hpc")

    @dbus.service.method(BusName, out_signature='s')
    def turbo(self):
        return subprocess.getoutput("/usr/libexec/powersave/turbo")


if __name__ == '__main__':
    import dbus.mainloop.glib
    from gi.repository import GLib

    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)

    loop = GLib.MainLoop()
    object = Powersave()
    try:
        loop.run()
    except KeyboardInterrupt:
        pass
