#
# This is a project Makefile. It is assumed the directory this Makefile resides in is a
# project subdirectory.
#

# CFLAGS += -I$(abspath ..)
# CPPFLAGS += -I$(abspath ..) -Wno-error=switch -Wno-error=maybe-uninitialized

COMPONENT_SRCDIRS := .

CPPFLAGS += -Wno-error=switch -Wno-error=maybe-uninitialized

EXTRA_COMPONENT_DIRS += $(HOME)/esp/esp-idf/components
EXTRA_COMPONENT_DIRS += $(HOME)/esp/Soulmate
EXTRA_COMPONENT_DIRS += $(HOME)/esp/Soulmate/components

PROJECT_NAME := soulmate-example

MAKEFLAGS +=

include $(IDF_PATH)/make/project.mk

