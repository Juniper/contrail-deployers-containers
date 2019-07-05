TARGET_NAME := $(lastword $(subst /, ,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))
ALL_DEPLOYERS+=$(TARGET_NAME)

deployer-$(TARGET_NAME): $(DEPLOYER_BASE_TARGET)
	@$(DEPLOYERS_DIR)/build.sh $(subst deployer-, ,$@)

.PHONY: $(TARGET_NAME)

