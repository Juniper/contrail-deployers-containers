TARGET_NAME := $(lastword $(subst /, ,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))

deployer-$(TARGET_NAME): deployer-deployers-base
	@$(DEPLOYERS_DIR)/build.sh $(subst deployer-, ,$@)

.PHONY: $(TARGET_NAME)

