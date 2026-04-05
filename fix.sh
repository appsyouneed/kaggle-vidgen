#!/bin/bash
set -e

echo "=== Fixing RIFE Model Installation ==="

echo "Removing old RIFE files..."
rm -rf train_log __MACOSX RIFEv4.26_0921.zip model

echo "Downloading RIFE model architecture..."
git clone --depth 1 https://github.com/hzwer/Practical-RIFE.git /tmp/rife
cp -r /tmp/rife/model .
mkdir -p train_log
cp -r /tmp/rife/train_log/* train_log/ 2>/dev/null || true

echo "Downloading RIFE weights..."
wget -q https://huggingface.co/r3gm/RIFE/resolve/main/RIFEv4.26_0921.zip
unzip -o -q RIFEv4.26_0921.zip

echo "Cleaning up..."
rm -rf /tmp/rife __MACOSX

echo "=== Fix Complete ==="
echo "Run: python3 app.py"
