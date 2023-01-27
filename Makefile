MAIN:=eglinfo

export CC:=arm-starfishmllib32-linux-gnueabi-gcc --sysroot=/opt/starfish-sdk-x86_64/5.0.0-20191125/sysroots/aarch64-starfish-linux \
    -mcpu=cortex-a55 -mfloat-abi=softfp -mthumb -rdynamic -funwind-tables
export CFLAGS:=-pipe -std=gnu17 -Wall -Wextra -O2 -ggdb -feliminate-unused-debug-types
export LDFLAGS:=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed

LIBS:=-lmali

SRCS:=eglinfo.c

.PHONY: all
all: $(MAIN)

$(MAIN): $(SRCS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o '$@' $^ $(LIBS)

.PHONY: clean
clean:
	rm -f -- '$(MAIN)'
