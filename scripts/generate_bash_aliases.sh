#!/bin/bash

# Path to your oh-my-zsh installation
ZSH_PATH="$HOME/.oh-my-zsh"
OUTPUT_FILE="$HOME/.bash_aliases_from_zsh"

# Clear previous aliases file
cat >"$OUTPUT_FILE" <<'EOL'
# Automatically generated bash aliases from oh-my-zsh plugins
# Last updated: $(date)
#
# WARNING: These functions and aliases were copied from zsh plugins and may contain
# zsh-specific syntax that doesn't work in bash. You may need to manually edit
# some functions for full bash compatibility.
#
# Common incompatibilities to look for:
# 1. ${var:t} - zsh syntax for basename, use $(basename "$var") in bash
# 2. ${var:h} - zsh syntax for dirname, use $(dirname "$var") in bash
# 3. [[...]] - may need different syntax in bash for certain expressions
# 4. compdef - zsh completion directives that should be removed
#

EOL

# Extract plugins list from .zshrc
PLUGINS_LINE=$(grep "^plugins=" "$HOME/.zshrc")
PLUGINS=$(echo "$PLUGINS_LINE" | sed 's/plugins=(//' | sed 's/)//' | tr -d '\n' | tr -d '\\' | sed 's/  */ /g')

# Split the plugins string into an array
IFS=' ' read -r -a PLUGIN_ARRAY <<<"$PLUGINS"

echo "Extracting aliases from the following oh-my-zsh plugins: ${PLUGIN_ARRAY[*]}"

extract_function() {
  local file="$1"
  local func_name="$2"
  local in_function=false
  local brace_count=0
  local result=""

  while IFS= read -r line; do
    if [[ "$line" =~ ^function\ $func_name\(\)\ \{.*$ ]]; then
      in_function=true
      brace_count=1
      result+="$line"$'\n'
      # If function is one line with braces in same line
      if [[ "$line" =~ \}$ ]]; then
        echo "$result"
        return
      fi
    elif [[ "$in_function" == true ]]; then
      result+="$line"$'\n'

      # Count opening braces
      local open_braces=$(echo "$line" | grep -o "{" | wc -l)
      brace_count=$((brace_count + open_braces))

      # Count closing braces
      local close_braces=$(echo "$line" | grep -o "}" | wc -l)
      brace_count=$((brace_count - close_braces))

      # If we're back to 0, we've found the end of the function
      if [[ $brace_count -eq 0 ]]; then
        echo "$result"
        return
      fi
    fi
  done <"$file"
}

for plugin in "${PLUGIN_ARRAY[@]}"; do
  # Skip empty plugin names
  if [ -z "$plugin" ]; then
    continue
  fi

  PLUGIN_PATH="$ZSH_PATH/plugins/$plugin/$plugin.plugin.zsh"

  # Check if plugin file exists
  if [ -f "$PLUGIN_PATH" ]; then
    echo "# Aliases from $plugin plugin" >>"$OUTPUT_FILE"

    # Extract alias definitions
    grep "^alias" "$PLUGIN_PATH" >>"$OUTPUT_FILE" 2>/dev/null || true
    echo "" >>"$OUTPUT_FILE"

    # Extract complete functions
    echo "# Functions from $plugin plugin" >>"$OUTPUT_FILE"

    # Find function names
    function_names=$(grep -o "^function [a-zA-Z0-9_]*() {" "$PLUGIN_PATH" | awk '{print $2}' | sed 's/()//g')

    for func in $function_names; do
      # Extract the complete function
      extract_function "$PLUGIN_PATH" "$func" >>"$OUTPUT_FILE"
      echo "" >>"$OUTPUT_FILE"
    done

    echo "" >>"$OUTPUT_FILE"
    echo "Processed plugin: $plugin"
  else
    echo "Warning: Plugin file not found: $PLUGIN_PATH"
  fi
done

# Remove lines that definitely won't work in bash (without using complex sed)
TEMP_FILE=$(mktemp)
grep -v "^compdef " "$OUTPUT_FILE" >"$TEMP_FILE"
mv "$TEMP_FILE" "$OUTPUT_FILE"

# Check if the file was created correctly
if [ -s "$OUTPUT_FILE" ]; then
  # Ensure the file ends with a newline
  echo "" >>"$OUTPUT_FILE"

  # Basic syntax check
  bash -n "$OUTPUT_FILE" 2>/dev/null
  if [ $? -eq 0 ]; then
    echo "Aliases file created successfully and passed syntax check."
  else
    echo "WARNING: The generated file contains bash syntax errors."
    echo "You may need to manually edit it for full compatibility."
  fi

  echo "Aliases saved to $OUTPUT_FILE"
else
  echo "Error: Failed to create aliases file or file is empty."
fi
