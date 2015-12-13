.PHONY: test clean
OBJDIR := build
CC := gcc
FLAGS := -g -c
LIBS :=
SOURCES := $(wildcard *.c)
OBJECTS = $(patsubst %.c,$(OBJDIR)/%.o,$(SOURCES))

all: $(OBJDIR)/fallout

test: all
	$(OBJDIR)/fallout || :

$(OBJDIR):
	mkdir -p $@

$(OBJDIR)/fallout: $(OBJECTS) | $(OBJDIR)
	$(CC) $^ -o $@ $(LIBS)

$(OBJDIR)/%.o: %.c | $(OBJDIR)
	$(CC) $(FLAGS) $< -o $@

%: %.o

clean:
	rm -r $(OBJDIR)
