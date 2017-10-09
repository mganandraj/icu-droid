# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


LOCAL_PATH:= $(call my-dir)

#
# Common definitions.
#

src_files := \
	cmemory.cpp          cstring.cpp          \
	cwchar.cpp           locmap.cpp           \
	punycode.cpp       putil.cpp          \
	sharedobject.cpp \
	simpleformatter.cpp \
	uarrsort.cpp         ubidi.cpp            \
	ubidiln.cpp          ubidi_props.cpp      \
	ubidiwrt.cpp         ucase.cpp          \
	ucasemap.cpp       ucat.cpp             \
	uchar.cpp            ucln_cmn.cpp         \
	ucmndata.cpp                            \
	ucnv2022.cpp       ucnv_bld.cpp       \
	ucnvbocu.cpp       ucnv.cpp             \
	ucnv_cb.cpp          ucnv_cnv.cpp         \
	ucnvdisp.cpp         ucnv_err.cpp         \
	ucnv_ext.cpp       ucnvhz.cpp           \
	ucnv_io.cpp        ucnvisci.cpp         \
	ucnvlat1.cpp         ucnv_lmb.cpp         \
	ucnvmbcs.cpp         ucnvscsu.cpp         \
	ucnv_set.cpp         ucnv_u16.cpp         \
	ucnv_u32.cpp         ucnv_u7.cpp          \
	ucnv_u8.cpp                             \
	udatamem.cpp         \
	udataswp.cpp         uenum.cpp            \
	uhash.cpp            uinit.cpp          \
	uinvchar.cpp         uloc.cpp           \
	umapfile.cpp         umath.cpp            \
	umutex.cpp         unames.cpp         \
	uresbund.cpp       \
	ures_cnv.cpp         uresdata.cpp         \
	usc_impl.cpp         uscript.cpp          \
	uscript_props.cpp  \
	ushape.cpp         ustrcase.cpp       \
	ustr_cnv.cpp         ustrfmt.cpp          \
	ustring.cpp        ustrtrns.cpp       \
	ustr_wcs.cpp       utf_impl.cpp         \
	utrace.cpp           utrie.cpp          \
	utypes.cpp           wintz.cpp            \
	utrie2_builder.cpp icuplug.cpp          \
	propsvec.cpp         ulist.cpp            \
	uloc_tag.cpp         ucnv_ct.cpp        \
	uloc_keytype.cpp

src_files += \
        bmpset.cpp      unisetspan.cpp   \
	brkeng.cpp      brkiter.cpp      \
	caniter.cpp     chariter.cpp     \
	dictbe.cpp	locbased.cpp     \
	locid.cpp       locutil.cpp      \
	normlzr.cpp     parsepos.cpp     \
	propname.cpp    rbbi.cpp         \
	rbbidata.cpp    rbbinode.cpp     \
	rbbirb.cpp      rbbiscan.cpp     \
	rbbisetb.cpp    rbbistbl.cpp     \
	rbbitblb.cpp    resbund_cnv.cpp  \
	resbund.cpp     ruleiter.cpp     \
	schriter.cpp    serv.cpp         \
	servlk.cpp      servlkf.cpp      \
	servls.cpp      servnotf.cpp     \
	servrbf.cpp     servslkf.cpp     \
	ubrk.cpp         \
	uchriter.cpp    uhash_us.cpp     \
	uidna.cpp       uiter.cpp        \
	unifilt.cpp     unifunct.cpp     \
	uniset.cpp      uniset_props.cpp \
	unistr_case.cpp unistr_cnv.cpp   \
	unistr.cpp      unistr_props.cpp \
	unormcmp.cpp    unorm.cpp        \
	uobject.cpp     uset.cpp         \
	usetiter.cpp    uset_props.cpp   \
	usprep.cpp      ustack.cpp       \
	ustrenum.cpp    utext.cpp        \
	util.cpp        util_props.cpp   \
	uvector.cpp     uvectr32.cpp     \
	errorcode.cpp                    \
	bytestream.cpp  stringpiece.cpp  \
	dtintrv.cpp      \
	ucnvsel.cpp     uvectr64.cpp     \
	locavailable.cpp         locdispnames.cpp   \
	loclikely.cpp            locresdata.cpp     \
	loadednormalizer2impl.cpp normalizer2impl.cpp      normalizer2.cpp    \
	filterednormalizer2.cpp  ucol_swp.cpp       \
	uprops.cpp      utrie2.cpp \
        charstr.cpp     uts46.cpp \
        udata.cpp   appendable.cpp  bytestrie.cpp \
        bytestriebuilder.cpp  bytestrieiterator.cpp \
        messagepattern.cpp patternprops.cpp stringtriebuilder.cpp \
        ucharstrie.cpp ucharstriebuilder.cpp ucharstrieiterator.cpp \
	dictionarydata.cpp \
	ustrcase_locale.cpp unistr_titlecase_brkiter.cpp \
	uniset_closure.cpp ucasemap_titlecase_brkiter.cpp \
	ustr_titlecase_brkiter.cpp unistr_case_locale.cpp \
	listformatter.cpp edits.cpp resource.cpp filteredbrk.cpp \
	unifiedcache.cpp locdspnm.cpp ucurr.cpp pluralmap.cpp \
	


