{

	# Add support for special terminals

programs.zsh = {
	initContent = ''

	# Support for cool-retro-term hotkeys
	if [ $TERM = 'xterm' ]
	then
	bindkey '^H' backward-delete-char
	else
	fi

	# Add support here for TTY color schemes:


	'';
};
}
