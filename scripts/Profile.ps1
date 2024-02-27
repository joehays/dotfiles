# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.4
# copy to  $HOME\Documents\PowerShell\Profile.ps1

Import-WslCommand "apt", "awk", "emacs", "find", "grep", "head", "less", "ls", "man", "sed", "seq", "ssh", "sudo", "tail", "touch", "vim", "ll", "tldr", "df", "du", "more", "apt-get"
