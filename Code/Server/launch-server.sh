#!/bin/bash
# usage: launch-server.sh

SCRIPT_DIR=$(dirname "$(realpath "$0")")

# kill existing processes
${SCRIPT_DIR}/kill-server.sh

sleep 3

# launch server and log to file
echo "Launching server..."

cd ${SCRIPT_DIR}
python main.py -tn >> ${SCRIPT_DIR}/server.log 2>&1 &
