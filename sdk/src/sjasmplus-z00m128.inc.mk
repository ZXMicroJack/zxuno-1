# sjasmplus-z00m128.inc.mk - script to download and build SJAsmPlus by aprisobal.
#
# This file is a part of main Makefile.
#
# SPDX-FileCopyrightText: 2021 Ivan Tatarinov <ivan-tat@ya.ru>
#
# SPDX-License-Identifier: GPL-3.0-or-later

$(DOWNLOADS)/sjasmplus-z00m128:
	mkdir -p $@

.PHONY: $(foreach t,build install uninstall clean distclean,$(t)-sjasmplus)

ifeq ($(_DoBuild),1)

SJASMPLUS_ARCHIVE		= $(DOWNLOADS)/sjasmplus-z00m128/v1.18.2.tar.gz
SJASMPLUS_ARCHIVE_SHA256	= 114807bf53d3526b4d1ae7d40f3050b9ee98220df74931efc1e6d1fe5aba3d02
SJASMPLUS_ARCHIVE_TYPE		= .tar.gz
SJASMPLUS_ARCHIVE_SUBDIR	= sjasmplus-1.18.2

build-sjasmplus: | sjasmplus-z00m128/.extracted sjasmplus-z00m128.mk
	$(MAKE) -w -C sjasmplus -f ../sjasmplus-z00m128.mk prefix=$(shell realpath --relative-to=sjasmplus-z00m128 $(prefix))

sjasmplus-z00m128/.extracted: $(SJASMPLUS_ARCHIVE)
	rm -rf $(@D)
	extract.sh $<\
	 --sha256 $(SJASMPLUS_ARCHIVE_SHA256)\
	 --type $(SJASMPLUS_ARCHIVE_TYPE)\
	 --subdir $(SJASMPLUS_ARCHIVE_SUBDIR)\
	 --output $(@D)
	touch $@

$(DOWNLOADS)/sjasmplus-z00m128/v1.18.2.tar.gz: | $(DOWNLOADS)/sjasmplus-z00m128
	wget -c https://github.com/z00m128/sjasmplus/archive/refs/tags/$(@F) -O $@

install-sjasmplus: | sjasmplus-z00m128/.extracted sjasmplus-z00m128.mk
	$(MAKE) -w -C sjasmplus-z00m128 -f ../sjasmplus-z00m128.mk prefix=$(shell realpath --relative-to=sjasmplus-z00m128 $(prefix)) install

ifeq ($(_DoClean),1)

uninstall-sjasmplus: | sjasmplus-z00m128.mk
	if test -d sjasmplus-z00m128; then\
		$(MAKE) -w -C sjasmplus-z00m128 -f ../sjasmplus-z00m128.mk prefix=$(shell realpath --relative-to=sjasmplus-z00m128 $(prefix)) uninstall;\
	else\
		rm -f $(DESTDIR)$(bindir)/sjasmplus$(EXESUFFIX);\
	fi

clean-sjasmplus: | sjasmplus-z00m128.mk
	if test -d sjasmplus-z00m128; then $(MAKE) -w -C sjasmplus-z00m128 -f ../sjasmplus-z00m128.mk clean; fi

else	#  !_DoClean

uninstall-sjasmplus clean-sjasmplus:;

endif	#  !_DoClean
endif	# _DoBuild

ifeq ($(_UsePrecompiledOnWindows),1)

build-sjasmplus: sjasmplus-z00m128/sjasmplus$(EXESUFFIX)

sjasmplus-z00m128/sjasmplus$(EXESUFFIX): | sjasmplus-z00m128/.extracted

ifeq ($(PROCESSOR_ARCHITECTURE),X86)
else ifeq ($(PROCESSOR_ARCHITECTURE),AMD64)
else ifeq ($(PROCESSOR_ARCHITECTURE),EM64T)
else
 $(warning Unsupported platform: "$(PROCESSOR_ARCHITECTURE)")
endif

SJASMPLUS_ARCHIVE		= $(DOWNLOADS)/sjasmplus-z00m128/sjasmplus-1.18.2.win.zip
SJASMPLUS_ARCHIVE_SHA256	= 848bca2522d6febbf3e3c48c634731ecd61899166f5922ed15857e8063c3dc4b
SJASMPLUS_ARCHIVE_TYPE		= .zip
SJASMPLUS_ARCHIVE_SUBDIR	= sjasmplus-1.18.2.win

sjasmplus-z00m128/.extracted: $(SJASMPLUS_ARCHIVE)
	rm -rf $(@D)
	extract.sh $<\
	 --sha256 $(SJASMPLUS_ARCHIVE_SHA256)\
	 --type $(SJASMPLUS_ARCHIVE_TYPE)\
	 --subdir $(SJASMPLUS_ARCHIVE_SUBDIR)\
	 --output $(@D)
	touch $@

$(DOWNLOADS)/sjasmplus-z00m128/sjasmplus-1.18.2.win.zip: | $(DOWNLOADS)/sjasmplus-z00m128
	wget -c https://github.com/z00m128/sjasmplus/releases/download/v1.18.2/$(@F) -O $@

install-sjasmplus: $(DESTDIR)$(bindir)/sjasmplus$(EXESUFFIX)

$(DESTDIR)$(bindir)/sjasmplus$(EXESUFFIX): sjasmplus-z00m128/sjasmplus$(EXESUFFIX) | $(DESTDIR)$(bindir)
	$(INSTALL_PROGRAM) -m 755 $< $@

ifeq ($(_DoClean),1)

uninstall-sjasmplus:
	rm -f $(DESTDIR)$(bindir)/sjasmplus$(EXESUFFIX)

clean-sjasmplus:
	rm -rf sjasmplus-z00m128

else	#  !_DoClean

uninstall-sjasmplus clean-sjasmplus:;

endif	#  !_DoClean
endif	# _UsePrecompiledOnWindows

ifeq ($(_DoClean),1)

distclean-sjasmplus:
	rm -rf $(DOWNLOADS)/sjasmplus-z00m128
	rm -rf sjasmplus-z00m128

else	# !_DoClean

distclean-sjasmplus:;

endif	# !_DoClean
