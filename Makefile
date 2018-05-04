SHELL = /usr/bin/env sh
.SUFFIXES:
.SUFFIXES: .c .o

CXX       = g++
CPPFLAGS  = -Wall -Wextra -mtune=native
LDFLAGS   =
#CPPFLAGS  = -Wall -Wextra -mtune=native `sdl2-config --cflags`
#LDFLAGS   = `sdl2-config --libs` -lSDL2_image -lm

TARGET_EXEC ?= main

srcdir	 =src
DESTDIR  =build

SRCS := $(shell find $(srcdir) -iname *.cpp -or -iname *.c++)
OBJS := $(SRCS:%=$(DESTDIR)/%.o)
DEPS := $(OBJS:.o=.d)

INC_DIRS := $(shell find $(srcdir) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIRS))

CPPFLAGS ?= $(INC_FLAGS) -MMD -MP

$(DESTDIR)/$(TARGET_EXEC): $(OBJS)
	$(CXX) $(OBJS) -o $@ $(LDFLAGS)

$(DESTDIR)/%.cpp.o: %.cpp
	mkdir -p $(dir $@)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

.PHONY: clean
clean:
	@rm -r $(DESTDIR) 2>/dev/null || true

-include $(DEPS)
