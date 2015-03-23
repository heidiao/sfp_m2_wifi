TARGET_OUT_WLAN_FW := $(TARGET_OUT)/system/vendor/firmware
TARGET_OUT_ETC_WIFI := $(TARGET_OUT)/system/etc/wifi
LOCAL_IWL_FW_DIR := hardware/imc/wlan/iwl-firmware

IWL_UCODE_FILES := $(notdir $(wildcard $(LOCAL_IWL_FW_DIR)/*8000*.ucode))

#copy the nvmData file and all the ucode files to $(TARGET_OUT_WLAN_FW)
# copying nvm to firmware is temporary
PRODUCT_COPY_FILES := \
	$(LOCAL_IWL_FW_DIR)/nvmData-8000:$(TARGET_OUT_WLAN_FW)/nvmData \
	$(LOCAL_IWL_FW_DIR)/nvmData-8000-source:$(TARGET_OUT_ETC_WIFI)/nvmDataDefault \
	$(LOCAL_IWL_FW_DIR)/fw_info.txt:$(TARGET_OUT_WLAN_FW)/fw_info.txt \
	$(foreach ucode,$(IWL_UCODE_FILES),\
		$(LOCAL_IWL_FW_DIR)/$(ucode):$(TARGET_OUT_WLAN_FW)/$(ucode)) \
