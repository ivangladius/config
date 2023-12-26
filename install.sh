#!/bin/bash


PROTOCOL=$1
ZELLIJ_PATH="$HOME/.config/zellij"
NVIM_PATH="$HOME/.config/nvim"
RANGER_PATH="$HOME/.config/ranger"
BASHRC_PATH="$HOME/.bashrc"
LAZYGIT_PATH="$HOME/.config/lazygit"
SCRIPTS_PATH="$HOME/scripts"





#save all old directories

# nvim config
#


set -x
create_backups() {
	BACKUP_DIR="$HOME/.backup"
	echo "$ZELLIJ_PATH" "$BACKUP_DIR/${ZELLIJ_PATH##*/}"
	echo "$NVIM_PATH" "$BACKUP_DIR/${NVIM_PATH##*/}"
	echo "$RANGER_PATH" "$BACKUP_DIR/${RANGER_PATH##*/}"
	echo "$LAZYGIT_PATH" "$BACKUP_DIR/${LAZYGIT_PATH##*/}"
	echo "$SCRIPTS_PATH" "$BACKUP_DIR/${SCRIPTS_PATH##*/}"
}


git_clone_and_move() {
	if [[ "$PROTOCOL" == "https" || "$PROTOCOL" == "http" ]];then
		GH_ADDRESS="https://github.com/ivangladius"
	elif [[ "$PROTOCOL" == "ssh" ]];then
		GH_ADDRESS="git@github.com:ivangladius"
	else 
		echo "unknown protocol"
		exit 1
	fi

	echo -e "cloning $GH_ADDRESS/$1" "$2"
	if [[ ! -e "$1" ]];then
		echo "ERROR: could not clone $1"
		exit 1
	fi
}

create_backups

git_clone_and_move nvim "$NVIM_PATH"
git_clone_and_move zellij "$ZELLIJ_PATH"
git_clone_and_move ranger "$RANGER_PATH"
git_clone_and_move lazygit "$LAZYGIT_PATH"
git_clone_and_move scripts "$SCRIPTS_PATH"


echo "done"

exit 1








	



