```
git clone git@github.com:hclimente/dotfiles.git .dotfiles
brew install stow
cd .dotfiles && stow .
```

Then, run the [script for MacOS](install/mac_config.sh) and/or for [Unix](install/unix_config.sh).

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

# tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# nextflow
brew cask install java
curl -s https://get.nextflow.io | bash
mkdir bin && mv nextflow bin/

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

