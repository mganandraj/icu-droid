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

include $(CLEAR_VARS)

src_files := \
	ucln_in.cpp  decContext.cpp \
	ulocdata.cpp  utmscale.cpp decNumber.cpp

src_files += \
        indiancal.cpp   dtptngen.cpp dtrule.cpp   \
        persncal.cpp    rbtz.cpp     reldtfmt.cpp \
        taiwncal.cpp    tzrule.cpp   tztrans.cpp  \
        udatpg.cpp      vtzone.cpp                \
	anytrans.cpp    astro.cpp    buddhcal.cpp \
	basictz.cpp     calendar.cpp casetrn.cpp  \
	choicfmt.cpp    coleitr.cpp  coll.cpp     \
	collation.cpp \
	collationbuilder.cpp \
	collationcompare.cpp collationdata.cpp \
	collationdatabuilder.cpp collationdatareader.cpp \
	collationdatawriter.cpp collationfastlatin.cpp \
	collationfastlatinbuilder.cpp collationfcd.cpp \
	collationiterator.cpp collationkeys.cpp collationroot.cpp \
	collationrootelements.cpp collationruleparser.cpp \
	collationsets.cpp collationsettings.cpp \
	collationtailoring.cpp collationweights.cpp \
	compactdecimalformat.cpp \
	cpdtrans.cpp    csdetect.cpp csmatch.cpp  \
	csr2022.cpp     csrecog.cpp  csrmbcs.cpp  \
	csrsbcs.cpp     csrucode.cpp csrutf8.cpp  \
	curramt.cpp     currfmt.cpp  currunit.cpp \
	dangical.cpp \
	datefmt.cpp     dcfmtsym.cpp decimfmt.cpp \
	decimalformatpattern.cpp \
	digitlst.cpp    dtfmtsym.cpp esctrn.cpp   \
	fmtable_cnv.cpp fmtable.cpp  format.cpp   \
	funcrepl.cpp    gender.cpp \
	gregocal.cpp gregoimp.cpp \
	hebrwcal.cpp \
	inputext.cpp islamcal.cpp \
	japancal.cpp    measfmt.cpp measunit.cpp  \
	measure.cpp  \
	msgfmt.cpp      name2uni.cpp nfrs.cpp     \
	nfrule.cpp      nfsubs.cpp   nortrans.cpp \
	nultrans.cpp    numfmt.cpp   olsontz.cpp  \
	quant.cpp       quantityformatter.cpp \
	rbnf.cpp     rbt.cpp      \
	rbt_data.cpp    rbt_pars.cpp rbt_rule.cpp \
	rbt_set.cpp     regexcmp.cpp regexst.cpp  \
	regeximp.cpp 	region.cpp \
	rematch.cpp     remtrans.cpp repattrn.cpp \
	rulebasedcollator.cpp \
	scriptset.cpp \
	search.cpp      simpletz.cpp smpdtfmt.cpp \
	sortkey.cpp     strmatch.cpp strrepl.cpp  \
	stsearch.cpp    timezone.cpp \
	titletrn.cpp    tolowtrn.cpp toupptrn.cpp \
	translit.cpp    transreg.cpp tridpars.cpp \
	ucal.cpp        \
	ucol.cpp        ucoleitr.cpp \
	ucol_res.cpp    ucol_sit.cpp \
	ucsdet.cpp      udat.cpp     \
	uitercollationiterator.cpp \
	umsg.cpp        unesctrn.cpp uni2name.cpp \
	unum.cpp        uregexc.cpp  uregex.cpp   \
	usearch.cpp     \
	utf16collationiterator.cpp \
	utf8collationiterator.cpp \
	utrans.cpp   windtfmt.cpp \
	winnmfmt.cpp    zonemeta.cpp \
	numsys.cpp      chnsecal.cpp \
	cecal.cpp       coptccal.cpp ethpccal.cpp \
	brktrans.cpp    wintzimpl.cpp plurrule.cpp \
	plurfmt.cpp     dtitvfmt.cpp dtitvinf.cpp \
	tmunit.cpp      tmutamt.cpp  tmutfmt.cpp  \
        currpinf.cpp    uspoof.cpp   uspoof_impl.cpp \
        uspoof_build.cpp     \
        regextxt.cpp    selfmt.cpp   uspoof_conf.cpp \
        ztrans.cpp zrule.cpp  \
        vzone.cpp       fphdlimp.cpp fpositer.cpp\
        alphaindex.cpp  bocsu.cpp    decfmtst.cpp \
        smpdtfst.cpp       tzfmt.cpp \
        tzgnames.cpp    tznames.cpp  tznames_impl.cpp \
        udateintervalformat.cpp  upluralrules.cpp \
		decimfmtimpl.cpp dayperiodrules.cpp precision.cpp \
		visibledigits.cpp affixpatternparser.cpp pluralaffix.cpp \
		digitinterval.cpp digitformatter.cpp digitaffixesandpadding.cpp \
		digitgrouping.cpp valueformatter.cpp digitaffix.cpp \
		smallintformatter.cpp standardplural.cpp ufieldpositer.cpp unumsys.cpp \

