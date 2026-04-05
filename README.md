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

## Quick Setup

1. **Enable dual T4 GPUs**: Settings → Accelerator → GPU T4 x2
2. **Enable Internet**: Settings → Internet → Enable
3. **Run in Kaggle notebook**:

```python
!git clone https://github.com/appsyouneed/kaggle-vidgen.git && cd kaggle-vidgen && bash setup.sh && python3 app.py
```

4. Click the Gradio public URL to access the app

## Repository

GitHub: https://github.com/appsyouneed/kaggle-vidgen

## Features

- Optimized for dual T4 GPUs (16GB each, 32GB total)
- Parallel processing on 2 GPUs for faster generation
- CPU offloading for memory efficiency
- FP8 quantization for faster inference
- Models cached in /kaggle/working for session persistence
- No authentication token required

## Performance

With dual T4 GPUs:
- Process 2 videos simultaneously
- ~30-45 seconds per video
- ~2x throughput compared to single GPU