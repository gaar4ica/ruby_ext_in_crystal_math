CRYSTAL = crystal
UNAME = "$(shell uname -ms)"
LIBRARY_PATH = $(shell brew --prefix crystal-lang)/embedded/lib
LIBS = -levent -lpcl -lpcre -lgc -lpthread
LDFLAGS = -Wl,-undefined,dynamic_lookup

TARGET = cr_math.bundle

$(TARGET): cr_math.o
	$(CC) -bundle -L$(LIBRARY_PATH) -o $@ $^ $(LIBS) $(LDFLAGS)

cr_math.o: cr_math.cr
	$(CRYSTAL) build --cross-compile $(UNAME) $<

.PHONY: clean
clean:
	rm -f bc_flags
	rm -f cr_math.o
	rm -f $(TARGET)
