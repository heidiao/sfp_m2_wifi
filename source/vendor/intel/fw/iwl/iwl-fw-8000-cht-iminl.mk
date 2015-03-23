TARGET_OUT_WLAN_FW := $(TARGET_OUT)/system/etc/firmware
LOCAL_IWL_FW_DIR := vendor/intel/fw/PRIVATE/wifi_intel/lnp
TARGET_OUT_WLAN_EXECUTABLES := $(TARGET_OUT)/system/bin
IWL_CREATE_NVM_LINK := true
NVM_TARGET_FILENAME = iwl_nvm.bin
NVM_TARGET_PATH = /factory/wlan/

IWL_UCODE_FILES := $(notdir $(wildcard $(LOCAL_IWL_FW_DIR)/*8000*.ucode))

# copy the NVM file and all the ucode files to $(TARGET_OUT_WLAN_FW)
PRODUCT_COPY_FILES := \
	$(LOCAL_IWL_FW_DIR)/iwl_nvm.bin:$(TARGET_OUT_WLAN_FW)/iwl_nvm_default.bin \
	$(LOCAL_IWL_FW_DIR)/change_mac_address.sh:$(TARGET_OUT_WLAN_EXECUTABLES)/change_mac_address.sh \
	$(LOCAL_IWL_FW_DIR)/generate_mac_address:$(TARGET_OUT_WLAN_EXECUTABLES)/generate_mac_address \
	$(LOCAL_IWL_FW_DIR)/fw_info.txt:$(TARGET_OUT_WLAN_FW)/fw_info.txt \
	$(foreach ucode,$(IWL_UCODE_FILES),\
		$(LOCAL_IWL_FW_DIR)/$(ucode):$(TARGET_OUT_WLAN_FW)/$(ucode)) \
