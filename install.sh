#!/usr/bin/env bash
{ # This ensures the entire script is downloaded.  set -eo pipefail

basedir="$HOME/.dotfiles"
bindir="$HOME/bin"
repourl="https://github.com/zmzhuai/dotfiles.git"

function symlink() {
  src="$1"
  dest="$2"

  if [ -e "$dest" ]; then
    if [ -L "$dest" ]; then
      # Already symlinked -- I'll assume correctly.
      return
    else
      # Rename files with a ".old" extension.
      echo "$dest already exists, renaming to $dest.old"
      backup="$dest.old"
      if [ -e "$backup" ]; then
        echo "Error: "$backup" already exists. Please delete or rename it."
        exit 1
      fi
      mv -v "$dest" "$backup"
    fi
  fi
  ln -sf "$src" "$dest"
}

if ! which git >/dev/null ; then
  echo "Error: git is not installed"
  exit 1
fi

if [ -d "$basedir/.git" ]; then
  echo "Updating dotfiles using existing git..."
  cd "$basedir"
  git pull --quiet --rebase origin master
  git submodule update --init --recursive
else
  echo "Checking out dotfiles using git..."
  rm -rf "$basedir"
  git clone --quiet --depth=1 "$repourl" "$basedir"
  git submodule update --init --recursive
fi

cd "$basedir"

echo "Creating symlinks..."
for path in .* ; do
  case "$path" in
    .|..|.git)
      continue
      ;;
    *)
      symlink "$basedir/$path" "$HOME/$path"
      ;;
  esac
done
symlink "$basedir/.vim/vimrc" "$HOME/.vimrc"
# symlink "$basedir/.vim/gvimrc" "$HOME/.gvimrc"

echo "Adding executables to ~/bin/..."
mkdir -p "$bindir"
for path in bin/* ; do
  symlink "$basedir/$path" "$bindir/$(basename $path)"
done

echo "Setting up vim plugins..."
.vim/update.sh

echo "Setting up git..."
cp "$basedir/.gitconfig.base" "$HOME/.gitconfig"
if which git-lfs >/dev/null 2>&1 ; then
  git lfs install
fi

if which zsh >/dev/null 2>&1 ; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
else
  echo "Skipping zsh plugin setup because zsh isn't installed."
fi

if which tmux >/dev/null 2>&1 ; then
  echo "Setting up tmux..."
  if [ -e "$HOME/.tmux/plugins/tpm" ]; then
    pushd "$HOME/.tmux/plugins/tpm" >/dev/null
    git pull -q origin master
    popd >/dev/null
  else
    git clone -q https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  fi
  $HOME/.tmux/plugins/tpm/scripts/install_plugins.sh >/dev/null
  $HOME/.tmux/plugins/tpm/scripts/clean_plugins.sh >/dev/null
  $HOME/.tmux/plugins/tpm/scripts/update_plugin.sh >/dev/null
else
  echo "Skipping tmux setup because tmux isn't installed."
fi

if which composer >/dev/null 2>&1 ; then
    symlink "$basedir/composer.json" "$HOME/.composer/composer.json"
    composer require global felixfbecker/language-server
    cd ~/.composer
    composer run-script --working-dir=vendor/felixfbecker/language-server parse-stubs
else
  echo "Skipping composer setup because composer isn't installed."
fi

postinstall="$HOME/.postinstall"
if [ -e "$postinstall" ]; then
  echo "Running post-install..."
  . "$postinstall"
else
  echo "No post install script found. Optionally create one at $postinstall"
fi

echo "Done."

} # This ensures the entire script is downloaded.
