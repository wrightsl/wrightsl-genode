REQUIRES = x86_64

TARGET = risc5-emu

RISC5_EMU_DIR := $(call select_from_ports,risc5-emu)/src/app/risc5-emu
RISC5_EMU_SRC_DIR := $(RISC5_EMU_DIR)/src

#SRC_CC	=	construct.cc
#SRC_CC	=	risc5-emu_component.cc

SRC_C_fptest  = $(notdir $(wildcard $(RISC5_EMU_DIR)/src/fp-test/*.cpp))
SRC_C         += sdl-main.c
SRC_C         += init-risc.c
SRC_C         += risc.c risc-fp.c disk.c pclink.c raw-serial.c
SRC_C         +=  sdl-ps2.c
#SRC_C         +=  sdl-clipboard.c
#SRC_C         += $(SRC_C_fptest)

vpath % $(RISC5_EMU_SRC_DIR)
vpath %.c $(RISC5_EMU_SRC_DIR)
vpath %.c $(RISC5_EMU_DIR)/src/fp-test

INC_DIR += /home/slw-debian/Develop/git/genode/repos/os/src/drivers/framebuffer/spec/sdl/

INC_DIR += $(PRG_DIR)
INC_DIR += $(RISC5_EMU_SRC_DIR)

CC_OPT  = -DHAVE_CONFIG_H -D_GNU_SOURCE=1 -D_REENTRANT
CC_OPT += -DC_TARGETCPU=X86_64
CFLAGS = -g -Os
#CFLAGS = -g -Os -std=c99  -Wall -Wextra -Wconversion -Wno-sign-conversion -Wno-unused-parameter
#SDL2_CONFIG = sdl2-config

#CC_OPT += $(CFLAGS) -std=c99 -I `$(SDL2_CONFIG) --cflags --libs` -lm
#CC_OPT += $(CFLAGS) -lsdl2 -lm
CC_OPT += $(CFLAGS)

#LIBS += sdl2 libiconv libc libm 
#LIBS  +=  sdlmain sdl  fb_sdl libc libm 
LIBS  +=  sdlmain sdl libc libm
