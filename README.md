---
title: Wan2.2 14B Kaggle Dual T4 GPU Version
emoji: 🐌
colorFrom: yellow
colorTo: pink
sdk: gradio
sdk_version: 6.0.1
app_file: app.py
pinned: false
short_description: Generate video from image with text prompt on dual T4 GPUs
---

# Wan2.2 14B - Kaggle Dual T4 GPU Version

This version is optimized to run on Kaggle with 2x T4 GPUs (32GB total VRAM).

## Setup Instructions

1. In Kaggle: Settings → Accelerator → GPU T4 x2
2. Upload all files to your Kaggle notebook
3. Run setup:
```bash
!bash setup.sh
```

4. Run the app:
```bash
!python app.py
```

The Gradio interface will provide a public URL to access the app.

## Features

- Optimized for dual T4 GPUs (16GB each, 32GB total)
- Parallel processing on 2 GPUs for faster generation
- CPU offloading for memory efficiency
- FP8 quantization for faster inference
- Models cached in /kaggle/working for session persistence

## Performance

With dual T4 GPUs, you can:
- Process 2 videos simultaneously
- ~2x throughput compared to single GPU
- ~30-45 seconds per video