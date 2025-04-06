# Apps available through WINGET
winget install "7zip.7zip" --accept-package-agreements --disable-interactivity
winget install "Audacity.Audacity" --accept-package-agreements --disable-interactivity
winget install "Brave.Brave" --accept-package-agreements --disable-interactivity
winget install "Canonical.Ubuntu.2004" --accept-package-agreements --disable-interactivity
winget install "Cisco.Jabber" --accept-package-agreements --disable-interactivity
winget install "Docker.DockerDesktop" --accept-package-agreements --disable-interactivity
winget install "Figma.Figma" --accept-package-agreements --disable-interactivity
winget install "Figma.FigmaAgent" --accept-package-agreements --disable-interactivity
winget install "GIMP.GIMP" --accept-package-agreements --disable-interactivity
winget install "Git.Git" --accept-package-agreements --disable-interactivity
winget install "Inkscape.Inkscape" --accept-package-agreements --disable-interactivity
winget install "Microsoft.AppInstaller" --accept-package-agreements --disable-interactivity
winget install "Microsoft.OneDrive" --accept-package-agreements --disable-interactivity
winget install "Microsoft.PowerShell" --accept-package-agreements --disable-interactivity
winget install "Microsoft.PowerToys" --accept-package-agreements --disable-interactivity
winget install "Microsoft.Teams.Classic" --accept-package-agreements --disable-interactivity
winget install "Microsoft.VisualStudioCode" --accept-package-agreements --disable-interactivity
winget install "Microsoft.WindowsTerminal" --accept-package-agreements --disable-interactivity
winget install "Mozilla.Firefox" --accept-package-agreements --disable-interactivity
winget install "Notepad++.Notepad++" --accept-package-agreements --disable-interactivity
winget install "Nvidia.Omniverse"  --accept-package-agreements --disable-interactivity
winget install "OBSProject.OBSStudio" --accept-package-agreements --disable-interactivity
winget install "Oracle.JavaRuntimeEnvironment" --accept-package-agreements --disable-interactivity
winget install "PuTTY.PuTTY" --accept-package-agreements --disable-interactivity
winget install "Rufus.Rufus" --accept-package-agreements --disable-interactivity
winget install "VideoLAN.VLC" --accept-package-agreements --disable-interactivity
winget install "VirtualGL.TurboVNC" --accept-package-agreements --disable-interactivity
winget install "WinSCP.WinSCP" --accept-package-agreements --disable-interactivity
winget install "Zoom.Zoom" --accept-package-agreements --disable-interactivity
winget install "marha.VcXsrv" --accept-package-agreements --disable-interactivity
winget install "vim.vim" --accept-package-agreements --disable-interactivity


# Apps requiring custom download
Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1" -OutFile "./install-pyenv-win.ps1"; &"./install-pyenv-win.ps1"
Invoke-WebRequest -UseBasicParsing -Uri "https://github.com/GerHobbelt/qiqqa-open-source/releases/download/v82.0.7578.6369/setup-v82.0.7578.6369.exe" -OutFile "./setup-v82.0.7578.6369.exe"; &"./setup-v82.0.7578.6369.exe"

# Apps not automated
# Microsoft Office (division license)
# Adobe Acrobat (division license)
# Davinci Resolve
# NVIDIA Omniverse Apps (Isaac-Sim, Omniverse Create, Omniverse specific version of Blender, etc…)

