install:
	@echo "This is going to add the following commands to your bashrc:"
	@grep "^[^#;]" ./.kutectl.bash
	@echo -n "Are you sure? [Y/n] " && read ans && [ $${ans:-Y} = Y ]
	@cp .kutectl.bash ~/.kutectl.bash
	@grep -qxF '. ~/.kutectl.bash' ~/.bashrc || echo -e '\n. ~/.kutectl.bash' >> ~/.bashrc
	@source ~/.bashrc

uninstall:
	@echo -n "Are you sure? [y/N] " && read ans && [ $${ans:-N} = y ]
	@sed -i '/\. \~\/.kutectl.bash/g' ~/.bashrc

.PHONY: install
.PHONY: uninstall

.DEFAULT_GOAL := install
SHELL := /bin/bash
