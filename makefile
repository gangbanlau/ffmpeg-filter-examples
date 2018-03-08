FFMPEG_DIR=.

CC=gcc
CFLAGS=-I$(FFMPEG_DIR)/include
LD_FLAGS=-L$(FFMPEG_DIR)/lib/ -lavformat -lavcodec -lavfilter -lavutil -lswscale -lvpx -lopus -lswresample

OBJ=filtering_video.o

%.o: %.c
	$(CC) -Wall -O2 -g -c -o $@ $< $(CFLAGS)

filtering_video: $(OBJ)
	gcc -o filtering_video $(OBJ) $(LD_FLAGS)

clean: 
	rm -f $(OBJ) filtering_video