c_includes = \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/../common

local_cflags := -D_REENTRANT
local_cflags += -DU_I18N_IMPLEMENTATION
local_cflags += -O3 -fvisibility=hidden


#
# Build for the target (device).
#

include $(CLEAR_VARS)
LOCAL_SRC_FILES += $(src_files)
LOCAL_C_INCLUDES += $(c_includes) $(optional_android_logging_includes)
LOCAL_C_INCLUDES += C:\icu\source\common\jni
LOCAL_CFLAGS += $(local_cflags) -DPIC -fPIC -DU_DISABLE_RENAMING=1
LOCAL_CPPFLAGS += -std=c++11
LOCAL_CPP_FEATURES := rtti
// LOCAL_LDLIBS += C:\icu\source\common\libs\armeabi-v7a\libicuuc.so
LOCAL_SHARED_LIBRARIES += libicuuc $(optional_android_logging_libraries)
#LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libicui18n
#LOCAL_ADDITIONAL_DEPENDENCIES += $(LOCAL_PATH)/Android.mk
# Use "-include" to not fail apps_only build.
#-include abi/cpp/use_rtti.mk
#-include external/stlport/libstlport.mk
include $(BUILD_SHARED_LIBRARY)


$(call import-module, common)

#
# Build for the host.
#

#include $(CLEAR_VARS)
#LOCAL_SRC_FILES += $(src_files)
#LOCAL_C_INCLUDES += $(c_includes) $(optional_android_logging_includes)
#LOCAL_CFLAGS += $(local_cflags)
#LOCAL_SHARED_LIBRARIES += libicuuc-host $(optional_android_logging_libraries)
#LOCAL_LDLIBS += -lm -lpthread
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE := libicui18n-host
#LOCAL_ADDITIONAL_DEPENDENCIES += $(LOCAL_PATH)/Android.mk
#LOCAL_MULTILIB := both
#include $(BUILD_HOST_SHARED_LIBRARY)

#
# Build as a static library against the NDK
#

#include $(CLEAR_VARS)
#LOCAL_SDK_VERSION := 9
#LOCAL_NDK_STL_VARIANT := stlport_static
#LOCAL_SRC_FILES += $(src_files)
#LOCAL_C_INCLUDES += $(c_includes) $(optional_android_logging_includes)
#LOCAL_SHARED_LIBRARIES += $(optional_android_logging_libraries)
#LOCAL_STATIC_LIBRARIES += libicuuc_static
#LOCAL_EXPORT_C_INCLUDES += $(LOCAL_PATH)
#LOCAL_CPP_FEATURES := rtti
#LOCAL_CFLAGS += $(local_cflags) -DPIC -fPIC -frtti
# Using -Os over -O3 actually cuts down the final executable size by a few dozen kilobytes
#LOCAL_CFLAGS += -Os
#LOCAL_EXPORT_CFLAGS += -DU_STATIC_IMPLEMENTATION=1
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE := libicui18n_static
#include $(BUILD_STATIC_LIBRARY)
