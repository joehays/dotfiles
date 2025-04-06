url="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip"

# Extract filename using parameter expansion
filename="${url##*/}" 

# Extract path using parameter expansion
path="${url%/*}"

echo "Filename: $filename"
echo "Path: $path"


