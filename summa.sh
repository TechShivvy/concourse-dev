#!/usr/bin/env sh

# Run a command
ls app-2.py

# Check if the command succeeded
if [ $? -eq 0 ]; then
    echo "Command succeeded"
else
    echo "Command failed"
fi
