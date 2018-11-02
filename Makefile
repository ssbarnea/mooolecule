all: molecule
.PHONY: molecule
DIR := $(shell dirname $(realpath $(MAKEFILE_LIST)))
QS_DIR := $(shell dirname $(realpath $(DIR)))/tripleo-quickstart
#PYTHON_PATH := $(shell bash -c "source $(QS_DIR)/quickstart.sh --help >/dev/null; python_cmd")
# todo: user python_cmd from quickstart.sh ^
PYTHON_PATH := python
PYTHON_VERSION := $(shell $(PYTHON_PATH) --version 2>&1)
PLATFORM := $(shell uname -s | awk '{print tolower($$0)}')
red=\033[0;31m
yellow=\033[0;33m
end=\033[0m

molecule:
	@bash -c "test -f $(QS_DIR)/quickstart.sh || { echo 'ERROR: this needs to be run alonside tripleo-quickstart'; exit 1; }"
	@echo "INFO:	Building using $(yellow)$(PYTHON_PATH)$(end) [$(PYTHON_VERSION) @ $(PLATFORM)]"
	@command -v molecule >/dev/null || pip install --user molecule
	@bash -c "ANSIBLE_ROLES_PATH=$(QS_DIR) molecule test"
	# --destroy=always