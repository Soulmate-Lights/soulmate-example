COMPONENT_SRCDIRS := .
CPPFLAGS += -Wno-error=switch -Wno-error=maybe-uninitialized
EXTRA_COMPONENT_DIRS += $(HOME)/soulmate/esp-idf/components
EXTRA_COMPONENT_DIRS += $(HOME)/soulmate/soulmate
EXTRA_COMPONENT_DIRS += $(HOME)/soulmate/soulmate/components
PROJECT_NAME := soulmate-example
MAKEFLAGS +=
include $(HOME)/soulmate/esp-idf/make/project.mk
