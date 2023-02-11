BASE_DIR=$(shell pwd)

.PHONY: init-gitconfig
init-gitconfig:
	[ -f ~/.gitconfig ] || touch ~/.gitconfig
	grep "\[include\]" ~/.gitconfig  --quiet || ( \
		echo "[include]" >> ~/.gitconfig && \
		echo "  path = ${BASE_DIR}/.gitconfig" >> ~/.gitconfig)
	grep "\[includeIf" ~/.gitconfig --quiet || ( \
		echo '# [includeIf "gitdir:~/work/"]' >> ~/.gitconfig && \
		echo '#	path = ~/.work.gitconfig' >> ~/.gitconfig)

~/.gitconfig:
	$(MAKE) init-gitconfig
