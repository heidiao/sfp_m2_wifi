TARGET_OUT_WLAN_FW := $(TARGET_OUT)/system/vendor/firmware
TARGET_OUT_ETC_WIFI := $(TARGET_OUT)/system/etc/wifi
LOCAL_IWL_FW_DIR := hardware/imc/wlan/iwl-firmware

IWL_UCODE_FILES := $(notdir $(wildcard $(LOCAL_IWL_FW_DIR)/*a620*.ucode))
IWL_PAPD_DB_FILES := $(notdir $(shell find $(LOCAL_IWL_FW_DIR)/papd_db -type f))

#copy the nvmData file and all the ucode files to $(TARGET_OUT_WLAN_FW)
# copying nvm to firmware is temporary
PRODUCT_COPY_FILES := \
	$(LOCAL_IWL_FW_DIR)/nvmData-a620:$(TARGET_OUT_WLAN_FW)/nvmData \
	$(LOCAL_IWL_FW_DIR)/nvmData-a620:$(TARGET_OUT_ETC_WIFI)/nvmDataDefault \
	$(LOCAL_IWL_FW_DIR)/fw_info.txt:$(TARGET_OUT_WLAN_FW)/fw_info.txt \
	$(LOCAL_IWL_FW_DIR)/iwl-dbg-cfg.ini:$(TARGET_OUT_WLAN_FW)/iwl-dbg-cfg.ini \
	$(foreach ucode,$(IWL_UCODE_FILES),\
		$(LOCAL_IWL_FW_DIR)/$(ucode):$(TARGET_OUT_WLAN_FW)/$(ucode)) \
	$(foreach file,$(IWL_PAPD_DB_FILES),\
                $(LOCAL_IWL_FW_DIR)/papd_db/$(file):$(TARGET_OUT_ETC_WIFI)/papd_db/$(file))
