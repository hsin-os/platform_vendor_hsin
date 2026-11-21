#
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

TARGET_FILES_PACKAGE := $(PRODUCT_OUT)/$(PROD_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: hsin
hsin: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(TARGET_FILES_PACKAGE)
	$(hide) $(SHA256) $(TARGET_FILES_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(TARGET_FILES_PACKAGE).sha256sum
	@echo -e ${CL_RED}"hsin"${CL_RST}
	@echo -e ${CL_RED}"\033[31m                          ckxo;,\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m                           ;kKK0ko;.\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m                            .dKKKKKOd:\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m                              l0KKKKK0x;\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m                               ;OKKKKKKKo.\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m                cdooolcc;;.     ;0KKKKKKKd.\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m                oKKKKKKKxc.      c0KKKKKKKc\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m                oKKKKKK0:         oKKKKKKKl\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m                oKKKKKK0:         .kKKKKKx,\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m       .d;      oKKKKKK0:          .;lol:     .,\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m       ,OO,     oKKKKKK0:                     ,dxl:\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m       :0Ko     oKKKKKK0:                       oKKkl,\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m       lKKO,    oKKKKKK0:                        l0KKOo:\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m      ,kKKKl    oKKKKKK0:                         oKKKK0o,\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m      oKKKKx    oKKKKKK0:                         .xKKKKKOc\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m     c0KKKKk.   oKKKKKK0:                          ;0KKKKKKd.\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m    :OKKKKKx    oKKKKKK0:                           dKKKKKKKd.\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m   c0KKKKKKo    oKKKKKK0:                           :0KKKKKKKl\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m ,dKKKKKKK0:    oKKKKKK0:                      .:    xKKKKKKKk\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31ml0KKKKKKKKl     oKKKKKK0:                      cx    lKKKKKKKk\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31mOKKKKKKK0l      oKKKKKK0:                     :Ok.   ;KKKKKKKo\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31mcOKKKK0k;       oKKKKKK0:                    .xKO,   ,kKKKK0o.\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m .;cc;,         oKKKKKK0:                    lKKO,     :llc,\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m                oKKKKKKKc                  ,l0KK0;.               ██   ██ ███████ ██ ███    ██      ██████  ███████\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m                oKKKKKKKKOkkkkkkkkkkkkkkOOO0KKKKKKOl              ██   ██ ██      ██ ████   ██     ██    ██ ██     \033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m                lKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKO,             ███████ ███████ ██ ██ ██  ██     ██    ██ ███████\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m                .dKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKOc              ██   ██      ██ ██ ██  ██ ██     ██    ██      ██\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m                  :ldxkOOOOOOOOOOOOOOOOOOkkxxdolc:.               ██   ██ ███████ ██ ██   ████      ██████  ███████\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31m------------------------------------------------------------------------------------------------------------------\033[0m"${CL_RST}
	@echo -e ${CL_RED}"\033[31mBuild Complete! Welcome to Hsin OS.\033[0m"${CL_RST}
	@echo "Package Complete: $(TARGET_FILES_PACKAGE)" >&2
	@echo "Package Sha256sum: `cat $(TARGET_FILES_PACKAGE).sha256sum | cut -d ' ' -f 1`" >&2
