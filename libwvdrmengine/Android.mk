LOCAL_PATH:= $(call my-dir)
include $(LOCAL_PATH)/oemcryptolevel.mk
ifneq ($(filter arm arm64, $(TARGET_ARCH)),)

#####################################################################
# -----------------------------------------------------------------------------
# Builds android.hardware.drm@1.1-service.widevine
#
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := android.hardware.drm@1.1-service.widevine
LOCAL_INIT_RC := android.hardware.drm@1.1-service.widevine.rc
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/bin/hw
LOCAL_PROPRIETARY_MODULE := true
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_SHARED_LIBRARIES := android.hardware.drm@1.0 android.hardware.drm@1.1 libbase libbinder \
	libc++ libc libdl libhidltransport libhwbinder liblog libm libutils libwvhidl
LOCAL_ALLOW_UNDEFINED_SYMBOLS := true
include $(BUILD_PREBUILT)

# libwvhidl.so
include $(CLEAR_VARS)
LOCAL_MODULE := libwvhidl
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_SRC_FILES := $(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_PROPRIETARY_MODULE := true
LOCAL_STRIP_MODULE := false
LOCAL_32_BIT_ONLY := true
LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES := android.hardware.drm@1.0 android.hardware.drm@1.1 \
	android.hidl.memory@1.0 libc++ libc libcutils libdl libhidlbase libhidlmemory libhidltransport \
	libhwbinder liblog libm libprotobuf-cpp-lite libutils
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

endif # TARGET_ARCH == arm

