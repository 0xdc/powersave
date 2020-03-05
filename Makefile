.PHONY: all install clean

DESTDIR ?=
PREFIX ?= /usr
ETC ?= /etc

FILES = \
	systemd/dbus-_0xdc.powersave.service \
	systemd/powersave.service \
	libexec/powersave.py

all: $(FILES)

%: %.in
	sed 's:@@PREFIX@@:$(PREFIX):g' $< > $@

install:
	mkdir -p $(DESTDIR)$(ETC)
	mkdir -p $(DESTDIR)/lib/systemd/system
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(PREFIX)/libexec/powersave
	mkdir -p $(DESTDIR)$(PREFIX)/share/dbus-1/system.d
	install bin/powersave $(DESTDIR)$(PREFIX)/bin
	install dbus-1/_0xdc.powersave.conf $(DESTDIR)$(PREFIX)/share/dbus-1/system.d
	install -t $(DESTDIR)/lib/systemd/system systemd/powersave.service systemd/dbus-_0xdc.powersave.service
	install -t $(DESTDIR)$(PREFIX)/libexec/powersave libexec/hpc libexec/turbo libexec/xps libexec/powersave.py
	install -t $(DESTDIR)$(ETC) intel-undervolt/intel-undervolt.hpc.conf intel-undervolt/intel-undervolt.turbo.conf intel-undervolt/intel-undervolt.xps.conf


clean:
	@rm -vf $(FILES)
