return {
   -- ############-- DON'T TOUCH ALL BELOW
   DOTFILES = "$HOME/dotfiles",
   -- see https://standards.freedesktop.org/basiir-spec/basedir-spec-latest.html
   XDG_CONFIG_HOME = "$HOME/.config",
   XDG_CONFIG_LINK = "$DOTFILES/.config",
   XDG_DATA_HOME = "$HOME/.local/share",
   XDG_DATA_DIRS = "/usr/local/share/:/usr/share/",
   XDG_CONFIG_DIRS = "/etc/xdg",
   XDG_CACHE_HOME = "$HOME/cache",

   EDITOR = "nvim",
   GIT_PAGER = "delta",
   GIT_EDITOR = "$EDITOR",
   FPP_EDITOR = "$EDITOR",
   BROWSER = '/Applications/Google Chrome.app',

   NVIM_DIR = "$XDG_CONFIG_HOME/nvim",
   FISH_DIR = "$XDG_CONFIG_HOME/fish",
   NUSHELL_DIR = "$XDG_CONFIG_HOME/nu",
   TMUX_DIR = "$HOME/.tmux",
   ALACRITTY_DIR = "$XDG_CONFIG_HOME/alacritty",
   WEZTERM_DIR = "$XDG_CONFIG_HOME/wezterm",
   ZELLIJ_DIR = "$XDG_CONFIG_HOME/zellij",
   VIMRC = "$NVIM_DIR/init.lua",
   GIT_CONFIG_HOME = "$XDG_CONFIG_HOME/git",
   GIT_CONFIG_GLOBAL = "$GIT_CONFIG_HOME/config",
   RCFILE = "$FISH_DIR/config.fish",
   TMUXFILE = "$HOME/.tmux.conf",
   ZELLIJ_FILE = "$ZELLIJ_DIR/config.kdl",
   -- ############-- DON'T TOUCH ALL ABOVE

   APPDATA = "$HOME",
   PATH = "$PATH $HOME/bin $DOTFILES/bin",
}
