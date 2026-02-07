#!/bin/bash

VAULT_DIR="$HOME/secure_vault"
REPORT="$VAULT_DIR/vault_report.txt"

# Start the report
echo "Vault Security Report - $(date)" > "$REPORT"
echo "--------------------------------" >> "$REPORT"

# 1. For each file in secure_vault, display info
for file in "$VAULT_DIR"/*; do
    # Don't monitor the report file itself
    if [[ "$file" == *"$REPORT"* ]]; then continue; fi

    fname=$(basename "$file")
    size=$(stat -c%s "$file")
    mod_date=$(stat -c%y "$file")
    perms=$(stat -c%a "$file")

    {
        echo "File: $fname"
        echo "Size: $size bytes"
        echo "Last Modified: $mod_date"
        echo "Permissions: $perms"
    } >> "$REPORT"

    # 2. If permissions are more open than 644, print risk
    if [ "$perms" -gt 644 ]; then
        echo "⚠️  SECURITY RISK DETECTED" >> "$REPORT"
    fi
    echo "--------------------------------" >> "$REPORT"
done

# 4. Print confirmation
echo "Monitoring complete. Report created at $REPORT"
