# dotfiles

### Installation

1. `curl -sL https://raw.githubusercontent.com/zmzhuai/dotfiles/master/install.sh | bash`
2. install zsh plugin if use [Zsh](http://www.zsh.org/)`brew install zsh-autosuggestions zsh-syntax-highlighting`
3. `chsh` or otherwise set your shell to use [Zsh](http://www.zsh.org/)
4. Restart your shell

Optionally create a `.postinstall` with some machine-specific commands, like `git config --global user.email "my-work-email@example.com"`". You can also create a `.vimlocal` and `.gvimlocal` for machine-specific Vim customizations.
