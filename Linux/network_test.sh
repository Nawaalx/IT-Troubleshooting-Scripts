#!/bin/bash
# ================================
# IT Troubleshooting Script: Network Test
# Author: Nawaal Mohamed
# Description: Tests connectivity to important websites and local network
# ================================

echo "==============================="
echo "NETWORK TEST SCRIPT"
echo "==============================="

TEST_HOSTS=("8.8.8.8" "google.com" "github.com")

for testHost in "${TEST_HOSTS[@]}"
do
    echo "Pinging $testHost..."
    ping -c 4 $testHost >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "$testHost is reachable."
    else
        echo "$testHost is not reachable."
    fi
done

echo "==============================="
echo "NETWORK TEST COMPLETE"
echo "==============================="
