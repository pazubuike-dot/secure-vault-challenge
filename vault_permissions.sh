#!/bin/bash

VAULT_DIR="$HOME/secure_vault"

# 1. Check if secure_vault exists
if [ ! -d "$VAULT_DIR" ]; then
    echo "Error: $VAULT_DIR does not exist."
    exit 1
fi

# 3. Function to handle permission updates
manage_perms() {
    local file=$1
    local default_perm=$2
    local filepath="$VAULT_DIR/$file"

    echo "---------------------------------------"
    echo "File: $file"
    # 2. Display current permission
    echo "Current permissions:"
    ls -l "$filepath"

    read -p "Do you want to update permissions for $file? (yes/no): " choice
    if [[ "$choice" == "yes" ]]; then
        read -p "Enter new permission (or press Enter for default $default_perm): " new_perm
        
        if [ -z "$new_perm" ]; then
            chmod "$default_perm" "$filepath"
            echo "Applied default permission: $default_perm"
        else
            chmod "$new_perm" "$filepath"
            echo "Applied new permission: $new_perm"
        fi
    else
        echo "Skipping $file..."
    fi
}

# 2. Run the function for each file
manage_perms "keys.txt" "600"
manage_perms "secrets.txt" "640"
manage_perms "logs.txt" "644"

# 4. Display all permissions at the end
echo -e "\n--- Final Vault Permissions ---"
ls -l "$VAULT_DIR"
