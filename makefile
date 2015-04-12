INCLUDE = -I/usr/local/include/gtk-3.0 -I/usr/local/include/glib-2.0 \
  -I/usr/local/lib/glib-2.0/include -I/usr/local/include/pango-1.0 \
  -I/usr/local/include/cairo -I/usr/local/include/gdk-pixbuf-2.0 \
  -I/usr/local/include/atk-1.0

LIB = -L/usr/local/lib -lgtk-3 -lgdk-3 -lgobject-2.0 -lthr -lpam

all: mindm

mindm: main.c pam.c
	cc ${INCLUDE} ${LIB} -Wall -o ${.TARGET} ${.ALLSRC}

clean:
	rm -f mindm drv_pam *.o *.log *.core

test_mindm: mindm
	Xephyr -ac -br -noreset -screen 800x600 :10 &
	DISPLAY=:10 ./mindm &

drv_pam: drv_pam.c pam.c
	cc ${INCLUDE} ${LIB} -Wall -o ${.TARGET} ${.ALLSRC}

.PHONY: all clean
