# Wan2.2 14B - Kaggle Dual T4 GPU Setup

## Quick Start

**IMPORTANT: Enable dual T4 GPUs first!**
- Settings → Accelerator → GPU T4 x2
- Settings → Internet → Enable (required for initial setup)

Then run these commands in your Kaggle notebook:

```python
# 1. Clone the repository
!git clone https://github.com/appsyouneed/kaggle-vidgen.git
!cd kaggle-vidgen

# 2. Run setup
!cd kaggle-vidgen && bash setup.sh

# 3. Run the app
!cd kaggle-vidgen && python3 app.py
```

The Gradio interface will display a public URL - click it to access the app.

## Alternative: One-Line Setup

```python
!git clone https://github.com/appsyouneed/kaggle-vidgen.git && cd kaggle-vidgen && bash setup.sh && python3 app.py
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
- **No Token Required**: Public model access

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
- First run downloads ~100GB of models (10-15 minutes)

## Troubleshooting

**If setup fails:**
```python
# Check GPU availability
!nvidia-smi

# Verify internet is enabled
!ping -c 3 huggingface.co

# Re-run setup
!cd kaggle-vidgen && bash setup.sh
```

**If app crashes:**
```python
# Check CUDA is available
!python3 -c "import torch; print(torch.cuda.is_available())"

# Clear cache and restart
!rm -rf /kaggle/working/.cache
!cd kaggle-vidgen && bash setup.sh
```