# This is the empty compiled-in icu data structure
# that we need to satisfy the linker.
src_files += ../stubdata/stubdata.cpp

c_includes := \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/../i18n

# We make the ICU data directory relative to $ANDROID_ROOT on Android, so both
# device and sim builds can use the same codepath, and it's hard to break one
# without noticing because the other still works.
local_cflags := '-DICU_DATA_DIR_PREFIX_ENV_VAR="ANDROID_ROOT"'
local_cflags += '-DICU_DATA_DIR="/usr/icu"'

# bionic doesn't have <langinfo.h>.
local_cflags += -DU_HAVE_NL_LANGINFO_CODESET=0

local_cflags += -D_REENTRANT
local_cflags += -DU_COMMON_IMPLEMENTATION

local_cflags += -DU_DISABLE_RENAMING=1

local_cflags += -O3 -fvisibility=hidden

#
# Build for the target (device).
#

include $(CLEAR_VARS)
LOCAL_SRC_FILES += $(src_files)
LOCAL_C_INCLUDES += $(c_includes) $(optional_android_logging_includes)
# LOCAL_C_INCLUDES += C:\buildtools\android-ndk-r13b\sources\cxx-stl\gnu-libstdc++\4.9\include C:\buildtools\android-ndk-r13b\sources\cxx-stl\gnu-libstdc++\4.9\libs\armeabi-v7a\include
LOCAL_CFLAGS += $(local_cflags) -DPIC -fPIC
#LOCAL_CPPFLAGS += -std=c++11
LOCAL_CPP_FEATURES := rtti
LOCAL_SHARED_LIBRARIES += libdl
LOCAL_LDLIBS += -latomic
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libicuuc
LOCAL_ADDITIONAL_DEPENDENCIES += $(LOCAL_PATH)/Android.mk
#LOCAL_REQUIRED_MODULES += icu-data
# Use "-include" to not fail apps_only build.
#-include abi/cpp/use_rtti.mk
#-include external/stlport/libstlport.mk
include $(BUILD_SHARED_LIBRARY)

#
# Build for the host.
#

#include $(CLEAR_VARS)
#LOCAL_SRC_FILES += $(src_files)
#LOCAL_C_INCLUDES += $(c_includes) $(optional_android_logging_includes)
#LOCAL_CFLAGS += $(local_cflags)
#LOCAL_SHARED_LIBRARIES += $(optional_android_logging_libraries)
#LOCAL_LDLIBS += -ldl -lm -lpthread -latomic
#LOCAL_CPP_FEATURES := rtti
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE := libicuuc-host
#LOCAL_ADDITIONAL_DEPENDENCIES += $(LOCAL_PATH)/Android.mk
#LOCAL_REQUIRED_MODULES += icu-data-host
#LOCAL_MULTILIB := both
#include $(BUILD_HOST_SHARED_LIBRARY)

#
# Build as a static library against the NDK
#

#include $(CLEAR_VARS)
#LOCAL_SDK_VERSION := 9
#LOCAL_NDK_STL_VARIANT := stlport_static
#LOCAL_C_INCLUDES += $(c_includes)
#LOCAL_EXPORT_C_INCLUDES += $(LOCAL_PATH)
#LOCAL_CPP_FEATURES := rtti
#LOCAL_CFLAGS += $(local_cflags) -DPIC -fPIC -frtti
# Using -Os over -O3 actually cuts down the final executable size by a few dozen kilobytes
#LOCAL_CFLAGS += -Os
#LOCAL_EXPORT_CFLAGS += -DU_STATIC_IMPLEMENTATION=1
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE := libicuuc_static
#LOCAL_SRC_FILES += $(src_files)
#LOCAL_REQUIRED_MODULES += icu-data
#include $(BUILD_STATIC_LIBRARY)
