# 🔧 Troubleshooting Guide

Common issues and solutions for StarGANv2-VC Google Colab training.

---

## 🚨 Setup Issues

### "No GPU detected"

**Symptoms:**
```
❌ No GPU detected!
⚠️  Go to Runtime → Change runtime type → Select 'GPU'
```

**Solution:**
1. Click **Runtime** in the menu bar
2. Select **Change runtime type**
3. Under "Hardware accelerator", choose **GPU**
4. Click **Save**
5. Re-run the cell

**Verification:**
```python
import torch
print(torch.cuda.is_available())  # Should print: True
```

---

### "Out of Memory" Error

**Symptoms:**
```
RuntimeError: CUDA out of memory
```

**Solutions:**

**Option 1: Reduce Batch Size**
```yaml
# In the configuration cell, change:
batch_size: 8   # Default
# To:
batch_size: 4   # or even 2
```

**Option 2: Restart Runtime**
1. Runtime → Restart runtime
2. Re-run all cells

**Option 3: Use Colab Pro**
- Upgrade to Colab Pro for better GPUs
- V100/A100 have more memory

---

### Pretrained Models Download Failed

**Symptoms:**
```
Failed to download epoch_00150.pth
ConnectionError or TimeoutError
```

**Solutions:**

**Option 1: Retry**
- Just re-run the download cell
- Sometimes it's a temporary network issue

**Option 2: Check Google Drive Links**
```python
# Verify the file IDs are correct:
# epoch_00150.pth: 1WARohzB7EHiQJfNDNMmWOJHe0SbPiLcY
# Vocoder: 1xhkLRy_0-S2tsZMFF3kFLZVJ-_Bxa7RY
# ASR: 1EwI7xAB2Ql1B2E8Xp8BKPcqrx1mSLJJr
```

