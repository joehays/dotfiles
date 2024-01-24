#!/bin/bash

# Bash script for installing VS Code extensions

# Set the path to VS Code executable
code_path="/mnt/c/Users/jhays/AppData/Local/Programs/Microsoft VS Code/Code.exe"
# Alternatively, you can use the following line if the path is bin/code
# code_path="/mnt/c/Users/jhays/AppData/Local/Programs/Microsoft VS Code/bin/code"

# Read the filename from the command line argument

SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"; ));
filename="${SCRIPT_ABS_DIR}/extensions.txt"

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File not found: $filename"
    exit 1
fi

# Install each extension
while IFS= read -r line || [[ -n "$line" ]]; do
    # Skip lines starting with #
    if [[ $line != \#* ]]; then
        echo "Processing extension: $line"
        #"$code_path" --install-extension "$line" --force
        code --install-extension "$line" --force
    fi
done < extensions.txt

echo "All extensions installed successfully."

# 
# # TODO
# # Needs updating given this [response](https://github.com/microsoft/vscode/issues/201148#issuecomment-1883326027)
# 
# 
# echo
# echo '============================================================'
# echo 'PROGRAMS/VSC.SH'
# echo '============================================================'
# 
# # https://code.visualstudio.com/docs/setup/linux
# if [ ! -f /etc/apt/trusted.gpg.d/microsoft.gpg ]; then
#   curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
#   sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
# fi [ ! -f /etc/apt/sources.list.d/vscode.list]; then
#   sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
#   sudo apt install -y apt-transport-https
#   sudo apt update
# fi
# 
# echo
# echo '------------------------------'
# echo '⌨️  Installing VSCode'
# echo '------------------------------'
# ${APT_INSTALL} code
# #rm microsoft.gpg
# 
# function install {
#   name="${1}"
#   code --install-extension ${name} --force
# }
# 
# # https://code.visualstudio.com/docs/editor/settings-sync
# 
# # https://stackoverflow.com/questions/35773299/how-can-you-export-the-visual-studio-code-extension-list
# ## [linux export] `code --list-extensions | xargs -L 1 echo code --install-extension`, or,
# ## [linux export] `code --list-extensions > vscode-extensions.list`
# ## [linux install] `cat vscode-extensions.list | xargs -L 1 code --install-extension`
# ## [windows export] `code --list-extensions | % { "code --install-extension $_" }`, or,
# ## [windows export] `code --list-extensions > vscode-extensions.list`
# ## [windows install] `Get-Content vscode_extensions.list | ForEach-Object { code --install-extension $_ }`
# ## [windows install] "C:\Program Files\Microsoft VS Code\bin\code" --install-extension vscodevim.vim
# ## [windows install from WSL] /mnt/c/Users/jhays/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe --install-extension 
# 
# 
# echo
# echo '------------------------------'
# echo '⌨️  Installing VSCode EXTENSIONS'
# echo '------------------------------'
# # unique at home
# code --install-extension johnpapa.vscode-peacock
# #code --install-extension SeyyedKhandon.firacode
# code --install-extension streetsidesoftware.code-spell-checker
# 
# # extensions at work
# #code --install-extension bierner.markdown-preview-github-styles        # dup w/ shd101wyy.markdown-preview-enhanced ???
# code --install-extension DavidAnson.vscode-markdownlint
# code --install-extension dracula-theme.theme-dracula
# #code --install-extension fabiospampinato.vscode-terminals              #don't-use-anymore ???
# code --install-extension Gruntfuggly.todo-tree
# code --install-extension James-Yu.latex-workshop
# code --install-extension jeff-hykin.better-cpp-syntax
# code --install-extension josetr.cmake-language-support-vscode
# code --install-extension julialang.language-julia                      #don't-use-anymore ???
# code --install-extension kriegalex.vscode-cudacpp                      # ???
# code --install-extension L13RARY.l13-diff                              # ???
# code --install-extension luggage66.AWK                                 # ???
# code --install-extension ms-azuretools.vscode-docker
# code --install-extension ms-dotnettools.vscode-dotnet-runtime
# code --install-extension ms-python.isort
# code --install-extension ms-python.python
# code --install-extension ms-python.vscode-pylance
# code --install-extension ms-toolsai.jupyter
# code --install-extension ms-toolsai.jupyter-keymap
# code --install-extension ms-toolsai.jupyter-renderers
# code --install-extension ms-toolsai.vscode-jupyter-cell-tags
# code --install-extension ms-toolsai.vscode-jupyter-slideshow
# code --install-extension ms-vscode-remote.remote-containers
# code --install-extension ms-vscode-remote.remote-ssh
# code --install-extension ms-vscode-remote.remote-ssh-edit
# code --install-extension ms-vscode-remote.remote-wsl
# code --install-extension ms-vscode-remote.vscode-remote-extensionpack
# code --install-extension ms-vscode.cmake-tools
# code --install-extension ms-vscode.cpptools
# code --install-extension ms-vscode.cpptools-themes
# code --install-extension ms-vscode.remote-explorer
# code --install-extension ms-vscode.remote-server
# code --install-extension negokaz.live-server-preview                   #sus !!!
# code --install-extension ritwickdey.LiveServer                         #sus !!!
# code --install-extension shd101wyy.markdown-preview-enhanced           # dup w/ bierner.markdown-preview-github-styles ???
# code --install-extension spadin.remote-x11-ssh                         #don't-use-anymore ???
# code --install-extension twxs.cmake
# code --install-extension VisualStudioExptTeam.intellicode-api-usage-examples
# code --install-extension VisualStudioExptTeam.vscodeintellicode
# code --install-extension vscode-org-mode.org-mode                      #don't-use-anymore ???
# code --install-extension vscodevim.vim
# code --install-extension yzhang.markdown-all-in-one
# code --install-extension zhuangtongfa.material-theme                   # ???
# 
# 
# # from Victoria Drake
# #install arcticicestudio.nord-visual-studio-code
# #install batisteo.vscode-django
# #install bibhasdn.django-html
# #install byi8220.indented-block-highlighting
# #install davidanson.vscode-markdownlint
# #install foxundermoon.shell-format
# #install glen-84.sass-lint
# #install golang.go
# #install hookyqr.beautify
# #install joaompinto.vscode-graphviz
# #install killalau.vscode-liquid-snippets
# #install neilding.language-liquid
# #install redhat.vscode-yaml
# #install rido3.wordcount
# #install simonsiefke.svg-preview
# #install streetsidesoftware.code-spell-checker
# #install victoriadrake.kabukicho
# #install vscode-icons-team.vscode-icons
# 
