REM .bat for installing vscode extensions
@echo off

REM Set the path to VS Code executable
REM SET "code_path=C:\Users\jhays\AppData\Local\Programs\Microsoft VS Code\Code.exe"
SET "code_path=C:\Users\jhays\AppData\Local\Programs\Microsoft VS Code\bin\code"

REM Install each extension
for /f "tokens=*" %%e in ('findstr /V /C:"#" extensions.txt') do (
    echo Processing extension: "%%e"
    call "%code_path%" --install-extension "%%e" --force
)

echo All extensions installed successfully.