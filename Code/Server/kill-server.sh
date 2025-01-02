#!/bin/bash

# Search for the processes
processes=$(ps aux | grep -E "python main.py -tn" | grep -v grep)

if [[ -z "$processes" ]]; then
    echo "No server processes found."
    exit 0
fi

# Display matching processes
echo "Found the following server processes were found:"
echo "$processes"

# Extract process IDs (PIDs)
pids=$(echo "$processes" | awk '{print $2}')

# Kill the processes
echo "Killing processes..."
for pid in $pids; do
    kill -9 "$pid" && echo "Killed process with PID $pid."
done

echo "All matching processes have been terminated."
