{

	home.sessionVariables = {
		XDG_DATA_HOME = "$HOME/.local/share";
		XDG_CONFIG_HOME = "$HOME/.config";
		XDG_STATE_HOME = "$HOME/.local/state";
		XDG_CACHE_HOME = "$HOME/.cache";
	
		# Setting vars according to xdg-ninja's recommendations
		GNUPGHOME = "$XDG_DATA_HOME/gnupg";
		GRADLE_USER_HOME = "$XDG_DATA_HOME/gradle";
		LESSHISTFILE = "$XDG_STATE_HOME/lesshst";
		DVDCSS_CACHE = "$XDG_DATA_HOME/dvdcss";
		MPLAYER_HOME = "$XDG_CONFIG_HOME/mplayer";
		TERMINFO = "$XDG_DATA_HOME/terminfo";
		TERMINFO_DIRS = "$XDG_DATA_HOME/terminfo:/usr/share/";
		NPM_CONFIG_INIT_MODULE = "$XDG_CONFIG_HOME/npm/config/npm-init.js";
		NPM_CONFIG_CACHE = "$XDG_CACHE_HOME/npm";
		NPM_CONFIG_TMP = "$XDG_RUNTIME_DIR/npm";
		_JAVA_OPTIONS = "-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java";
		PYTHON_HISTORY = "$XDG_CACHE_HOME/python/python_history";
		TLDR_CACHE_DIR = "$XDG_CACHE_HOME/tldr";
		XCOMPOSECACHE = "$XDG_CACHE_HOME/X11/xcompose";
		HISTFILE = "$XDG_STATE_HOME/zsh/history";
		ZDOTDIR = "$XDG_CONFIG_HOME/zsh";
	};

}	