**Option 3: Manual Download**
1. Download files from [StarGANv2-VC releases](https://github.com/yl4579/StarGANv2-VC)
2. Upload to Colab manually
3. Place in correct directories

---

## 📤 Data Upload Issues

### Data Upload Failed

**Symptoms:**
- Upload times out
- File not found after upload
- Corrupted ZIP file

**Solutions:**

**Option 1: Check File Size**
- Colab has upload limits
- Maximum: ~100-200 MB recommended
- If larger, split your data

**Option 2: Use Google Drive**
```python
from google.colab import drive
drive.mount('/content/drive')

# Copy from Drive
!cp /content/drive/MyDrive/MyVoice.zip .
```

**Option 3: Verify ZIP Structure**
```python
import zipfile
with zipfile.ZipFile('MyVoice.zip', 'r') as z:
    z.printdir()
# Should show: MyVoice/train_list.txt, MyVoice/val_list.txt, MyVoice/*.wav
```

---

### Data Extraction Error

**Symptoms:**
```
Error: train_list.txt not found
Directory structure incorrect
```

**Solution:**
```python
# Check extracted structure:
!ls -la Data/MyVoice/

# Should contain:
# train_list.txt
# val_list.txt
# speaker0_seg0000.wav
# speaker0_seg0001.wav
# ...
```

**Fix:**
```python
# If structure is wrong, manually create:
!mkdir -p Data/MyVoice
!unzip MyVoice.zip -d Data/
```

---

## 🏋️ Training Issues

### Training Stuck / Not Starting

**Symptoms:**
- Cell running but no progress
- `[train]: 0%` for long time
- No iteration updates

**Solutions:**

**Option 1: Check GPU Usage**
```python
!nvidia-smi
# Should show python process using GPU
```

**Option 2: Restart and Check Config**
```python
# Verify config file exists:
!cat Configs/my_voice_config.yml
```

**Option 3: Check Data Loading**
```python
# Test data loader:
with open('Data/MyVoice/train_list.txt') as f:
    print(f"Training samples: {len(f.readlines())}")
```

---

### Training is Very Slow

**Symptoms:**
- >30 seconds per iteration
- Expected 1-2 seconds on GPU

**Diagnosis:**
```python
import torch
print(f"Using device: {torch.cuda.get_device_name(0)}")
print(f"Batch size: {batch_size}")

# Check if GPU is actually being used:
!nvidia-smi
```

**Solutions:**

**Option 1: Verify GPU is Enabled**
- Check config: `device: "cuda"`
- Not `device: "cpu"`

**Option 2: Increase Batch Size**
```yaml
batch_size: 8  # T4 can handle this
```

**Option 3: Enable Mixed Precision**
```yaml
fp16_run: true  # Already should be enabled
```

---

### Disconnection / Session Timeout

**Symptoms:**
```
Runtime disconnected
Session terminated
```

**Prevention:**

**Option 1: Keep Tab Active**
- Don't close the Colab tab
- Interact every ~1 hour
- Disable computer sleep mode

**Option 2: Anti-Idle Script**
```javascript
// Run in browser console (F12):
function ClickConnect() {
  console.log("Keeping alive...");
  document.querySelector("colab-connect-button").click();
}
setInterval(ClickConnect, 60000);  // Every 60 seconds
```

**Option 3: Use Colab Pro**
- 24-hour runtime limit (vs 12 hours)
- Background execution
- Priority GPU access

**Recovery After Disconnection:**

1. Checkpoints are saved every 2 epochs
2. Download latest checkpoint before disconnection
3. On reconnect, use "Resume Training" cell
4. Upload checkpoint ZIP
5. Training continues!

---

### Loss Not Decreasing

**Symptoms:**
- Loss stays constant or increases
- No quality improvement after many epochs

**Diagnosis:**
```bash
# Check training log:
!tail -100 Models/MyVoice_BestQuality/train.log

# Look for:
# - Decreasing training loss
# - Reasonable validation loss
```

**Possible Causes:**

**1. Learning Rate Too High/Low**
```yaml
# Default is good, but try adjusting:
lr: 0.0001  # Default
# Try: 0.00005 (if loss exploding)
# Try: 0.0002 (if too slow)
```

**2. Bad Data Quality**
- Check audio quality
- Verify segments aren't corrupted
- Ensure 24kHz sample rate

**3. Insufficient Data**
- Need minimum 30 minutes
- More data = better results

---

### Shape Mismatch Errors

**Symptoms:**
```
RuntimeError: shape mismatch
Tensor size mismatch
```

**Cause:**
- Usually normal during transfer learning
- Pretrained model: 20 speakers
- Your model: 1 speaker

**Expected Messages (NORMAL):**
```
dis.main.9.weight does not have same shape
torch.Size([20, 512, 1, 1]) torch.Size([1, 512, 1, 1])
cls.main.9.bias does not have same shape
```

**If Error Persists:**
```python
# Check configuration:
num_domains: 1  # Should be 1 for single speaker
```

---

## 💾 Checkpoint Issues

### Can't Download Checkpoints

**Symptoms:**
- Download cell fails
- ZIP file empty or corrupted

**Solutions:**

**Option 1: Manual Download**
```python
# Download individual files:
from google.colab import files

# Download specific epoch:
files.download('Models/MyVoice_BestQuality/epoch_00150.pth')
```

**Option 2: Save to Google Drive**
```python
from google.colab import drive
drive.mount('/content/drive')

# Copy to Drive:
!cp -r Models/MyVoice_BestQuality /content/drive/MyDrive/
```

**Option 3: Check Disk Space**
```python
!df -h
# Ensure sufficient space for ZIP creation
```

---

### Can't Resume Training

**Symptoms:**
- Resume cell doesn't work
- Training starts from epoch 0

**Solutions:**

**Option 1: Verify Checkpoint Location**
```python
!ls -lh Models/MyVoice_BestQuality/
# Should see: epoch_00002.pth, epoch_00004.pth, etc.
```

**Option 2: Manual Resume**
```python
# Edit config to specify starting checkpoint:
pretrained_model: "Models/MyVoice_BestQuality/epoch_00050.pth"
```

**Option 3: Check Config**
```yaml
load_only_params: true  # Should be true for resume
```

---

## 🎤 Inference Issues

### Model Loading Failed

**Symptoms:**
```
FileNotFoundError: epoch_00150.pth not found
```

**Solution:**
```python
# Verify model path:
import os
model_path = "Models/MyVoice_BestQuality/epoch_00150.pth"
print(f"Exists: {os.path.exists(model_path)}")

# List available checkpoints:
!ls -lh Models/MyVoice_BestQuality/*.pth
```

---

### Poor Conversion Quality

**Symptoms:**
- Output sounds robotic
- Voice doesn't match target
- Artifacts or distortion

**Possible Causes:**

**1. Not Enough Training**
- Train to at least epoch 75
- Best quality at epoch 150

**2. Bad Source Audio**
- Use clean source audio
- 24kHz recommended
- No background noise

**3. Vocoder Issues**
- Ensure vocoder is properly loaded
- Check vocoder checkpoint exists

---

## 🌐 Network Issues

### "Connection Refused" Errors

**Solution:**
- Check internet connection
- Restart runtime
- Try again in a few minutes

### "Rate Limit Exceeded"

**Solution:**
- Google Drive rate limiting
- Wait 15-30 minutes
- Use alternative download method

---

## 🔄 Runtime Issues

### Kernel Died / Crashed

**Symptoms:**
```
Runtime crashed
Kernel restarting
```

**Solutions:**

**Option 1: Reduce Memory Usage**
- Reduce batch_size
- Close other Colab notebooks

**Option 2: Restart Runtime**
1. Runtime → Restart runtime
2. Re-run all setup cells
3. Resume training if needed

**Option 3: Use Different GPU**
- Try disconnecting and reconnecting
- Might get different GPU type

---

## 📊 Quality Issues

### Model Quality Lower Than Expected

**Checklist:**

1. **Training Duration**
   - [ ] Trained for at least 75 epochs?
   - [ ] Waited full 150 epochs?

2. **Data Quality**
   - [ ] Clean audio recording?
   - [ ] At least 30 minutes of data?
   - [ ] Diverse speaking styles?

3. **Configuration**
   - [ ] Using pretrained model?
   - [ ] Correct loss weights?
   - [ ] GPU acceleration enabled?

4. **Transfer Learning**
   - [ ] `load_only_params: true`?
   - [ ] Pretrained model loaded correctly?

**Improvement Tips:**
- Record more training data
- Include diverse emotions/styles
- Train for full 150 epochs
- Use better source audio for conversion

---

## 🆘 Still Having Issues?

### Before Asking for Help:

1. **Check Error Message**
   - Read the full error carefully
   - Google the specific error

2. **Verify Setup**
   - GPU enabled?
   - All files uploaded correctly?
   - Dependencies installed?

3. **Check Logs**
   ```python
   !tail -50 Models/MyVoice_BestQuality/train.log
   ```

4. **System Info**
   ```python
   import torch
   print(f"PyTorch: {torch.__version__}")
   print(f"CUDA: {torch.version.cuda}")
   print(f"GPU: {torch.cuda.get_device_name(0)}")
   !nvidia-smi
   ```

### Where to Get Help:

1. **GitHub Issues**
   - Check existing issues
   - Create new issue with details

2. **StarGANv2-VC Original Repo**
   - https://github.com/yl4579/StarGANv2-VC/issues

3. **Include in Help Request:**
   - Error message (full text)
   - Steps to reproduce
   - System info (GPU, PyTorch version)
   - Training configuration
   - Logs (last 50 lines)

---

## ✅ Quick Diagnostic Checklist

Run this cell to check everything:

```python
import torch
import os

print("=== DIAGNOSTIC CHECK ===\\n")

# GPU
print("1. GPU Status:")
if torch.cuda.is_available():
    print(f"   ✅ GPU: {torch.cuda.get_device_name(0)}")
    print(f"   ✅ Memory: {torch.cuda.get_device_properties(0).total_memory/1024**3:.1f}GB")
else:
    print("   ❌ No GPU! Enable in Runtime settings")

# Data
print("\\n2. Training Data:")
if os.path.exists('Data/MyVoice/train_list.txt'):
    train_count = len(open('Data/MyVoice/train_list.txt').readlines())
    val_count = len(open('Data/MyVoice/val_list.txt').readlines())
    print(f"   ✅ Training: {train_count} samples")
    print(f"   ✅ Validation: {val_count} samples")
else:
    print("   ❌ Data not found!")

# Models
print("\\n3. Pretrained Models:")
models = {
    'StarGANv2': 'Models/epoch_00150.pth',
    'Vocoder': 'Vocoder/checkpoint-400000steps.pkl',
    'ASR': 'Utils/ASR/epoch_00100.pth',
    'F0': 'Utils/JDC/bst.t7'
}
for name, path in models.items():
    if os.path.exists(path):
        size = os.path.getsize(path) / 1024**2
        print(f"   ✅ {name}: {size:.1f}MB")
    else:
        print(f"   ❌ {name}: Not found!")

# Config
print("\\n4. Configuration:")
if os.path.exists('Configs/my_voice_config.yml'):
    print("   ✅ Config file exists")
    with open('Configs/my_voice_config.yml') as f:
        for line in f:
            if 'device:' in line or 'batch_size:' in line or 'epochs:' in line:
                print(f"   {line.strip()}")
else:
    print("   ❌ Config not found!")

# Checkpoints
print("\\n5. Training Progress:")
if os.path.exists('Models/MyVoice_BestQuality'):
    checkpoints = [f for f in os.listdir('Models/MyVoice_BestQuality') if f.endswith('.pth')]
    if checkpoints:
        print(f"   ✅ Checkpoints: {len(checkpoints)}")
        print(f"   Latest: {sorted(checkpoints)[-1]}")
    else:
        print("   ⚠️  No checkpoints yet (training not started)")
else:
    print("   ⚠️  Training not started")

print("\\n=== END DIAGNOSTIC ===")
```

---

**💡 Most issues are solved by checking GPU settings and verifying file paths!**
