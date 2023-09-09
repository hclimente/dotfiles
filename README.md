```
alias dit="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
git clone --bare git@github.com:hclimente/dotfiles.git $HOME/.cfg/
dit checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
else
  mkdir -p dotfiles-backup/.config dotfiles-backup/.nextflow
  echo "Backing up pre-existing dot files.";
  dit checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} dotfiles-backup/{}
fi;
dit checkout
dit config status.showUntrackedFiles no
```

Inspired by [this tutorial](https://www.atlassian.com/git/tutorials/dotfiles).

# Installation

```
export DOTFILES_CFG=$HOME/.dotfiles-cfg/

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
export PATH=$HOME/.linuxbrew/bin:$PATH

# install zsh and oh-my-zsh
brew install zsh bash-completion
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## install plugins
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/z-shell/F-Sy-H.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/F-Sy-H
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

mv .zshrc.pre-oh-my-zsh .zshrc
echo "source $DOTFILES_CFG/bashrc" >>.bashrc

# basic cli tools
brew install tmux gcc findutils z eza nvim rg bat node fzf

# install 
git clone https://github.com/gpakosz/.tmux.git ~/.oh-my-tmux
ln -s -f ~/.oh-my-tmux/.tmux.conf ~/.tmux.conf
cp ~/.oh-my-tmux/.tmux.conf.local ~/.tmux.conf.local

# nextflow
brew cask install java
curl -s https://get.nextflow.io | bash
mkdir bin && mv nextflow bin/
dit reveal

# conda environments
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda
conda install cookiecutter nextflow mamba pre_commit -n base -c conda-forge

## general (python + R)
mamba create --name general --file $DOTFILES_CFG/conda/general.txt && conda activate general && echo "libblas[build=*mkl]" >> ${CONDA_PREFIX}/conda-meta/pinned

## laptop (general + jupyter)
mamba create --name laptop --channel dglteam --file $DOTFILES_CFG/conda/general.txt --file $DOTFILES_CFG/conda/laptop.txt && conda activate laptop && echo "libblas[build=*mkl]" >> ${CONDA_PREFIX}/conda-meta/pinned

## gpu (general + gpu)
mamba create --name gpu --channel dglteam --file $DOTFILES_CFG/conda/general.txt --file $DOTFILES_CFG/conda/gpu.txt && conda activate gpu && echo "libblas[build=*mkl]" >> ${CONDA_PREFIX}/conda-meta/pinned

## development
mamba create --name dev --file $DOTFILES_CFG/conda/dev.txt --file $DOTFILES_CFG/conda/general.txt && conda activate dev && echo "libblas[build=*mkl]" >> ${CONDA_PREFIX}/conda-meta/pinned

# r environment
R -e "IRkernel::installspec()"
```

# Git secrets

To encrypt secrets:

```
dit secret hide
```

On a trusted machine:

```
gpg --export-secret-key me@mail.com > ~/my-key.asc
scp my-key.asc me@server:~/
```

On the new machine:

```
brew install git-secret

gpg --import my-key.asc
dit secret tell me@mail.com
dit secret reveal
```

Follow instructions from https://git-secret.io/ to encrypt/decrypt secrets.

# Additional macOS software and configurations

```
brew install --cask anki
brew install --cask firefox
brew install --cask finicky
brew install --cask hiddenbar
brew install --cask kitty
brew install --cask mtmr # for macbooks with a touchbar
brew tap homebrew/cask-fonts && brew install --cask font-jetbrains-mono
brew install --cask spotify
brew install --cask docker
brew install --cask iina
brew install cookiecutter
brew install dvc
brew install --cask zotero
brew install --cask aerial

# hide native tabs in Firefox
# https://gist.github.com/ruanbekker/f800e098936b27c7cf956c56005fe362
# https://github.com/piroor/treestyletab/wiki/Code-snippets-for-custom-style-rules#for-userchromecss
```

```
defaults write -g ApplePressAndHoldEnabled -bool true
```

```
ln -s $HOME/.config/firefox/userChrome.css
```

# For older servers

```
# edit or create ~/.curlrc file and add "--insecure" to it then:
HOMEBREW_CURLRC=1 brew install curl
# delete ~/.curlrc file or remove the "--insecure" from it
```
