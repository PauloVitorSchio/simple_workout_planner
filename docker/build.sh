#!/bin/bash

REQUIREMENTS_FILE=$1

echo "Installing $MODE requirements"
pip install --no-cache-dir -r $REQUIREMENTS_FILE
echo "Requirements installed!"
