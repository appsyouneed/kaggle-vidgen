# Wan2.2 14B - Kaggle Dual T4 GPU Setup

## Quick Start

**IMPORTANT: Enable dual T4 GPUs first!**
- Settings → Accelerator → GPU T4 x2

Then run these commands in your Kaggle notebook:

```python
# 1. Setup environment
!bash setup.sh

# 2. Run the app
!python app.py
```

## Files Included

- `app.py` - Main application (Dual T4 GPU optimized)
- `requirements.txt` - Python dependencies
- `setup.sh` - Automated setup script
- `run.sh` - Simple run script
- `README.md` - Documentation
- Sample images for testing

## Key Features

- **Dual GPU Support**: 2x T4 GPUs (32GB total VRAM)
- **Parallel Processing**: Handle 2 requests simultaneously
- **CPU Offloading**: Memory efficient on 16GB per GPU
- **FP8 Quantization**: Faster inference
- **Session Persistence**: Models cached in /kaggle/working
- **Pre-configured Token**: Faster HuggingFace downloads

## Performance

**Dual T4 GPUs:**
- ~30-45 seconds per video
- Can process 2 videos in parallel
- ~2x throughput vs single GPU

**Video generation (3-4 seconds, 4 steps):**
- GPU 0: 30-45 seconds
- GPU 1: 30-45 seconds (parallel)
- Total throughput: ~2 videos per minute

## Kaggle-Specific Notes

- Kaggle provides 30 hours/week of GPU time (free tier)
- Sessions timeout after 12 hours of inactivity
- Internet access must be enabled for initial model download
- Models persist in /kaggle/working during session
