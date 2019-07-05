DE_DIR 	:= $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

-include $(DE_DIR)containers/Makefile
