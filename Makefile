CONTAINER ?= avdteam/base:3.6
HOME_DIR = $(shell pwd)
AVD_PLAYBOOK ?= playbooks/dc-fabric-config.yml


help: ## Display help message
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

################################################################################
# Alias Commands
################################################################################
.PHONY: wipe
wipe: ## Delete Intended Structured & EOS Configs
	rm -f inventory/intended/configs/*.cfg
	rm -f inventory/intended/structured_configs/*.yml

################################################################################
# AVD Commands
################################################################################

.PHONY: build
build: ## Run ansible playbook to build EVPN Fabric configuration.
	ansible-playbook $(AVD_PLAYBOOK) --tags build

.PHONY: provision
provision: ## Run ansible playbook to deploy EVPN Fabric.
	ansible-playbook $(AVD_PLAYBOOK) --tags provision

.PHONY: deploy
deploy: ## Run ansible playbook to deploy EVPN Fabric.
	ansible-playbook $(AVD_PLAYBOOK) --extra-vars "execute_tasks=true" --tags "build,provision,apply"

