CC=gcc
CFLAGS=-Wall
LFLAGS=-lrt -lm -lasound -ljack -pthread
DEPS = portaudio.h serial.h audio.h 
DEPS_OBJ = serial.o audio.o
RNN_OBJ = main.o libportaudio.a
TEST_OBJ = paex_record.o libportaudio.a

all: $(DEPS_OBJ) $(RNN_OBJ)
	$(CC) $(CFLAGS) -o backlight $^ $(LFLAGS)

%.o: %.c $(DEPS)
	$(CC) $(CFLAGS) -c -o $@ $< $(LFLAGS)

backlight: $(DEPS_OBJ) $(RNN_OBJ)
	$(CC) $(CFLAGS) -o backlight $^ $(LFLAGS)

record: $(DEPS_OBJ) $(TEST_OBJ)
	$(CC) $(CFLAGS) -o record $^ $(LFLAGS)


clean:
	rm $(RNN_OBJ) $(DEPS_OBJ)
