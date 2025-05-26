{

	# Add support for special terminals

programs.zsh = {
	initContent = ''

	if [ $TERM = 'xterm-kitty' ]
	then
	alias ssh='kitty +kitten ssh'
	else
	fi

	'';
};
}
