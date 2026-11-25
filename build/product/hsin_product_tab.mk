#
# Copyright (C) 2018 The Android Open Source Project
# Copyright (C) 2021-2022 Miku UI
# Copyright (C) 2026 Hsin OS
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
#

# Inherit from our versioning
$(call inherit-product, vendor/hsin/config/versioning.mk)

# Inherit from our overlay
$(call inherit-product, vendor/hsin/config/overlay.mk)

# Sign for official build
ifeq ($(TARGET_FORCE_SIGN_CHECK),true)
$(call inherit-product, vendor/hsin-secret/keys/sign.mk)
else
$(call inherit-product-if-exists, vendor/hsin-secret/keys/sign.mk)
endif

ifneq ($(TARGET_DISABLE_EPPE),true)
# Require all requested packages to exist
$(call enforce-product-packages-exist-internal,$(wildcard device/*/$(HSIN_BUILD)/$(TARGET_PRODUCT).mk),product_manifest.xml rild Calendar Launcher3 Launcher3Go Launcher3QuickStep Launcher3QuickStepGo android.hidl.memory@1.0-impl.vendor vndk_apex_snapshot_package)
endif

# 2-Pane layout
PRODUCT_PACKAGES += \
    androidx.window.extensions

# Applications
ifneq ($(TARGET_NO_APERTURE),true)
    PRODUCT_PACKAGES += Aperture
else
    PRODUCT_PACKAGES += Camera2
endif

PRODUCT_PACKAGES += \
    Gboard \
    LiveWallpapersPicker \
    PartnerBookmarksProvider \
    ThemePicker \
    ThemesStub

# Lineage AudioFX
ifneq ($(TARGET_EXCLUDES_AUDIOFX),true)
PRODUCT_PACKAGES += \
    AudioFX
endif

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/hsin/bootanimation/bootanimation.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
    
# Charger mode images
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images

# Ringtone
PRODUCT_COPY_FILES += \
    vendor/hsin/ringtone/peritune_where_fairies_hide.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/peritune_where_fairies_hide.ogg \
    vendor/hsin/ringtone/hsin_moon_dew_drop.wav:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/hsin_moon_dew_drop.wav

PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.ringtone=peritune_where_fairies_hide.ogg \
    ro.config.notification_sound=hsin_moon_dew_drop

# Performance Mode
PRODUCT_COPY_FILES += \
    vendor/hsin/prebuilt/common/etc/init/init.hsin.performance_mode.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/init.hsin.performance_mode.rc

# HsinWallpapers
PRODUCT_PACKAGES += \
    HsinWallpapers

# ThemeOverlays
include packages/overlays/Themes/themes.mk

# Compile everything
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := everything

# Disable extra StrictMode features on all non-engineering builds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.strictmode.disable=true
