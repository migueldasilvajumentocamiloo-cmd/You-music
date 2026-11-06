.RECIPEPREFIX = >
TARGET := YOIMUSIC01
CONTENTID := UP0001-YOIMUSIC01_00-0000000000000000

all: $(TARGET).pkg

$(TARGET).elf: Main.c
> ppu-gcc -O2 -Wall -o $@ $< -lsysutil -lsysmodule -lm

$(TARGET).self: $(TARGET).elf
> make_self $< $@

$(TARGET).pkg: $(TARGET).self
> make_package --contentid $(CONTENTID) $< $@

clean:
> rm -f $(TARGET).elf $(TARGET).self $(TARGET).pkg
