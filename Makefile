TITLE		:= Yoi Music
APPID		:= YOIMUSIC01
CONTENTID	:= UP0001-YOIMUSIC01_00-0000000000000000

include $(PSL1GHT)/ppu_rules

TARGET		:= $(APPID)
BUILD		:= build
SOURCES		:= .
INCLUDE		:=
DATA		:=

CFILES		:= $(foreach dir,$(SOURCES),$(notdir $(wildcard $(dir)/*.c)))
CXXFILES	:= $(foreach dir,$(SOURCES),$(notdir $(wildcard $(dir)/*.cpp)))
SFILES		:= $(foreach dir,$(SOURCES),$(notdir $(wildcard $(dir)/*.S)))

OFILES		:= $(CFILES:.c=.o) $(CXXFILES:.cpp=.o) $(SFILES:.S=.o)
OFILES		:= $(addprefix $(BUILD)/,$(OFILES))

CFLAGS		:= -O2 -Wall
CXXFLAGS	:= $(CFLAGS)
LDFLAGS		:= -lsysutil -lsysmodule -lm

all: $(TARGET).pkg

$(TARGET).elf: $(OFILES)
	$(LD) $^ $(LDFLAGS) -o $@

$(TARGET).self: $(TARGET).elf
	$(SELF) $< $@

$(TARGET).pkg: $(TARGET).self
	$(PKG) --contentid $(CONTENTID) $< $@

$(BUILD)/%.o: %.c
	@mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD) $(TARGET).elf $(TARGET).self $(TARGET).pkg
