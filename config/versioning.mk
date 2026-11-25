#
# Copyright (C) 2018-2019 The Pixel3ROM Project
# Copyright (C) 2020 Raphielscape LLC. and Haruka LLC.
# Copyright (C) 2020 StormbreakerOSS
# Copyright (C) 2021-2023 Miku UI
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

PLATFORM_HSIN_RELEASE := Moon_fox
PLATFORM_HSIN_VERSION := $(PLATFORM_HSIN_RELEASE).$(shell date +%y%m%d%H)

HSIN_ROM_VERSION := Moon_fox_1.0

TARGET_PRODUCT_SHORT := $(subst hsin_,,$(TARGET_DEVICE))

ifeq ($(HSIN_GAPPS), true)
    $(call inherit-product, vendor/gapps/arm64/arm64-vendor.mk)
    HSIN_TYPE = GAPPS-
endif

ifeq ($(TARGET_HSIN_BUILD_VARIANT),OFFICIAL)
    PLATFORM_HSIN_VERSION := $(PLATFORM_HSIN_RELEASE)
    PROD_VERSION += HsinOS-$(PLATFORM_HSIN_VERSION)-$(TARGET_DEVICE)-$(shell date +%y%m%d%H)-$(HSIN_TYPE)OFFICIAL
else ifeq ($(TARGET_HSIN_BUILD_VARIANT),COMMUNITY)
    PLATFORM_HSIN_VERSION := $(PLATFORM_HSIN_RELEASE)
    PROD_VERSION += HsinOS-$(PLATFORM_HSIN_VERSION)-$(TARGET_DEVICE)-$(shell date +%y%m%d%H)-$(HSIN_TYPE)COMMUNITY
else
    PLATFORM_HSIN_VERSION := $(PLATFORM_HSIN_RELEASE)
    TARGET_HSIN_BUILD_VARIANT := UNOFFICIAL
    PROD_VERSION += HsinOS-$(PLATFORM_HSIN_VERSION)-$(TARGET_DEVICE)-$(shell date +%y%m%d%H)-$(HSIN_TYPE)UNOFFICIAL
endif

ifeq ($(HSIN_MASTER),)
    TARGET_HSIN_MASTER := BuildBot
else
    TARGET_HSIN_MASTER := $(HSIN_MASTER)
endif

PRODUCT_PRODUCT_PROPERTIES += \
    ro.system.hsin.version=$(PLATFORM_HSIN_VERSION)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.hsin.version=$(HSIN_ROM_VERSION) \
    ro.hsin.buildtype=$(TARGET_HSIN_BUILD_VARIANT) \
    ro.hsin.maintainer=$(TARGET_HSIN_MASTER)

