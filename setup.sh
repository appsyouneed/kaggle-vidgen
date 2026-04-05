#!/bin/bash
set -e

echo "=== Wan 2.2 14B Kaggle Dual T4 GPU Setup ==="

echo "Creating temp directory..."
mkdir -p /kaggle/working/tmp
chmod 1777 /kaggle/working/tmp

echo "Creating cache directory..."
mkdir -p /kaggle/working/.cache/huggingface

echo "Installing system dependencies..."
apt-get update && apt-get install -y ffmpeg wget unzip git

echo "Installing Python dependencies for GPU..."
pip install -r requirements.txt

echo "Setting up RIFE interpolation model..."
if [ ! -d "model" ] || [ ! -d "train_log" ]; then
    echo "Removing incomplete RIFE installation..."
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
    
    echo "RIFE model installed successfully"
else
    echo "RIFE model already installed, skipping..."
fi

echo "=== Setup Complete ==="
echo ""
echo "Detected GPUs:"
nvidia-smi --query-gpu=name,memory.total --format=csv,noheader
echo ""
echo "To run: python app.py"
echo "The app will be accessible via Kaggle's public URL"
