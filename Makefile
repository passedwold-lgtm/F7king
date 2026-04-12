export THEOS=$(HOME)/theos
export CC=clang
export CXX=clang++

ARCHS = arm64

DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1

THEOS_PACKAGE_SCHEME = rootless
THEOS_LEAN_AND_MEAN = 1
THEOS_NO_DEFAULTS = 1

TARGET = iphone:clang:16.5:16.5

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NexoraFF

$(TWEAK_NAME)_CCFLAGS = -std=c++17 -fno-rtti -DNDEBUG -Wall ึ
-Wno-deprecated-declarations -Wno-unused-variable 
-Wno-unused-value -Wno-unused-function -fvisibility=hidden

$(TWEAK_NAME)_CCFLAGS += -x objective-c++

$(TWEAK_NAME)_CFLAGS = -fobjc-arc -Wall 
-Wno-deprecated-declarations -Wno-unused-variable 
-Wno-unused-value -Wno-unused-function -fvisibility=hidden -Wno-error

ifeq ($(IGNORE_WARNINGS),1)
$(TWEAK_NAME)_CFLAGS += -w
$(TWEAK_NAME)_CCFLAGS += -w
endif

$(TWEAK_NAME)_FRAMEWORKS = UIKit Foundation Security QuartzCore CoreGraphics CoreText AVFoundation Accelerate SystemConfiguration SafariServices AudioToolbox GameController

$(TWEAK_NAME)_FILES = ImGuiDrawView.mm satooBY.mm 
$(wildcard Esp/.mm) $(wildcard Esp/.m) 
$(wildcard IMGUI/.cpp) $(wildcard IMGUI/.mm) 
FF.mm fishhook.c 
$(wildcard Hook/.c) 
$(wildcard KittyMemory/.cpp) $(wildcard KittyMemory/.mm) 
$(wildcard Soooto/.m)

$(TWEAK_NAME)_LDFLAGS += -L$(THEOS_PROJECT
