NAME=scl-utils
VERSION=`date +%Y%m%d`
WARNINGS?=-Wall -Wshadow -Wcast-align -Winline -Wextra -Wmissing-noreturn
CFLAGS?=-O2
CFILES=scl.c
OTHERFILES=Makefile scl_enabled macros.scl
SOURCES=$(CFILES) $(OTHERFILES)
OBJECTS=scl.o

BINDIR=/usr/bin
MANDIR=/usr/share/man
CNFDIR=/etc

all: $(NAME)

$(NAME): $(SOURCES) $(OBJECTS) $(OTHERFILES)
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJECTS) $(WARNINGS) -o scl

clean:
	rm -f *.o scl

distclean: clean
	rm -f *~

dist: $(NAME)
	LANG=C
	rm -rf $(NAME)-$(VERSION)
	mkdir $(NAME)-$(VERSION)
	cp $(SOURCES) $(NAME)-$(VERSION)
	tar fcz $(NAME)-$(VERSION).tar.gz $(NAME)-$(VERSION)
	rm -rf $(NAME)-$(VERSION)

install: $(NAME)
	mkdir -p $(DESTDIR)/$(BINDIR)
	mkdir -p $(DESTDIR)/$(CNFDIR)/rpm
	cp macros.scl $(DESTDIR)/$(CNFDIR)/rpm
	cp scl $(DESTDIR)/$(BINDIR)
	cp -d scl $(DESTDIR)/$(BINDIR)
	cp scl_enabled $(DESTDIR)/$(BINDIR)

uninstall:
	rm -f $(BINDIR)/$(NAME) $(BINDIR)/scl
	rm -f $(CNFDIR)/rpm/macros.scl
