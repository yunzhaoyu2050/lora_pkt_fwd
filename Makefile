
APP := lora_pkt_fwd

OBJDIR := build
OBJS   := $(patsubst %.c,$(OBJDIR)/%.o,$(wildcard *.c))

CFLAGS  +=
LDFLAGS += -luci -lm -lpthread -lwiringPi


all: $(OBJDIR) $(APP)

$(OBJDIR):
	@mkdir -p $@

$(APP): $(OBJDIR)/$(APP)

$(OBJDIR)/$(APP): $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $@

$(OBJDIR)/%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	$(RM) -rf $(OBJDIR)

.PHONY: all clean
