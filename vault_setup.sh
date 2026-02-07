#!/bin/bash

# 1. Create a directory called secure_vault in the user's home
mkdir -p "$HOME/secure_vault"

# 2 & 3. Create 3 files and add welcome messages using I/O redirection
echo "Welcome to the Keys File" > "$HOME/secure_vault/keys.txt"
echo "Welcome to the Secrets File" > "$HOME/secure_vault/secrets.txt"
echo "Welcome to the Logs File" > "$HOME/secure_vault/logs.txt"

# 4. Print success message and list files in long format
echo "Vault Setup Complete!"
ls -l "$HOME/secure_vault"
