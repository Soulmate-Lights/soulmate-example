COMPONENT_SRCDIRS := .
CPPFLAGS += -Wno-error=switch -Wno-error=maybe-uninitialized
EXTRA_COMPONENT_DIRS += $(HOME)/esp/esp-idf/components
EXTRA_COMPONENT_DIRS += $(HOME)/esp/soulmate
EXTRA_COMPONENT_DIRS += $(HOME)/esp/soulmate/components
PROJECT_NAME := soulmate-example
MAKEFLAGS +=
include $(HOME)/esp/esp-idf/make/project.mk
