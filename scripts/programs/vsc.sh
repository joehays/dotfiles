#!/bin/bash

# https://code.visualstudio.com/docs/setup/linux
if [ ! -f /etc/apt/trusted.gpg.d/microsoft.gpg ]; then
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
fi [ ! -f /etc/apt/sources.list.d/vscode.list]; then
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
  sudo apt install -y apt-transport-https
  sudo apt update
fi

echo "⌨️  Installing VSCode"
sudo apt install -y code
rm microsoft.gpg
function install {
  name="${1}"
  code --install-extension ${name} --force
}

# https://code.visualstudio.com/docs/editor/settings-sync

# https://stackoverflow.com/questions/35773299/how-can-you-export-the-visual-studio-code-extension-list
## [linux export] `code --list-extensions | xargs -L 1 echo code --install-extension`
## [windows export] `code --list-extensions | % { "code --install-extension $_" }` 


# unique at home
install johnpapa.vscode-peacock
install SeyyedKhandon.firacode
install streetsidesoftware.code-spell-checker

# extensions at work
install bierner.markdown-preview-github-styles        # dup w/ shd101wyy.markdown-preview-enhanced ???
install DavidAnson.vscode-markdownlint
install dracula-theme.theme-dracula
install fabiospampinato.vscode-terminals              #don't-use-anymore ???
install Gruntfuggly.todo-tree
install James-Yu.latex-workshop
install jeff-hykin.better-cpp-syntax
install josetr.cmake-language-support-vscode
install julialang.language-julia                      #don't-use-anymore ???
install kriegalex.vscode-cudacpp                      # ???
install L13RARY.l13-diff                              # ???
install luggage66.AWK                                 # ???
install ms-azuretools.vscode-docker
install ms-dotnettools.vscode-dotnet-runtime
install ms-python.isort
install ms-python.python
install ms-python.vscode-pylance
install ms-toolsai.jupyter
install ms-toolsai.jupyter-keymap
install ms-toolsai.jupyter-renderers
install ms-toolsai.vscode-jupyter-cell-tags
install ms-toolsai.vscode-jupyter-slideshow
install ms-vscode-remote.remote-containers
install ms-vscode-remote.remote-ssh
install ms-vscode-remote.remote-ssh-edit
install ms-vscode-remote.remote-wsl
install ms-vscode-remote.vscode-remote-extensionpack
install ms-vscode.cmake-tools
install ms-vscode.cpptools
install ms-vscode.cpptools-themes
install ms-vscode.remote-explorer
install ms-vscode.remote-server
install negokaz.live-server-preview                   #sus !!!
install ritwickdey.LiveServer                         #sus !!!
install shd101wyy.markdown-preview-enhanced           # dup w/ bierner.markdown-preview-github-styles ???
install spadin.remote-x11-ssh                         #don't-use-anymore ???
install twxs.cmake
install VisualStudioExptTeam.intellicode-api-usage-examples
install VisualStudioExptTeam.vscodeintellicode
install vscode-org-mode.org-mode                      #don't-use-anymore ???
install vscodevim.vim
install yzhang.markdown-all-in-one
install zhuangtongfa.material-theme                   # ???


# from Victoria Drake
#install arcticicestudio.nord-visual-studio-code
#install batisteo.vscode-django
#install bibhasdn.django-html
#install byi8220.indented-block-highlighting
#install davidanson.vscode-markdownlint
#install foxundermoon.shell-format
#install glen-84.sass-lint
#install golang.go
#install hookyqr.beautify
#install joaompinto.vscode-graphviz
#install killalau.vscode-liquid-snippets
#install neilding.language-liquid
#install redhat.vscode-yaml
#install rido3.wordcount
#install simonsiefke.svg-preview
#install streetsidesoftware.code-spell-checker
#install victoriadrake.kabukicho
#install vscode-icons-team.vscode-icons

