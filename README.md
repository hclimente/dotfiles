```
alias dotfiles="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
git clone --bare git@github.com:hclimente/dotfiles.git $HOME/.cfg/
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
else
  mkdir -p dotfiles-backup
  echo "Backing up pre-existing dot files.";
  dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} dotfiles-backup/{}
fi;
dotfiles checkout
dotfiles config status.showUntrackedFiles no
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
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zdharma/fast-syntax-highlighting.git \
  ~ZSH_CUSTOM/plugins/fast-syntax-highlighting

mv .zshrc.pre-oh-my-zsh .zshrc
echo "source $DOTFILES_CFG/bashrc" >>.bashrc

# basic cli tools
brew install tmux gcc findutils z exa nvim rg bat node

## neovim config
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# remember to :PlugInstall!!

# nextflow
brew cask install java
curl -s https://get.nextflow.io | bash
mkdir bin && mv nextflow bin/

if grep --quiet `hostname` $DOTFILES_CFG/env/laptop_hosts; then ln -s $DOTFILES_CFG/nextflow/config_laptop $HOME/.nextflow/config;
elif grep --quiet `hostname` $DOTFILES_CFG/env/kyodai_hosts; then ln -s $DOTFILES_CFG/nextflow/config_server $HOME/.nextflow/config;
elif grep --quiet `hostname` $DOTFILES_CFG/env/slurm_hosts; then ln -s $DOTFILES_CFG/nextflow/config_slurm $HOME/.nextflow/config; fi

# conda environments
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && bash Miniconda3-latest-Linux-x86_64.sh
conda install mamba -n base -c conda-forge

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

# Additional macOS software

```
brew install --cask anki
brew install --cask firefox
brew install --cask pycharm-ce
brew install --cask finicky
brew install --cask dozer
brew tap homebrew/cask-fonts && brew install --cask font-fira-code
brew install --cask spotify
brew install --cask visual-studio-code
brew install --cask docker
brew install --cask signal
brew install --cask beardedspice

wget https://raw.githubusercontent.com/thisiscam/math-with-slack/master/math-with-slack.py && sudo python math-with-slack.py && rm math-with-slack.py
```
