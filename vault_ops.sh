#!/bin/bash

VAULT_DIR="$HOME/secure_vault"

# Create a menu-driven program that runs in a loop
while true; do
    echo -e "\n--- Vault Operations Menu ---"
    echo "1. Add Secret"
    echo "2. Update Secret"
    echo "3. Add Log Entry"
    echo "4. Access Keys"
    echo "5. Exit"
    read -p "Choose an option (1-5): " choice

    case $choice in
        1)
            # Append a new secret to secrets.txt
            read -p "Enter new secret: " new_secret
            echo "$new_secret" >> "$VAULT_DIR/secrets.txt"
            echo "Secret added."
            ;;
        2)
            # Replace an existing secret using sed -i
            read -p "Enter text to replace: " old_text
            read -p "Enter new text: " new_text
            if grep -q "$old_text" "$VAULT_DIR/secrets.txt"; then
                sed -i "s/$old_text/$new_text/g" "$VAULT_DIR/secrets.txt"
                echo "Secret updated."
            else
                echo "No match found."
            fi
            ;;
        3)
            # Add a timestamped log into logs.txt
            read -p "Enter log message: " log_msg
            echo "$(date): $log_msg" >> "$VAULT_DIR/logs.txt"
            echo "Log entry added."
            ;;
        4)
            # Always print ACCESS DENIED
            echo "ACCESS DENIED 🚫"
            ;;
        5)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option, try again."
            ;;
    esac
done
