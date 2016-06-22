ifeq "$(PLATFORM)" ""
PLATFORM := $(shell uname)
endif

ifeq "$(PLATFORM)" "Linux"
SO_NAME = common_math
CRYSTAL = crystal
UNAME = "$(shell llvm-config --host-target)"
CRYSTAL_BIN = $(shell readlink -f `which crystal`)
LIBRARY_PATH = $(shell dirname $(CRYSTAL_BIN))/../embedded/lib
LIBCRYSTAL = $(shell dirname $(CRYSTAL_BIN) )/../src/ext/libcrystal.a
LIBRUBY = $(shell ruby -e "puts RbConfig::CONFIG['libdir']")
LIBS = -levent -lpcre -lgc -lpthread -lruby -ldl -lm -lc
LDFLAGS = -L. -fstack-protector -rdynamic -Wl,-export-dynamic,-undefined,dynamic_lookup
TARGET = $(SO_NAME).so

install: $(TARGET)

$(TARGET): $(SO_NAME).o
	$(CC) -shared $^ -o $@ $(LIBCRYSTAL) -L$(LIBRARY_PATH) -L$(LIBRUBY) $(LIBS) $(LDFLAGS)

$(SO_NAME).o: $(SO_NAME).cr
	$(CRYSTAL) compile --cross-compile --target $(UNAME) $<

.PHONY: clean
clean:
	rm -f bc_flags
	rm -f $(SO_NAME).o
	rm -f $(TARGET)
endif

ifeq "$(PLATFORM)" "Darwin"
install: common_math.cr
	crystal common_math.cr --release --link-flags "-dynamic -bundle -Wl,-undefined,dynamic_lookup" -o common_math.bundle

clean:
	rm -f common_math.bundle
endif
