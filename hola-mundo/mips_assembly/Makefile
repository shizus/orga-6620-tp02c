PROGS  = 00-holamundo 01-holamundo 02-holamundo
CFLAGS = -g -Wall

all: $(PROGS)
	:

00-holamundo: 00-holamundo.S
	$(CC) $(CFLAGS) -o $@ $>

01-holamundo: 01-holamundo.S
	$(CC) $(CFLAGS) -o $@ $>

02-holamundo: 02-holamundo.c 02-holamundo.S
	$(CC) $(CFLAGS) -o $@ $>

clean:
	rm -f $(PROGS) *.so *.o *.a *.core
