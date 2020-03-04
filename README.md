powersave (dbus)
================

This exposes some root-only scripts that control my laptop's CPU frequency and runtime powersaving.

This is based on content from this blog post:
https://www.gkbrk.com/2018/02/simple-dbus-service-in-python/

Quickstart
----------

```bash
# make install
# systemctl daemon-reload
# systemctl enable --now powersave.service
# systemctl enable --now dbus-_0xdc.powersave.service
$ powersave turbo
```
