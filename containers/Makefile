DEPLOYERS_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# include all containers targets
-include $(DEPLOYERS_DIR)/*/module.mk

list-deployers:
	@$(DEPLOYERS_DIR)/build.sh list | grep -v INFO | sed -e 's,/,_,g' -e 's/^/deployer-/'

all-deployers: 
	$(MAKE) $$($(DEPLOYERS_DIR)/build.sh list | grep -v INFO | sed -e 's,/,_,g' -e 's/^/deployer-/')

.PHONY: list-deployers all-deployers
