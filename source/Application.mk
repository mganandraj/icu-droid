APP_BUILD_SCRIPT := Android.mk

APP_ABI := armeabi-v7a x86
APP_PLATFORM := android-9

APP_STL := gnustl_shared

# Enable c++11 extentions in source code
APP_CPPFLAGS += -std=c++11

# Make sure every shared lib includes a .note.gnu.build-id header
# APP_LDFLAGS := -Wl,--build-id

NDK_TOOLCHAIN_VERSION := 4.9
