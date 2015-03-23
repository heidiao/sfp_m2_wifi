# create the NVM file soft link
ifneq (,$(IWL_CREATE_NVM_LINK))
  include $(LOCAL_IWL_FW_DIR)/iwl-nvm-link.mk
endif
