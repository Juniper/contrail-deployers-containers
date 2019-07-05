# DEPLOYERS_BASE_CONTAINER env variable might be 'contrail-general-base' 
DB_DEPS := $(shell echo $(DEPLOYERS_BASE_CONTAINER) | grep contrail | sed 's/contrail-//g')

TARGET_NAME := $(lastword $(subst /, ,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))
deployer-$(TARGET_NAME): $(DB_DEPS)
	@$(DEPLOYERS_DIR)/build.sh $(subst deployer-, ,$@)

.PHONY: $(TARGET_NAME)