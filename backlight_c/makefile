CC=gcc
CFLAGS=-Wall
LFLAGS=-lm
DEPS = serial.h
DEPS_OBJ = serial.o
RNN_OBJ = main.o

all: $(DEPS_OBJ) $(RNN_OBJ)
	$(CC) $(CFLAGS) -o backlight $^ $(LFLAGS)

%.o: %.c $(DEPS)
	$(CC) $(CFLAGS) -c -o $@ $< $(LFLAGS)

backlight: $(DEPS_OBJ) $(RNN_OBJ)
	$(CC) $(CFLAGS) -o backlight $^ $(LFLAGS)

clean:
	rm $(RNN_OBJ) $(DEPS_OBJ)